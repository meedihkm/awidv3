#!/bin/bash

# Script de backup automatique pour AWID
# À ajouter au crontab pour exécution quotidienne

set -e

# Configuration
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/var/backups/awid"
DB_CONTAINER="awid-postgres"
DB_USER="awid_user"
DB_NAME="awid"
RETENTION_DAYS=7

# Créer le dossier de backup s'il n'existe pas
mkdir -p $BACKUP_DIR

echo "🔄 Démarrage du backup AWID - $DATE"

# Backup PostgreSQL
echo "📦 Backup de la base de données..."
docker exec $DB_CONTAINER pg_dump -U $DB_USER $DB_NAME | gzip > $BACKUP_DIR/db-$DATE.sql.gz

if [ $? -eq 0 ]; then
    echo "✅ Backup DB réussi: db-$DATE.sql.gz"
else
    echo "❌ Erreur lors du backup DB"
    exit 1
fi

# Backup des uploads (images)
echo "📸 Backup des uploads..."
if [ -d "/var/lib/coolify/awid/uploads" ]; then
    tar -czf $BACKUP_DIR/uploads-$DATE.tar.gz /var/lib/coolify/awid/uploads
    echo "✅ Backup uploads réussi: uploads-$DATE.tar.gz"
else
    echo "⚠️  Dossier uploads non trouvé, skip"
fi

# Nettoyer les vieux backups (garder seulement les X derniers jours)
echo "🧹 Nettoyage des anciens backups (> $RETENTION_DAYS jours)..."
find $BACKUP_DIR -name "*.gz" -mtime +$RETENTION_DAYS -delete
echo "✅ Nettoyage terminé"

# Afficher la taille totale des backups
TOTAL_SIZE=$(du -sh $BACKUP_DIR | cut -f1)
echo "💾 Taille totale des backups: $TOTAL_SIZE"

# Lister les backups
echo "📋 Backups disponibles:"
ls -lh $BACKUP_DIR | tail -n +2

echo "✅ Backup terminé avec succès - $DATE"
