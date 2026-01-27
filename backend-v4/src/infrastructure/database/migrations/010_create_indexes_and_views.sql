-- Migration 010: Create additional indexes and materialized views
-- Description: Optimisations de performance et vues matérialisées

-- ============================================================================
-- INDEXES SUPPLÉMENTAIRES POUR PERFORMANCE
-- ============================================================================

-- Index pour recherche full-text sur les produits
CREATE INDEX idx_products_name_trgm ON products USING gin(name gin_trgm_ops) WHERE deleted_at IS NULL;
CREATE INDEX idx_products_description_trgm ON products USING gin(description gin_trgm_ops) WHERE deleted_at IS NULL;

-- Index pour recherche full-text sur les utilisateurs
CREATE INDEX idx_users_name_trgm ON users USING gin((first_name || ' ' || last_name) gin_trgm_ops) WHERE deleted_at IS NULL;

-- Index pour les requêtes de dashboard
CREATE INDEX idx_orders_org_status_date ON orders(organization_id, status, created_at DESC) WHERE deleted_at IS NULL;
CREATE INDEX idx_deliveries_org_status_date ON deliveries(organization_id, status, created_at DESC) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_org_date_amount ON payments(organization_id, payment_date DESC, amount) WHERE deleted_at IS NULL;

-- ============================================================================
-- VUES MATÉRIALISÉES POUR RAPPORTS
-- ============================================================================

-- Vue: Statistiques quotidiennes par organisation
CREATE MATERIALIZED VIEW daily_organization_stats AS
SELECT
  o.organization_id,
  DATE(o.created_at) as date,
  
  -- Commandes
  COUNT(DISTINCT o.id) as total_orders,
  COUNT(DISTINCT CASE WHEN o.status = 'delivered' THEN o.id END) as delivered_orders,
  COUNT(DISTINCT CASE WHEN o.status = 'cancelled' THEN o.id END) as cancelled_orders,
  
  -- Montants (en centimes)
  COALESCE(SUM(o.total), 0) as total_revenue,
  COALESCE(SUM(CASE WHEN o.status = 'delivered' THEN o.total ELSE 0 END), 0) as delivered_revenue,
  COALESCE(SUM(o.amount_paid), 0) as total_paid,
  COALESCE(SUM(o.amount_due), 0) as total_due,
  
  -- Clients
  COUNT(DISTINCT o.customer_id) as unique_customers,
  
  -- Livraisons
  COUNT(DISTINCT d.id) as total_deliveries,
  COUNT(DISTINCT d.deliverer_id) as active_deliverers,
  
  -- Temps moyen de livraison (en secondes)
  AVG(EXTRACT(EPOCH FROM (d.delivered_at - d.created_at)))::INTEGER as avg_delivery_time
  
FROM orders o
LEFT JOIN deliveries d ON d.order_id = o.id
WHERE o.deleted_at IS NULL
GROUP BY o.organization_id, DATE(o.created_at);

-- Index pour la vue matérialisée
CREATE UNIQUE INDEX idx_daily_org_stats_org_date ON daily_organization_stats(organization_id, date);
CREATE INDEX idx_daily_org_stats_date ON daily_organization_stats(date DESC);

-- Vue: Vieillissement des créances par client
CREATE MATERIALIZED VIEW customer_debt_aging AS
SELECT
  o.organization_id,
  o.customer_id,
  u.first_name || ' ' || u.last_name as customer_name,
  u.email as customer_email,
  u.credit_limit,
  u.current_debt,
  
  -- Vieillissement des dettes
  COALESCE(SUM(CASE 
    WHEN o.payment_status IN ('unpaid', 'partial') 
      AND o.created_at >= CURRENT_TIMESTAMP - INTERVAL '7 days'
    THEN o.amount_due 
    ELSE 0 
  END), 0) as debt_0_7_days,
  
  COALESCE(SUM(CASE 
    WHEN o.payment_status IN ('unpaid', 'partial')
      AND o.created_at >= CURRENT_TIMESTAMP - INTERVAL '15 days'
      AND o.created_at < CURRENT_TIMESTAMP - INTERVAL '7 days'
    THEN o.amount_due 
    ELSE 0 
  END), 0) as debt_8_15_days,
  
  COALESCE(SUM(CASE 
    WHEN o.payment_status IN ('unpaid', 'partial')
      AND o.created_at >= CURRENT_TIMESTAMP - INTERVAL '30 days'
      AND o.created_at < CURRENT_TIMESTAMP - INTERVAL '15 days'
    THEN o.amount_due 
    ELSE 0 
  END), 0) as debt_16_30_days,
  
  COALESCE(SUM(CASE 
    WHEN o.payment_status IN ('unpaid', 'partial')
      AND o.created_at < CURRENT_TIMESTAMP - INTERVAL '30 days'
    THEN o.amount_due 
    ELSE 0 
  END), 0) as debt_over_30_days,
  
  -- Statistiques
  COUNT(DISTINCT CASE WHEN o.payment_status IN ('unpaid', 'partial') THEN o.id END) as unpaid_orders_count,
  MIN(CASE WHEN o.payment_status IN ('unpaid', 'partial') THEN o.created_at END) as oldest_unpaid_order_date
  
