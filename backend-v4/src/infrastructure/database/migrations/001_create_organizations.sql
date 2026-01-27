-- Migration 001: Create organizations table
-- Description: Table principale pour les organisations (pizzeria, boulangerie, laiterie, etc.)

-- Activer les extensions nécessaires
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";      -- Pour gen_random_uuid()
CREATE EXTENSION IF NOT EXISTS "cube";           -- Dépendance pour earthdistance
CREATE EXTENSION IF NOT EXISTS "earthdistance";  -- Pour les calculs de distance géographique (ll_to_earth)
CREATE EXTENSION IF NOT EXISTS "pg_trgm";        -- Pour la recherche full-text avec trigrams (gin_trgm_ops)

CREATE TABLE IF NOT EXISTS organizations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  
  -- Informations de base
  name VARCHAR(255) NOT NULL,
  type VARCHAR(50) NOT NULL CHECK (type IN ('pizzeria', 'bakery', 'dairy', 'restaurant', 'other')),
  description TEXT,
  
  -- Contact
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(20) NOT NULL,
  
  -- Adresse
  address_street VARCHAR(255) NOT NULL,
  address_city VARCHAR(100) NOT NULL,
  address_state VARCHAR(100) NOT NULL,
  address_postal_code VARCHAR(20) NOT NULL,
  address_country VARCHAR(2) DEFAULT 'DZ' NOT NULL,
  
  -- Coordonnées GPS
  latitude DECIMAL(10, 8),
  longitude DECIMAL(11, 8),
  
  -- Configuration métier
  default_credit_limit INTEGER DEFAULT 50000 NOT NULL, -- En centimes (DZD)
  default_credit_days INTEGER DEFAULT 30 NOT NULL,
  currency VARCHAR(3) DEFAULT 'DZD' NOT NULL,
  
  -- Paramètres
  settings JSONB DEFAULT '{}',
  
  -- Statut
  is_active BOOLEAN DEFAULT true NOT NULL,
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  deleted_at TIMESTAMP WITH TIME ZONE
);

-- Index pour les recherches fréquentes
CREATE INDEX idx_organizations_type ON organizations(type) WHERE deleted_at IS NULL;
CREATE INDEX idx_organizations_is_active ON organizations(is_active) WHERE deleted_at IS NULL;
CREATE INDEX idx_organizations_email ON organizations(email) WHERE deleted_at IS NULL;
CREATE INDEX idx_organizations_location ON organizations USING GIST (
  ll_to_earth(latitude, longitude)
) WHERE deleted_at IS NULL AND latitude IS NOT NULL AND longitude IS NOT NULL;

-- Trigger pour updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_organizations_updated_at
  BEFORE UPDATE ON organizations
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Commentaires
COMMENT ON TABLE organizations IS 'Organisations (pizzeria, boulangerie, laiterie, etc.)';
COMMENT ON COLUMN organizations.default_credit_limit IS 'Limite de crédit par défaut pour les nouveaux clients (en centimes)';
COMMENT ON COLUMN organizations.default_credit_days IS 'Nombre de jours de crédit par défaut';
COMMENT ON COLUMN organizations.settings IS 'Configuration JSON (horaires, options, etc.)';
