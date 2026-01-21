-- =====================================================
-- MIGRATION : Limite de crédit
-- =====================================================

-- Ajouter colonne credit_limit si pas présente
ALTER TABLE users ADD COLUMN IF NOT EXISTS credit_limit DECIMAL(10,2) DEFAULT NULL;
-- NULL = pas de limite

-- Index pour les requêtes
CREATE INDEX IF NOT EXISTS idx_users_credit_limit ON users(organization_id, credit_limit) 
  WHERE credit_limit IS NOT NULL;

COMMENT ON COLUMN users.credit_limit IS 'Plafond de crédit en DA. NULL = pas de limite.';
