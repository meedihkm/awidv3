# 🚀 Quick Start - Déploiement AWID sur Coolify

Guide rapide pour déployer AWID en 10 minutes sur ton VPS avec Coolify.

---

## 📋 Avant de Commencer

Tu dois avoir :
- ✅ Un VPS avec Coolify installé
- ✅ Accès SSH au VPS
- ✅ Git installé sur le VPS
- ✅ Un nom de domaine (optionnel)

---

## ⚡ Déploiement Rapide (3 étapes)

### ÉTAPE 1 : Préparer les Secrets

Sur ta machine locale, génère les secrets :

```bash
# JWT Secret (64 caractères)
openssl rand -hex 64

# Super Admin Key (32 caractères)
openssl rand -hex 32

# Database Password (32 caractères)
openssl rand -base64 32
```

**Note ces valeurs quelque part !**

---

### ÉTAPE 2 : Déployer dans Coolify

#### 2.1 Créer la Database PostgreSQL

1. Ouvrir Coolify : `https://ton-vps-ip:8000`
2. Créer un nouveau projet : **"awid-production"**
3. Add Resource → Database → PostgreSQL
   - Name: `awid-postgres`
   - Database: `awid`
   - Username: `awid_user`
   - Password: *[coller le DB_PASSWORD généré]*
   - Version: `14`
4. Cliquer **Deploy**
5. Attendre que le statut soit **Running** (vert)

#### 2.2 Initialiser la Database

**Option A : Via Coolify Terminal**

1. Dans la database → Terminal
2. Exécuter :

```bash
psql -U awid_user -d awid
```

3. Copier-coller le contenu de `sql_migrations.sql`
4. Puis copier-coller le contenu de `api-v2/migrations/DEPLOY_ALL_NEW_FEATURES.sql`
5. Créer un admin de test :

```sql
INSERT INTO organizations (id, name, type, active) 
VALUES ('org-test-1', 'Restaurant Test', 'restaurant', true);

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

**Option B : Via Script (depuis ton VPS)**

```bash
# SSH vers ton VPS
ssh root@ton-vps-ip

# Cloner le repo (si pas déjà fait)
git clone https://github.com/ton-username/awid.git
cd awid

# Exécuter le script d'init
./scripts/init-db.sh awid-postgres awid_user awid
```

#### 2.3 Déployer l'API Backend

1. Dans Coolify, Add Resource → Application
2. Configuration :
   - **Source** : Public/Private Repository
   - **Git URL** : `https://github.com/ton-username/awid.git`
   - **Branch** : `main`
   - **Name** : `awid-api`
   - **Build Pack** : `Dockerfile`
   - **Port** : `3000`
   - **Health Check** : `/api/health`

3. **Environment Variables** (très important !) :

```bash
NODE_ENV=production
PORT=3000
DATABASE_URL=postgresql://awid_user:TON_DB_PASSWORD@awid-postgres:5432/awid
DATABASE_SSL_REJECT_UNAUTHORIZED=false
JWT_SECRET=TON_JWT_SECRET_64_CARACTERES
SUPER_ADMIN_KEY=TON_SUPER_ADMIN_KEY_32_CARACTERES
CORS_ORIGINS=https://ton-domaine.com
```

4. **Domain** (optionnel) :
   - Ajouter : `api.ton-domaine.com`
   - Coolify va auto-configurer SSL

5. Cliquer **Deploy**
6. Suivre les logs
7. Attendre que le statut soit **Running**

---

### ÉTAPE 3 : Tester

```bash
# Test health check
curl https://api.ton-domaine.com/api/health

# Test login
curl -X POST https://api.ton-domaine.com/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@test.com","password":"admin123"}'

# Ou utiliser le script de test
./scripts/test-deployment.sh https://api.ton-domaine.com
```

**Accéder au Super Admin Panel :**
- URL : `https://api.ton-domaine.com/api/admin`
- Clé : *[ta SUPER_ADMIN_KEY]*

---

## 📱 Configurer le Mobile

1. Éditer `mobile/lib/core/constants/api_constants.dart` :

```dart
static const String baseUrl = 'https://api.ton-domaine.com/api';
```

2. Builder l'APK :

```bash
cd mobile
flutter pub get
flutter build apk --release
```

3. L'APK est dans : `build/app/outputs/flutter-apk/app-release.apk`

---

## 🔧 Commandes Utiles

### Voir les logs

```bash
# Dans Coolify : Application → Logs

# Ou via SSH
docker logs -f awid-api
docker logs -f awid-postgres
```

### Redéployer

```bash
# Dans Coolify : Application → Redeploy

# Ou via Git
git push origin main
# (si auto-deploy activé)
```

### Backup manuel

```bash
# Sur le VPS
./scripts/backup.sh
```

### Restaurer un backup

```bash
# Sur le VPS
docker exec -i awid-postgres psql -U awid_user awid < /var/backups/awid/db-20260122.sql
```

---

## 🐛 Problèmes Courants

### L'API ne démarre pas

```bash
# Vérifier les logs
docker logs awid-api

# Vérifier les variables d'env
docker exec awid-api env | grep DATABASE_URL
```

### Database connection failed

```bash
# Vérifier que PostgreSQL tourne
docker ps | grep postgres

# Tester la connexion
docker exec awid-postgres psql -U awid_user -d awid -c "SELECT 1;"
```

### CORS errors

Vérifier que `CORS_ORIGINS` contient ton domaine exact :
```bash
CORS_ORIGINS=https://ton-domaine.com,https://api.ton-domaine.com
```

---

## ✅ Checklist

- [ ] PostgreSQL déployé et running
- [ ] Database initialisée (tables créées)
- [ ] Admin de test créé
- [ ] API déployée et running
- [ ] Variables d'environnement configurées
- [ ] Health check répond 200
- [ ] Login fonctionne
- [ ] Super Admin Panel accessible
- [ ] Mobile APK buildé avec la bonne URL

---

## 🎉 C'est Tout !

Ton application AWID est maintenant en production sur ton VPS ! 🚀

**Prochaines étapes :**
1. Créer des organisations réelles via le Super Admin Panel
2. Configurer les backups automatiques (voir `DEPLOYMENT_COOLIFY.md`)
3. Configurer le firewall (voir `DEPLOYMENT_COOLIFY.md`)
4. Distribuer l'APK aux utilisateurs

**Besoin d'aide ?**
- Guide complet : `DEPLOYMENT_COOLIFY.md`
- Documentation Coolify : https://coolify.io/docs

---

*ⴰⵡⵉⴷ - "Apporte" en Tamazight 🇩🇿*
