-- Migration 009: Create notifications and audit tables
-- Description: Système de notifications et audit trail

CREATE TABLE IF NOT EXISTS notifications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  
  -- Type de notification
  notification_type VARCHAR(50) NOT NULL CHECK (
    notification_type IN (
      'order_created', 'order_confirmed', 'order_ready', 'order_delivered',
      'delivery_assigned', 'delivery_started', 'delivery_completed',
      'payment_received', 'credit_limit_warning', 'credit_limit_exceeded',
      'stock_low', 'stock_out', 'system_alert', 'custom'
    )
  ),
  
  -- Contenu
  title VARCHAR(255) NOT NULL,
  message TEXT NOT NULL,
  
  -- Référence (order_id, delivery_id, etc.)
  reference_type VARCHAR(50),
  reference_id UUID,
  
  -- Canaux de notification
  channels JSONB DEFAULT '{"push": true, "email": false, "sms": false}',
  
  -- Statut
  is_read BOOLEAN DEFAULT false NOT NULL,
  read_at TIMESTAMP WITH TIME ZONE,
  
  -- Priorité
  priority VARCHAR(20) DEFAULT 'normal' CHECK (priority IN ('low', 'normal', 'high', 'urgent')),
  
  -- Métadonnées
  metadata JSONB DEFAULT '{}',
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Table d'audit pour traçabilité complète
CREATE TABLE IF NOT EXISTS audit_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID REFERENCES organizations(id) ON DELETE CASCADE,
  
  -- Utilisateur qui a effectué l'action
  user_id UUID REFERENCES users(id) ON DELETE SET NULL,
  user_email VARCHAR(255),
  user_role VARCHAR(20),
  
  -- Action
  action VARCHAR(100) NOT NULL, -- 'create', 'update', 'delete', 'login', 'logout', etc.
  entity_type VARCHAR(100) NOT NULL, -- 'order', 'user', 'product', etc.
  entity_id UUID,
  
  -- Détails de l'action
  description TEXT,
  changes JSONB, -- Avant/après pour les updates
  
  -- Contexte de la requête
  ip_address INET,
  user_agent TEXT,
  request_method VARCHAR(10),
  request_path VARCHAR(500),
  
  -- Métadonnées
  metadata JSONB DEFAULT '{}',
  
  -- Timestamp
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Table pour les sessions utilisateur
CREATE TABLE IF NOT EXISTS user_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  
  -- Token
  refresh_token VARCHAR(500) NOT NULL UNIQUE,
  
  -- Informations de session
  ip_address INET,
  user_agent TEXT,
  device_type VARCHAR(50), -- 'mobile', 'tablet', 'desktop'
  device_name VARCHAR(255),
  
  -- Dates
  expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
  last_used_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  
  -- Statut
  is_active BOOLEAN DEFAULT true NOT NULL,
  revoked_at TIMESTAMP WITH TIME ZONE,
  revoked_reason VARCHAR(255),
  
  -- Audit
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Index pour notifications
CREATE INDEX idx_notifications_organization_id ON notifications(organization_id);
CREATE INDEX idx_notifications_user_id ON notifications(user_id);
CREATE INDEX idx_notifications_notification_type ON notifications(notification_type);
CREATE INDEX idx_notifications_is_read ON notifications(is_read);
CREATE INDEX idx_notifications_priority ON notifications(priority);
CREATE INDEX idx_notifications_created_at ON notifications(created_at DESC);
CREATE INDEX idx_notifications_reference ON notifications(reference_type, reference_id);

-- Index composite
CREATE INDEX idx_notifications_user_unread ON notifications(user_id, is_read) WHERE is_read = false;
CREATE INDEX idx_notifications_org_type ON notifications(organization_id, notification_type);

-- Index pour audit_logs
CREATE INDEX idx_audit_logs_organization_id ON audit_logs(organization_id);
CREATE INDEX idx_audit_logs_user_id ON audit_logs(user_id);
CREATE INDEX idx_audit_logs_action ON audit_logs(action);
CREATE INDEX idx_audit_logs_entity_type ON audit_logs(entity_type);
CREATE INDEX idx_audit_logs_entity_id ON audit_logs(entity_id);
CREATE INDEX idx_audit_logs_created_at ON audit_logs(created_at DESC);

