-- Migration 008: Create stock tables
-- Description: Gestion avancée des stocks et mouvements

CREATE TABLE IF NOT EXISTS stock_movements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE RESTRICT,
  
  -- Type de mouvement
  movement_type VARCHAR(50) NOT NULL CHECK (
    movement_type IN ('purchase', 'sale', 'adjustment', 'return', 'loss', 'transfer', 'production')
  ),
  
  -- Quantité (positive ou négative selon le type)
  quantity INTEGER NOT NULL,
  
  -- Stock avant et après
  stock_before INTEGER NOT NULL,
  stock_after INTEGER NOT NULL,
  
  -- Référence (order_id, delivery_id, etc.)
  reference_type VARCHAR(50), -- 'order', 'delivery', 'manual', etc.
  reference_id UUID,
  
  -- Coût unitaire (pour calcul du coût moyen pondéré)
  unit_cost INTEGER, -- En centimes (DZD)
  total_cost INTEGER, -- quantity * unit_cost
  
  -- Raison du mouvement
  reason VARCHAR(255),
  notes TEXT,
  
  -- Utilisateur qui a effectué le mouvement
  performed_by UUID REFERENCES users(id) ON DELETE SET NULL,
  
  -- Date du mouvement
  movement_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  -- Métadonnées
  metadata JSONB DEFAULT '{}',
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Table pour les alertes de stock
CREATE TABLE IF NOT EXISTS stock_alerts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  
  -- Type d'alerte
  alert_type VARCHAR(50) NOT NULL CHECK (
    alert_type IN ('low_stock', 'out_of_stock', 'overstock', 'expiring_soon')
  ),
  
  -- Détails
  current_stock INTEGER NOT NULL,
  threshold INTEGER,
  message TEXT NOT NULL,
  
  -- Statut
  status VARCHAR(50) NOT NULL DEFAULT 'active' CHECK (
    status IN ('active', 'acknowledged', 'resolved')
  ),
  
  -- Dates
  acknowledged_at TIMESTAMP WITH TIME ZONE,
  acknowledged_by UUID REFERENCES users(id) ON DELETE SET NULL,
  resolved_at TIMESTAMP WITH TIME ZONE,
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Index pour stock_movements
CREATE INDEX idx_stock_movements_organization_id ON stock_movements(organization_id);
CREATE INDEX idx_stock_movements_product_id ON stock_movements(product_id);
CREATE INDEX idx_stock_movements_movement_type ON stock_movements(movement_type);
CREATE INDEX idx_stock_movements_movement_date ON stock_movements(movement_date DESC);
CREATE INDEX idx_stock_movements_reference ON stock_movements(reference_type, reference_id);
CREATE INDEX idx_stock_movements_performed_by ON stock_movements(performed_by);

-- Index composite
CREATE INDEX idx_stock_movements_product_date ON stock_movements(product_id, movement_date DESC);
CREATE INDEX idx_stock_movements_org_product ON stock_movements(organization_id, product_id);
CREATE INDEX idx_stock_movements_org_date ON stock_movements(organization_id, movement_date DESC);

-- Index pour stock_alerts
CREATE INDEX idx_stock_alerts_organization_id ON stock_alerts(organization_id);
CREATE INDEX idx_stock_alerts_product_id ON stock_alerts(product_id);
CREATE INDEX idx_stock_alerts_alert_type ON stock_alerts(alert_type);
CREATE INDEX idx_stock_alerts_status ON stock_alerts(status);
CREATE INDEX idx_stock_alerts_created_at ON stock_alerts(created_at DESC);

-- Index composite
CREATE INDEX idx_stock_alerts_org_status ON stock_alerts(organization_id, status);
CREATE INDEX idx_stock_alerts_product_status ON stock_alerts(product_id, status);

-- Trigger pour updated_at
CREATE TRIGGER update_stock_movements_updated_at
  BEFORE UPDATE ON stock_movements
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_stock_alerts_updated_at
  BEFORE UPDATE ON stock_alerts
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Fonction pour enregistrer un mouvement de stock
CREATE OR REPLACE FUNCTION record_stock_movement()
RETURNS TRIGGER AS $$
DECLARE
  current_stock INTEGER;
  new_stock INTEGER;
