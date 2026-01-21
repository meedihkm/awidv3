-- =====================================================
-- Migration 007: Recurring Orders (Commandes Récurrentes)
-- =====================================================
-- Système de commandes récurrentes automatiques

-- Table des templates de commandes récurrentes
CREATE TABLE IF NOT EXISTS recurring_orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID REFERENCES organizations(id) ON DELETE CASCADE,
  cafeteria_id UUID REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(100),
  frequency VARCHAR(20) NOT NULL CHECK (frequency IN ('daily', 'weekly', 'monthly')),
  day_of_week INTEGER CHECK (day_of_week >= 0 AND day_of_week <= 6),  -- 0=Sunday, 6=Saturday
  day_of_month INTEGER CHECK (day_of_month >= 1 AND day_of_month <= 31),
  time_of_day TIME DEFAULT '06:00:00',
  active BOOLEAN DEFAULT true,
  last_generated_at TIMESTAMP,
  next_generation_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Table des items du template
CREATE TABLE IF NOT EXISTS recurring_order_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  recurring_order_id UUID REFERENCES recurring_orders(id) ON DELETE CASCADE,
  product_id UUID REFERENCES products(id) ON DELETE CASCADE,
  quantity INTEGER NOT NULL DEFAULT 1 CHECK (quantity > 0)
);

-- Indexes pour performance
CREATE INDEX IF NOT EXISTS idx_recurring_orders_org ON recurring_orders(organization_id);
CREATE INDEX IF NOT EXISTS idx_recurring_orders_cafeteria ON recurring_orders(cafeteria_id);
CREATE INDEX IF NOT EXISTS idx_recurring_orders_next ON recurring_orders(next_generation_at) WHERE active = true;
CREATE INDEX IF NOT EXISTS idx_recurring_orders_active ON recurring_orders(organization_id, active);
CREATE INDEX IF NOT EXISTS idx_recurring_items_order ON recurring_order_items(recurring_order_id);

-- Commentaires
COMMENT ON TABLE recurring_orders IS 'Templates de commandes récurrentes pour les cafétérias';
COMMENT ON TABLE recurring_order_items IS 'Produits inclus dans chaque template récurrent';
COMMENT ON COLUMN recurring_orders.frequency IS 'Fréquence: daily, weekly, monthly';
COMMENT ON COLUMN recurring_orders.day_of_week IS 'Jour de la semaine pour weekly (0=Dimanche)';
COMMENT ON COLUMN recurring_orders.day_of_month IS 'Jour du mois pour monthly (1-31)';
COMMENT ON COLUMN recurring_orders.next_generation_at IS 'Prochaine date/heure de génération automatique';