FROM users u
LEFT JOIN orders o ON o.customer_id = u.id AND o.deleted_at IS NULL
WHERE u.role = 'customer' AND u.deleted_at IS NULL
GROUP BY o.organization_id, o.customer_id, u.first_name, u.last_name, u.email, u.credit_limit, u.current_debt;

-- Index pour la vue matérialisée
CREATE UNIQUE INDEX idx_customer_debt_aging_org_customer ON customer_debt_aging(organization_id, customer_id);
CREATE INDEX idx_customer_debt_aging_current_debt ON customer_debt_aging(current_debt DESC);

-- Vue: Performance des livreurs
CREATE MATERIALIZED VIEW deliverer_performance AS
SELECT
  d.organization_id,
  d.deliverer_id,
  u.first_name || ' ' || u.last_name as deliverer_name,
  
  -- Statistiques de livraison
  COUNT(d.id) as total_deliveries,
  COUNT(CASE WHEN d.status = 'delivered' THEN 1 END) as successful_deliveries,
  COUNT(CASE WHEN d.status = 'failed' THEN 1 END) as failed_deliveries,
  
  -- Taux de réussite
  ROUND(
    COUNT(CASE WHEN d.status = 'delivered' THEN 1 END)::NUMERIC / 
    NULLIF(COUNT(d.id), 0) * 100, 
    2
  ) as success_rate,
  
  -- Temps moyen de livraison (en secondes)
  AVG(EXTRACT(EPOCH FROM (d.delivered_at - d.picked_up_at)))::INTEGER as avg_delivery_time,
  
  -- Distance totale (en mètres)
  SUM(d.actual_distance) as total_distance,
  
  -- Chiffre d'affaires généré (en centimes)
  COALESCE(SUM(o.total), 0) as total_revenue,
  
  -- Dernière livraison
  MAX(d.delivered_at) as last_delivery_date
  
FROM deliveries d
JOIN users u ON u.id = d.deliverer_id
LEFT JOIN orders o ON o.id = d.order_id
WHERE d.deleted_at IS NULL AND u.deleted_at IS NULL
GROUP BY d.organization_id, d.deliverer_id, u.first_name, u.last_name;

-- Index pour la vue matérialisée
CREATE UNIQUE INDEX idx_deliverer_perf_org_deliverer ON deliverer_performance(organization_id, deliverer_id);
CREATE INDEX idx_deliverer_perf_success_rate ON deliverer_performance(success_rate DESC);

-- Vue: Produits les plus vendus
CREATE MATERIALIZED VIEW top_selling_products AS
SELECT
  p.organization_id,
  p.id as product_id,
  p.name as product_name,
  p.category,
  
  -- Statistiques de vente
  COUNT(DISTINCT oi.order_id) as orders_count,
  SUM(oi.quantity) as total_quantity_sold,
  SUM(oi.total) as total_revenue,
  
  -- Moyenne
  AVG(oi.quantity)::NUMERIC(10,2) as avg_quantity_per_order,
  AVG(oi.unit_price)::INTEGER as avg_unit_price,
  
  -- Dernière vente
  MAX(o.created_at) as last_sold_at
  
FROM products p
JOIN order_items oi ON oi.product_id = p.id
JOIN orders o ON o.id = oi.order_id
WHERE p.deleted_at IS NULL 
  AND o.deleted_at IS NULL
  AND o.status NOT IN ('cancelled', 'failed')
GROUP BY p.organization_id, p.id, p.name, p.category;

-- Index pour la vue matérialisée
CREATE UNIQUE INDEX idx_top_products_org_product ON top_selling_products(organization_id, product_id);
CREATE INDEX idx_top_products_revenue ON top_selling_products(total_revenue DESC);
CREATE INDEX idx_top_products_quantity ON top_selling_products(total_quantity_sold DESC);

