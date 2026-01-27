-- Migration 002: Create users table
-- Description: Utilisateurs du système (admin, kitchen, deliverer, customer)

CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  
  -- Informations personnelles
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(20) NOT NULL,
  
  -- Authentification
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'kitchen', 'deliverer', 'customer')),
  
  -- Adresse (pour customers et deliverers)
  address_street VARCHAR(255),
  address_city VARCHAR(100),
  address_state VARCHAR(100),
  address_postal_code VARCHAR(20),
  address_country VARCHAR(2) DEFAULT 'DZ',
  
  -- Coordonnées GPS (pour customers)
  latitude DECIMAL(10, 8),
  longitude DECIMAL(11, 8),
  
  -- Configuration spécifique customer
  credit_limit INTEGER DEFAULT 0, -- En centimes (DZD)
  credit_days INTEGER DEFAULT 30,
  current_debt INTEGER DEFAULT 0 NOT NULL, -- En centimes (DZD)
  
  -- Configuration spécifique deliverer
  vehicle_type VARCHAR(50), -- 'motorcycle', 'car', 'bicycle', 'foot'
  vehicle_plate VARCHAR(20),
  is_available BOOLEAN DEFAULT true,
  
  -- Métadonnées
  avatar_url VARCHAR(500),
  notes TEXT,
  settings JSONB DEFAULT '{}',
  
  -- Statut
  is_active BOOLEAN DEFAULT true NOT NULL,
  email_verified BOOLEAN DEFAULT false NOT NULL,
  phone_verified BOOLEAN DEFAULT false NOT NULL,
  
  -- Dates importantes
  last_login_at TIMESTAMP WITH TIME ZONE,
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  deleted_at TIMESTAMP WITH TIME ZONE
);

-- Index pour les recherches fréquentes
CREATE INDEX idx_users_organization_id ON users(organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_users_role ON users(role) WHERE deleted_at IS NULL;
CREATE INDEX idx_users_email ON users(email) WHERE deleted_at IS NULL;
CREATE INDEX idx_users_is_active ON users(is_active) WHERE deleted_at IS NULL;
CREATE INDEX idx_users_is_available ON users(is_available) WHERE deleted_at IS NULL AND role = 'deliverer';
CREATE INDEX idx_users_current_debt ON users(current_debt) WHERE deleted_at IS NULL AND role = 'customer';
CREATE INDEX idx_users_location ON users USING GIST (
  ll_to_earth(latitude, longitude)
) WHERE deleted_at IS NULL AND latitude IS NOT NULL AND longitude IS NOT NULL;

-- Index composite pour les requêtes fréquentes
CREATE INDEX idx_users_org_role ON users(organization_id, role) WHERE deleted_at IS NULL;
CREATE INDEX idx_users_org_active ON users(organization_id, is_active) WHERE deleted_at IS NULL;

-- Trigger pour updated_at
CREATE TRIGGER update_users_updated_at
  BEFORE UPDATE ON users
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Contrainte: credit_limit et credit_days uniquement pour customers
CREATE OR REPLACE FUNCTION check_customer_fields()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.role != 'customer' THEN
    NEW.credit_limit := 0;
    NEW.credit_days := 0;
    NEW.current_debt := 0;
  END IF;
  
  IF NEW.role != 'deliverer' THEN
    NEW.vehicle_type := NULL;
    NEW.vehicle_plate := NULL;
    NEW.is_available := NULL;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_customer_fields_trigger
  BEFORE INSERT OR UPDATE ON users
  FOR EACH ROW
  EXECUTE FUNCTION check_customer_fields();

-- Commentaires
COMMENT ON TABLE users IS 'Utilisateurs du système (admin, kitchen, deliverer, customer)';
COMMENT ON COLUMN users.role IS 'Rôle: admin (gérant), kitchen (cuisine), deliverer (livreur), customer (client)';
COMMENT ON COLUMN users.credit_limit IS 'Limite de crédit pour les customers (en centimes)';
COMMENT ON COLUMN users.current_debt IS 'Dette actuelle du customer (en centimes)';
COMMENT ON COLUMN users.is_available IS 'Disponibilité du livreur (uniquement pour role=deliverer)';
COMMENT ON COLUMN users.vehicle_type IS 'Type de véhicule du livreur';
