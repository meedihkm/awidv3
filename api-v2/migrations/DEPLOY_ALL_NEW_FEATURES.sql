-- =====================================================
-- SCRIPT DE DÉPLOIEMENT - TOUTES LES NOUVELLES FEATURES
-- =====================================================
-- À exécuter sur la base de données PostgreSQL de production
-- Date: 2026-01-21
--
-- Ce script inclut les migrations:
--   004: Gestion de la dette
--   005: Limite de crédit
--   006: Consignes (emballages)
--   007: Commandes récurrentes
-- =====================================================

BEGIN;

-- =====================================================
-- MIGRATION 004 : Gestion de la dette
-- =====================================================

-- 1. Ajouter colonnes à la table orders (si pas présentes)
ALTER TABLE orders ADD COLUMN IF NOT EXISTS amount_paid DECIMAL(10,2) DEFAULT 0;
ALTER TABLE orders ADD COLUMN IF NOT EXISTS payment_status VARCHAR(20) DEFAULT 'unpaid';
-- payment_status : 'unpaid', 'partial', 'paid'

-- Mettre à jour les commandes existantes
UPDATE orders SET payment_status = 'paid' WHERE amount_paid >= total;
UPDATE orders SET payment_status = 'partial' WHERE amount_paid > 0 AND amount_paid < total;

-- 2. Table des paiements de dette
CREATE TABLE IF NOT EXISTS debt_payments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  customer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  
  -- Montant et type
  amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
  payment_type VARCHAR(20) NOT NULL DEFAULT 'cash',
  -- 'cash', 'check', 'transfer', 'other'
  
  -- Qui a collecté
  collected_by UUID NOT NULL REFERENCES users(id),
  collector_role VARCHAR(20) NOT NULL,
  -- 'admin', 'deliverer'
  
  -- Contexte (optionnel - si collecté lors d'une livraison)
  delivery_id UUID REFERENCES deliveries(id) ON DELETE SET NULL,
  
  -- Métadonnées
  note TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  -- Contraintes
  CONSTRAINT valid_payment_type CHECK (payment_type IN ('cash', 'check', 'transfer', 'other')),
  CONSTRAINT valid_collector_role CHECK (collector_role IN ('admin', 'deliverer'))
);

-- Index pour performance
CREATE INDEX IF NOT EXISTS idx_debt_payments_customer ON debt_payments(customer_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_debt_payments_org ON debt_payments(organization_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_debt_payments_collector ON debt_payments(collected_by, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_debt_payments_delivery ON debt_payments(delivery_id);

-- Index sur orders pour calcul dette
CREATE INDEX IF NOT EXISTS idx_orders_customer_payment ON orders(customer_id, payment_status, organization_id);

-- =====================================================
-- MIGRATION 005 : Limite de crédit
-- =====================================================

-- Ajouter colonne credit_limit si pas présente
ALTER TABLE users ADD COLUMN IF NOT EXISTS credit_limit DECIMAL(10,2) DEFAULT NULL;
-- NULL = pas de limite

-- Index pour les requêtes
CREATE INDEX IF NOT EXISTS idx_users_credit_limit ON users(organization_id, credit_limit) 
  WHERE credit_limit IS NOT NULL;

COMMENT ON COLUMN users.credit_limit IS 'Plafond de crédit en DA. NULL = pas de limite.';

-- =====================================================
-- MIGRATION 006 : Consignes (Emballages)
-- =====================================================

-- Table des types de consignes
CREATE TABLE IF NOT EXISTS packaging_types (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID REFERENCES organizations(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  deposit_value DECIMAL(10,2) DEFAULT 0,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Table des transactions de consignes
CREATE TABLE IF NOT EXISTS packaging_deposits (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID REFERENCES organizations(id) ON DELETE CASCADE,
  customer_id UUID REFERENCES users(id) ON DELETE CASCADE,
  packaging_type_id UUID REFERENCES packaging_types(id) ON DELETE CASCADE,
  delivery_id UUID REFERENCES deliveries(id) ON DELETE SET NULL,
  quantity INTEGER NOT NULL,  -- Positive = given to customer, Negative = returned by customer
  recorded_by UUID REFERENCES users(id),
  note TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Indexes pour performance
CREATE INDEX IF NOT EXISTS idx_packaging_types_org ON packaging_types(organization_id);
CREATE INDEX IF NOT EXISTS idx_packaging_types_active ON packaging_types(organization_id, active);

CREATE INDEX IF NOT EXISTS idx_packaging_deposits_customer ON packaging_deposits(customer_id);
CREATE INDEX IF NOT EXISTS idx_packaging_deposits_delivery ON packaging_deposits(delivery_id);
CREATE INDEX IF NOT EXISTS idx_packaging_deposits_org ON packaging_deposits(organization_id);
CREATE INDEX IF NOT EXISTS idx_packaging_deposits_type ON packaging_deposits(packaging_type_id);
CREATE INDEX IF NOT EXISTS idx_packaging_deposits_date ON packaging_deposits(created_at DESC);

-- Vue pour calculer le solde par client/type
CREATE OR REPLACE VIEW customer_packaging_balance AS
SELECT 
  pd.organization_id,
  pd.customer_id,
  pd.packaging_type_id,
  pt.name as type_name,
  pt.deposit_value,
  SUM(CASE WHEN pd.quantity > 0 THEN pd.quantity ELSE 0 END) as total_given,
  SUM(CASE WHEN pd.quantity < 0 THEN ABS(pd.quantity) ELSE 0 END) as total_returned,
  SUM(pd.quantity) as outstanding
FROM packaging_deposits pd
JOIN packaging_types pt ON pd.packaging_type_id = pt.id
GROUP BY pd.organization_id, pd.customer_id, pd.packaging_type_id, pt.name, pt.deposit_value;

-- Commentaires
COMMENT ON TABLE packaging_types IS 'Types de consignes (caisses, bouteilles, etc.)';
COMMENT ON TABLE packaging_deposits IS 'Transactions de consignes données/retournées';
COMMENT ON COLUMN packaging_deposits.quantity IS 'Positif = donné au client, Négatif = retourné par client';

-- =====================================================
-- MIGRATION 007 : Commandes Récurrentes
-- =====================================================

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

COMMIT;

-- =====================================================
-- RÉSUMÉ DES TABLES CRÉÉES
-- =====================================================
-- 
-- NOUVELLES TABLES:
--   1. debt_payments          - Paiements de dette collectés
--   2. packaging_types        - Types de consignes
--   3. packaging_deposits     - Transactions de consignes
--   4. recurring_orders       - Templates commandes récurrentes
--   5. recurring_order_items  - Items des templates récurrents
--
-- COLONNES AJOUTÉES:
--   - orders.amount_paid       (DECIMAL)
--   - orders.payment_status    (VARCHAR - unpaid/partial/paid)
--   - users.credit_limit       (DECIMAL, NULL = pas de limite)
--
-- VUES CRÉÉES:
--   - customer_packaging_balance
--
-- =====================================================
