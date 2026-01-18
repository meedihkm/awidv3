-- =============================================
-- MIGRATIONS SQL OPTIMISÉES POUR AWID V2
-- Date: 19 Janvier 2026
-- Toutes les colonnes nécessaires + optimisations
-- =============================================

-- =============================================
-- 1. TABLES PRINCIPALES
-- =============================================

-- Table refresh_tokens (pour les refresh tokens JWT)
CREATE TABLE IF NOT EXISTS refresh_tokens (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    token TEXT NOT NULL UNIQUE,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    revoked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Table audit_logs (pour les logs d'audit)
CREATE TABLE IF NOT EXISTS audit_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    organization_id TEXT REFERENCES organizations(id) ON DELETE CASCADE,
    action VARCHAR(100) NOT NULL,
    details JSONB DEFAULT '{}',
    ip_address VARCHAR(45),
    user_agent VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Table location_history (historique GPS des livreurs)
CREATE TABLE IF NOT EXISTS location_history (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    deliverer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    recorded_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Table order_sequences (numérotation séquentielle des commandes)
CREATE TABLE IF NOT EXISTS order_sequences (
    organization_id TEXT PRIMARY KEY REFERENCES organizations(id) ON DELETE CASCADE,
    last_number INTEGER DEFAULT 0
);

-- =============================================
-- 2. COLONNES ADDITIONNELLES
-- =============================================

-- Colonnes pour les produits (Nouveau/Promo)
ALTER TABLE products ADD COLUMN IF NOT EXISTS is_new BOOLEAN DEFAULT false;
ALTER TABLE products ADD COLUMN IF NOT EXISTS is_promo BOOLEAN DEFAULT false;
ALTER TABLE products ADD COLUMN IF NOT EXISTS promo_price DECIMAL(10,2) DEFAULT NULL;
ALTER TABLE products ADD COLUMN IF NOT EXISTS sort_order INTEGER DEFAULT 0;

-- Colonnes pour les organisations
ALTER TABLE organizations ADD COLUMN IF NOT EXISTS kitchen_mode BOOLEAN DEFAULT false;

-- Colonnes pour les commandes
ALTER TABLE orders ADD COLUMN IF NOT EXISTS locked_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE orders ADD COLUMN IF NOT EXISTS payment_status VARCHAR(20) DEFAULT 'unpaid';
ALTER TABLE orders ADD COLUMN IF NOT EXISTS amount_paid DECIMAL(10,2) DEFAULT 0;
ALTER TABLE orders ADD COLUMN IF NOT EXISTS order_number INTEGER;
ALTER TABLE orders ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW();

-- Colonnes pour les livraisons
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS payment_status VARCHAR(20) DEFAULT 'unpaid';
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS amount_collected DECIMAL(10,2) DEFAULT 0;
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS comment TEXT;
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS failure_reason VARCHAR(100);
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS failed_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS postponed_to DATE;
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS attempts INTEGER DEFAULT 0;
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS delivered_at TIMESTAMP WITH TIME ZONE;

-- Colonnes pour la géolocalisation des livreurs
ALTER TABLE users ADD COLUMN IF NOT EXISTS latitude DECIMAL(10,8);
ALTER TABLE users ADD COLUMN IF NOT EXISTS longitude DECIMAL(11,8);
ALTER TABLE users ADD COLUMN IF NOT EXISTS location_updated_at TIMESTAMP WITH TIME ZONE;

-- Colonnes adresse clients (cafétérias) pour navigation GPS
ALTER TABLE users ADD COLUMN IF NOT EXISTS address TEXT;
ALTER TABLE users ADD COLUMN IF NOT EXISTS address_lat DECIMAL(10,8);
ALTER TABLE users ADD COLUMN IF NOT EXISTS address_lng DECIMAL(11,8);

-- =============================================
-- 3. INDEX POUR PERFORMANCES
-- =============================================

-- Index sur refresh_tokens
CREATE INDEX IF NOT EXISTS idx_refresh_tokens_token ON refresh_tokens(token);
CREATE INDEX IF NOT EXISTS idx_refresh_tokens_user_id ON refresh_tokens(user_id);
CREATE INDEX IF NOT EXISTS idx_refresh_tokens_expires ON refresh_tokens(expires_at) WHERE revoked = false;

-- Index sur audit_logs
CREATE INDEX IF NOT EXISTS idx_audit_logs_org_id ON audit_logs(organization_id);
CREATE INDEX IF NOT EXISTS idx_audit_logs_created_at ON audit_logs(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_audit_logs_action ON audit_logs(action);
CREATE INDEX IF NOT EXISTS idx_audit_logs_user_id ON audit_logs(user_id);

-- Index sur location_history
CREATE INDEX IF NOT EXISTS idx_location_history_deliverer ON location_history(deliverer_id);
CREATE INDEX IF NOT EXISTS idx_location_history_date ON location_history(recorded_at DESC);
CREATE INDEX IF NOT EXISTS idx_location_history_deliverer_date ON location_history(deliverer_id, recorded_at DESC);

-- Index sur les commandes (requêtes fréquentes)
CREATE INDEX IF NOT EXISTS idx_orders_org_status ON orders(organization_id, status);
CREATE INDEX IF NOT EXISTS idx_orders_org_date ON orders(organization_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_orders_cafeteria ON orders(cafeteria_id);
CREATE INDEX IF NOT EXISTS idx_orders_payment ON orders(organization_id, payment_status);
CREATE INDEX IF NOT EXISTS idx_orders_number ON orders(organization_id, order_number);

-- Index sur les livraisons
CREATE INDEX IF NOT EXISTS idx_deliveries_org_status ON deliveries(organization_id, status);
CREATE INDEX IF NOT EXISTS idx_deliveries_deliverer ON deliveries(deliverer_id, status);
CREATE INDEX IF NOT EXISTS idx_deliveries_order ON deliveries(order_id);
CREATE INDEX IF NOT EXISTS idx_deliveries_date ON deliveries(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_deliveries_deliverer_active ON deliveries(deliverer_id) WHERE status IN ('assigned', 'in_progress');

-- Index sur les produits
CREATE INDEX IF NOT EXISTS idx_products_org_active ON products(organization_id, active);
CREATE INDEX IF NOT EXISTS idx_products_category ON products(organization_id, category);
CREATE INDEX IF NOT EXISTS idx_products_order ON products(organization_id, sort_order);

-- Index sur les utilisateurs
CREATE INDEX IF NOT EXISTS idx_users_org_role ON users(organization_id, role);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_active ON users(organization_id, active);
CREATE INDEX IF NOT EXISTS idx_users_location ON users(latitude, longitude) WHERE role = 'deliverer' AND latitude IS NOT NULL;

-- Index sur order_items
CREATE INDEX IF NOT EXISTS idx_order_items_order ON order_items(order_id);
CREATE INDEX IF NOT EXISTS idx_order_items_product ON order_items(product_id);

-- =============================================
-- 4. TRIGGERS POUR UPDATED_AT
-- =============================================

-- Fonction pour mettre à jour updated_at automatiquement
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger sur orders
DROP TRIGGER IF EXISTS update_orders_updated_at ON orders;
CREATE TRIGGER update_orders_updated_at
    BEFORE UPDATE ON orders
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Trigger sur products
DROP TRIGGER IF EXISTS update_products_updated_at ON products;
CREATE TRIGGER update_products_updated_at
    BEFORE UPDATE ON products
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =============================================
-- 5. VUES POUR REQUÊTES FRÉQUENTES
-- =============================================

-- Vue pour les livraisons actives avec toutes les infos
CREATE OR REPLACE VIEW active_deliveries_view AS
SELECT 
    d.id as delivery_id,
    d.status as delivery_status,
    d.payment_status,
    d.amount_collected,
    d.created_at as delivery_created_at,
    o.id as order_id,
    o.order_number,
    o.total as order_total,
    o.organization_id,
    c.id as client_id,
    c.name as client_name,
    c.phone as client_phone,
    c.address as client_address,
    c.address_lat as client_lat,
    c.address_lng as client_lng,
    u.id as deliverer_id,
    u.name as deliverer_name,
    u.latitude as deliverer_lat,
    u.longitude as deliverer_lng,
    u.location_updated_at as deliverer_location_updated
FROM deliveries d
JOIN orders o ON d.order_id = o.id
JOIN users c ON o.cafeteria_id = c.id
LEFT JOIN users u ON d.deliverer_id = u.id
WHERE d.status IN ('assigned', 'in_progress');

-- Vue pour les statistiques quotidiennes par organisation
CREATE OR REPLACE VIEW daily_stats_view AS
SELECT 
    organization_id,
    DATE(created_at) as date,
    COUNT(*) as total_orders,
    SUM(total) as total_amount,
    SUM(amount_paid) as total_collected,
    COUNT(*) FILTER (WHERE status = 'delivered') as delivered_count,
    COUNT(*) FILTER (WHERE status = 'pending') as pending_count
FROM orders
GROUP BY organization_id, DATE(created_at);

-- =============================================
-- 6. FONCTIONS UTILITAIRES
-- =============================================

-- Fonction pour nettoyer les vieux tokens expirés
CREATE OR REPLACE FUNCTION cleanup_expired_tokens()
RETURNS INTEGER AS $$
DECLARE
    deleted_count INTEGER;
BEGIN
    DELETE FROM refresh_tokens 
    WHERE expires_at < NOW() OR revoked = true;
    GET DIAGNOSTICS deleted_count = ROW_COUNT;
    RETURN deleted_count;
END;
$$ LANGUAGE plpgsql;

-- Fonction pour nettoyer les vieux logs d'audit (garder 90 jours)
CREATE OR REPLACE FUNCTION cleanup_old_audit_logs(days_to_keep INTEGER DEFAULT 90)
RETURNS INTEGER AS $$
DECLARE
    deleted_count INTEGER;
BEGIN
    DELETE FROM audit_logs 
    WHERE created_at < NOW() - (days_to_keep || ' days')::INTERVAL;
    GET DIAGNOSTICS deleted_count = ROW_COUNT;
    RETURN deleted_count;
END;
$$ LANGUAGE plpgsql;

-- Fonction pour nettoyer l'historique GPS (garder 30 jours)
CREATE OR REPLACE FUNCTION cleanup_old_location_history(days_to_keep INTEGER DEFAULT 30)
RETURNS INTEGER AS $$
DECLARE
    deleted_count INTEGER;
BEGIN
    DELETE FROM location_history 
    WHERE recorded_at < NOW() - (days_to_keep || ' days')::INTERVAL;
    GET DIAGNOSTICS deleted_count = ROW_COUNT;
    RETURN deleted_count;
END;
$$ LANGUAGE plpgsql;

-- =============================================
-- 7. CONTRAINTES ET VALIDATIONS
-- =============================================

-- Contrainte: payment_status valide
ALTER TABLE orders DROP CONSTRAINT IF EXISTS orders_payment_status_check;
ALTER TABLE orders ADD CONSTRAINT orders_payment_status_check 
    CHECK (payment_status IN ('unpaid', 'partial', 'paid'));

ALTER TABLE deliveries DROP CONSTRAINT IF EXISTS deliveries_payment_status_check;
ALTER TABLE deliveries ADD CONSTRAINT deliveries_payment_status_check 
    CHECK (payment_status IN ('unpaid', 'partial', 'paid'));

-- Contrainte: status valide pour orders
ALTER TABLE orders DROP CONSTRAINT IF EXISTS orders_status_check;
ALTER TABLE orders ADD CONSTRAINT orders_status_check 
    CHECK (status IN ('pending', 'validated', 'preparing', 'ready', 'locked', 'in_delivery', 'delivered', 'cancelled'));

-- Contrainte: status valide pour deliveries
ALTER TABLE deliveries DROP CONSTRAINT IF EXISTS deliveries_status_check;
ALTER TABLE deliveries ADD CONSTRAINT deliveries_status_check 
    CHECK (status IN ('assigned', 'in_progress', 'delivered', 'failed', 'postponed'));

-- Contrainte: amount_paid ne peut pas dépasser total
ALTER TABLE orders DROP CONSTRAINT IF EXISTS orders_amount_paid_check;
ALTER TABLE orders ADD CONSTRAINT orders_amount_paid_check 
    CHECK (amount_paid >= 0 AND amount_paid <= total);

-- Contrainte: latitude/longitude valides
ALTER TABLE users DROP CONSTRAINT IF EXISTS users_latitude_check;
ALTER TABLE users ADD CONSTRAINT users_latitude_check 
    CHECK (latitude IS NULL OR (latitude >= -90 AND latitude <= 90));

ALTER TABLE users DROP CONSTRAINT IF EXISTS users_longitude_check;
ALTER TABLE users ADD CONSTRAINT users_longitude_check 
    CHECK (longitude IS NULL OR (longitude >= -180 AND longitude <= 180));

-- =============================================
-- 8. PERMISSIONS (à adapter selon vos besoins)
-- =============================================

-- Exemple: Créer un rôle read-only pour analytics
-- CREATE ROLE analytics_readonly;
-- GRANT SELECT ON ALL TABLES IN SCHEMA public TO analytics_readonly;
-- GRANT SELECT ON daily_stats_view TO analytics_readonly;
-- GRANT SELECT ON active_deliveries_view TO analytics_readonly;

-- =============================================
-- 9. COMMANDES DE MAINTENANCE
-- =============================================

-- À exécuter périodiquement (via CRON ou manuellement):

-- Nettoyer les tokens expirés
-- SELECT cleanup_expired_tokens();

-- Nettoyer les vieux logs (garder 90 jours)
-- SELECT cleanup_old_audit_logs(90);

-- Nettoyer l'historique GPS (garder 30 jours)
-- SELECT cleanup_old_location_history(30);

-- Analyser les tables pour optimiser les requêtes
-- ANALYZE orders;
-- ANALYZE deliveries;
-- ANALYZE users;
-- ANALYZE products;

-- Vacuum pour récupérer l'espace
-- VACUUM ANALYZE;

-- =============================================
-- 10. STATISTIQUES ET MONITORING
-- =============================================

-- Voir la taille des tables
-- SELECT 
--     schemaname,
--     tablename,
--     pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) AS size
-- FROM pg_tables
-- WHERE schemaname = 'public'
-- ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;

-- Voir les index inutilisés
-- SELECT 
--     schemaname,
--     tablename,
--     indexname,
--     idx_scan
-- FROM pg_stat_user_indexes
-- WHERE idx_scan = 0
-- ORDER BY pg_relation_size(indexrelid) DESC;

-- =============================================
-- FIN DES MIGRATIONS
-- =============================================

-- Vérifier que tout est OK
SELECT 'Migrations terminées avec succès!' as status;
