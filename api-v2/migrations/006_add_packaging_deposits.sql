-- =====================================================
-- Migration 006: Packaging Deposits (Consignes)
-- =====================================================
-- Système de gestion des consignes (emballages retournables)

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
