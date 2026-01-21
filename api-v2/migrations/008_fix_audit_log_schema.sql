-- Migration pour corriger la table audit_logs
-- Ajout des colonnes entity_type et entity_id manquantes
-- Date: 21 Janvier 2026

-- Ajouter entity_type s'il n'existe pas
ALTER TABLE audit_logs ADD COLUMN IF NOT EXISTS entity_type VARCHAR(100);

-- Ajouter entity_id s'il n'existe pas
ALTER TABLE audit_logs ADD COLUMN IF NOT EXISTS entity_id TEXT;

-- Index pour les recherches par entité
CREATE INDEX IF NOT EXISTS idx_audit_logs_entity ON audit_logs(entity_type, entity_id);

-- Vérification
SELECT 'Audit Log Schema Fixed' as status;