-- Index composite
CREATE INDEX idx_audit_logs_entity ON audit_logs(entity_type, entity_id);
CREATE INDEX idx_audit_logs_user_action ON audit_logs(user_id, action);
CREATE INDEX idx_audit_logs_org_entity ON audit_logs(organization_id, entity_type);

-- Index pour user_sessions
CREATE INDEX idx_user_sessions_user_id ON user_sessions(user_id);
CREATE INDEX idx_user_sessions_refresh_token ON user_sessions(refresh_token);
CREATE INDEX idx_user_sessions_is_active ON user_sessions(is_active);
CREATE INDEX idx_user_sessions_expires_at ON user_sessions(expires_at);

-- Index composite
CREATE INDEX idx_user_sessions_user_active ON user_sessions(user_id, is_active) WHERE is_active = true;

-- Trigger pour updated_at
CREATE TRIGGER update_notifications_updated_at
  BEFORE UPDATE ON notifications
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_user_sessions_updated_at
  BEFORE UPDATE ON user_sessions
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Fonction pour nettoyer les anciennes notifications
CREATE OR REPLACE FUNCTION cleanup_old_notifications()
RETURNS void AS $$
BEGIN
  -- Supprimer les notifications lues de plus de 30 jours
  DELETE FROM notifications
  WHERE is_read = true
    AND read_at < CURRENT_TIMESTAMP - INTERVAL '30 days';
  
  -- Supprimer les notifications non lues de plus de 90 jours
  DELETE FROM notifications
  WHERE is_read = false
    AND created_at < CURRENT_TIMESTAMP - INTERVAL '90 days';
END;
$$ LANGUAGE plpgsql;

-- Fonction pour nettoyer les anciennes sessions
CREATE OR REPLACE FUNCTION cleanup_expired_sessions()
RETURNS void AS $$
BEGIN
  -- Révoquer les sessions expirées
  UPDATE user_sessions
  SET is_active = false,
      revoked_at = CURRENT_TIMESTAMP,
      revoked_reason = 'expired',
      updated_at = CURRENT_TIMESTAMP
  WHERE is_active = true
    AND expires_at < CURRENT_TIMESTAMP;
  
  -- Supprimer les sessions révoquées de plus de 30 jours
  DELETE FROM user_sessions
  WHERE is_active = false
    AND revoked_at < CURRENT_TIMESTAMP - INTERVAL '30 days';
END;
$$ LANGUAGE plpgsql;

-- Fonction pour nettoyer les anciens logs d'audit
CREATE OR REPLACE FUNCTION cleanup_old_audit_logs()
RETURNS void AS $$
BEGIN
  -- Supprimer les logs d'audit de plus de 1 an (sauf actions critiques)
  DELETE FROM audit_logs
  WHERE created_at < CURRENT_TIMESTAMP - INTERVAL '1 year'
    AND action NOT IN ('delete', 'login_failed', 'permission_denied');
END;
$$ LANGUAGE plpgsql;

-- Commentaires
COMMENT ON TABLE notifications IS 'Notifications push/email/SMS pour les utilisateurs';
COMMENT ON COLUMN notifications.notification_type IS 'Type de notification';
COMMENT ON COLUMN notifications.channels IS 'Canaux de notification (push, email, sms)';
COMMENT ON COLUMN notifications.priority IS 'Priorité: low, normal, high, urgent';
COMMENT ON TABLE audit_logs IS 'Journal d''audit pour traçabilité complète';
COMMENT ON COLUMN audit_logs.changes IS 'Changements effectués (avant/après en JSON)';
COMMENT ON TABLE user_sessions IS 'Sessions utilisateur actives';
COMMENT ON COLUMN user_sessions.refresh_token IS 'Token de rafraîchissement JWT';
