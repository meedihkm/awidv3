# 🚀 Guide de Déploiement AWID sur VPS avec Coolify

## Déploiement complet : Backend Node.js + PostgreSQL + Mobile Flutter

---

## 📋 Prérequis

### Ce que tu as déjà
- ✅ VPS avec Coolify installé
- ✅ Accès SSH au VPS
- ✅ Nom de domaine (optionnel mais recommandé)

### Ce dont tu as besoin
- Node.js >= 18.0.0
- PostgreSQL 14+
- Git
- Minimum 2GB RAM sur le VPS

---

## 🎯 ÉTAPE 1 : Préparation du Projet

### 1.1 Créer un Dockerfile pour le Backend

Coolify utilise Docker, donc on va créer un Dockerfile optimisé :

```dockerfile
# Dockerfile
FROM node:18-alpine

# Installer les dépendances système
RUN apk add --no-cache postgresql-client

# Créer le répertoire de l'app
WORKDIR /app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer les dépendances de production
RUN npm ci --only=production

# Copier le code source
COPY api-v2 ./api-v2
COPY sql_migrations.sql ./
COPY api-v2/migrations ./api-v2/migrations

# Créer le dossier uploads
RUN mkdir -p api-v2/uploads

# Exposer le port
EXPOSE 3000

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s \
  CMD node -e "require('http').get('http://localhost:3000/api/health', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"

# Démarrer l'application
CMD ["node", "api-v2/index.js"]
```

### 1.2 Créer un .dockerignore

```
# .dockerignore
node_modules
npm-debug.log
.env
.env.local
.git
.github
coverage
mobile
Awidv2-main
docs
*.md
.vscode
artillery
```

### 1.3 Créer un docker-compose.yml (pour référence)

```yaml
# docker-compose.yml
version: '3.8'

services:
  postgres:
    image: postgres:14-alpine
    environment:
      POSTGRES_DB: awid
      POSTGRES_USER: awid_user
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./sql_migrations.sql:/docker-entrypoint-initdb.d/01-schema.sql
      - ./api-v2/migrations/DEPLOY_ALL_NEW_FEATURES.sql:/docker-entrypoint-initdb.d/02-features.sql
    ports:
      - "5432:5432"
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U awid_user -d awid"]
      interval: 10s
      timeout: 5s
      retries: 5

  api:
    build: .
    ports:
      - "3000:3000"
    environment:
      NODE_ENV: production
      PORT: 3000
      DATABASE_URL: postgresql://awid_user:${DB_PASSWORD}@postgres:5432/awid
      JWT_SECRET: ${JWT_SECRET}
      SUPER_ADMIN_KEY: ${SUPER_ADMIN_KEY}
      CORS_ORIGINS: ${CORS_ORIGINS}
    depends_on:
      postgres:
        condition: service_healthy
    volumes:
      - uploads:/app/api-v2/uploads
    restart: unless-stopped

volumes:
  postgres_data:
  uploads:
```

---

## 🐳 ÉTAPE 2 : Configuration dans Coolify

### 2.1 Créer un Nouveau Projet

1. Ouvrir Coolify : `https://votre-vps-ip:8000` (ou votre domaine Coolify)
2. Cliquer sur **"New Project"**
3. Nom du projet : `awid-production`

### 2.2 Ajouter la Base de Données PostgreSQL

1. Dans le projet, cliquer sur **"Add Resource"** → **"Database"**
2. Choisir **PostgreSQL**
3. Configuration :
   - **Name** : `awid-postgres`
   - **Database Name** : `awid`
   - **Username** : `awid_user`
   - **Password** : Générer un mot de passe fort (noter quelque part)
   - **Version** : `14` ou `15`
   - **Port** : `5432` (interne)
4. Cliquer sur **"Deploy"**
5. Attendre que le statut soit **"Running"** (vert)

### 2.3 Initialiser la Base de Données

Une fois PostgreSQL déployé :

1. Dans Coolify, aller dans la database → **"Terminal"**
2. Exécuter :

```bash
# Se connecter à PostgreSQL
psql -U awid_user -d awid

# Ou via le terminal de votre VPS
docker exec -it <container-id-postgres> psql -U awid_user -d awid
```

