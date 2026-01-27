-- Migration 003: Create products table
-- Description: Catalogue de produits par organisation

CREATE TABLE IF NOT EXISTS products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  
  -- Informations de base
  name VARCHAR(255) NOT NULL,
  description TEXT,
  sku VARCHAR(100), -- Stock Keeping Unit
  category VARCHAR(100) NOT NULL,
  
  -- Prix
  base_price INTEGER NOT NULL, -- En centimes (DZD)
  
  -- Images
  image_url VARCHAR(500),
  thumbnail_url VARCHAR(500),
  
  -- Stock
  track_stock BOOLEAN DEFAULT true NOT NULL,
  current_stock INTEGER DEFAULT 0,
  min_stock_level INTEGER DEFAULT 0,
  unit VARCHAR(50) DEFAULT 'unit' NOT NULL, -- 'unit', 'kg', 'liter', 'box', etc.
  
  -- Disponibilité
  is_available BOOLEAN DEFAULT true NOT NULL,
  
  -- Métadonnées
  tags TEXT[], -- Array de tags pour recherche
  metadata JSONB DEFAULT '{}',
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  deleted_at TIMESTAMP WITH TIME ZONE
);

-- Table pour les prix personnalisés par client
CREATE TABLE IF NOT EXISTS product_custom_prices (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  customer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  
  custom_price INTEGER NOT NULL, -- En centimes (DZD)
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  
  -- Contrainte d'unicité
  UNIQUE(product_id, customer_id)
);

-- Index pour les recherches fréquentes
CREATE INDEX idx_products_organization_id ON products(organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_products_category ON products(category) WHERE deleted_at IS NULL;
CREATE INDEX idx_products_is_available ON products(is_available) WHERE deleted_at IS NULL;
CREATE INDEX idx_products_sku ON products(sku) WHERE deleted_at IS NULL AND sku IS NOT NULL;
CREATE INDEX idx_products_stock_level ON products(current_stock) WHERE deleted_at IS NULL AND track_stock = true;
CREATE INDEX idx_products_tags ON products USING GIN(tags) WHERE deleted_at IS NULL;

-- Index composite
CREATE INDEX idx_products_org_available ON products(organization_id, is_available) WHERE deleted_at IS NULL;
CREATE INDEX idx_products_org_category ON products(organization_id, category) WHERE deleted_at IS NULL;

-- Index pour product_custom_prices
CREATE INDEX idx_product_custom_prices_product_id ON product_custom_prices(product_id);
CREATE INDEX idx_product_custom_prices_customer_id ON product_custom_prices(customer_id);

-- Trigger pour updated_at
CREATE TRIGGER update_products_updated_at
  BEFORE UPDATE ON products
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_product_custom_prices_updated_at
  BEFORE UPDATE ON product_custom_prices
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Fonction pour vérifier le stock bas
CREATE OR REPLACE FUNCTION check_low_stock()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.track_stock = true AND NEW.current_stock <= NEW.min_stock_level THEN
    -- Ici on pourrait déclencher une notification
    -- Pour l'instant on log juste
    RAISE NOTICE 'Low stock alert for product %: % units remaining', NEW.name, NEW.current_stock;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_low_stock_trigger
  AFTER UPDATE OF current_stock ON products
  FOR EACH ROW
  WHEN (NEW.track_stock = true)
  EXECUTE FUNCTION check_low_stock();

-- Commentaires
COMMENT ON TABLE products IS 'Catalogue de produits par organisation';
COMMENT ON COLUMN products.base_price IS 'Prix de base en centimes (DZD)';
COMMENT ON COLUMN products.track_stock IS 'Si true, le stock est suivi';
COMMENT ON COLUMN products.current_stock IS 'Stock actuel';
COMMENT ON COLUMN products.min_stock_level IS 'Niveau minimum de stock avant alerte';
COMMENT ON COLUMN products.unit IS 'Unité de mesure (unit, kg, liter, box, etc.)';
COMMENT ON TABLE product_custom_prices IS 'Prix personnalisés par client';
