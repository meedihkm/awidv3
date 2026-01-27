# 🚀 Guide de déploiement Backend v4 sur Coolify

## 📋 Prérequis

- VPS avec Coolify installé
- Accès SSH au VPS
- Nom de domaine (optionnel mais recommandé)
- GitHub repository configuré

## 🔧 Configuration Coolify

### 1. Créer un nouveau projet dans Coolify

1. Connectez-vous à votre interface Coolify
2. Créez un nouveau projet "AWID Backend v4"
3. Ajoutez une nouvelle ressource de type "Docker Compose"

### 2. Configuration du repository

- **Repository**: `https://github.com/meedihkm/awidv3`
- **Branch**: `main`
- **Build Pack**: Docker Compose
- **Docker Compose Path**: `backend-v4/docker-compose.yml`

### 3. Variables d'environnement

Configurez les variables suivantes dans Coolify:

#### 🔐 Secrets critiques (à générer)

```bash
# Générer des secrets forts
openssl rand -base64 32  # Pour JWT_SECRET
openssl rand -base64 32  # Pour JWT_REFRESH_SECRET
openssl rand -base64 32  # Pour DB_PASSWORD
openssl rand -base64 32  # Pour REDIS_PASSWORD
```

#### 📝 Variables à configurer

```env
# Application
NODE_ENV=production
PORT=3000

# Database
DB_HOST=postgres
DB_PORT=5432
DB_NAME=awid_db
DB_USER=awid_user
DB_PASSWORD=<GENERER_UN_MOT_DE_PASSE_FORT>

# Redis
REDIS_HOST=redis
REDIS_PORT=6379
REDIS_PASSWORD=<GENERER_UN_MOT_DE_PASSE_FORT>

# JWT
JWT_SECRET=<GENERER_UN_SECRET_FORT>
JWT_REFRESH_SECRET=<GENERER_UN_SECRET_FORT>
JWT_EXPIRES_IN=15m
JWT_REFRESH_EXPIRES_IN=7d

# CORS
CORS_ORIGIN=https://votre-domaine.com

# Optionnel - Sentry
SENTRY_DSN=

# Optionnel - Email
SMTP_HOST=
SMTP_PORT=587
SMTP_USER=
SMTP_PASSWORD=
SMTP_FROM=noreply@awid.app
```

### 4. Configuration du domaine