BEGIN
  -- Récupérer le stock actuel
  SELECT products.current_stock INTO current_stock
  FROM products
  WHERE id = NEW.product_id;
  
  -- Calculer le nouveau stock
  new_stock := current_stock + NEW.quantity;
  
  -- Vérifier que le stock ne devient pas négatif
  IF new_stock < 0 THEN
    RAISE EXCEPTION 'Insufficient stock for product %. Current: %, Requested: %',
      NEW.product_id, current_stock, -NEW.quantity;
  END IF;
  
  -- Enregistrer les valeurs avant/après
  NEW.stock_before := current_stock;
  NEW.stock_after := new_stock;
  
  -- Mettre à jour le stock du produit
  UPDATE products
  SET current_stock = new_stock,
      updated_at = CURRENT_TIMESTAMP
  WHERE id = NEW.product_id;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER record_stock_movement_trigger
  BEFORE INSERT ON stock_movements
  FOR EACH ROW
  EXECUTE FUNCTION record_stock_movement();

-- Fonction pour créer une alerte de stock bas
CREATE OR REPLACE FUNCTION create_low_stock_alert()
RETURNS TRIGGER AS $$
DECLARE
  existing_alert UUID;
BEGIN
  -- Vérifier si le produit suit le stock
  IF NEW.track_stock = false THEN
    RETURN NEW;
  END IF;
  
  -- Vérifier si le stock est bas
  IF NEW.current_stock <= NEW.min_stock_level THEN
    -- Vérifier s'il existe déjà une alerte active
    SELECT id INTO existing_alert
    FROM stock_alerts
    WHERE product_id = NEW.id
      AND alert_type = CASE
        WHEN NEW.current_stock = 0 THEN 'out_of_stock'
        ELSE 'low_stock'
      END
      AND status = 'active'
    LIMIT 1;
    
    -- Créer une alerte si elle n'existe pas
    IF existing_alert IS NULL THEN
      INSERT INTO stock_alerts (
        organization_id,
        product_id,
        alert_type,
        current_stock,
        threshold,
        message,
        status
      )
      VALUES (
        NEW.organization_id,
        NEW.id,
        CASE
          WHEN NEW.current_stock = 0 THEN 'out_of_stock'
          ELSE 'low_stock'
        END,
        NEW.current_stock,
        NEW.min_stock_level,
        CASE
          WHEN NEW.current_stock = 0 THEN 'Product "' || NEW.name || '" is out of stock'
          ELSE 'Product "' || NEW.name || '" is low on stock (' || NEW.current_stock || ' units remaining)'
        END,
        'active'
      );
    END IF;
  ELSE
    -- Résoudre les alertes actives si le stock est revenu à la normale
    UPDATE stock_alerts
    SET status = 'resolved',
        resolved_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
    WHERE product_id = NEW.id
      AND alert_type IN ('low_stock', 'out_of_stock')
      AND status = 'active';
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER create_low_stock_alert_trigger
  AFTER UPDATE OF current_stock ON products
  FOR EACH ROW
  WHEN (NEW.track_stock = true)
  EXECUTE FUNCTION create_low_stock_alert();

-- Fonction pour enregistrer automatiquement les mouvements de stock lors d'une commande
CREATE OR REPLACE FUNCTION record_order_stock_movement()
RETURNS TRIGGER AS $$
BEGIN
  -- Enregistrer un mouvement de stock pour chaque ligne de commande
  INSERT INTO stock_movements (
    organization_id,
    product_id,
    movement_type,
    quantity,
    stock_before,
    stock_after,
    reference_type,
    reference_id,
    reason,
    movement_date
  )
  SELECT
    o.organization_id,
    oi.product_id,
    'sale',
    -oi.quantity, -- Négatif car c'est une vente
    0, -- Sera calculé par le trigger
    0, -- Sera calculé par le trigger
    'order',
    o.id,
    'Order #' || o.order_number,
    o.created_at
  FROM orders o
  JOIN order_items oi ON oi.order_id = o.id
  WHERE o.id = NEW.id;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Note: Ce trigger sera activé uniquement si nécessaire
-- CREATE TRIGGER record_order_stock_movement_trigger
--   AFTER INSERT ON orders
--   FOR EACH ROW
--   EXECUTE FUNCTION record_order_stock_movement();

-- Commentaires
COMMENT ON TABLE stock_movements IS 'Historique des mouvements de stock';
COMMENT ON COLUMN stock_movements.movement_type IS 'Type: purchase, sale, adjustment, return, loss, transfer, production';
COMMENT ON COLUMN stock_movements.quantity IS 'Quantité (positive pour entrée, négative pour sortie)';
COMMENT ON COLUMN stock_movements.unit_cost IS 'Coût unitaire en centimes (DZD)';
COMMENT ON TABLE stock_alerts IS 'Alertes de stock (bas, rupture, surstock, etc.)';
COMMENT ON COLUMN stock_alerts.alert_type IS 'Type: low_stock, out_of_stock, overstock, expiring_soon';
