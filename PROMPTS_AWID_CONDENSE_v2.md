# 📋 PROMPTS AWID v2.0 - VERSION CONDENSÉE

## 🚀 CONTEXTE GLOBAL (à donner UNE SEULE FOIS au début)

```
Tu es un développeur senior travaillant sur AWID, une application B2B de gestion de livraison.

STACK TECHNIQUE :
- Backend : Node.js + Express.js (dossier api-v2/)
- Mobile : Flutter (dossier mobile/)
- Base de données : PostgreSQL (Supabase/Neon)
- Hébergement : Vercel

STRUCTURE PROJET :
awid/
├── api-v2/
│   ├── config/
│   ├── routes/
│   ├── middleware/
│   ├── services/
│   └── utils/
└── mobile/lib/
    ├── core/
    │   ├── providers/
    │   ├── services/
    │   └── models/
    └── features/

RÈGLES OBLIGATOIRES :
1. Ne jamais casser les fonctionnalités existantes
2. Tester chaque modification avant commit
3. Documenter les changements importants
4. Utiliser les conventions de code existantes
5. Pas de console.log en production (utiliser logger)
6. Gérer toutes les erreurs avec try/catch

OBJECTIF GLOBAL : Transformer AWID v1.0 en plateforme enterprise-ready v2.0
```

---

# 🎯 PHASE 1 : FONDATIONS

---

## Sprint 1.1 : Sécurité (5 jours)

```
SPRINT 1.1 - SÉCURITÉ

OBJECTIF : Corriger les vulnérabilités de sécurité critiques.

TÂCHES :
1. CORS (api-v2/config/cors.js)
   - Créer whitelist domaines autorisés via ALLOWED_ORIGINS
   - Bloquer requêtes non autorisées → 403

2. SSL PostgreSQL (api-v2/config/database.js)
   - Activer rejectUnauthorized: true en production
   - Configurer certificat CA

3. Filtre organization_id
   - Vérifier que location_history filtre par organization_id
   - Aucune fuite de données inter-organisations

4. 2FA Super-Admin (api-v2/routes/superAdmin.routes.js)
   - Intégrer speakeasy ou otplib (TOTP)
   - Endpoints : /super-admin/2fa/setup et /verify
   - Générer backup codes

5. CSP + HTTPS
   - Ajouter helmet avec CSP strict
   - Middleware redirection HTTP → HTTPS
   - Header HSTS (max-age 1 an)

6. Audit secrets
   - Vérifier aucun secret hardcodé
   - Mettre à jour .env.example

LIVRABLES :
- api-v2/config/cors.js (corrigé)
- api-v2/config/database.js (SSL)
- api-v2/config/security.js (nouveau)
- api-v2/middleware/httpsRedirect.js (nouveau)
- docs/SECURITY_AUDIT.md

VALIDATION :
□ CORS bloque domaines non autorisés
□ Connexion DB avec SSL vérifié
□ 2FA fonctionne pour super-admin
□ Headers CSP et HSTS présents
```

---

## Sprint 1.2 : Monitoring (5 jours)

```
SPRINT 1.2 - MONITORING

OBJECTIF : Mettre en place monitoring complet (Sentry + Prometheus + Grafana).

TÂCHES :
1. Sentry Backend
   - Installer @sentry/node
   - Configurer dans api-v2/config/sentry.js
   - Capturer erreurs 500 + performance traces
   - Filtrer PII dans beforeSend

2. Sentry Mobile
   - Ajouter sentry_flutter
   - Wrapper app avec SentryWidget
   - Capturer crashes + breadcrumbs navigation

3. Alertes
   - Erreurs 500 > 5/min → email/Slack
   - Latence P95 > 500ms → alerte

4. Prometheus (api-v2/middleware/metrics.middleware.js)
   - Endpoint /metrics (protégé)
   - Métriques : http_requests_total, http_request_duration_seconds, active_connections

5. Logs Winston (api-v2/config/logger.js)
   - Format JSON en production
   - Niveaux : error, warn, info, debug
   - Contexte automatique (requestId, userId)
   - Remplacer tous les console.log

6. Health Checks (api-v2/routes/health.routes.js)
   - /health → 200 OK simple
   - /health/ready → vérifie DB + Redis
   - /health/live → liveness probe

LIVRABLES :
- api-v2/config/sentry.js
- api-v2/config/logger.js
- api-v2/middleware/metrics.middleware.js
- api-v2/routes/health.routes.js
- mobile/lib/core/services/sentry_service.dart
- docs/MONITORING.md

VALIDATION :
□ Sentry reçoit les erreurs (tester erreur forcée)
□ /metrics retourne métriques Prometheus
□ /health/ready vérifie dépendances
□ Aucun console.log dans le code
```

