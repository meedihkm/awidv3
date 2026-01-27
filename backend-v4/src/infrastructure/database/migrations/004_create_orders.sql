-- Migration 004: Create orders and order_items tables
-- Description: Commandes et leurs lignes de détail

CREATE TABLE IF NOT EXISTS orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  customer_id UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
  
  -- Numéro de commande (auto-incrémenté par organisation)
  order_number VARCHAR(50) NOT NULL,
  
  -- Statut
  status VARCHAR(50) NOT NULL DEFAULT 'pending' CHECK (
    status IN ('pending', 'confirmed', 'preparing', 'ready', 'assigned', 'in_delivery', 'delivered', 'cancelled', 'failed')
  ),
  
  -- Montants (en centimes DZD)
  subtotal INTEGER NOT NULL,
  discount INTEGER DEFAULT 0 NOT NULL,
  tax INTEGER DEFAULT 0 NOT NULL,
  total INTEGER NOT NULL,
  
  -- Paiement
  payment_status VARCHAR(50) NOT NULL DEFAULT 'unpaid' CHECK (
    payment_status IN ('unpaid', 'partial', 'paid', 'overpaid')
  ),
  amount_paid INTEGER DEFAULT 0 NOT NULL,
  amount_due INTEGER NOT NULL,
  
  -- Livraison
  delivery_address_street VARCHAR(255) NOT NULL,
  delivery_address_city VARCHAR(100) NOT NULL,
  delivery_address_state VARCHAR(100) NOT NULL,
  delivery_address_postal_code VARCHAR(20) NOT NULL,
  delivery_latitude DECIMAL(10, 8),
  delivery_longitude DECIMAL(11, 8),
  
  delivery_notes TEXT,
  delivery_priority VARCHAR(20) DEFAULT 'normal' CHECK (delivery_priority IN ('low', 'normal', 'high', 'urgent')),
  
  -- Dates importantes
  scheduled_for TIMESTAMP WITH TIME ZONE,
  confirmed_at TIMESTAMP WITH TIME ZONE,
  prepared_at TIMESTAMP WITH TIME ZONE,
  delivered_at TIMESTAMP WITH TIME ZONE,
  cancelled_at TIMESTAMP WITH TIME ZONE,
  
  -- Métadonnées
  notes TEXT,
  metadata JSONB DEFAULT '{}',
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  deleted_at TIMESTAMP WITH TIME ZONE,
  
  -- Contrainte d'unicité pour order_number par organisation
  UNIQUE(organization_id, order_number)
);

-- Table des lignes de commande
CREATE TABLE IF NOT EXISTS order_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE RESTRICT,
  
  -- Détails du produit (snapshot au moment de la commande)
  product_name VARCHAR(255) NOT NULL,
  product_sku VARCHAR(100),
  
  -- Quantité et prix
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  unit_price INTEGER NOT NULL, -- Prix unitaire en centimes (DZD)
  subtotal INTEGER NOT NULL, -- quantity * unit_price
  discount INTEGER DEFAULT 0 NOT NULL,
  total INTEGER NOT NULL, -- subtotal - discount
  
  -- Métadonnées
  notes TEXT,
  metadata JSONB DEFAULT '{}',
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Index pour orders
CREATE INDEX idx_orders_organization_id ON orders(organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_customer_id ON orders(customer_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_status ON orders(status) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_payment_status ON orders(payment_status) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_order_number ON orders(order_number) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_scheduled_for ON orders(scheduled_for) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_created_at ON orders(created_at DESC) WHERE deleted_at IS NULL;

-- Index composite
CREATE INDEX idx_orders_org_status ON orders(organization_id, status) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_org_customer ON orders(organization_id, customer_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_org_payment ON orders(organization_id, payment_status) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_customer_status ON orders(customer_id, status) WHERE deleted_at IS NULL;

-- Index pour order_items
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

-- Trigger pour updated_at
CREATE TRIGGER update_orders_updated_at
  BEFORE UPDATE ON orders
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_order_items_updated_at
  BEFORE UPDATE ON order_items
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Fonction pour générer le numéro de commande
CREATE OR REPLACE FUNCTION generate_order_number()
RETURNS TRIGGER AS $$
DECLARE
  next_number INTEGER;
  prefix VARCHAR(10);
BEGIN
  -- Obtenir le prochain numéro pour cette organisation
  SELECT COALESCE(MAX(CAST(SUBSTRING(order_number FROM '[0-9]+$') AS INTEGER)), 0) + 1
  INTO next_number
  FROM orders
  WHERE organization_id = NEW.organization_id
    AND order_number ~ '^ORD-[0-9]+$';
  
  -- Générer le numéro avec préfixe
  NEW.order_number := 'ORD-' || LPAD(next_number::TEXT, 6, '0');
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER generate_order_number_trigger
  BEFORE INSERT ON orders
  FOR EACH ROW
  WHEN (NEW.order_number IS NULL OR NEW.order_number = '')
  EXECUTE FUNCTION generate_order_number();

-- Fonction pour mettre à jour la dette du client
CREATE OR REPLACE FUNCTION update_customer_debt()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
    -- Recalculer la dette totale du client
    UPDATE users
    SET current_debt = (
      SELECT COALESCE(SUM(amount_due), 0)
      FROM orders
      WHERE customer_id = NEW.customer_id
        AND payment_status IN ('unpaid', 'partial')
        AND status NOT IN ('cancelled', 'failed')
        AND deleted_at IS NULL
    )
    WHERE id = NEW.customer_id;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_customer_debt_trigger
  AFTER INSERT OR UPDATE OF amount_due, payment_status, status ON orders
  FOR EACH ROW
  EXECUTE FUNCTION update_customer_debt();

-- Commentaires
COMMENT ON TABLE orders IS 'Commandes clients';
COMMENT ON COLUMN orders.order_number IS 'Numéro de commande unique par organisation (ex: ORD-000001)';
COMMENT ON COLUMN orders.status IS 'Statut de la commande';
COMMENT ON COLUMN orders.payment_status IS 'Statut du paiement';
COMMENT ON COLUMN orders.amount_due IS 'Montant restant à payer (en centimes)';
COMMENT ON COLUMN orders.delivery_priority IS 'Priorité de livraison';
COMMENT ON TABLE order_items IS 'Lignes de détail des commandes';
COMMENT ON COLUMN order_items.unit_price IS 'Prix unitaire au moment de la commande (snapshot)';