3. Copier-coller le contenu de `sql_migrations.sql` puis `DEPLOY_ALL_NEW_FEATURES.sql`

**Alternative : Via fichier**

```bash
# Sur votre machine locale
scp sql_migrations.sql root@votre-vps:/tmp/
scp api-v2/migrations/DEPLOY_ALL_NEW_FEATURES.sql root@votre-vps:/tmp/

# Sur le VPS
docker exec -i <container-id-postgres> psql -U awid_user -d awid < /tmp/sql_migrations.sql
docker exec -i <container-id-postgres> psql -U awid_user -d awid < /tmp/DEPLOY_ALL_NEW_FEATURES.sql
```

### 2.4 Créer une Organisation de Test

```sql
-- Dans psql
INSERT INTO organizations (id, name, type, active) 
VALUES ('org-test-1', 'Restaurant Test', 'restaurant', true);

-- Créer un admin (mot de passe: "admin123")
INSERT INTO users (organization_id, email, password, name, role, active)
VALUES (
  'org-test-1',
  'admin@test.com',
  '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYIeWEgKK3q',
  'Admin Test',
  'admin',
  true
);
```

---

## 🚀 ÉTAPE 3 : Déployer le Backend

### 3.1 Ajouter l'Application Backend

1. Dans le projet Coolify, cliquer sur **"Add Resource"** → **"Application"**
2. Choisir **"Public Repository"** ou **"Private Repository"**

**Si Public Repository :**
- **Git Repository URL** : `https://github.com/votre-username/awid.git`
- **Branch** : `main` ou `master`

**Si Private Repository :**
- Ajouter votre clé SSH dans Coolify
- Utiliser l'URL SSH : `git@github.com:votre-username/awid.git`

3. Configuration :
   - **Name** : `awid-api`
   - **Build Pack** : `Dockerfile`
   - **Dockerfile Location** : `/Dockerfile` (à la racine)
   - **Port** : `3000`
   - **Health Check Path** : `/api/health`

### 3.2 Configurer les Variables d'Environnement

Dans l'application → **"Environment Variables"** :

```bash
# Node Environment
NODE_ENV=production
PORT=3000

# Database (récupérer l'URL interne de Coolify)
# Format: postgresql://awid_user:PASSWORD@awid-postgres:5432/awid
DATABASE_URL=postgresql://awid_user:VOTRE_PASSWORD@awid-postgres:5432/awid

# JWT Secret (générer avec: openssl rand -hex 64)
JWT_SECRET=votre_secret_jwt_128_caracteres_minimum_tres_securise

# Super Admin Key (générer avec: openssl rand -hex 32)
SUPER_ADMIN_KEY=votre_cle_super_admin_64_caracteres_minimum

# CORS (votre domaine)
CORS_ORIGINS=https://votre-domaine.com,https://api.votre-domaine.com

# Database SSL (pour connexion interne Docker, pas besoin de SSL)
DATABASE_SSL_REJECT_UNAUTHORIZED=false
```

**Générer les secrets** :

```bash
# Sur votre machine locale ou VPS
openssl rand -hex 64  # Pour JWT_SECRET
openssl rand -hex 32  # Pour SUPER_ADMIN_KEY
```

### 3.3 Configurer le Domaine (Optionnel mais Recommandé)