1. Dans Coolify, configurez votre domaine: `api.votre-domaine.com`
2. Activez le SSL automatique (Let's Encrypt)
3. Coolify configurera automatiquement Nginx comme reverse proxy

### 5. Volumes persistants

Coolify créera automatiquement les volumes suivants:
- `postgres_data` - Données PostgreSQL
- `redis_data` - Données Redis
- `uploads_data` - Fichiers uploadés
- `logs_data` - Logs de l'application

## 🚀 Déploiement

### Déploiement automatique

1. Cliquez sur "Deploy" dans Coolify
2. Coolify va:
   - Cloner le repository
   - Builder l'image Docker
   - Démarrer les services (PostgreSQL, Redis, Backend)
   - Configurer le reverse proxy
   - Activer le SSL

### Déploiement manuel (si nécessaire)

```bash
# Se connecter au VPS
ssh user@votre-vps

# Aller dans le dossier du projet
cd /path/to/coolify/projects/awid-backend-v4

# Déployer
docker-compose up -d --build

# Vérifier les logs
docker-compose logs -f backend
```

## 🔍 Vérification du déploiement

### 1. Vérifier les services

```bash
# Vérifier que tous les services sont up
docker-compose ps

# Devrait afficher:
# awid-postgres   Up (healthy)
# awid-redis      Up (healthy)
# awid-backend    Up (healthy)
```

### 2. Tester l'API

```bash
# Health check
curl https://api.votre-domaine.com/health

# Devrait retourner:
# {"status":"ok","timestamp":"...","uptime":...}
```

### 3. Vérifier les logs

```bash
# Logs du backend
docker-compose logs -f backend

# Logs de PostgreSQL
docker-compose logs -f postgres

# Logs de Redis
docker-compose logs -f redis
```

## 🗄️ Migrations de base de données

### Exécution automatique

Les migrations s'exécutent automatiquement au démarrage du backend.

### Exécution manuelle (si nécessaire)

```bash
# Se connecter au container backend
docker exec -it awid-backend sh

# Exécuter les migrations
npm run migrate

# Exécuter les seeds (données de test)
npm run seed
```

## 📊 Monitoring

### Logs

```bash
# Logs en temps réel
docker-compose logs -f

# Logs d'un service spécifique
docker-compose logs -f backend

# Dernières 100 lignes
docker-compose logs --tail=100 backend
```

### Métriques

Coolify fournit automatiquement:
- CPU usage
- Memory usage
- Network I/O
- Disk usage

### Health checks

Les health checks sont configurés pour:
- **Backend**: `GET /health` toutes les 30s
- **PostgreSQL**: `pg_isready` toutes les 10s
- **Redis**: `redis-cli ping` toutes les 10s

## 🔄 Mises à jour

### Déploiement continu

Coolify peut être configuré pour déployer automatiquement à chaque push sur `main`:

1. Dans Coolify, activez "Auto Deploy"
2. Configurez le webhook GitHub
3. Chaque push sur `main` déclenchera un redéploiement

### Mise à jour manuelle

```bash
# Dans Coolify, cliquez sur "Redeploy"
# Ou en ligne de commande:
docker-compose pull
docker-compose up -d --build
```

## 🔐 Sécurité

### Bonnes pratiques

1. ✅ Utilisez des secrets forts (32+ caractères)
2. ✅ Activez le SSL (Let's Encrypt via Coolify)
3. ✅ Configurez CORS correctement
4. ✅ Limitez les accès SSH
5. ✅ Activez le firewall (UFW)
6. ✅ Mettez à jour régulièrement les images Docker

### Firewall (UFW)

```bash
# Autoriser SSH
sudo ufw allow 22/tcp

# Autoriser HTTP/HTTPS (Coolify gère le reste)
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Activer le firewall
sudo ufw enable
```

## 🆘 Dépannage

### Le backend ne démarre pas

```bash
# Vérifier les logs
docker-compose logs backend

# Vérifier les variables d'environnement
docker exec awid-backend env | grep -E "DB_|REDIS_|JWT_"

# Redémarrer le service
docker-compose restart backend
```

### Erreur de connexion à PostgreSQL

```bash
# Vérifier que PostgreSQL est up
docker-compose ps postgres

# Tester la connexion
docker exec awid-backend psql -h postgres -U awid_user -d awid_db -c "SELECT 1"
```

### Erreur de connexion à Redis

```bash
# Vérifier que Redis est up
docker-compose ps redis

# Tester la connexion
docker exec awid-backend redis-cli -h redis -a $REDIS_PASSWORD ping
```

## 📱 Configuration de l'app mobile

Une fois le backend déployé, configurez l'URL dans l'app mobile:

```dart
// mobile-v4/lib/core/config/api_config.dart
const String API_BASE_URL = 'https://api.votre-domaine.com';
```

## 🎯 Checklist de déploiement

- [ ] VPS avec Coolify installé
- [ ] Repository GitHub configuré
- [ ] Variables d'environnement configurées dans Coolify
- [ ] Secrets générés (JWT, DB, Redis)
- [ ] Domaine configuré avec SSL
- [ ] Déploiement effectué
- [ ] Health checks passent
- [ ] Migrations exécutées
- [ ] Tests API réussis
- [ ] App mobile configurée avec la nouvelle URL
- [ ] Monitoring activé

## 📚 Ressources

- [Documentation Coolify](https://coolify.io/docs)
- [Documentation PostgreSQL](https://www.postgresql.org/docs/)
- [Documentation Redis](https://redis.io/docs/)
- [Documentation Node.js](https://nodejs.org/docs/)