---

## Sprint 1.3 : Tests Backend (10 jours)

```
SPRINT 1.3 - TESTS UNITAIRES BACKEND

OBJECTIF : Implémenter tests Jest + Supertest, coverage > 70%.

TÂCHES :
1. Setup Jest
   - Installer jest, supertest
   - Créer jest.config.js avec coverage threshold 70%
   - Créer __tests__/setup.js

2. Tests Middleware
   - auth.middleware.test.js : token valide/manquant/expiré/invalide
   - validate.middleware.test.js : données valides/manquantes/format invalide
   - rateLimit.middleware.test.js : sous/à/au-dessus limite

3. Tests Services
   - audit.service.test.js : logAction, getAuditLogs
   - token.service.test.js : generate, verify, refresh
   - order.service.test.js : create, update, getByOrg

4. Tests Routes (Intégration)
   - auth.routes.test.js : login, logout, refresh
   - orders.routes.test.js : CRUD complet
   - deliveries.routes.test.js : workflow livraison

5. Mocks
   - __tests__/mocks/database.mock.js
   - Factories : createMockUser, createMockOrder, etc.

6. CI GitHub Actions
   - .github/workflows/test.yml
   - Tests auto sur PR

STRUCTURE :
api-v2/__tests__/
├── unit/
│   ├── middleware/
│   └── services/
├── integration/
│   └── routes/
├── mocks/
└── setup.js

LIVRABLES :
- 150+ tests unitaires
- 50+ tests intégration
- Coverage > 70%
- CI fonctionnel

VALIDATION :
□ npm test → tous passent
□ npm run test:coverage → > 70%
□ CI GitHub → green
□ Temps total < 2 min
```

---

## Sprint 1.4 : Tests E2E (5 jours)

```
SPRINT 1.4 - TESTS E2E + PERFORMANCE + SÉCURITÉ

OBJECTIF : Scénarios E2E critiques + load testing + audit OWASP.

TÂCHES :
1. Scénarios E2E (__tests__/e2e/)
   - organization-setup.e2e.test.js : création org → admin → users → produits
   - order-delivery.e2e.test.js : commande → assignation → livraison → paiement
   - payments.e2e.test.js : workflow paiements complet

2. Load Testing (Artillery)
   - artillery/load-test.yml
   - Scénarios : browse products, create order
   - Phases : warm up (10 req/s) → sustained (50 req/s) → peak (100 req/s)
   - Cibles : P95 < 200ms, error rate < 1%

3. Tests Sécurité (OWASP ZAP)
   - Scanner endpoints API
   - Rapport security/owasp-report.html

LIVRABLES :
- 20+ scénarios E2E
- Rapport performance Artillery
- Rapport sécurité OWASP

VALIDATION :
□ Scénarios E2E passent
□ P95 < 200ms sous charge
□ Aucune vulnérabilité critique OWASP
```

---

## Sprint 1.5 : Tests Flutter (10 jours)

