-- =====================================================
-- MIGRATION: location_history - Ajout organization_id et accuracy
-- =====================================================
-- Description: Mise à jour de la table location_history existante
-- Date: 2026-01-19
-- =====================================================

-- Extension pour UUID (si pas déjà activée)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =====================================================
-- ÉTAPE 1: Vérifier et créer la table si elle n'existe pas
-- =====================================================
CREATE TABLE IF NOT EXISTS location_history (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    deliverer_id TEXT NOT NULL,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    recorded_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- =====================================================
-- ÉTAPE 2: Ajouter organization_id si elle n'existe pas
-- =====================================================
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'location_history' 
        AND column_name = 'organization_id'
    ) THEN
        ALTER TABLE location_history 
        ADD COLUMN organization_id TEXT;
        
        RAISE NOTICE 'Colonne organization_id ajoutée à location_history';
    ELSE
        RAISE NOTICE 'Colonne organization_id existe déjà dans location_history';
    END IF;
END $$;

-- =====================================================
-- ÉTAPE 3: Ajouter accuracy si elle n'existe pas
-- =====================================================
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'location_history' 
        AND column_name = 'accuracy'
    ) THEN
        ALTER TABLE location_history 
        ADD COLUMN accuracy DOUBLE PRECISION;
        
        RAISE NOTICE 'Colonne accuracy ajoutée à location_history';
    ELSE
        RAISE NOTICE 'Colonne accuracy existe déjà dans location_history';
    END IF;
END $$;

-- =====================================================
-- ÉTAPE 4: Mettre organization_id NOT NULL après remplissage
-- =====================================================
-- Si la colonne vient d'être ajoutée, remplir avec les données existantes
DO $$
BEGIN
    -- Remplir organization_id à partir de la table users (deliverers)
    UPDATE location_history lh
    SET organization_id = u.organization_id
    FROM users u
    WHERE lh.deliverer_id = u.id
    AND lh.organization_id IS NULL;
    
    RAISE NOTICE 'organization_id rempli pour les enregistrements existants';
END $$;

-- Maintenant rendre la colonne NOT NULL
DO $$
BEGIN
    -- Vérifier si la contrainte NOT NULL existe déjà
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'location_history' 
        AND column_name = 'organization_id'
        AND is_nullable = 'YES'
    ) THEN
        ALTER TABLE location_history 
        ALTER COLUMN organization_id SET NOT NULL;
        
        RAISE NOTICE 'Contrainte NOT NULL ajoutée à organization_id';
    ELSE
        RAISE NOTICE 'Contrainte NOT NULL existe déjà sur organization_id';
    END IF;
END $$;

-- =====================================================
-- ÉTAPE 5: Ajouter les contraintes CHECK si elles n'existent pas
-- =====================================================
DO $$
BEGIN
    -- Contrainte latitude
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'valid_latitude' 
        AND conrelid = 'location_history'::regclass
    ) THEN
        ALTER TABLE location_history 
        ADD CONSTRAINT valid_latitude CHECK (latitude >= -90 AND latitude <= 90);
        
        RAISE NOTICE 'Contrainte valid_latitude ajoutée';
    ELSE
        RAISE NOTICE 'Contrainte valid_latitude existe déjà';
    END IF;

    -- Contrainte longitude
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'valid_longitude' 
        AND conrelid = 'location_history'::regclass
    ) THEN
        ALTER TABLE location_history 
        ADD CONSTRAINT valid_longitude CHECK (longitude >= -180 AND longitude <= 180);
        
        RAISE NOTICE 'Contrainte valid_longitude ajoutée';
    ELSE
        RAISE NOTICE 'Contrainte valid_longitude existe déjà';
    END IF;

    -- Contrainte accuracy
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'valid_accuracy' 
        AND conrelid = 'location_history'::regclass
    ) THEN
        ALTER TABLE location_history 
        ADD CONSTRAINT valid_accuracy CHECK (accuracy IS NULL OR accuracy >= 0);
        
        RAISE NOTICE 'Contrainte valid_accuracy ajoutée';
    ELSE
        RAISE NOTICE 'Contrainte valid_accuracy existe déjà';
    END IF;
END $$;

-- =====================================================
-- ÉTAPE 6: Ajouter les foreign keys si elles n'existent pas
-- =====================================================
-- Foreign key vers users (deliverers)
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'location_history_deliverer_id_fkey'
    ) THEN
        ALTER TABLE location_history 
        ADD CONSTRAINT location_history_deliverer_id_fkey 
        FOREIGN KEY (deliverer_id) REFERENCES users(id) ON DELETE CASCADE;
        
        RAISE NOTICE 'Foreign key deliverer_id ajoutée';
    ELSE
        RAISE NOTICE 'Foreign key deliverer_id existe déjà';
    END IF;
END $$;

-- Foreign key vers organizations
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'location_history_organization_id_fkey'
    ) THEN
        ALTER TABLE location_history 
        ADD CONSTRAINT location_history_organization_id_fkey 
        FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;
        
        RAISE NOTICE 'Foreign key organization_id ajoutée';
    ELSE
        RAISE NOTICE 'Foreign key organization_id existe déjà';
    END IF;
END $$;

-- =====================================================
-- ÉTAPE 7: Créer les index si ils n'existent pas
-- =====================================================
CREATE INDEX IF NOT EXISTS idx_location_history_deliverer ON location_history(deliverer_id);
CREATE INDEX IF NOT EXISTS idx_location_history_org ON location_history(organization_id);
CREATE INDEX IF NOT EXISTS idx_location_history_date ON location_history(recorded_at DESC);
CREATE INDEX IF NOT EXISTS idx_location_history_deliverer_date ON location_history(deliverer_id, recorded_at DESC);

-- =====================================================
-- ÉTAPE 8: Créer la fonction cleanup si elle n'existe pas
-- =====================================================
CREATE OR REPLACE FUNCTION cleanup_old_location_history(days_to_keep INTEGER DEFAULT 30)
RETURNS INTEGER AS $$
DECLARE
    deleted_count INTEGER;
BEGIN
    DELETE FROM location_history 
    WHERE recorded_at < NOW() - (days_to_keep || ' days')::INTERVAL;
    GET DIAGNOSTICS deleted_count = ROW_COUNT;
    RETURN deleted_count;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- RÉSUMÉ
-- =====================================================
DO $$
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Migration location_history terminée!';
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Colonnes ajoutées: organization_id, accuracy';
    RAISE NOTICE 'Contraintes ajoutées: valid_latitude, valid_longitude, valid_accuracy';
    RAISE NOTICE 'Foreign keys ajoutées: deliverer_id, organization_id';
    RAISE NOTICE 'Index créés: deliverer, org, date, deliverer_date';
    RAISE NOTICE 'Fonction créée: cleanup_old_location_history()';
    RAISE NOTICE '========================================';
END $$;