1. Dans l'application → **"Domains"**
2. Ajouter votre domaine : `api.votre-domaine.com`
3. Coolify va automatiquement :
   - Configurer le reverse proxy (Traefik)
   - Générer un certificat SSL (Let's Encrypt)
   - Rediriger HTTP → HTTPS

**Si vous n'avez pas de domaine** :
- Utiliser l'IP du VPS : `http://votre-vps-ip:3000`
- Ou le domaine par défaut de Coolify

### 3.4 Déployer

1. Cliquer sur **"Deploy"**
2. Suivre les logs en temps réel
3. Attendre que le statut soit **"Running"** (vert)

### 3.5 Vérifier le Déploiement

```bash
# Test health check
curl https://api.votre-domaine.com/api/health

# Devrait retourner :
# {"status":"ok","version":"2.0.0","name":"Awid API","timestamp":"..."}

# Test login
curl -X POST https://api.votre-domaine.com/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@test.com","password":"admin123"}'

# Devrait retourner un accessToken
```

---

## 🔧 ÉTAPE 4 : Configuration Avancée

### 4.1 Configurer les Volumes Persistants

Pour les uploads d'images :

1. Dans l'application → **"Storages"**
2. Ajouter un volume :
   - **Name** : `awid-uploads`
   - **Mount Path** : `/app/api-v2/uploads`
   - **Host Path** : `/var/lib/coolify/awid/uploads`

### 4.2 Configurer les Logs

Coolify capture automatiquement les logs. Pour y accéder :

1. Application → **"Logs"**
2. Voir les logs en temps réel
3. Filtrer par niveau (info, error, etc.)

### 4.3 Configurer les Backups PostgreSQL

1. Database → **"Backups"**
2. Activer les backups automatiques :
   - **Frequency** : Daily
   - **Retention** : 7 days
   - **Time** : 02:00 AM

**Backup manuel** :

```bash
# Sur le VPS
docker exec <container-id-postgres> pg_dump -U awid_user awid > backup-$(date +%Y%m%d).sql

# Restaurer
docker exec -i <container-id-postgres> psql -U awid_user awid < backup-20260122.sql
```

### 4.4 Configurer le Monitoring

Coolify inclut du monitoring basique. Pour plus :

1. Application → **"Monitoring"**
2. Voir :
   - CPU usage
   - Memory usage
   - Network I/O
   - Disk usage

---

## 📱 ÉTAPE 5 : Configuration Mobile

### 5.1 Mettre à Jour l'URL de l'API

Éditer `mobile/lib/core/constants/api_constants.dart` :

```dart
class ApiConstants {
  // Remplacer par votre domaine Coolify
  static const String baseUrl = 'https://api.votre-domaine.com/api';
  
  // Ou si pas de domaine :
  // static const String baseUrl = 'http://VOTRE_VPS_IP:3000/api';
  
  // Auth
  static const String login = '$baseUrl/auth/login';
  static const String refresh = '$baseUrl/auth/refresh';
  // ... reste du code
}
```

### 5.2 Builder l'APK

```bash
cd mobile

# Installer les dépendances
flutter pub get

# Build APK release
flutter build apk --release

# L'APK sera dans : build/app/outputs/flutter-apk/app-release.apk
```

### 5.3 Tester l'Application

1. Installer l'APK sur un appareil Android
2. Se connecter avec : `admin@test.com` / `admin123`
3. Vérifier que tout fonctionne

---

## 🔒 ÉTAPE 6 : Sécurité Production

### 6.1 Configurer le Firewall

```bash
# Sur le VPS
ufw allow 22/tcp    # SSH
ufw allow 80/tcp    # HTTP
ufw allow 443/tcp   # HTTPS
ufw allow 8000/tcp  # Coolify (optionnel, peut être fermé après config)
ufw enable
```

### 6.2 Configurer Fail2Ban

```bash
# Installer Fail2Ban
apt update && apt install fail2ban -y

# Configurer
cat > /etc/fail2ban/jail.local <<EOF
[sshd]
enabled = true
port = 22
maxretry = 3
bantime = 3600
EOF

# Redémarrer
systemctl restart fail2ban
```

### 6.3 Activer les Logs d'Audit

Les logs sont déjà configurés dans l'application (table `audit_logs`).

### 6.4 Configurer les Backups Automatiques

```bash
# Créer un script de backup
cat > /root/backup-awid.sh <<'EOF'
#!/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/var/backups/awid"
mkdir -p $BACKUP_DIR

# Backup PostgreSQL
docker exec awid-postgres pg_dump -U awid_user awid | gzip > $BACKUP_DIR/db-$DATE.sql.gz

# Backup uploads
tar -czf $BACKUP_DIR/uploads-$DATE.tar.gz /var/lib/coolify/awid/uploads

# Garder seulement les 7 derniers jours
find $BACKUP_DIR -name "*.gz" -mtime +7 -delete

echo "Backup completed: $DATE"
EOF

chmod +x /root/backup-awid.sh

# Ajouter au cron (tous les jours à 2h)
crontab -e
# Ajouter :
0 2 * * * /root/backup-awid.sh >> /var/log/awid-backup.log 2>&1
```

---

## 📊 ÉTAPE 7 : Monitoring et Maintenance

### 7.1 Accéder au Super Admin Panel

1. Ouvrir : `https://api.votre-domaine.com/api/admin`
2. Entrer votre `SUPER_ADMIN_KEY`
3. Créer des organisations de production

### 7.2 Surveiller les Performances

```bash
# Voir les logs en temps réel
docker logs -f <container-id-api>

# Voir l'utilisation des ressources
docker stats

# Voir les connexions PostgreSQL
docker exec <container-id-postgres> psql -U awid_user -d awid -c "SELECT count(*) FROM pg_stat_activity;"
```

### 7.3 Mettre à Jour l'Application

```bash
# Dans Coolify
# 1. Aller dans l'application
# 2. Cliquer sur "Redeploy"
# 3. Coolify va pull les derniers changements et redéployer

# Ou via Git
git push origin main
# Coolify peut être configuré pour auto-deploy sur push
```

### 7.4 Nettoyer les Anciennes Images Docker

```bash
# Sur le VPS
docker system prune -a --volumes -f
```

---

## 🐛 ÉTAPE 8 : Dépannage

### Problème : L'application ne démarre pas

```bash
# Voir les logs
docker logs <container-id-api>

# Vérifier les variables d'environnement
docker exec <container-id-api> env | grep DATABASE_URL

# Vérifier la connexion à PostgreSQL
docker exec <container-id-api> nc -zv awid-postgres 5432
```

### Problème : Database connection failed

```bash
# Vérifier que PostgreSQL est running
docker ps | grep postgres

# Tester la connexion
docker exec <container-id-postgres> psql -U awid_user -d awid -c "SELECT 1;"

# Vérifier le mot de passe dans DATABASE_URL
```

### Problème : CORS errors

```bash
# Vérifier CORS_ORIGINS
docker exec <container-id-api> env | grep CORS_ORIGINS

# Mettre à jour dans Coolify
# Application → Environment Variables → CORS_ORIGINS
```

### Problème : Out of memory

```bash
# Vérifier l'utilisation mémoire
free -h
docker stats

# Augmenter la RAM du VPS ou optimiser
# Limiter la mémoire de Node.js
NODE_OPTIONS="--max-old-space-size=512"
```

---

## ✅ ÉTAPE 9 : Checklist de Déploiement

- [ ] VPS configuré avec Coolify
- [ ] PostgreSQL déployé et initialisé
- [ ] Migrations SQL exécutées
- [ ] Organisation de test créée
- [ ] Backend déployé et accessible
- [ ] Variables d'environnement configurées
- [ ] Domaine configuré avec SSL
- [ ] Health check répond correctement
- [ ] Super Admin Panel accessible
- [ ] Mobile APK buildé avec la bonne URL
- [ ] Test de login réussi
- [ ] Backups automatiques configurés
- [ ] Firewall configuré
- [ ] Monitoring actif

---

## 🎉 Félicitations !

Ton application AWID est maintenant déployée sur ton propre VPS avec Coolify ! 🚀

### Avantages de cette configuration

✅ **Contrôle total** : Tu possèdes l'infrastructure  
✅ **Coûts prévisibles** : Pas de surprise de facturation  
✅ **Performance** : Serveur dédié à ton app  
✅ **Scalabilité** : Facile d'upgrader le VPS  
✅ **Backups** : Contrôle complet de tes données  

### Prochaines Étapes

1. **Créer des organisations réelles** via le Super Admin Panel
2. **Distribuer l'APK** aux utilisateurs
3. **Monitorer** les performances et logs
4. **Optimiser** selon l'usage réel
5. **Scaler** si nécessaire (plus de RAM, CPU, etc.)

### Support

- 📚 Documentation Coolify : https://coolify.io/docs
- 🐛 Issues : GitHub Issues
- 💬 Community : Discord Coolify

---

*Guide créé le 22 Janvier 2026*  
*Version: 2.0.0*  
*ⴰⵡⵉⴷ - "Apporte" en Tamazight 🇩🇿*