```
SPRINT 1.5 - TESTS FLUTTER

OBJECTIF : Tests unitaires, widgets, intégration Flutter. Coverage > 60%.

TÂCHES :
1. Setup
   - Ajouter mockito, golden_toolkit dans pubspec.yaml
   - Créer test/setup.dart

2. Tests Unitaires (test/unit/)
   - providers/auth_provider_test.dart : login, logout, refreshToken
   - services/api_service_test.dart : GET/POST, token refresh auto, erreurs réseau
   - models/ : fromJson, toJson pour Order, Delivery, User

3. Tests Widgets (test/widget/)
   - login_page_test.dart : validation form, erreur credentials
   - orders_list_test.dart : affichage liste, empty state
   - delivery_card_test.dart : états différents

4. Tests Intégration (test/integration/)
   - order_flow_test.dart : navigation → ajout panier → validation → confirmation
   - delivery_flow_test.dart : assignation → démarrage → complétion

5. Golden Tests (test/goldens/)
   - Screenshots composants critiques

LIVRABLES :
- 100+ tests unitaires
- 30+ tests widgets
- 10+ tests intégration
- Coverage > 60%

VALIDATION :
□ flutter test → tous passent
□ flutter test --coverage → > 60%
□ Golden tests sans régression
```

---

## Sprint 1.6 : Documentation (5 jours)

```
SPRINT 1.6 - DOCUMENTATION

OBJECTIF : Documentation complète API + projet + utilisateur.

TÂCHES :
1. Swagger/OpenAPI
   - Installer swagger-ui-express, swagger-jsdoc
   - Documenter TOUS les endpoints avec exemples
   - Endpoint /api-docs accessible

2. README.md
   - Description, prérequis, installation, configuration, lancement, tests, déploiement

3. ARCHITECTURE.md
   - Diagramme composants (Mermaid)
   - Diagramme séquence (auth, commande)
   - ERD base de données

4. CONTRIBUTING.md
   - Workflow Git, standards code, process review

5. Postman Collection
   - docs/postman/AWID.postman_collection.json
   - Toutes routes + variables + tests

6. CHANGELOG.md
   - Format Keep a Changelog

7. Guide Utilisateur
   - docs/USER_GUIDE.pdf

LIVRABLES :
- /api-docs fonctionnel
- README.md complet
- docs/ARCHITECTURE.md
- CONTRIBUTING.md
- CHANGELOG.md
- Collection Postman
- Guide PDF

VALIDATION :
□ /api-docs complet et navigable
□ README permet install from scratch
□ Postman collection importable et fonctionnelle
```

---

# ⚡ PHASE 2 : PERFORMANCE

---

## Sprint 2.1 : Redis Cache (10 jours)

```
SPRINT 2.1 - REDIS CACHE

OBJECTIF : Implémenter cache Redis, réduire latence de 40%.

TÂCHES :
1. Setup Redis (api-v2/config/redis.js)
   - Utiliser ioredis
   - Connexion Upstash ou Redis Cloud
   - Gestion erreurs + reconnexion

2. Cache Service (api-v2/services/cache.service.js)
   - Méthodes : get, set, invalidate
   - TTL par défaut 5 min
   - Fallback si Redis down (pas d'erreur, juste skip cache)

3. Cache Middleware (api-v2/middleware/cache.middleware.js)
   - Clé : cache:{url}:{organization_id}
   - Intercepter res.json pour cacher réponses 200

4. Endpoints à cacher
   - GET /api/products (TTL 5min)
   - GET /api/users (TTL 5min)
   - GET /api/organizations/:id/settings (TTL 10min)
   - GET /api/categories (TTL 30min)

5. Invalidation automatique
   - POST/PUT/DELETE → invalider cache correspondant

6. Métriques
   - cache_hits_total, cache_misses_total
   - Ajouter au dashboard Grafana

LIVRABLES :
- api-v2/config/redis.js
- api-v2/services/cache.service.js
- api-v2/middleware/cache.middleware.js
- Cache sur 10+ endpoints

VALIDATION :
□ Redis connecté (logs)
□ Cache hit visible dans métriques
□ Invalidation fonctionne après CRUD
□ Latence réduite ~40%
```

---

## Sprint 2.2 : Optimisations SQL (5 jours)

