#!/bin/bash

# Script d'initialisation de la base de données AWID
# À exécuter après le déploiement de PostgreSQL

set -e

echo "🚀 Initialisation de la base de données AWID..."

# Variables
DB_CONTAINER=${1:-awid-postgres}
DB_USER=${2:-awid_user}
DB_NAME=${3:-awid}

echo "📦 Container: $DB_CONTAINER"
echo "👤 User: $DB_USER"
echo "🗄️  Database: $DB_NAME"
echo ""

# Vérifier que le container existe
if ! docker ps | grep -q $DB_CONTAINER; then
    echo "❌ Erreur: Le container $DB_CONTAINER n'existe pas ou n'est pas démarré"
    exit 1
fi

echo "1️⃣  Exécution du schéma principal (sql_migrations.sql)..."
docker exec -i $DB_CONTAINER psql -U $DB_USER -d $DB_NAME < sql_migrations.sql
echo "✅ Schéma principal créé"
echo ""

echo "2️⃣  Exécution des migrations de fonctionnalités (DEPLOY_ALL_NEW_FEATURES.sql)..."
docker exec -i $DB_CONTAINER psql -U $DB_USER -d $DB_NAME < api-v2/migrations/DEPLOY_ALL_NEW_FEATURES.sql
echo "✅ Migrations de fonctionnalités appliquées"
echo ""

echo "3️⃣  Création d'une organisation de test..."
docker exec -i $DB_CONTAINER psql -U $DB_USER -d $DB_NAME <<EOF
-- Créer une organisation de test
INSERT INTO organizations (id, name, type, active) 
VALUES ('org-test-1', 'Restaurant Test', 'restaurant', true)
ON CONFLICT (id) DO NOTHING;

-- Créer un admin (mot de passe: "admin123")
-- Hash bcrypt de "admin123" avec 12 rounds
INSERT INTO users (organization_id, email, password, name, role, active)
VALUES (
  'org-test-1',
  'admin@test.com',
  '\$2a\$12\$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYIeWEgKK3q',
  'Admin Test',
  'admin',
  true
)
ON CONFLICT (email) DO NOTHING;
EOF
echo "✅ Organisation de test créée"
echo ""

echo "4️⃣  Vérification des tables..."
docker exec -i $DB_CONTAINER psql -U $DB_USER -d $DB_NAME <<EOF
SELECT 
    tablename,
    pg_size_pretty(pg_total_relation_size('public.'||tablename)) AS size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY tablename;
EOF
echo ""

echo "5️⃣  Vérification de l'organisation de test..."
docker exec -i $DB_CONTAINER psql -U $DB_USER -d $DB_NAME <<EOF
SELECT 
    o.name as organization,
    u.email,
    u.name as user_name,
    u.role
FROM organizations o
JOIN users u ON o.id = u.organization_id
WHERE o.id = 'org-test-1';
EOF
echo ""

echo "✅ ✅ ✅ Base de données initialisée avec succès ! ✅ ✅ ✅"
echo ""
echo "📝 Informations de connexion de test:"
echo "   Email: admin@test.com"
echo "   Mot de passe: admin123"
echo ""
echo "🔐 N'oubliez pas de changer ces identifiants en production !"
