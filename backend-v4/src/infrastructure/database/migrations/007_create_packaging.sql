-- Migration 007: Create packaging tables
-- Description: Gestion des consignes (emballages réutilisables)

CREATE TABLE IF NOT EXISTS packaging_types (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  
  -- Informations de base
  name VARCHAR(255) NOT NULL,
  description TEXT,
  
  -- Valeur de la consigne
  deposit_amount INTEGER NOT NULL, -- En centimes (DZD)
  
  -- Métadonnées
  metadata JSONB DEFAULT '{}',
  
  -- Statut
  is_active BOOLEAN DEFAULT true NOT NULL,
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  deleted_at TIMESTAMP WITH TIME ZONE,
  
  -- Contrainte d'unicité
  UNIQUE(organization_id, name)
);

-- Table des mouvements de consignes
CREATE TABLE IF NOT EXISTS packaging_movements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  packaging_type_id UUID NOT NULL REFERENCES packaging_types(id) ON DELETE RESTRICT,
  customer_id UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
  delivery_id UUID REFERENCES deliveries(id) ON DELETE SET NULL,
  
  -- Type de mouvement
  movement_type VARCHAR(20) NOT NULL CHECK (movement_type IN ('deposit', 'return')),
  
  -- Quantité
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  
  -- Montant (quantity * deposit_amount)
  amount INTEGER NOT NULL, -- En centimes (DZD)
  
  -- Date du mouvement
  movement_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  -- Notes
  notes TEXT,
  metadata JSONB DEFAULT '{}',
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Table du solde de consignes par client
CREATE TABLE IF NOT EXISTS packaging_balances (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  packaging_type_id UUID NOT NULL REFERENCES packaging_types(id) ON DELETE CASCADE,
  customer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  
  -- Solde actuel
  quantity INTEGER DEFAULT 0 NOT NULL,
  amount INTEGER DEFAULT 0 NOT NULL, -- En centimes (DZD)
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  
  -- Contrainte d'unicité
  UNIQUE(organization_id, packaging_type_id, customer_id)
);

-- Index pour packaging_types
CREATE INDEX idx_packaging_types_organization_id ON packaging_types(organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_packaging_types_is_active ON packaging_types(is_active) WHERE deleted_at IS NULL;

-- Index pour packaging_movements
CREATE INDEX idx_packaging_movements_organization_id ON packaging_movements(organization_id);
CREATE INDEX idx_packaging_movements_packaging_type_id ON packaging_movements(packaging_type_id);
CREATE INDEX idx_packaging_movements_customer_id ON packaging_movements(customer_id);
CREATE INDEX idx_packaging_movements_delivery_id ON packaging_movements(delivery_id);
CREATE INDEX idx_packaging_movements_movement_type ON packaging_movements(movement_type);
CREATE INDEX idx_packaging_movements_movement_date ON packaging_movements(movement_date DESC);

-- Index composite
CREATE INDEX idx_packaging_movements_customer_type ON packaging_movements(customer_id, packaging_type_id);
CREATE INDEX idx_packaging_movements_org_customer ON packaging_movements(organization_id, customer_id);

-- Index pour packaging_balances
CREATE INDEX idx_packaging_balances_organization_id ON packaging_balances(organization_id);
CREATE INDEX idx_packaging_balances_packaging_type_id ON packaging_balances(packaging_type_id);
CREATE INDEX idx_packaging_balances_customer_id ON packaging_balances(customer_id);
CREATE INDEX idx_packaging_balances_quantity ON packaging_balances(quantity) WHERE quantity > 0;

-- Trigger pour updated_at
CREATE TRIGGER update_packaging_types_updated_at
  BEFORE UPDATE ON packaging_types
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_packaging_movements_updated_at
  BEFORE UPDATE ON packaging_movements
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_packaging_balances_updated_at
  BEFORE UPDATE ON packaging_balances
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Fonction pour mettre à jour le solde de consignes
CREATE OR REPLACE FUNCTION update_packaging_balance()
RETURNS TRIGGER AS $$
DECLARE
  balance_change INTEGER;
BEGIN
  -- Déterminer le changement de solde
  IF NEW.movement_type = 'deposit' THEN
    balance_change := NEW.quantity;
  ELSE -- return
    balance_change := -NEW.quantity;
  END IF;
  
  -- Mettre à jour ou créer le solde
  INSERT INTO packaging_balances (
    organization_id,
    packaging_type_id,
    customer_id,
    quantity,
    amount
  )
  VALUES (
    NEW.organization_id,
    NEW.packaging_type_id,
    NEW.customer_id,
    balance_change,
    NEW.amount * CASE WHEN NEW.movement_type = 'deposit' THEN 1 ELSE -1 END
  )
  ON CONFLICT (organization_id, packaging_type_id, customer_id)
  DO UPDATE SET
    quantity = packaging_balances.quantity + balance_change,
    amount = packaging_balances.amount + (NEW.amount * CASE WHEN NEW.movement_type = 'deposit' THEN 1 ELSE -1 END),
    updated_at = CURRENT_TIMESTAMP;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_packaging_balance_trigger
  AFTER INSERT ON packaging_movements
  FOR EACH ROW
  EXECUTE FUNCTION update_packaging_balance();

-- Fonction pour vérifier qu'on ne retourne pas plus que le solde
CREATE OR REPLACE FUNCTION check_packaging_return()
RETURNS TRIGGER AS $$
DECLARE
  current_balance INTEGER;
BEGIN
  IF NEW.movement_type = 'return' THEN
    -- Récupérer le solde actuel
    SELECT COALESCE(quantity, 0) INTO current_balance
    FROM packaging_balances
    WHERE organization_id = NEW.organization_id
      AND packaging_type_id = NEW.packaging_type_id
      AND customer_id = NEW.customer_id;
    
    -- Vérifier qu'on ne retourne pas plus que le solde
    IF NEW.quantity > current_balance THEN
      RAISE EXCEPTION 'Cannot return % units, current balance is only %',
        NEW.quantity, current_balance;
    END IF;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_packaging_return_trigger
  BEFORE INSERT ON packaging_movements
  FOR EACH ROW
  WHEN (NEW.movement_type = 'return')
  EXECUTE FUNCTION check_packaging_return();

-- Commentaires
COMMENT ON TABLE packaging_types IS 'Types de consignes (emballages réutilisables)';
COMMENT ON COLUMN packaging_types.deposit_amount IS 'Montant de la consigne en centimes (DZD)';
COMMENT ON TABLE packaging_movements IS 'Mouvements de consignes (dépôt/retour)';
COMMENT ON COLUMN packaging_movements.movement_type IS 'Type de mouvement: deposit (dépôt) ou return (retour)';
COMMENT ON TABLE packaging_balances IS 'Solde de consignes par client';
COMMENT ON COLUMN packaging_balances.quantity IS 'Nombre de consignes en possession du client';
COMMENT ON COLUMN packaging_balances.amount IS 'Valeur totale des consignes en centimes (DZD)';