```
SPRINT 2.2 - OPTIMISATIONS SQL

OBJECTIF : Éliminer N+1, ajouter index, optimiser requêtes.

TÂCHES :
1. Éliminer N+1
   - getOrdersWithItems → JOIN + json_agg
   - getDeliveriesWithOrders → JOIN
   - getUsersWithRoles → JOIN
   Transformer les boucles de requêtes en JOINs.

2. Ajouter Index (migrations/003_add_indexes.sql)
   - orders(organization_id, created_at DESC)
   - orders(status) WHERE status IN ('pending', 'processing')
   - deliveries(deliverer_id, status)
   - deliveries(organization_id, created_at DESC)
   - audit_logs(organization_id, created_at DESC)
   - location_history(user_id, created_at DESC)
   Utiliser CREATE INDEX CONCURRENTLY.

3. Prepared Statements
   - Créer queries/prepared-statements.js
   - Requêtes fréquentes pré-compilées

4. Connection Pooling
   - Optimiser pg-pool : max 20, timeouts appropriés

5. Documentation
   - docs/SQL_OPTIMIZATIONS.md avec EXPLAIN ANALYZE avant/après

LIVRABLES :
- migrations/003_add_indexes.sql
- queries/prepared-statements.js
- docs/SQL_OPTIMIZATIONS.md

VALIDATION :
□ Aucun N+1 dans le code
□ Index créés (vérifier pg_indexes)
□ Requêtes 60% plus rapides
```

---

## Sprint 2.3 : Pagination & Lazy Loading (10 jours)

```
SPRINT 2.3 - PAGINATION

OBJECTIF : Pagination backend + infinite scroll mobile.

TÂCHES :
1. Pagination Backend
   - Créer api-v2/utils/pagination.helper.js
   - Format réponse : { data, pagination: { page, limit, total, totalPages, hasNext, hasPrev } }
   - Endpoints : /api/orders, /api/deliveries, /api/products, /api/audit-logs, /api/users
   - Params : ?page=1&limit=20

2. Infinite Scroll Flutter
   - Créer mobile/lib/core/widgets/infinite_scroll_list.dart
   - Widget générique réutilisable
   - Implémenter sur : OrdersListPage, DeliveriesListPage, ProductsListPage

3. Pull-to-Refresh
   - RefreshIndicator sur toutes les listes

4. Skeleton Loaders
   - Créer mobile/lib/core/widgets/skeleton_loader.dart
   - Shimmer effect pendant chargement

LIVRABLES :
- api-v2/utils/pagination.helper.js
- mobile/lib/core/widgets/infinite_scroll_list.dart
- mobile/lib/core/widgets/skeleton_loader.dart
- Pagination sur 10+ endpoints
- Infinite scroll sur 5+ écrans

VALIDATION :
□ API retourne format paginé standard
□ Infinite scroll fluide
□ Pull-to-refresh fonctionne
□ Skeleton visible pendant chargement
```

---

## Sprint 2.4 : Compression & CDN (5 jours)

```
SPRINT 2.4 - COMPRESSION & CDN

OBJECTIF : Optimiser assets, configurer CDN.

TÂCHES :
1. Compression Images (api-v2/services/image.service.js)
   - Installer sharp
   - Générer variants : original, large (800px), medium (400px), thumbnail (150px)
   - Format WebP

2. CDN
   - Configurer Cloudflare ou Vercel Edge
   - Cache images produits et avatars

3. Compression API
   - Middleware compression (gzip/brotli)
   - Threshold 1024 bytes

LIVRABLES :
- api-v2/services/image.service.js
- CDN configuré
- Compression activée

VALIDATION :
□ Images 80% plus légères
□ CDN sert les assets
□ Headers gzip/brotli présents
```

---

## Sprint 2.5 : Queue System (10 jours)

```
SPRINT 2.5 - QUEUE SYSTEM

OBJECTIF : Implémenter BullMQ pour tâches asynchrones.

TÂCHES :
1. Setup BullMQ (api-v2/config/queue.js)
   - Queues : email, report, cleanup
   - Connexion Redis

2. Jobs
   - email.queue.js : notifications, alertes
   - report.queue.js : génération PDF, export CSV
   - cleanup.queue.js : purge logs, fichiers temp

3. Workers
   - email.worker.js
   - report.worker.js

4. Bull Board
   - Dashboard /admin/queues
   - Visualisation jobs en cours/échoués

5. Retry Logic
   - 3 tentatives avec backoff exponentiel
   - Dead letter queue pour échecs définitifs

LIVRABLES :
- api-v2/queues/*.queue.js
- api-v2/workers/*.worker.js
- Dashboard Bull Board

VALIDATION :
□ Jobs exécutés correctement
□ Dashboard accessible
□ Retry fonctionne
□ Dead letter queue capture les échecs
```

