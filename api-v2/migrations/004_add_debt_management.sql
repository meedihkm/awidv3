-- =====================================================
-- MIGRATION : Gestion de la dette
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
