# 🚀 Guide de Déploiement Awid v2.0

## Guide complet pour déployer l'application en production

---

## 📋 Prérequis

### Comptes Nécessaires
- ✅ Compte GitHub (pour le code)
- ✅ Compte Vercel (pour le backend)
- ✅ Compte Supabase (pour la database)
- ✅ Compte Google Play Console (pour Android - optionnel)

### Outils Locaux
- Node.js >= 18.0.0
- Flutter >= 3.1.0
- Git
- PostgreSQL client (psql)

---

## 🗄️ ÉTAPE 1 : Configuration Base de Données (Supabase)

### 1.1 Créer un Projet Supabase

1. Aller sur [supabase.com](https://supabase.com)
2. Créer un nouveau projet
3. Choisir une région proche (Europe West pour l'Algérie)
4. Noter le **Database Password**

### 1.2 Obtenir la Connection String

1. Dans Supabase Dashboard → Settings → Database
2. Copier la **Connection String** (mode "URI")
3. Remplacer `[YOUR-PASSWORD]` par votre mot de passe

Exemple:
```
postgresql://postgres.xxxxx:PASSWORD@aws-0-eu-west-1.pooler.supabase.com:5432/postgres
```

### 1.3 Exécuter les Migrations

**Option A: Via Supabase SQL Editor (Recommandé)**

1. Aller dans SQL Editor
2. Copier le contenu de `sql_migrations_v2_optimized.sql`
3. Exécuter le script
4. Vérifier qu'il n'y a pas d'erreurs

**Option B: Via psql local**

```bash
# Télécharger le fichier de migration
# Remplacer CONNECTION_STRING par votre string Supabase
psql "CONNECTION_STRING" -f sql_migrations_v2_optimized.sql
```

### 1.4 Vérifier les Tables

```sql
-- Dans SQL Editor Supabase
SELECT tablename FROM pg_tables WHERE schemaname = 'public';

-- Devrait afficher:
-- organizations, users, products, orders, order_items, 
-- deliveries, refresh_tokens, audit_logs, location_history, order_sequences
```

### 1.5 Créer la Première Organisation (Optionnel)

```sql
-- Créer une organisation de test
INSERT INTO organizations (id, name, type, active) 
VALUES ('test-org-1', 'Mon Restaurant', 'restaurant', true);

-- Créer un admin (mot de passe: "admin123")
-- Hash bcrypt de "admin123" avec 12 rounds
INSERT INTO users (organization_id, email, password, name, role, active)
VALUES (
  'test-org-1',
  'admin@test.com',
  '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYIeWEgKK3q',
  'Admin Test',
  'admin',
  true
);
```

---

## ☁️ ÉTAPE 2 : Déploiement Backend (Vercel)

### 2.1 Préparer le Projet

```bash
# Cloner le repo (si pas déjà fait)
git clone https://github.com/votre-repo/awid.git
cd awid

# Installer les dépendances
npm install

# Vérifier que tout compile
npm run build
```

### 2.2 Installer Vercel CLI

```bash
npm install -g vercel
```

### 2.3 Login Vercel

```bash
vercel login
# Suivre les instructions (email ou GitHub)
```

### 2.4 Premier Déploiement

```bash
# Déployer en mode preview d'abord
vercel

# Questions:
# - Set up and deploy? Yes
# - Which scope? Votre compte
# - Link to existing project? No
# - Project name? awid-api (ou autre)
# - Directory? ./
# - Override settings? No
```

### 2.5 Configurer les Variables d'Environnement

**Via Dashboard Vercel** (Recommandé):

1. Aller sur [vercel.com/dashboard](https://vercel.com/dashboard)
2. Sélectionner votre projet
3. Settings → Environment Variables
4. Ajouter les variables suivantes:

```env
# DATABASE_URL
Name: DATABASE_URL
Value: postgresql://postgres.xxxxx:PASSWORD@aws-0-eu-west-1.pooler.supabase.com:5432/postgres
Environments: Production, Preview, Development

# JWT_SECRET (générer avec: node -e "console.log(require('crypto').randomBytes(64).toString('hex'))")
Name: JWT_SECRET
Value: votre_secret_jwt_64_caracteres_minimum_tres_securise_genere_aleatoirement
Environments: Production, Preview, Development

# SUPER_ADMIN_KEY (générer avec: node -e "console.log(require('crypto').randomBytes(32).toString('hex'))")
Name: SUPER_ADMIN_KEY
Value: votre_cle_super_admin_32_caracteres_minimum_securisee
Environments: Production, Preview, Development

# NODE_ENV
Name: NODE_ENV
Value: production
Environments: Production

# CORS_ORIGINS (votre domaine frontend si vous en avez un)
Name: CORS_ORIGINS
Value: https://votre-app.vercel.app,https://votre-domaine.com
Environments: Production, Preview, Development
```

**Via CLI** (Alternative):

```bash
# Ajouter les variables
vercel env add DATABASE_URL production
# Coller la valeur quand demandé

vercel env add JWT_SECRET production
# Coller la valeur

vercel env add SUPER_ADMIN_KEY production
# Coller la valeur

vercel env add NODE_ENV production
# Taper: production

vercel env add CORS_ORIGINS production
# Taper: https://votre-app.vercel.app
```

### 2.6 Déployer en Production

```bash
# Déployer en production
vercel --prod

# Noter l'URL de production
# Exemple: https://awid-api.vercel.app
```

### 2.7 Tester l'API

```bash
# Test health check
curl https://votre-app.vercel.app/api/health

# Devrait retourner:
# {"status":"ok","version":"2.0.0","timestamp":"2026-01-19T..."}

# Test login (avec l'admin créé plus tôt)
curl -X POST https://votre-app.vercel.app/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@test.com","password":"admin123"}'

# Devrait retourner un accessToken et refreshToken
```

### 2.8 Accéder au Super Admin Panel

1. Ouvrir: `https://votre-app.vercel.app/api/admin`
2. Entrer votre `SUPER_ADMIN_KEY`
3. Vous devriez voir le dashboard super-admin

---

## 📱 ÉTAPE 3 : Configuration Mobile

### 3.1 Configurer l'URL de l'API

Éditer `mobile/lib/core/constants/api_constants.dart`:

```dart
class ApiConstants {
  // Remplacer par votre URL Vercel
  static const String baseUrl = 'https://votre-app.vercel.app/api';
  
  // Auth
  static const String login = '$baseUrl/auth/login';
  static const String refresh = '$baseUrl/auth/refresh';
  static const String logout = '$baseUrl/auth/logout';
  static const String me = '$baseUrl/auth/me';
  
  // Products
  static const String products = '$baseUrl/products';
  
  // Users
  static const String users = '$baseUrl/users';
  static const String deliverers = '$baseUrl/users/deliverers';
  
  // Orders
  static const String orders = '$baseUrl/orders';
  static const String myOrders = '$baseUrl/orders/my';
  
  // Deliveries
  static const String deliveries = '$baseUrl/deliveries';
  static const String deliveryRoute = '$baseUrl/deliveries/route';
  
  // Financial
  static const String dailyFinancial = '$baseUrl/financial/daily';
  static const String debts = '$baseUrl/financial/debts';
}
```

### 3.2 Tester en Développement

```bash
cd mobile

# Installer les dépendances
flutter pub get

# Lancer sur émulateur/appareil
flutter run

# Tester le login avec admin@test.com / admin123
```

### 3.3 Builder l'APK de Production

```bash
# Build APK release
flutter build apk --release

# L'APK sera dans: build/app/outputs/flutter-apk/app-release.apk
```

### 3.4 Signer l'APK (Pour Google Play)

**Créer un keystore**:

```bash
keytool -genkey -v -keystore ~/awid-release-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias awid-key
```

**Configurer dans `mobile/android/key.properties`**:

```properties
storePassword=votre_mot_de_passe
keyPassword=votre_mot_de_passe
keyAlias=awid-key
storeFile=/chemin/vers/awid-release-key.jks
```

**Modifier `mobile/android/app/build.gradle`**:

```gradle
// Avant android {
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    // ...
    
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

**Builder l'APK signé**:

```bash
flutter build apk --release
```

---

## 🌐 ÉTAPE 4 : Déploiement Website (Optionnel)

### 4.1 Via Vercel

```bash
cd website

# Déployer
vercel --prod

# Noter l'URL: https://awid-website.vercel.app
```

### 4.2 Via Netlify (Alternative)

1. Aller sur [netlify.com](https://netlify.com)
2. New site from Git
3. Sélectionner le repo
4. Build settings:
   - Base directory: `website`
   - Build command: (laisser vide)
   - Publish directory: `.`
5. Deploy

---

## 🔧 ÉTAPE 5 : Configuration Post-Déploiement

### 5.1 Créer des Organisations via Super Admin

1. Ouvrir `https://votre-app.vercel.app/api/admin`
2. Se connecter avec SUPER_ADMIN_KEY
3. Aller dans "Créer Organisation"
4. Remplir:
   - Nom: "Restaurant Le Palmier"
   - Type: "restaurant"
   - Email Admin: "admin@palmier.com"
   - Mot de passe: "motdepasse123"
   - Nom Admin: "Ahmed Benali"
   - Téléphone: "+213 555 123 456"
5. Créer

### 5.2 Tester le Login Mobile

1. Ouvrir l'app mobile
2. Se connecter avec:
   - Email: admin@palmier.com
   - Mot de passe: motdepasse123
3. Vérifier que le dashboard s'affiche

### 5.3 Créer des Utilisateurs de Test

Via l'app mobile (en tant qu'admin):

1. Aller dans "Utilisateurs"
2. Créer un livreur:
   - Email: livreur@palmier.com
   - Mot de passe: livreur123
   - Nom: "Karim Livreur"
   - Rôle: Livreur
3. Créer une cafétéria:
   - Email: cafe@test.com
   - Mot de passe: cafe123
   - Nom: "Café Central"
   - Rôle: Cafétéria

### 5.4 Tester le Système Complet

**Scénario de test**:

1. **Cafétéria** crée une commande
2. **Admin** verrouille la commande
3. **Admin** assigne un livreur
4. **Livreur** voit la livraison dans sa tournée
5. **Livreur** active le GPS
6. **Admin** voit le livreur sur la carte temps réel
7. **Livreur** confirme la livraison
8. **Admin** voit les statistiques mises à jour

---

## 📊 ÉTAPE 6 : Monitoring et Maintenance

### 6.1 Configurer les Alertes Vercel

1. Vercel Dashboard → Settings → Notifications
2. Activer:
   - Deployment Failed
   - Deployment Ready
   - Domain Configuration Changed

### 6.2 Monitoring Database

**Via Supabase Dashboard**:

1. Database → Logs
2. Surveiller les erreurs
3. Vérifier les performances

**Requêtes utiles**:

```sql
-- Taille des tables
SELECT 
    tablename,
    pg_size_pretty(pg_total_relation_size('public.'||tablename)) AS size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size('public.'||tablename) DESC;

-- Nombre d'utilisateurs par organisation
SELECT o.name, COUNT(u.id) as user_count
FROM organizations o
LEFT JOIN users u ON o.id = u.organization_id
GROUP BY o.id, o.name;

-- Commandes du jour
SELECT COUNT(*) as today_orders
FROM orders
WHERE DATE(created_at) = CURRENT_DATE;
```

### 6.3 Nettoyage Automatique

**Créer un CRON job** (via Vercel Cron ou service externe):

```javascript
// api-v2/cron/cleanup.js
const pool = require('../config/database');

async function cleanup() {
  // Nettoyer tokens expirés
  await pool.query('SELECT cleanup_expired_tokens()');
  
  // Nettoyer vieux logs (90 jours)
  await pool.query('SELECT cleanup_old_audit_logs(90)');
  
  // Nettoyer historique GPS (30 jours)
  await pool.query('SELECT cleanup_old_location_history(30)');
  
  console.log('Cleanup completed');
}

cleanup();
```

**Configurer dans `vercel.json`**:

```json
{
  "crons": [{
    "path": "/api/cron/cleanup",
    "schedule": "0 2 * * *"
  }]
}
```

---

## 🔒 ÉTAPE 7 : Sécurité Production

### 7.1 Checklist Sécurité

- [ ] JWT_SECRET >= 64 caractères aléatoires
- [ ] SUPER_ADMIN_KEY >= 32 caractères aléatoires
- [ ] DATABASE_URL avec SSL activé
- [ ] CORS_ORIGINS configuré avec domaines exacts
- [ ] NODE_ENV=production
- [ ] Keystore Android sécurisé (pas dans Git)
- [ ] Backup database configuré
- [ ] Logs d'audit activés

### 7.2 Configurer les Backups Supabase

1. Supabase Dashboard → Database → Backups
2. Activer "Point in Time Recovery" (PITR)
3. Configurer la rétention (7 jours minimum)

### 7.3 Tester la Restauration

```bash
# Télécharger un backup
# Via Supabase Dashboard → Database → Backups → Download

# Restaurer sur une nouvelle database de test
psql "CONNECTION_STRING_TEST" < backup.sql

# Vérifier que tout fonctionne
```

---

## 📈 ÉTAPE 8 : Optimisation Performance

### 8.1 Activer le Cache Vercel

Dans `vercel.json`:

```json
{
  "headers": [
    {
      "source": "/api/products",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "s-maxage=60, stale-while-revalidate"
        }
      ]
    }
  ]
}
```

### 8.2 Optimiser les Images Mobile

```bash
# Compresser les assets
cd mobile/assets
# Utiliser un outil comme ImageOptim ou TinyPNG
```

### 8.3 Analyser les Performances

```bash
# Backend
vercel logs --follow

# Mobile
flutter run --profile
# Utiliser DevTools pour analyser
```

---

## 🐛 ÉTAPE 9 : Dépannage

### Problème: "Token expiré" constant

**Solution**:
```bash
# Vérifier que JWT_SECRET est bien configuré
vercel env ls

# Vérifier l'heure système
date

# Régénérer un nouveau secret si nécessaire
node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"
vercel env add JWT_SECRET production
```

### Problème: "CORS non autorisé"

**Solution**:
```bash
# Vérifier CORS_ORIGINS
vercel env ls

# Ajouter votre domaine
vercel env add CORS_ORIGINS production
# Valeur: https://votre-domaine.com,https://autre-domaine.com
```

### Problème: GPS ne fonctionne pas

**Solution**:
1. Vérifier permissions Android dans `AndroidManifest.xml`
2. Activer GPS sur l'appareil
3. Vérifier connexion internet
4. Redémarrer l'app

### Problème: Database lente

**Solution**:
```sql
-- Analyser les tables
ANALYZE orders;
ANALYZE deliveries;
ANALYZE users;

-- Vacuum
VACUUM ANALYZE;

-- Vérifier les index manquants
SELECT * FROM pg_stat_user_indexes WHERE idx_scan = 0;
```

---

## ✅ ÉTAPE 10 : Validation Finale

### Checklist de Déploiement

- [ ] Database créée et migrée
- [ ] Backend déployé sur Vercel
- [ ] Variables d'environnement configurées
- [ ] API accessible et répond correctement
- [ ] Super Admin Panel accessible
- [ ] Mobile APK buildé et testé
- [ ] Organisations de test créées
- [ ] Utilisateurs de test créés
- [ ] Scénario complet testé
- [ ] Monitoring configuré
- [ ] Backups activés
- [ ] Documentation à jour

### Tests de Validation

```bash
# 1. Health check
curl https://votre-app.vercel.app/api/health

# 2. Login
curl -X POST https://votre-app.vercel.app/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@test.com","password":"admin123"}'

# 3. Get products (avec token)
curl https://votre-app.vercel.app/api/products \
  -H "Authorization: Bearer VOTRE_TOKEN"

# 4. Realtime deliveries
curl https://votre-app.vercel.app/api/realtime/deliveries-map \
  -H "Authorization: Bearer VOTRE_TOKEN"
```

---

## 🎉 Félicitations !

Votre application Awid est maintenant déployée en production ! 🚀

### Prochaines Étapes

1. **Monitorer** les logs et performances
2. **Collecter** les retours utilisateurs
3. **Itérer** sur les fonctionnalités
4. **Optimiser** selon l'usage réel

### Support

- 📧 Email: contact@awid.app
- 📚 Documentation: README.md
- 🐛 Issues: GitHub Issues
- 💬 Discord: (à créer)

---

*Guide créé le 19 Janvier 2026*  
*Version: 2.0.0*  
*ⴰⵡⵉⴷ - "Apporte" en Tamazight 🇩🇿*
