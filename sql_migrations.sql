-- =============================================
-- MIGRATIONS SQL POUR AWID
-- Toutes les colonnes nécessaires
-- =============================================

-- 1. Table refresh_tokens (pour les refresh tokens)
CREATE TABLE IF NOT EXISTS refresh_tokens (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    token TEXT NOT NULL UNIQUE,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    revoked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour recherche rapide par token
CREATE INDEX IF NOT EXISTS idx_refresh_tokens_token ON refresh_tokens(token);
CREATE INDEX IF NOT EXISTS idx_refresh_tokens_user_id ON refresh_tokens(user_id);

-- 2. Table audit_logs (pour les logs d'audit)
CREATE TABLE IF NOT EXISTS audit_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    organization_id UUID REFERENCES organizations(id) ON DELETE CASCADE,
    action VARCHAR(100) NOT NULL,
    details JSONB DEFAULT '{}',
    ip_address VARCHAR(45),
    user_agent VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour recherche par organisation et date
CREATE INDEX IF NOT EXISTS idx_audit_logs_org_id ON audit_logs(organization_id);
CREATE INDEX IF NOT EXISTS idx_audit_logs_created_at ON audit_logs(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_audit_logs_action ON audit_logs(action);

-- =============================================
-- COLONNES ADDITIONNELLES (exécuter si manquantes)
-- =============================================

-- 3. Colonnes pour les produits (Nouveau/Promo)
ALTER TABLE products ADD COLUMN IF NOT EXISTS is_new BOOLEAN DEFAULT false;
ALTER TABLE products ADD COLUMN IF NOT EXISTS is_promo BOOLEAN DEFAULT false;
ALTER TABLE products ADD COLUMN IF NOT EXISTS promo_price DECIMAL(10,2) DEFAULT NULL;

-- 4. Colonnes pour les organisations
ALTER TABLE organizations ADD COLUMN IF NOT EXISTS kitchen_mode BOOLEAN DEFAULT false;

-- 5. Colonnes pour les commandes
ALTER TABLE orders ADD COLUMN IF NOT EXISTS locked_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE orders ADD COLUMN IF NOT EXISTS payment_status VARCHAR(20) DEFAULT 'unpaid';
ALTER TABLE orders ADD COLUMN IF NOT EXISTS amount_paid DECIMAL(10,2) DEFAULT 0;

-- 6. Colonnes pour les livraisons
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS payment_status VARCHAR(20) DEFAULT 'unpaid';
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS amount_collected DECIMAL(10,2) DEFAULT 0;
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS comment TEXT;
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS failure_reason VARCHAR(100);
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS failed_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS postponed_to DATE;
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS attempts INTEGER DEFAULT 0;
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS delivered_at TIMESTAMP WITH TIME ZONE;

-- 7. Colonnes pour la géolocalisation des livreurs
ALTER TABLE users ADD COLUMN IF NOT EXISTS latitude DECIMAL(10,8);
ALTER TABLE users ADD COLUMN IF NOT EXISTS longitude DECIMAL(11,8);
ALTER TABLE users ADD COLUMN IF NOT EXISTS location_updated_at TIMESTAMP WITH TIME ZONE;

-- 7b. Colonnes adresse clients (cafétérias) pour navigation GPS
ALTER TABLE users ADD COLUMN IF NOT EXISTS address TEXT;
ALTER TABLE users ADD COLUMN IF NOT EXISTS address_lat DECIMAL(10,8);
ALTER TABLE users ADD COLUMN IF NOT EXISTS address_lng DECIMAL(11,8);

-- 8. Table historique de localisation (optionnel)
CREATE TABLE IF NOT EXISTS location_history (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    deliverer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    recorded_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_location_history_deliverer ON location_history(deliverer_id);
CREATE INDEX IF NOT EXISTS idx_location_history_date ON location_history(recorded_at);

-- =============================================
-- 9. Numérotation séquentielle des commandes
-- =============================================

-- Séquence par organisation pour numéros de commande (TEXT car organizations.id est TEXT)
CREATE TABLE IF NOT EXISTS order_sequences (
    organization_id TEXT PRIMARY KEY REFERENCES organizations(id) ON DELETE CASCADE,
    last_number INTEGER DEFAULT 0
);

-- Colonne numéro de commande
ALTER TABLE orders ADD COLUMN IF NOT EXISTS order_number INTEGER;

-- Index pour recherche rapide par numéro
CREATE INDEX IF NOT EXISTS idx_orders_number ON orders(organization_id, order_number);

-- =============================================
-- NETTOYAGE (à exécuter périodiquement)
-- =============================================

-- Supprimer les vieux tokens expirés
-- DELETE FROM refresh_tokens WHERE expires_at < NOW() OR revoked = true;

-- Garder 90 jours de logs d'audit
-- DELETE FROM audit_logs WHERE created_at < NOW() - INTERVAL '90 days';

-- Garder 30 jours d'historique de localisation
-- DELETE FROM location_history WHERE recorded_at < NOW() - INTERVAL '30 days';

-- =============================================
-- 10. INDEX POUR PERFORMANCES
-- =============================================

-- Index sur les commandes (requêtes fréquentes)
CREATE INDEX IF NOT EXISTS idx_orders_org_status ON orders(organization_id, status);
CREATE INDEX IF NOT EXISTS idx_orders_org_date ON orders(organization_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_orders_cafeteria ON orders(cafeteria_id);
CREATE INDEX IF NOT EXISTS idx_orders_payment ON orders(organization_id, payment_status);

-- Index sur les livraisons
CREATE INDEX IF NOT EXISTS idx_deliveries_org_status ON deliveries(organization_id, status);
CREATE INDEX IF NOT EXISTS idx_deliveries_deliverer ON deliveries(deliverer_id, status);
CREATE INDEX IF NOT EXISTS idx_deliveries_order ON deliveries(order_id);
CREATE INDEX IF NOT EXISTS idx_deliveries_date ON deliveries(created_at DESC);

-- Index sur les produits
CREATE INDEX IF NOT EXISTS idx_products_org_active ON products(organization_id, active);
CREATE INDEX IF NOT EXISTS idx_products_category ON products(organization_id, category);
CREATE INDEX IF NOT EXISTS idx_products_order ON products(organization_id, display_order);

-- Index sur les utilisateurs
CREATE INDEX IF NOT EXISTS idx_users_org_role ON users(organization_id, role);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_active ON users(organization_id, active);

-- Index sur order_items
CREATE INDEX IF NOT EXISTS idx_order_items_order ON order_items(order_id);
CREATE INDEX IF NOT EXISTS idx_order_items_product ON order_items(product_id);

-- Index sur refresh_tokens
CREATE INDEX IF NOT EXISTS idx_refresh_tokens_expires ON refresh_tokens(expires_at) WHERE revoked = false;