---

# 🎨 PHASE 3 : FEATURES

---

## Sprint 3.1 : Mode Offline (10 jours)

```
SPRINT 3.1 - MODE OFFLINE

OBJECTIF : App fonctionnelle sans connexion + sync automatique.

TÂCHES :
1. Setup Hive (mobile/lib/core/database/hive_service.dart)
   - Boxes : orders, products, syncQueue
   - Adapters pour chaque model

2. Sync Service (mobile/lib/core/database/sync_service.dart)
   - downloadData() : récupérer products, users, orders
   - uploadPendingActions() : envoyer actions créées offline
   - resolveConflict() : stratégie server-wins

3. Queue Actions Offline
   - Stocker actions dans syncQueue
   - Sync au retour connexion

4. UI Offline
   - OfflineIndicator widget (bandeau orange)
   - Icônes indiquant données non synchronisées

5. Background Sync
   - WorkManager tâche périodique (15 min)
   - Sync quand connexion disponible

FONCTIONNALITÉS OFFLINE :
- Consulter produits
- Créer commandes
- Voir historique

LIVRABLES :
- mobile/lib/core/database/hive_service.dart
- mobile/lib/core/database/sync_service.dart
- mobile/lib/core/widgets/offline_indicator.dart

VALIDATION :
□ App fonctionne sans connexion
□ Commandes créées offline
□ Sync auto au retour online
□ Indicateur offline visible
```

---

## Sprint 3.2 : Notifications Push (10 jours)

```
SPRINT 3.2 - NOTIFICATIONS PUSH (OneSignal)

OBJECTIF : Notifications push Android via OneSignal (pas de carte bancaire requise).

PRÉREQUIS :
- Créer compte sur onesignal.com (gratuit, email suffit)
- Créer une app → récupérer APP_ID et REST_API_KEY
- Free tier = 10 000 utilisateurs (largement suffisant)

TÂCHES :
1. Setup OneSignal Mobile (Flutter)
   - Ajouter onesignal_flutter dans pubspec.yaml
   - Initialiser dans main.dart avec APP_ID
   - Demander permission notifications au premier lancement

2. Lier User à OneSignal
   - À chaque login : OneSignal.login(userId)
   - À chaque logout : OneSignal.logout()
   - OneSignal gère les tokens automatiquement

3. Backend Service (api-v2/services/notification.service.js)
   - Utiliser REST API OneSignal (pas de SDK nécessaire)
   - POST https://onesignal.com/api/v1/notifications
   - Headers : Authorization: Basic REST_API_KEY
   - Cibler par external_user_id (ton user_id)

4. Types Notifications
   - Nouvelle commande → admin + cafétéria
   - Livraison assignée → livreur
   - Commande prête à récupérer → livreur
   - Livraison complétée → admin
   - Paiement/dette récupéré → admin

5. Mobile Handlers
   - Foreground : afficher in-app notification
   - Background : notification système
   - Tap : deep link via additionalData

6. Deep Links
   - { type: "new_order", id: "xxx" } → OrderDetailPage
   - { type: "delivery_assigned", id: "xxx" } → DeliveryDetailPage
   - { type: "payment_received", id: "xxx" } → PaymentDetailPage

EXEMPLE BACKEND :
```javascript
// api-v2/services/notification.service.js
const axios = require('axios');

class NotificationService {
  constructor() {
    this.apiUrl = 'https://onesignal.com/api/v1/notifications';
    this.appId = process.env.ONESIGNAL_APP_ID;
    this.apiKey = process.env.ONESIGNAL_REST_API_KEY;
  }

