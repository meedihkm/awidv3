# ⴰⵡⵉⴷ Awid - Système de Gestion de Livraisons B2B

![Version](https://img.shields.io/badge/version-2.0.0-green.svg)
![Node](https://img.shields.io/badge/node-%3E%3D18.0.0-brightgreen.svg)
![Flutter](https://img.shields.io/badge/flutter-%3E%3D3.1.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

Application complète de gestion de commandes et livraisons B2B avec suivi GPS en temps réel, conçue pour l'Algérie.

## 🌟 Fonctionnalités Principales

### 📱 Application Mobile (Flutter)
- **Multi-rôles** : Admin, Cafétéria, Livreur, Cuisine
- **Suivi GPS temps réel** : Localisation des livreurs sur carte interactive
- **Gestion commandes** : Création, modification, suivi complet
- **Catalogue produits** : Photos, catégories, promotions
- **Rapports financiers** : Statistiques, exports PDF
- **Impression** : Bons de livraison, tickets thermiques
- **Mode offline** : Cache intelligent pour performance
- **Notifications** : Alertes en temps réel

### 🖥️ Backend API (Node.js)
- **Architecture RESTful** : API v2 optimisée
- **Authentification JWT** : Access + Refresh tokens
- **Multi-tenant** : Support organisations multiples
- **Audit complet** : Logs de toutes les actions
- **Rate limiting** : Protection contre abus
- **Validation Zod** : Données sécurisées
- **PostgreSQL** : Base de données robuste

### 🌐 Website (HTML/CSS/JS)
- **Landing page** : Présentation professionnelle
- **Responsive** : Mobile-first design
- **SEO optimisé** : Meta tags complets

## 🚀 Installation Rapide

### Prérequis
- Node.js >= 18.0.0
- PostgreSQL >= 12
- Flutter >= 3.1.0 (pour mobile)
- Compte Vercel (pour déploiement)
- Compte Supabase (pour database)

### 1. Backend Setup

```bash
# Cloner le repo
git clone https://github.com/votre-repo/awid.git
cd awid

# Installer les dépendances
npm install

# Configurer les variables d'environnement
cp .env.example .env
# Éditer .env avec vos valeurs

# Exécuter les migrations SQL
psql -U postgres -d votre_database -f sql_migrations_v2_optimized.sql

# Démarrer en développement
npm run dev
```

### 2. Mobile Setup

```bash
cd mobile

# Installer les dépendances Flutter
flutter pub get

# Configurer l'API URL
# Éditer mobile/lib/core/constants/api_constants.dart

# Lancer sur Android
flutter run

# Ou builder l'APK
flutter build apk --release
```

### 3. Déploiement Vercel

```bash
# Installer Vercel CLI
npm i -g vercel

# Déployer
vercel --prod

# Configurer les variables d'environnement sur Vercel Dashboard
# DATABASE_URL, JWT_SECRET, SUPER_ADMIN_KEY, CORS_ORIGINS
```

## 📁 Structure du Projet

```
awid/
├── api-v2/                 # Backend Node.js
│   ├── config/            # Configuration (DB, JWT, CORS)
│   ├── middleware/        # Auth, validation, rate limiting
│   ├── routes/            # Routes API
│   ├── services/          # Business logic
│   ├── schemas/           # Validation Zod
│   └── index.js           # Entry point
├── mobile/                # Application Flutter
│   ├── lib/
│   │   ├── core/         # Services, models, widgets
│   │   ├── features/     # Features par rôle
│   │   └── main.dart     # Entry point
│   └── pubspec.yaml      # Dépendances Flutter
├── website/              # Landing page
│   ├── index.html
│   ├── styles.css
│   └── script.js
├── sql_migrations_v2_optimized.sql  # Migrations DB
├── vercel.json           # Config Vercel
├── package.json          # Dépendances Node
└── README.md            # Ce fichier
```

## 🔐 Sécurité

### Authentification
- **JWT** avec expiration courte (15min)
- **Refresh tokens** avec révocation
- **Bcrypt** pour hash passwords (12 rounds)
- **Timing-safe** comparison pour super-admin

### Protection
- **Rate limiting** sur toutes les routes
- **CORS** restrictif en production
- **Helmet.js** pour headers sécurisés
- **Validation Zod** sur toutes les entrées
- **Parameterized queries** (protection SQL injection)

### Audit
- Logs de toutes actions sensibles
- IP et User-Agent enregistrés
- Traçabilité complète

## 📊 API Endpoints

### Auth
```
POST   /api/auth/login          # Connexion
POST   /api/auth/refresh        # Refresh token
POST   /api/auth/logout         # Déconnexion
POST   /api/auth/logout-all     # Déconnexion tous appareils
GET    /api/auth/me             # Infos utilisateur
```

### Products
```
GET    /api/products            # Liste produits
POST   /api/products            # Créer produit
PUT    /api/products/:id        # Modifier produit
DELETE /api/products/:id        # Supprimer produit
PUT    /api/products/:id/toggle # Activer/désactiver
PUT    /api/products/:id/reorder # Réorganiser
```

### Orders
```
GET    /api/orders              # Liste commandes
GET    /api/orders/my           # Mes commandes (cafétéria)
GET    /api/orders/kitchen      # Commandes cuisine
POST   /api/orders              # Créer commande
PUT    /api/orders/:id          # Modifier commande
PUT    /api/orders/:id/lock     # Verrouiller commande
POST   /api/orders/:id/assign   # Assigner livreur
PUT    /api/orders/:id/kitchen-status # Statut cuisine
```

### Deliveries
```
GET    /api/deliveries          # Liste livraisons
GET    /api/deliveries/route    # Ma tournée (livreur)
GET    /api/deliveries/history  # Historique (livreur)
GET    /api/deliveries/:id      # Détail livraison
PUT    /api/deliveries/:id/status # Mettre à jour statut
```

### Realtime (Nouveau!)
```
POST   /api/realtime/location           # Livreur: Mettre à jour position
GET    /api/realtime/deliverers         # Admin: Positions livreurs
GET    /api/realtime/deliveries-map     # Admin: Carte livraisons temps réel
GET    /api/realtime/deliverer/:id/route # Admin: Itinéraire livreur
GET    /api/realtime/deliverer/:id/history # Admin: Historique GPS
```

### Users
```
GET    /api/users               # Liste utilisateurs
GET    /api/users/deliverers    # Liste livreurs actifs
POST   /api/users               # Créer utilisateur
DELETE /api/users/:id           # Supprimer utilisateur
PUT    /api/users/:id/toggle    # Activer/désactiver
PUT    /api/users/:id/address   # Mettre à jour adresse
```

### Organization
```
GET    /api/organization/settings # Paramètres organisation
PUT    /api/organization/settings # Modifier paramètres
GET    /api/financial/daily      # Résumé financier jour
GET    /api/financial/debts      # Liste dettes clients
GET    /api/audit-logs           # Logs d'audit
```

### Super Admin
```
GET    /api/super-admin/stats           # Statistiques globales
GET    /api/super-admin/organizations   # Liste organisations
POST   /api/super-admin/organizations   # Créer organisation
DELETE /api/super-admin/organizations/:id # Supprimer organisation
PATCH  /api/super-admin/organizations/:id/status # Activer/désactiver
GET    /api/super-admin/users           # Tous les utilisateurs
GET    /api/super-admin/audit-logs      # Tous les logs
```

## 🗺️ Système de Maps Temps Réel

### Fonctionnalités
- **Tracking automatique** : Position livreur mise à jour toutes les 50m
- **Carte interactive** : Visualisation clients + livreurs
- **Filtres** : Par statut (assignée, en cours)
- **Historique GPS** : Trajet complet par jour
- **Navigation** : Lien direct vers Google Maps/OSM
- **Temps réel** : Refresh automatique toutes les 10s

### Utilisation Livreur
```dart
// Le tracking démarre automatiquement au lancement
// Position envoyée au serveur toutes les minutes max
// Bouton GPS dans l'app pour activer/désactiver
```

### Utilisation Admin
```dart
// Bouton "Carte Temps Réel" dans le dashboard
// Voir tous les livreurs et clients sur la carte
// Cliquer sur un marker pour plus d'infos
// Liste horizontale en bas pour navigation rapide
```

## 🔧 Configuration

### Variables d'Environnement (.env)

```env
# Base de données
DATABASE_URL="postgresql://user:password@host:5432/database"

# JWT (OBLIGATOIRE - min 32 caractères)
JWT_SECRET="votre_secret_jwt_tres_long_et_securise"

# Super Admin (OBLIGATOIRE - min 32 caractères)
SUPER_ADMIN_KEY="votre_cle_super_admin_tres_securisee"

# Environment
NODE_ENV="production"

# CORS (séparés par virgule)
CORS_ORIGINS="https://votre-app.vercel.app,https://votre-domaine.com"
```

### Générer des secrets sécurisés

```bash
# JWT Secret
node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"

# Super Admin Key
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

## 📱 Configuration Mobile

Éditer `mobile/lib/core/constants/api_constants.dart`:

```dart
class ApiConstants {
  static const String baseUrl = 'https://votre-api.vercel.app/api';
  
  // Endpoints
  static const String login = '$baseUrl/auth/login';
  static const String products = '$baseUrl/products';
  // ...
}
```

## 🧪 Tests

```bash
# Backend (à implémenter)
npm test

# Mobile (à implémenter)
cd mobile
flutter test
```

## 📈 Performance

### Backend
- Connection pooling PostgreSQL (max 20)
- Index optimisés sur colonnes fréquentes
- Vues matérialisées pour stats
- Rate limiting pour protection

### Mobile
- Cache intelligent (products, users, orders)
- Cached network images
- Lazy loading
- Optimistic UI updates

### Database
- Index composites pour requêtes complexes
- Partitioning pour tables volumineuses (audit_logs)
- Fonctions de nettoyage automatique
- Triggers pour updated_at

## 🛠️ Maintenance

### Nettoyage Automatique

```sql
-- Nettoyer tokens expirés
SELECT cleanup_expired_tokens();

-- Nettoyer vieux logs (garder 90 jours)
SELECT cleanup_old_audit_logs(90);

-- Nettoyer historique GPS (garder 30 jours)
SELECT cleanup_old_location_history(30);

-- Optimiser les tables
VACUUM ANALYZE;
```

### Monitoring

```sql
-- Taille des tables
SELECT 
    tablename,
    pg_size_pretty(pg_total_relation_size('public.'||tablename)) AS size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size('public.'||tablename) DESC;

-- Index inutilisés
SELECT 
    tablename,
    indexname,
    idx_scan
FROM pg_stat_user_indexes
WHERE idx_scan = 0;
```

## 🐛 Dépannage

### Erreur "Token expiré"
- Vérifier que JWT_SECRET est configuré
- Vérifier l'heure système (NTP)
- Utiliser le refresh token

### Erreur "CORS non autorisé"
- Vérifier CORS_ORIGINS dans .env
- Ajouter votre domaine à la whitelist
- En dev, CORS est permissif

### GPS ne fonctionne pas
- Vérifier permissions Android (Location)
- Activer GPS sur l'appareil
- Vérifier connexion internet
- Bouton GPS dans l'app pour activer

### Base de données lente
- Exécuter ANALYZE sur les tables
- Vérifier les index manquants
- Nettoyer les vieux logs
- Augmenter connection pool si nécessaire

## 📝 Changelog

### v2.0.0 (19 Janvier 2026)
- ✨ Nouveau système de maps temps réel
- ✨ Tracking GPS automatique pour livreurs
- ✨ API realtime avec endpoints optimisés
- 🔒 Sécurité renforcée (CORS, validation)
- 🗑️ Nettoyage code (suppression API v1)
- 📊 Vues SQL pour performances
- 🔧 Triggers et fonctions utilitaires
- 📱 Interface admin améliorée
- 🐛 Corrections bugs critiques

### v1.0.0
- 🎉 Version initiale

## 🤝 Contribution

Les contributions sont les bienvenues ! Merci de :
1. Fork le projet
2. Créer une branche (`git checkout -b feature/AmazingFeature`)
3. Commit vos changements (`git commit -m 'Add AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## 📄 License

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 👥 Auteurs

- **Équipe Awid** - *Développement initial* - [GitHub](https://github.com/votre-org)

## 🙏 Remerciements

- OpenStreetMap pour les cartes
- Flutter & Dart team
- Node.js & Express community
- PostgreSQL team
- Vercel pour l'hébergement

## 📞 Support

- Email: contact@awid.app
- GitHub Issues: [Issues](https://github.com/votre-repo/awid/issues)
- Documentation: [Wiki](https://github.com/votre-repo/awid/wiki)

---

**ⴰⵡⵉⴷ** - "Apporte" en Tamazight 🇩🇿