-- ============================================================================
-- FONCTIONS POUR RAFRAÎCHIR LES VUES MATÉRIALISÉES
-- ============================================================================

-- Fonction pour rafraîchir toutes les vues matérialisées
CREATE OR REPLACE FUNCTION refresh_all_materialized_views()
RETURNS void AS $$
BEGIN
  REFRESH MATERIALIZED VIEW CONCURRENTLY daily_organization_stats;
  REFRESH MATERIALIZED VIEW CONCURRENTLY customer_debt_aging;
  REFRESH MATERIALIZED VIEW CONCURRENTLY deliverer_performance;
  REFRESH MATERIALIZED VIEW CONCURRENTLY top_selling_products;
END;
$$ LANGUAGE plpgsql;

-- Fonction pour rafraîchir les statistiques quotidiennes
CREATE OR REPLACE FUNCTION refresh_daily_stats()
RETURNS void AS $$
BEGIN
  REFRESH MATERIALIZED VIEW CONCURRENTLY daily_organization_stats;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- VUES SIMPLES (NON MATÉRIALISÉES) POUR REQUÊTES FRÉQUENTES
-- ============================================================================

-- Vue: Commandes en cours
CREATE OR REPLACE VIEW active_orders AS
SELECT
  o.*,
  u.first_name || ' ' || u.last_name as customer_name,
  u.phone as customer_phone,
  d.id as delivery_id,
  d.status as delivery_status,
  d.deliverer_id,
  du.first_name || ' ' || du.last_name as deliverer_name
FROM orders o
JOIN users u ON u.id = o.customer_id
LEFT JOIN deliveries d ON d.order_id = o.id
LEFT JOIN users du ON du.id = d.deliverer_id
WHERE o.deleted_at IS NULL
  AND o.status NOT IN ('delivered', 'cancelled', 'failed');

-- Vue: Livraisons en cours
CREATE OR REPLACE VIEW active_deliveries AS
SELECT
  d.*,
  o.order_number,
  o.total as order_total,
  u.first_name || ' ' || u.last_name as deliverer_name,
  u.phone as deliverer_phone,
  u.vehicle_type,
  c.first_name || ' ' || c.last_name as customer_name,
  c.phone as customer_phone
FROM deliveries d
JOIN orders o ON o.id = d.order_id
JOIN users u ON u.id = d.deliverer_id
JOIN users c ON c.id = o.customer_id
WHERE d.deleted_at IS NULL
  AND d.status IN ('assigned', 'picked_up', 'in_transit', 'arrived');

-- Vue: Alertes actives
CREATE OR REPLACE VIEW active_alerts AS
SELECT
  'stock' as alert_category,
  sa.id,
  sa.organization_id,
  sa.alert_type,
  sa.message,
  sa.created_at,
  p.name as product_name,
  p.current_stock,
  NULL as customer_name,
  NULL as current_debt
FROM stock_alerts sa
JOIN products p ON p.id = sa.product_id
WHERE sa.status = 'active'

UNION ALL

SELECT
  'credit' as alert_category,
  gen_random_uuid() as id,
  u.organization_id,
  'credit_limit_exceeded' as alert_type,
  'Customer "' || u.first_name || ' ' || u.last_name || '" has exceeded credit limit' as message,
  CURRENT_TIMESTAMP as created_at,
  NULL as product_name,
  NULL as current_stock,
  u.first_name || ' ' || u.last_name as customer_name,
  u.current_debt
FROM users u
WHERE u.role = 'customer'
  AND u.deleted_at IS NULL
  AND u.current_debt > u.credit_limit;

-- Commentaires
COMMENT ON MATERIALIZED VIEW daily_organization_stats IS 'Statistiques quotidiennes par organisation (rafraîchir quotidiennement)';
COMMENT ON MATERIALIZED VIEW customer_debt_aging IS 'Vieillissement des créances par client (rafraîchir quotidiennement)';
COMMENT ON MATERIALIZED VIEW deliverer_performance IS 'Performance des livreurs (rafraîchir hebdomadairement)';
COMMENT ON MATERIALIZED VIEW top_selling_products IS 'Produits les plus vendus (rafraîchir quotidiennement)';
COMMENT ON VIEW active_orders IS 'Commandes en cours (temps réel)';
COMMENT ON VIEW active_deliveries IS 'Livraisons en cours (temps réel)';
COMMENT ON VIEW active_alerts IS 'Toutes les alertes actives (temps réel)';
