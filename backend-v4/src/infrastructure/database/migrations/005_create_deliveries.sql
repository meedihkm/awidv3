-- Migration 005: Create deliveries table
-- Description: Livraisons et tracking en temps réel

CREATE TABLE IF NOT EXISTS deliveries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  order_id UUID NOT NULL REFERENCES orders(id) ON DELETE RESTRICT,
  deliverer_id UUID REFERENCES users(id) ON DELETE SET NULL,
  
  -- Numéro de livraison
  delivery_number VARCHAR(50) NOT NULL,
  
  -- Statut
  status VARCHAR(50) NOT NULL DEFAULT 'pending' CHECK (
    status IN ('pending', 'assigned', 'picked_up', 'in_transit', 'arrived', 'delivered', 'failed', 'cancelled')
  ),
  
  -- Adresse de livraison (snapshot)
  delivery_address_street VARCHAR(255) NOT NULL,
  delivery_address_city VARCHAR(100) NOT NULL,
  delivery_latitude DECIMAL(10, 8),
  delivery_longitude DECIMAL(11, 8),
  
  -- Tracking
  estimated_distance INTEGER, -- En mètres
  estimated_duration INTEGER, -- En secondes
  actual_distance INTEGER, -- En mètres
  actual_duration INTEGER, -- En secondes
  
  -- Dates importantes
  assigned_at TIMESTAMP WITH TIME ZONE,
  picked_up_at TIMESTAMP WITH TIME ZONE,
  started_at TIMESTAMP WITH TIME ZONE,
  arrived_at TIMESTAMP WITH TIME ZONE,
  delivered_at TIMESTAMP WITH TIME ZONE,
  failed_at TIMESTAMP WITH TIME ZONE,
  cancelled_at TIMESTAMP WITH TIME ZONE,
  
  -- Preuve de livraison
  proof_type VARCHAR(50), -- 'signature', 'photo', 'qr_code', 'pin'
  proof_signature_url VARCHAR(500),
  proof_photo_url VARCHAR(500),
  proof_recipient_name VARCHAR(255),
  proof_notes TEXT,
  
  -- Échec de livraison
  failure_reason VARCHAR(50), -- 'customer_absent', 'address_wrong', 'customer_refused', 'other'
  failure_notes TEXT,
  
  -- Notes
  notes TEXT,
  metadata JSONB DEFAULT '{}',
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  deleted_at TIMESTAMP WITH TIME ZONE,
  
  -- Contrainte d'unicité
  UNIQUE(organization_id, delivery_number)
);

-- Table pour le tracking GPS en temps réel
CREATE TABLE IF NOT EXISTS delivery_tracking (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  delivery_id UUID NOT NULL REFERENCES deliveries(id) ON DELETE CASCADE,
  deliverer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  
  -- Position GPS
  latitude DECIMAL(10, 8) NOT NULL,
  longitude DECIMAL(11, 8) NOT NULL,
  accuracy DECIMAL(10, 2), -- Précision en mètres
  altitude DECIMAL(10, 2), -- Altitude en mètres
  speed DECIMAL(10, 2), -- Vitesse en m/s
  heading DECIMAL(5, 2), -- Direction en degrés (0-360)
  
  -- Métadonnées
  battery_level INTEGER, -- Niveau de batterie (0-100)
  is_moving BOOLEAN DEFAULT true,
  
  -- Timestamp
  recorded_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Index pour deliveries
CREATE INDEX idx_deliveries_organization_id ON deliveries(organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_deliveries_order_id ON deliveries(order_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_deliveries_deliverer_id ON deliveries(deliverer_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_deliveries_status ON deliveries(status) WHERE deleted_at IS NULL;
CREATE INDEX idx_deliveries_delivery_number ON deliveries(delivery_number) WHERE deleted_at IS NULL;
CREATE INDEX idx_deliveries_created_at ON deliveries(created_at DESC) WHERE deleted_at IS NULL;

-- Index composite
CREATE INDEX idx_deliveries_org_status ON deliveries(organization_id, status) WHERE deleted_at IS NULL;
CREATE INDEX idx_deliveries_org_deliverer ON deliveries(organization_id, deliverer_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_deliveries_deliverer_status ON deliveries(deliverer_id, status) WHERE deleted_at IS NULL;

-- Index pour delivery_tracking
CREATE INDEX idx_delivery_tracking_delivery_id ON delivery_tracking(delivery_id);
CREATE INDEX idx_delivery_tracking_deliverer_id ON delivery_tracking(deliverer_id);
CREATE INDEX idx_delivery_tracking_recorded_at ON delivery_tracking(recorded_at DESC);
CREATE INDEX idx_delivery_tracking_location ON delivery_tracking USING GIST (
  ll_to_earth(latitude, longitude)
);

-- Index composite pour requêtes fréquentes
CREATE INDEX idx_delivery_tracking_delivery_time ON delivery_tracking(delivery_id, recorded_at DESC);

-- Trigger pour updated_at
CREATE TRIGGER update_deliveries_updated_at
  BEFORE UPDATE ON deliveries
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Fonction pour générer le numéro de livraison
CREATE OR REPLACE FUNCTION generate_delivery_number()
RETURNS TRIGGER AS $$
DECLARE
  next_number INTEGER;
BEGIN
  SELECT COALESCE(MAX(CAST(SUBSTRING(delivery_number FROM '[0-9]+$') AS INTEGER)), 0) + 1
  INTO next_number
  FROM deliveries
  WHERE organization_id = NEW.organization_id
    AND delivery_number ~ '^DEL-[0-9]+$';
  
  NEW.delivery_number := 'DEL-' || LPAD(next_number::TEXT, 6, '0');
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER generate_delivery_number_trigger
  BEFORE INSERT ON deliveries
  FOR EACH ROW
  WHEN (NEW.delivery_number IS NULL OR NEW.delivery_number = '')
  EXECUTE FUNCTION generate_delivery_number();

-- Fonction pour mettre à jour le statut de la commande
CREATE OR REPLACE FUNCTION update_order_status_from_delivery()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.status = 'delivered' THEN
    UPDATE orders
    SET status = 'delivered',
        delivered_at = NEW.delivered_at
    WHERE id = NEW.order_id;
  ELSIF NEW.status = 'in_transit' THEN
    UPDATE orders
    SET status = 'in_delivery'
    WHERE id = NEW.order_id;
  ELSIF NEW.status = 'failed' THEN
    UPDATE orders
    SET status = 'failed'
    WHERE id = NEW.order_id;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_order_status_from_delivery_trigger
  AFTER UPDATE OF status ON deliveries
  FOR EACH ROW
  EXECUTE FUNCTION update_order_status_from_delivery();

-- Commentaires
COMMENT ON TABLE deliveries IS 'Livraisons et tracking';
COMMENT ON COLUMN deliveries.delivery_number IS 'Numéro de livraison unique (ex: DEL-000001)';
COMMENT ON COLUMN deliveries.status IS 'Statut de la livraison';
COMMENT ON COLUMN deliveries.estimated_distance IS 'Distance estimée en mètres';
COMMENT ON COLUMN deliveries.estimated_duration IS 'Durée estimée en secondes';
COMMENT ON COLUMN deliveries.proof_type IS 'Type de preuve de livraison';
COMMENT ON TABLE delivery_tracking IS 'Tracking GPS en temps réel des livreurs';
COMMENT ON COLUMN delivery_tracking.accuracy IS 'Précision GPS en mètres';
COMMENT ON COLUMN delivery_tracking.speed IS 'Vitesse en m/s';
COMMENT ON COLUMN delivery_tracking.heading IS 'Direction en degrés (0-360)';