  async sendToUser(userId, title, message, data = {}) {
    return axios.post(this.apiUrl, {
      app_id: this.appId,
      include_external_user_ids: [userId],
      headings: { fr: title },
      contents: { fr: message },
      data: data
    }, {
      headers: { 'Authorization': `Basic ${this.apiKey}` }
    });
  }

  async sendToUsers(userIds, title, message, data = {}) {
    return axios.post(this.apiUrl, {
      app_id: this.appId,
      include_external_user_ids: userIds,
      headings: { fr: title },
      contents: { fr: message },
      data: data
    }, {
      headers: { 'Authorization': `Basic ${this.apiKey}` }
    });
  }
}
```

EXEMPLE FLUTTER :
```dart
// mobile/lib/core/services/notification_service.dart
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationService {
  static Future<void> init() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("TON_APP_ID");
    OneSignal.Notifications.requestPermission(true);
  }

  static Future<void> login(String userId) async {
    await OneSignal.login(userId);
  }

  static Future<void> logout() async {
    await OneSignal.logout();
  }

  static void setNotificationHandler(Function(OSNotificationClickEvent) handler) {
    OneSignal.Notifications.addClickListener(handler);
  }
}
```

LIVRABLES :
- api-v2/services/notification.service.js
- api-v2/routes/notifications.routes.js (optionnel, pour tests)
- mobile/lib/core/services/notification_service.dart
- .env mis à jour avec ONESIGNAL_APP_ID et ONESIGNAL_REST_API_KEY

VALIDATION :
□ Compte OneSignal créé + app configurée
□ Notifications reçues foreground
□ Notifications reçues background (app fermée)
□ Deep links ouvrent la bonne page
□ Login/logout met à jour le user dans OneSignal
□ Envoi depuis backend fonctionne
```

---

## Sprint 3.3 : Analytics Dashboard (10 jours)

```
SPRINT 3.3 - ANALYTICS

OBJECTIF : Dashboard analytics + rapports + exports.

TÂCHES :
1. Endpoint Analytics (GET /api/analytics/dashboard)
   - Revenue : today, week, month, trend
   - Orders : today, week, pending
   - Top products, top customers
   - Delivery performance : avgTime, onTime %

2. Rapports PDF (api-v2/services/report.service.js)
   - Rapport journalier
   - Rapport mensuel
   - Factures
   - Utiliser PDFKit ou Puppeteer

3. Export CSV
   - GET /api/export/orders?format=csv&from=X&to=Y
   - GET /api/export/deliveries?format=csv

4. Graphiques Mobile
   - Utiliser fl_chart
   - Revenue chart (line)
   - Orders chart (bar)
   - Performance chart (pie)

LIVRABLES :
- api-v2/routes/analytics.routes.js
- api-v2/services/report.service.js
- api-v2/routes/export.routes.js
- mobile/lib/features/analytics/

VALIDATION :
□ Données analytics correctes
□ PDF généré lisible
□ CSV importable dans Excel
□ Graphiques interactifs
```

---

# 🌍 PHASE 4 : POLISH

---

## Sprint 4.1 : iOS Build (10 jours)

```
SPRINT 4.1 - iOS

OBJECTIF : Publier sur App Store.

TÂCHES :
1. Configuration Xcode
   - Bundle Identifier
   - Signing & Capabilities
   - App Groups si nécessaire

2. Permissions (Info.plist)
   - NSLocationWhenInUseUsageDescription
   - NSLocationAlwaysUsageDescription
   - NSCameraUsageDescription
   - NSPhotoLibraryUsageDescription

3. Tests
   - Simulateur : iPhone 14 Pro, iPhone SE, iPad
   - Device physique via TestFlight

4. App Store Connect
   - Créer app
   - Screenshots 6.5" et 5.5"
   - Description FR + EN
   - Privacy policy URL

5. Soumission
   - Archive + Upload
   - Passer review

LIVRABLES :
- App iOS fonctionnelle
- Publiée sur App Store

VALIDATION :
□ Fonctionne sur simulateur
□ Fonctionne sur device physique
□ TestFlight OK
□ App Store acceptée
```

---

## Sprint 4.2 : Internationalisation (10 jours)

