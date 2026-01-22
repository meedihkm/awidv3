# 🚀 Guide de Configuration Coolify - AWID Livraison

Ce guide unifie TOUTE la configuration pour simplifier le déploiement sur Coolify.

## 📋 Prérequis

- Accès à Coolify
- Accès SSH au serveur (pour générer les secrets)

---

## 🔐 Étape 1 : Générer les Secrets

### Option A : Script automatique (recommandé)

```bash
# Sur votre machine locale ou serveur
./scripts/generate-secrets.sh
```

Le script affiche les 3 secrets à copier.

### Option B : Manuellement

```bash
# DB_PASSWORD
openssl rand -base64 32 | tr -d "=+/" | cut -c1-32

# JWT_SECRET
openssl rand -hex 64

# SUPER_ADMIN_KEY
openssl rand -hex 32
```

---

## ⚙️ Étape 2 : Configuration Coolify

### 2.1 Variables d'environnement

1. Dans Coolify, aller dans votre projet **AWID livraison**
2. Cliquer sur **Environment** ou **Variables d'environnement**
3. Copier-coller le contenu de `.env.coolify`
4. Remplacer les valeurs `CHANGEME_*` par les secrets générés :
   - `CHANGEME_DB_PASSWORD` → Votre DB_PASSWORD
   - `CHANGEME_JWT_SECRET` → Votre JWT_SECRET
   - `CHANGEME_SUPER_ADMIN_KEY` → Votre SUPER_ADMIN_KEY

5. Modifier `CORS_ORIGINS` avec votre domaine :
   ```
   CORS_ORIGINS=https://votre-domaine.com,https://api.votre-domaine.com
   ```

6. **Sauvegarder**

### 2.2 Docker Compose

1. Dans Coolify, aller dans **Docker Compose** ou **Configuration**
2. Remplacer le contenu par `docker-compose.coolify.yml`
3. **Sauvegarder**

---

## 🗄️ Étape 3 : Configuration des Bases de Données

### PostgreSQL

Dans Coolify, votre base PostgreSQL `awid-postgres` doit avoir :

```
Nom: awid-postgres
Database: awid
User: awid_user
Password: [même valeur que DB_PASSWORD]
Port: 5432
```

### Redis

Dans Coolify, créer ou vérifier Redis `awid-redis` :

```
Nom: awid-redis
Port: 6379
```

---

## 🚀 Étape 4 : Déploiement

1. Dans Coolify, cliquer sur **Deploy** ou **Redéployer**
2. Attendre que les 3 services démarrent :
   - ✅ awid-postgres
   - ✅ awid-redis
   - ✅ awid-api

---

## ✅ Étape 5 : Vérification

### Tester l'API

```bash
# Health check
curl http://votre-ip:3000/api/health

# Devrait retourner : {"status":"ok"}
```

### Vérifier les logs

Dans Coolify :
1. Cliquer sur chaque service
2. Voir les **Logs**
3. Vérifier qu'il n'y a pas d'erreurs

---

## 🔧 Variables d'Environnement - Référence Complète

| Variable | Description | Exemple |
|----------|-------------|---------|
| `DB_PASSWORD` | Mot de passe PostgreSQL | `abc123...` |
| `DATABASE_URL` | URL connexion PostgreSQL | `postgresql://awid_user:${DB_PASSWORD}@awid-postgres:5432/awid` |
| `REDIS_URL` | URL connexion Redis | `redis://awid-redis:6379` |
| `JWT_SECRET` | Secret pour tokens JWT | `64 caractères hex` |
| `SUPER_ADMIN_KEY` | Clé super admin | `32 caractères hex` |
| `NODE_ENV` | Environnement | `production` |
| `PORT` | Port API | `3000` |
| `CORS_ORIGINS` | Domaines autorisés | `https://domain.com` |

---

## 🐛 Dépannage

### Erreur : "Connection refused" PostgreSQL

- Vérifier que `awid-postgres` est démarré
- Vérifier que `DB_PASSWORD` est identique dans les variables et la config PostgreSQL

### Erreur : "Redis connection failed"

- Vérifier que `awid-redis` est démarré
- Vérifier que `REDIS_URL=redis://awid-redis:6379`

### Erreur : "CORS blocked"

- Ajouter votre domaine dans `CORS_ORIGINS`
- Format : `https://domain1.com,https://domain2.com` (séparés par virgule, sans espaces)

### L'API ne démarre pas

1. Vérifier les logs dans Coolify
2. Vérifier que les 3 secrets sont bien définis
3. Vérifier que PostgreSQL et Redis sont en ligne AVANT l'API

---

## 📝 Checklist Finale

- [ ] Secrets générés (DB_PASSWORD, JWT_SECRET, SUPER_ADMIN_KEY)
- [ ] Variables d'environnement configurées dans Coolify
- [ ] Docker Compose mis à jour
- [ ] PostgreSQL configuré et démarré
- [ ] Redis configuré et démarré
- [ ] API déployée
- [ ] Health check OK (`/api/health`)
- [ ] CORS configuré avec votre domaine
- [ ] Secrets sauvegardés dans un endroit sûr

---

## 🎯 Résumé des Ports

| Service | Port Interne | Port Externe | URL Interne Docker |
|---------|--------------|--------------|-------------------|
| API | 3000 | 3000 | `http://api:3000` |
| PostgreSQL | 5432 | 5432 | `postgresql://postgres:5432` |
| Redis | 6379 | 6379 | `redis://redis:6379` |

---

## 📞 Support

Si vous rencontrez des problèmes :

1. Vérifier les logs dans Coolify
2. Vérifier que toutes les variables sont définies
3. Vérifier que les services sont démarrés dans l'ordre : PostgreSQL → Redis → API

---

**✨ Configuration terminée ! Votre application AWID est prête.**
