-- ============================================
-- PHASE 3: SYSTÈME DE NOTIFICATIONS
-- ============================================
-- Date: 19 Janvier 2026
-- Description: Système de notifications pour paiements,
--              dettes, favoris et rappels

-- ============================================
-- 1. TABLE: notifications
-- ============================================
-- Stocke toutes les notifications

CREATE TABLE IF NOT EXISTS notifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  organization_id TEXT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  type VARCHAR(50) NOT NULL, -- payment_recorded, debt_cleared, favorite_suggested, debt_reminder
  title VARCHAR(200) NOT NULL,
  message TEXT NOT NULL,
  data JSONB, -- Données additionnelles (orderId, paymentId, favoriteId, etc.)
  is_read BOOLEAN DEFAULT false,
  priority VARCHAR(20) DEFAULT 'normal', -- low, normal, high, urgent
  action_url VARCHAR(500), -- URL ou route pour action
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  read_at TIMESTAMP,
  expires_at TIMESTAMP, -- Expiration optionnelle
  
  CONSTRAINT fk_notification_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_notification_organization FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE
);

-- Index pour performance
CREATE INDEX IF NOT EXISTS idx_notifications_user ON notifications(user_id, is_read, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_notifications_org ON notifications(organization_id);
CREATE INDEX IF NOT EXISTS idx_notifications_type ON notifications(type);
CREATE INDEX IF NOT EXISTS idx_notifications_unread ON notifications(user_id) WHERE is_read = false;
CREATE INDEX IF NOT EXISTS idx_notifications_expires ON notifications(expires_at) WHERE expires_at IS NOT NULL;

-- ============================================
-- 2. TABLE: notification_preferences
-- ============================================
-- Préférences de notification par utilisateur

CREATE TABLE IF NOT EXISTS notification_preferences (
  user_id TEXT PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  payment_notifications BOOLEAN DEFAULT true,
  debt_notifications BOOLEAN DEFAULT true,
  favorite_notifications BOOLEAN DEFAULT true,
  debt_reminders_enabled BOOLEAN DEFAULT false,
  debt_reminder_frequency INTEGER DEFAULT 7, -- Jours entre rappels
  quiet_hours_start TIME, -- Début heures silencieuses
  quiet_hours_end TIME, -- Fin heures silencieuses
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  CONSTRAINT fk_notif_pref_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ============================================
-- 3. FONCTION: create_notification
-- ============================================
-- Crée une notification pour un utilisateur

CREATE OR REPLACE FUNCTION create_notification(
  p_user_id TEXT,
  p_organization_id TEXT,
  p_type VARCHAR,
  p_title VARCHAR,
  p_message TEXT,
  p_data JSONB DEFAULT NULL,
  p_priority VARCHAR DEFAULT 'normal',
  p_action_url VARCHAR DEFAULT NULL,
  p_expires_in_days INTEGER DEFAULT NULL
) RETURNS UUID AS $$
DECLARE
  v_notification_id UUID;
  v_expires_at TIMESTAMP;
  v_preferences RECORD;
BEGIN
  -- Vérifier les préférences utilisateur
  SELECT * INTO v_preferences
  FROM notification_preferences
  WHERE user_id = p_user_id;
  
  -- Si pas de préférences, créer avec valeurs par défaut
  IF v_preferences IS NULL THEN
    INSERT INTO notification_preferences (user_id)
    VALUES (p_user_id);
    v_preferences := ROW(p_user_id, true, true, true, false, 7, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
  END IF;
  
  -- Vérifier si type de notification est activé
  IF (p_type LIKE 'payment%' AND NOT v_preferences.payment_notifications) OR
     (p_type LIKE 'debt%' AND NOT v_preferences.debt_notifications) OR
     (p_type LIKE 'favorite%' AND NOT v_preferences.favorite_notifications) THEN
    RETURN NULL; -- Ne pas créer la notification
  END IF;
  
  -- Calculer expiration si spécifiée
  IF p_expires_in_days IS NOT NULL THEN
    v_expires_at := CURRENT_TIMESTAMP + (p_expires_in_days || ' days')::INTERVAL;
  END IF;
  
  -- Créer la notification
  INSERT INTO notifications (
    user_id,
    organization_id,
    type,
    title,
    message,
    data,
    priority,
    action_url,
    expires_at
  ) VALUES (
    p_user_id,
    p_organization_id,
    p_type,
    p_title,
    p_message,
    p_data,
    p_priority,
    p_action_url,
    v_expires_at
  )
  RETURNING id INTO v_notification_id;
  
  RETURN v_notification_id;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 4. FONCTION: notify_payment_recorded
-- ============================================
-- Crée notifications pour paiement enregistré

CREATE OR REPLACE FUNCTION notify_payment_recorded(
  p_payment_id UUID,
  p_client_id TEXT,
  p_organization_id TEXT,
  p_amount DECIMAL,
  p_recorded_by_name VARCHAR,
  p_debt_cleared BOOLEAN
) RETURNS VOID AS $$
DECLARE
  v_admin_ids TEXT[];
  v_admin_id TEXT;
BEGIN
  -- Notification pour le client
  IF p_debt_cleared THEN
    -- Dette soldée - notification spéciale
    PERFORM create_notification(
      p_client_id,
      p_organization_id,
      'debt_cleared',
      '🎉 Dette soldée !',
      'Félicitations ! Votre dette a été entièrement réglée. Merci pour votre paiement de ' || p_amount || ' DA.',
      jsonb_build_object('paymentId', p_payment_id, 'amount', p_amount),
      'high',
      '/payments',
      30
    );
  ELSE
    -- Paiement enregistré
    PERFORM create_notification(
      p_client_id,
      p_organization_id,
      'payment_recorded',
      'Paiement enregistré',
      'Un paiement de ' || p_amount || ' DA a été enregistré par ' || p_recorded_by_name || '.',
      jsonb_build_object('paymentId', p_payment_id, 'amount', p_amount),
      'normal',
      '/payments',
      30
    );
  END IF;
  
  -- Notification pour les admins
  SELECT ARRAY_AGG(id) INTO v_admin_ids
  FROM users
  WHERE organization_id = p_organization_id
    AND role IN ('admin', 'superadmin')
    AND id != p_client_id;
  
  IF v_admin_ids IS NOT NULL THEN
    FOREACH v_admin_id IN ARRAY v_admin_ids LOOP
      PERFORM create_notification(
        v_admin_id,
        p_organization_id,
        'payment_recorded',
        'Nouveau paiement',
        'Paiement de ' || p_amount || ' DA enregistré pour le client.',
        jsonb_build_object('paymentId', p_payment_id, 'clientId', p_client_id, 'amount', p_amount),
        'normal',
        '/financial',
        7
      );
    END LOOP;
  END IF;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 5. FONCTION: notify_favorite_suggested
-- ============================================
-- Notifie qu'un favori peut être créé

CREATE OR REPLACE FUNCTION notify_favorite_suggested(
  p_client_id TEXT,
  p_organization_id TEXT,
  p_pattern_count INTEGER
) RETURNS VOID AS $$
BEGIN
  PERFORM create_notification(
    p_client_id,
    p_organization_id,
    'favorite_suggested',
    '💡 Commande habituelle détectée',
    'Vous avez commandé ces articles ' || p_pattern_count || ' fois. Voulez-vous les sauvegarder comme favori ?',
    jsonb_build_object('patternCount', p_pattern_count),
    'normal',
    '/new-order',
    7
  );
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 6. FONCTION: notify_debt_reminder
-- ============================================
-- Envoie rappel de dette

CREATE OR REPLACE FUNCTION notify_debt_reminder(
  p_client_id TEXT,
  p_organization_id TEXT,
  p_debt_amount DECIMAL,
  p_order_count INTEGER
) RETURNS VOID AS $$
BEGIN
  PERFORM create_notification(
    p_client_id,
    p_organization_id,
    'debt_reminder',
    'Rappel de dette',
    'Vous avez une dette de ' || p_debt_amount || ' DA sur ' || p_order_count || ' commande(s). Pensez à régler lors de votre prochaine livraison.',
    jsonb_build_object('debtAmount', p_debt_amount, 'orderCount', p_order_count),
    'low',
    '/history',
    14
  );
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 7. FONCTION: mark_notification_read
-- ============================================
-- Marque une notification comme lue

CREATE OR REPLACE FUNCTION mark_notification_read(
  p_notification_id UUID,
  p_user_id TEXT
) RETURNS BOOLEAN AS $$
DECLARE
  v_updated INTEGER;
BEGIN
  UPDATE notifications
  SET is_read = true, read_at = CURRENT_TIMESTAMP
  WHERE id = p_notification_id
    AND user_id = p_user_id
    AND is_read = false;
  
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  RETURN v_updated > 0;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 8. FONCTION: mark_all_notifications_read
-- ============================================
-- Marque toutes les notifications comme lues

CREATE OR REPLACE FUNCTION mark_all_notifications_read(
  p_user_id TEXT
) RETURNS INTEGER AS $$
DECLARE
  v_updated INTEGER;
BEGIN
  UPDATE notifications
  SET is_read = true, read_at = CURRENT_TIMESTAMP
  WHERE user_id = p_user_id
    AND is_read = false;
  
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  RETURN v_updated;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 9. FONCTION: delete_old_notifications
-- ============================================
-- Supprime les notifications expirées ou anciennes

CREATE OR REPLACE FUNCTION delete_old_notifications() RETURNS INTEGER AS $$
DECLARE
  v_deleted INTEGER;
BEGIN
  DELETE FROM notifications
  WHERE (expires_at IS NOT NULL AND expires_at < CURRENT_TIMESTAMP)
     OR (is_read = true AND read_at < CURRENT_TIMESTAMP - INTERVAL '30 days')
     OR (is_read = false AND created_at < CURRENT_TIMESTAMP - INTERVAL '90 days');
  
  GET DIAGNOSTICS v_deleted = ROW_COUNT;
  RETURN v_deleted;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 10. FONCTION: get_user_notifications
-- ============================================
-- Récupère les notifications d'un utilisateur

CREATE OR REPLACE FUNCTION get_user_notifications(
  p_user_id TEXT,
  p_limit INTEGER DEFAULT 50,
  p_unread_only BOOLEAN DEFAULT false
) RETURNS TABLE (
  id UUID,
  type VARCHAR,
  title VARCHAR,
  message TEXT,
  data JSONB,
  is_read BOOLEAN,
  priority VARCHAR,
  action_url VARCHAR,
  created_at TIMESTAMP,
  read_at TIMESTAMP
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    n.id,
    n.type,
    n.title,
    n.message,
    n.data,
    n.is_read,
    n.priority,
    n.action_url,
    n.created_at,
    n.read_at
  FROM notifications n
  WHERE n.user_id = p_user_id
    AND (NOT p_unread_only OR n.is_read = false)
    AND (n.expires_at IS NULL OR n.expires_at > CURRENT_TIMESTAMP)
  ORDER BY n.created_at DESC
  LIMIT p_limit;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 11. FONCTION: get_unread_count
-- ============================================
-- Compte les notifications non lues

CREATE OR REPLACE FUNCTION get_unread_count(
  p_user_id TEXT
) RETURNS INTEGER AS $$
DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM notifications
  WHERE user_id = p_user_id
    AND is_read = false
    AND (expires_at IS NULL OR expires_at > CURRENT_TIMESTAMP);
  
  RETURN v_count;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 12. TRIGGER: auto_notify_payment
-- ============================================
-- Déclenche notification automatique après paiement

CREATE OR REPLACE FUNCTION trigger_notify_payment()
RETURNS TRIGGER AS $$
DECLARE
  v_client_name VARCHAR;
  v_recorded_by_name VARCHAR;
  v_debt_after DECIMAL;
BEGIN
  -- Récupérer infos client
  SELECT name INTO v_client_name
  FROM users
  WHERE id = NEW.client_id;
  
  -- Récupérer nom de celui qui a enregistré
  SELECT name INTO v_recorded_by_name
  FROM users
  WHERE id = NEW.recorded_by;
  
  -- Calculer dette après paiement
  SELECT COALESCE(SUM(remaining_amount), 0) INTO v_debt_after
  FROM orders
  WHERE client_id = NEW.client_id
    AND status = 'delivered'
    AND remaining_amount > 0;
  
  -- Créer notifications
  PERFORM notify_payment_recorded(
    NEW.id,
    NEW.client_id,
    NEW.organization_id,
    NEW.amount,
    v_recorded_by_name,
    v_debt_after = 0
  );
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_payment_notification
AFTER INSERT ON payment_transactions
FOR EACH ROW
EXECUTE FUNCTION trigger_notify_payment();

-- ============================================
-- 13. VUE: notification_stats
-- ============================================
-- Statistiques sur les notifications

CREATE OR REPLACE VIEW notification_stats AS
SELECT
  u.id AS user_id,
  u.name AS user_name,
  u.organization_id,
  COUNT(n.id) AS total_notifications,
  COUNT(CASE WHEN n.is_read = false THEN 1 END) AS unread_count,
  COUNT(CASE WHEN n.type = 'payment_recorded' THEN 1 END) AS payment_notifications,
  COUNT(CASE WHEN n.type = 'debt_cleared' THEN 1 END) AS debt_cleared_notifications,
  COUNT(CASE WHEN n.type = 'favorite_suggested' THEN 1 END) AS favorite_notifications,
  MAX(n.created_at) AS last_notification_at
FROM users u
LEFT JOIN notifications n ON n.user_id = u.id
GROUP BY u.id, u.name, u.organization_id;

-- ============================================
-- 14. DONNÉES INITIALES
-- ============================================
-- Créer préférences par défaut pour utilisateurs existants

INSERT INTO notification_preferences (user_id, payment_notifications, debt_notifications, favorite_notifications, debt_reminders_enabled)
SELECT id, true, true, true, false
FROM users
ON CONFLICT (user_id) DO NOTHING;

-- ============================================
-- COMMENTAIRES
-- ============================================

COMMENT ON TABLE notifications IS 'Notifications pour les utilisateurs';
COMMENT ON TABLE notification_preferences IS 'Préférences de notification par utilisateur';
COMMENT ON FUNCTION create_notification IS 'Crée une notification en respectant les préférences';
COMMENT ON FUNCTION notify_payment_recorded IS 'Notifie client et admins après paiement';
COMMENT ON FUNCTION notify_favorite_suggested IS 'Suggère création favori après détection pattern';
COMMENT ON FUNCTION notify_debt_reminder IS 'Envoie rappel de dette au client';
COMMENT ON FUNCTION mark_notification_read IS 'Marque une notification comme lue';
COMMENT ON FUNCTION get_user_notifications IS 'Récupère notifications d''un utilisateur';
COMMENT ON FUNCTION get_unread_count IS 'Compte notifications non lues';

-- ============================================
-- FIN DU SCRIPT
-- ============================================
