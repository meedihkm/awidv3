-- Migration 006: Create payments table
-- Description: Paiements et allocation aux commandes

CREATE TABLE IF NOT EXISTS payments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  customer_id UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
  delivery_id UUID REFERENCES deliveries(id) ON DELETE SET NULL,
  
  -- Numéro de paiement
  payment_number VARCHAR(50) NOT NULL,
  
  -- Montant
  amount INTEGER NOT NULL CHECK (amount > 0), -- En centimes (DZD)
  
  -- Méthode de paiement
  payment_method VARCHAR(50) NOT NULL CHECK (
    payment_method IN ('cash', 'check', 'bank_transfer', 'mobile_money', 'other')
  ),
  
  -- Détails selon la méthode
  check_number VARCHAR(100),
  check_bank VARCHAR(100),
  check_date DATE,
  transfer_reference VARCHAR(100),
  
  -- Statut
  status VARCHAR(50) NOT NULL DEFAULT 'pending' CHECK (
    status IN ('pending', 'confirmed', 'cancelled', 'refunded')
  ),
  
  -- Dates
  payment_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  confirmed_at TIMESTAMP WITH TIME ZONE,
  cancelled_at TIMESTAMP WITH TIME ZONE,
  refunded_at TIMESTAMP WITH TIME ZONE,
  
  -- Notes
  notes TEXT,
  metadata JSONB DEFAULT '{}',
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  deleted_at TIMESTAMP WITH TIME ZONE,
  
  -- Contrainte d'unicité
  UNIQUE(organization_id, payment_number)
);

-- Table d'allocation des paiements aux commandes
CREATE TABLE IF NOT EXISTS payment_allocations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  payment_id UUID NOT NULL REFERENCES payments(id) ON DELETE CASCADE,
  order_id UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  
  -- Montant alloué
  amount INTEGER NOT NULL CHECK (amount > 0), -- En centimes (DZD)
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  
  -- Contrainte: un paiement ne peut être alloué qu'une fois à une commande
  UNIQUE(payment_id, order_id)
);

-- Index pour payments
CREATE INDEX idx_payments_organization_id ON payments(organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_customer_id ON payments(customer_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_delivery_id ON payments(delivery_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_payment_number ON payments(payment_number) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_payment_method ON payments(payment_method) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_status ON payments(status) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_payment_date ON payments(payment_date DESC) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_created_at ON payments(created_at DESC) WHERE deleted_at IS NULL;

-- Index composite
CREATE INDEX idx_payments_org_customer ON payments(organization_id, customer_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_org_status ON payments(organization_id, status) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_customer_date ON payments(customer_id, payment_date DESC) WHERE deleted_at IS NULL;

-- Index pour payment_allocations
CREATE INDEX idx_payment_allocations_payment_id ON payment_allocations(payment_id);
CREATE INDEX idx_payment_allocations_order_id ON payment_allocations(order_id);

-- Trigger pour updated_at
CREATE TRIGGER update_payments_updated_at
  BEFORE UPDATE ON payments
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_payment_allocations_updated_at
  BEFORE UPDATE ON payment_allocations
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Fonction pour générer le numéro de paiement
CREATE OR REPLACE FUNCTION generate_payment_number()
RETURNS TRIGGER AS $$
DECLARE
  next_number INTEGER;
BEGIN
  SELECT COALESCE(MAX(CAST(SUBSTRING(payment_number FROM '[0-9]+$') AS INTEGER)), 0) + 1
  INTO next_number
  FROM payments
  WHERE organization_id = NEW.organization_id
    AND payment_number ~ '^PAY-[0-9]+$';
  
  NEW.payment_number := 'PAY-' || LPAD(next_number::TEXT, 6, '0');
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER generate_payment_number_trigger
  BEFORE INSERT ON payments
  FOR EACH ROW
  WHEN (NEW.payment_number IS NULL OR NEW.payment_number = '')
  EXECUTE FUNCTION generate_payment_number();

-- Fonction pour mettre à jour le statut de paiement des commandes
CREATE OR REPLACE FUNCTION update_order_payment_status()
RETURNS TRIGGER AS $$
DECLARE
  order_total INTEGER;
  order_paid INTEGER;
BEGIN
  -- Récupérer le total de la commande
  SELECT total INTO order_total
  FROM orders
  WHERE id = NEW.order_id;
  
  -- Calculer le montant total payé pour cette commande
  SELECT COALESCE(SUM(pa.amount), 0) INTO order_paid
  FROM payment_allocations pa
  JOIN payments p ON p.id = pa.payment_id
  WHERE pa.order_id = NEW.order_id
    AND p.status = 'confirmed'
    AND p.deleted_at IS NULL;
  
  -- Mettre à jour le statut de paiement de la commande
  UPDATE orders
  SET 
    amount_paid = order_paid,
    amount_due = order_total - order_paid,
    payment_status = CASE
      WHEN order_paid = 0 THEN 'unpaid'
      WHEN order_paid < order_total THEN 'partial'
      WHEN order_paid = order_total THEN 'paid'
      WHEN order_paid > order_total THEN 'overpaid'
    END
  WHERE id = NEW.order_id;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_order_payment_status_trigger
  AFTER INSERT OR UPDATE OR DELETE ON payment_allocations
  FOR EACH ROW
  EXECUTE FUNCTION update_order_payment_status();

-- Fonction pour vérifier que le montant alloué ne dépasse pas le montant du paiement
CREATE OR REPLACE FUNCTION check_payment_allocation_amount()
RETURNS TRIGGER AS $$
DECLARE
  payment_amount INTEGER;
  total_allocated INTEGER;
BEGIN
  -- Récupérer le montant du paiement
  SELECT amount INTO payment_amount
  FROM payments
  WHERE id = NEW.payment_id;
  
  -- Calculer le total déjà alloué
  SELECT COALESCE(SUM(amount), 0) INTO total_allocated
  FROM payment_allocations
  WHERE payment_id = NEW.payment_id
    AND id != COALESCE(NEW.id, '00000000-0000-0000-0000-000000000000'::UUID);
  
  -- Vérifier que le total n'excède pas le montant du paiement
  IF total_allocated + NEW.amount > payment_amount THEN
    RAISE EXCEPTION 'Total allocated amount (% + %) exceeds payment amount (%)',
      total_allocated, NEW.amount, payment_amount;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_payment_allocation_amount_trigger
  BEFORE INSERT OR UPDATE ON payment_allocations
  FOR EACH ROW
  EXECUTE FUNCTION check_payment_allocation_amount();

-- Commentaires
COMMENT ON TABLE payments IS 'Paiements reçus des clients';
COMMENT ON COLUMN payments.payment_number IS 'Numéro de paiement unique (ex: PAY-000001)';
COMMENT ON COLUMN payments.amount IS 'Montant du paiement en centimes (DZD)';
COMMENT ON COLUMN payments.payment_method IS 'Méthode de paiement (cash, check, bank_transfer, etc.)';
COMMENT ON TABLE payment_allocations IS 'Allocation des paiements aux commandes';
COMMENT ON COLUMN payment_allocations.amount IS 'Montant alloué à cette commande (en centimes)';
