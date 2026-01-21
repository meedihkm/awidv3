-- ============================================
-- PHASE 2: SYSTÈME DE COMMANDE HABITUELLE
-- ============================================
-- Date: 19 Janvier 2026
-- Description: Détection automatique des patterns de commande
--              et système de favoris pour commande rapide

-- ============================================
-- 1. TABLE: favorite_orders
-- ============================================
-- Stocke les commandes favorites des clients

CREATE TABLE IF NOT EXISTS favorite_orders (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  client_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  organization_id TEXT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL DEFAULT 'Ma commande habituelle',
  items JSONB NOT NULL, -- [{productId, quantity, productName, unitPrice}]
  total DECIMAL(10,2) NOT NULL,
  order_count INTEGER DEFAULT 0, -- Nombre de fois commandé
  last_ordered_at TIMESTAMP,
  is_auto_detected BOOLEAN DEFAULT false, -- Détecté automatiquement ou créé manuellement
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  CONSTRAINT fk_favorite_client FOREIGN KEY (client_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_favorite_organization FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE
);

-- Index pour performance
CREATE INDEX IF NOT EXISTS idx_favorite_orders_client ON favorite_orders(client_id) WHERE is_active = true;
CREATE INDEX IF NOT EXISTS idx_favorite_orders_org ON favorite_orders(organization_id);
CREATE INDEX IF NOT EXISTS idx_favorite_orders_auto ON favorite_orders(client_id, is_auto_detected) WHERE is_active = true;

-- ============================================
-- 2. TABLE: client_order_patterns
-- ============================================
-- Analyse des patterns de commande pour détection automatique

CREATE TABLE IF NOT EXISTS client_order_patterns (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  client_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  organization_id TEXT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  items_signature TEXT NOT NULL, -- Hash des items pour comparaison
  items JSONB NOT NULL,
  occurrence_count INTEGER DEFAULT 1,
  first_occurrence TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  last_occurrence TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  CONSTRAINT fk_pattern_client FOREIGN KEY (client_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_pattern_organization FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE,
  CONSTRAINT unique_client_pattern UNIQUE(client_id, items_signature)
);

-- Index pour performance
CREATE INDEX IF NOT EXISTS idx_patterns_client ON client_order_patterns(client_id);
CREATE INDEX IF NOT EXISTS idx_patterns_occurrence ON client_order_patterns(occurrence_count DESC);

-- ============================================
-- 3. TABLE: user_preferences
-- ============================================
-- Préférences utilisateur pour commande habituelle

CREATE TABLE IF NOT EXISTS user_preferences (
  user_id TEXT PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  favorite_orders_enabled BOOLEAN DEFAULT true,
  auto_suggest_enabled BOOLEAN DEFAULT true,
  min_pattern_count INTEGER DEFAULT 3, -- Minimum d'occurrences pour suggestion
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  CONSTRAINT fk_preferences_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ============================================
-- 4. FONCTION: detect_order_pattern
-- ============================================
-- Détecte et enregistre les patterns de commande

CREATE OR REPLACE FUNCTION detect_order_pattern(
  p_client_id TEXT,
  p_organization_id TEXT,
  p_items JSONB
) RETURNS JSONB AS $$
DECLARE
  v_signature TEXT;
  v_pattern_count INTEGER;
  v_should_suggest BOOLEAN := false;
  v_min_count INTEGER;
  v_existing_favorite UUID;
BEGIN
  -- Créer signature des items (triés par productId)
  SELECT string_agg(
    item->>'productId' || ':' || item->>'quantity',
    ','
    ORDER BY item->>'productId'
  ) INTO v_signature
  FROM jsonb_array_elements(p_items) AS item;
  
  -- Insérer ou mettre à jour le pattern
  INSERT INTO client_order_patterns (
    client_id,
    organization_id,
    items_signature,
    items,
    occurrence_count,
    last_occurrence
  ) VALUES (
    p_client_id,
    p_organization_id,
    v_signature,
    p_items,
    1,
    CURRENT_TIMESTAMP
  )
  ON CONFLICT (client_id, items_signature)
  DO UPDATE SET
    occurrence_count = client_order_patterns.occurrence_count + 1,
    last_occurrence = CURRENT_TIMESTAMP
  RETURNING occurrence_count INTO v_pattern_count;
  
  -- Récupérer le seuil minimum de l'utilisateur
  SELECT COALESCE(min_pattern_count, 3) INTO v_min_count
  FROM user_preferences
  WHERE user_id = p_client_id;
  
  IF v_min_count IS NULL THEN
    v_min_count := 3;
  END IF;
  
  -- Vérifier si on doit suggérer comme favori
  IF v_pattern_count >= v_min_count THEN
    -- Vérifier si pas déjà en favori
    SELECT id INTO v_existing_favorite
    FROM favorite_orders
    WHERE client_id = p_client_id
      AND is_active = true
      AND is_auto_detected = true
    LIMIT 1;
    
    IF v_existing_favorite IS NULL THEN
      v_should_suggest := true;
    END IF;
  END IF;
  
  RETURN jsonb_build_object(
    'pattern_count', v_pattern_count,
    'should_suggest', v_should_suggest,
    'min_count', v_min_count
  );
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 5. FONCTION: create_favorite_from_pattern
-- ============================================
-- Crée un favori à partir d'un pattern détecté

CREATE OR REPLACE FUNCTION create_favorite_from_pattern(
  p_client_id TEXT,
  p_organization_id TEXT,
  p_items JSONB,
  p_name VARCHAR DEFAULT 'Ma commande habituelle'
) RETURNS UUID AS $$
DECLARE
  v_favorite_id UUID;
  v_total DECIMAL(10,2);
BEGIN
  -- Calculer le total
  SELECT SUM((item->>'quantity')::INTEGER * (item->>'unitPrice')::DECIMAL)
  INTO v_total
  FROM jsonb_array_elements(p_items) AS item;
  
  -- Créer le favori
  INSERT INTO favorite_orders (
    client_id,
    organization_id,
    name,
    items,
    total,
    is_auto_detected,
    is_active
  ) VALUES (
    p_client_id,
    p_organization_id,
    p_name,
    p_items,
    v_total,
    true,
    true
  )
  RETURNING id INTO v_favorite_id;
  
  RETURN v_favorite_id;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 6. FONCTION: get_client_favorites
-- ============================================
-- Récupère les favoris d'un client avec détails

CREATE OR REPLACE FUNCTION get_client_favorites(
  p_client_id TEXT
) RETURNS TABLE (
  id UUID,
  name VARCHAR,
  items JSONB,
  total DECIMAL,
  order_count INTEGER,
  last_ordered_at TIMESTAMP,
  is_auto_detected BOOLEAN,
  created_at TIMESTAMP
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    f.id,
    f.name,
    f.items,
    f.total,
    f.order_count,
    f.last_ordered_at,
    f.is_auto_detected,
    f.created_at
  FROM favorite_orders f
  WHERE f.client_id = p_client_id
    AND f.is_active = true
  ORDER BY f.order_count DESC, f.last_ordered_at DESC NULLS LAST;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 7. FONCTION: update_favorite_usage
-- ============================================
-- Met à jour les stats d'utilisation d'un favori

CREATE OR REPLACE FUNCTION update_favorite_usage(
  p_favorite_id UUID
) RETURNS VOID AS $$
BEGIN
  UPDATE favorite_orders
  SET
    order_count = order_count + 1,
    last_ordered_at = CURRENT_TIMESTAMP,
    updated_at = CURRENT_TIMESTAMP
  WHERE id = p_favorite_id;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 8. TRIGGER: update_favorite_timestamp
-- ============================================
-- Met à jour automatiquement updated_at

CREATE OR REPLACE FUNCTION update_favorite_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_favorite_timestamp
BEFORE UPDATE ON favorite_orders
FOR EACH ROW
EXECUTE FUNCTION update_favorite_timestamp();

CREATE TRIGGER trigger_update_preferences_timestamp
BEFORE UPDATE ON user_preferences
FOR EACH ROW
EXECUTE FUNCTION update_favorite_timestamp();

-- ============================================
-- 9. VUE: client_favorite_stats
-- ============================================
-- Statistiques sur les favoris par client

CREATE OR REPLACE VIEW client_favorite_stats AS
SELECT
  u.id AS client_id,
  u.name AS client_name,
  u.organization_id,
  COUNT(f.id) AS favorite_count,
  SUM(f.order_count) AS total_favorite_orders,
  MAX(f.last_ordered_at) AS last_favorite_used,
  COALESCE(up.favorite_orders_enabled, true) AS feature_enabled
FROM users u
LEFT JOIN favorite_orders f ON f.client_id = u.id AND f.is_active = true
LEFT JOIN user_preferences up ON up.user_id = u.id
WHERE u.role = 'cafeteria'
GROUP BY u.id, u.name, u.organization_id, up.favorite_orders_enabled;

-- ============================================
-- 10. DONNÉES INITIALES
-- ============================================
-- Créer préférences par défaut pour utilisateurs existants

INSERT INTO user_preferences (user_id, favorite_orders_enabled, auto_suggest_enabled, min_pattern_count)
SELECT id, true, true, 3
FROM users
WHERE role = 'cafeteria'
ON CONFLICT (user_id) DO NOTHING;

-- ============================================
-- COMMENTAIRES
-- ============================================

COMMENT ON TABLE favorite_orders IS 'Commandes favorites des clients pour commande rapide';
COMMENT ON TABLE client_order_patterns IS 'Patterns de commande détectés automatiquement';
COMMENT ON TABLE user_preferences IS 'Préférences utilisateur pour fonctionnalités';
COMMENT ON FUNCTION detect_order_pattern IS 'Détecte et enregistre les patterns de commande répétitifs';
COMMENT ON FUNCTION create_favorite_from_pattern IS 'Crée un favori à partir d''un pattern détecté';
COMMENT ON FUNCTION get_client_favorites IS 'Récupère les favoris actifs d''un client';
COMMENT ON FUNCTION update_favorite_usage IS 'Incrémente le compteur d''utilisation d''un favori';

-- ============================================
-- FIN DU SCRIPT
-- ============================================
