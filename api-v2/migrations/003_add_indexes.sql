-- Migration: 003_add_indexes.sql
-- Description: Ajout d'index pour optimiser les performances des listes et filtres

-- Index composite pour les commandes par organisation et date (tri par défaut)
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_orders_org_created 
ON orders (organization_id, created_at DESC);

-- Index partiel pour les commandes actives (status filter)
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_orders_status_active 
ON orders (status) 
WHERE status IN ('pending', 'validated', 'preparing', 'ready', 'in_delivery');

-- Index composite pour les livraisons par livreur et statut
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_deliveries_deliverer_status 
ON deliveries (deliverer_id, status);

-- Index composite pour les livraisons par organisation et date
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_deliveries_org_created 
ON deliveries (organization_id, created_at DESC);

-- Index pour l'historique de audit logs (souvent filtré par org et trié par date)
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_audit_logs_org_created 
ON audit_logs (organization_id, created_at DESC);

-- Index pour location history (par user et date)
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_location_history_user_created 
ON location_history (user_id, created_at DESC);