```
SPRINT 4.2 - i18n (4 LANGUES)

OBJECTIF : Supporter Français, Kabyle, Arabe, Anglais.

TÂCHES :
1. Setup flutter_localizations
   - Ajouter dans pubspec.yaml
   - Configurer supportedLocales dans main.dart

2. Fichiers ARB (mobile/lib/l10n/)
   - app_fr.arb (existant à compléter)
   - app_kab.arb (Kabyle)
   - app_ar.arb (Arabe)
   - app_en.arb (Anglais)

3. Support RTL (Arabe)
   - Directionality widget
   - Tester tous les écrans en RTL

4. Format localisé
   - Dates : DateFormat.yMMMMd(locale)
   - Nombres : NumberFormat.currency(locale)

5. Sélecteur Langue
   - Dans Settings
   - Persistance du choix

LIVRABLES :
- mobile/lib/l10n/app_*.arb (4 fichiers)
- RTL fonctionnel
- Sélecteur langue

VALIDATION :
□ Français complet
□ Kabyle complet
□ Arabe complet + RTL correct
□ Anglais complet
□ Changement sans redémarrage
```

---

## Sprint 4.3 : Améliorations UX (10 jours)

```
SPRINT 4.3 - UX POLISH

OBJECTIF : Animations, accessibilité, dark mode, onboarding.

TÂCHES :
1. Animations
   - Hero animations (liste → détail)
   - Page transitions fluides
   - Loading states animés

2. Accessibilité
   - Semantics widgets partout
   - Screen reader support (TalkBack/VoiceOver)
   - Contraste WCAG AA
   - Touch targets >= 48px

3. Dark Mode
   - ThemeData.dark() personnalisé
   - Toggle dans Settings
   - Persistance du choix

4. Onboarding
   - 3-4 écrans introduction
   - Skip possible
   - Afficher une seule fois

5. Empty States
   - Illustrations listes vides
   - Call-to-action clair

6. Haptic Feedback
   - HapticFeedback sur actions importantes

LIVRABLES :
- Animations fluides
- Accessibility score > 90%
- Dark mode complet
- Onboarding

VALIDATION :
□ Animations sans jank
□ TalkBack/VoiceOver fonctionne
□ Dark mode sur tous les écrans
□ Onboarding affiché 1 fois
```

---

## Sprint 4.4 : CI/CD (5 jours)

```
SPRINT 4.4 - CI/CD COMPLET

OBJECTIF : Automatiser tests et déploiements.

TÂCHES :
1. GitHub Actions (.github/workflows/main.yml)
   - Job test-backend : npm test
   - Job test-mobile : flutter test
   - Job deploy-staging : si push develop
   - Job deploy-production : si push main

2. Environments
   - Development (local)
   - Staging (pre-prod)
   - Production

3. Health Check Post-Deploy
   - Vérifier /health après deploy
   - Rollback auto si échec

4. Notifications
   - Slack sur deploy réussi/échoué

LIVRABLES :
- .github/workflows/main.yml
- 3 environments configurés
- Rollback automatique
- Notifications Slack

VALIDATION :
□ PR déclenche tests
□ Merge develop → staging
□ Merge main → production
□ Rollback fonctionne
□ Notifications reçues
```

---

# 📋 CHECKLIST DE TRANSITION

Après chaque sprint, dire à l'agent :

```
Sprint X.X terminé et validé. Résumé des changements :
- [lister les fichiers créés/modifiés]
- [lister les fonctionnalités ajoutées]

On passe au Sprint X.Y.
[coller le prompt du sprint suivant]
```

---

# 🔗 ORDRE D'EXÉCUTION

```
PHASE 1 (8 sem) : 1.1 → 1.2 → 1.3 → 1.4 → 1.5 → 1.6
PHASE 2 (6 sem) : 2.1 → 2.2 → 2.3 → 2.4 → 2.5
PHASE 3 (6 sem) : 3.1 → 3.2 → 3.3
PHASE 4 (6 sem) : 4.1 → 4.2 → 4.3 → 4.4
```

Ne jamais sauter un sprint. Chaque sprint dépend du précédent.
