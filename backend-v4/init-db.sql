-- Script d'initialisation PostgreSQL
-- Exécuté automatiquement au premier démarrage du conteneur

-- Créer les extensions nécessaires
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm"; -- Pour la recherche full-text
CREATE EXTENSION IF NOT EXISTS "cube"; -- Pour les calculs de distance GPS
CREATE EXTENSION IF NOT EXISTS "earthdistance"; -- Pour les calculs de distance GPS

-- Créer un utilisateur pour l'application (optionnel)
-- CREATE USER awid WITH PASSWORD 'awid_password';
-- GRANT ALL PRIVILEGES ON DATABASE awid_v4 TO awid;

-- Message de confirmation
DO $$
BEGIN
  RAISE NOTICE '✅ Database initialized successfully';
  RAISE NOTICE '📦 Extensions installed: uuid-ossp, pg_trgm, cube, earthdistance';
END $$;
