# RAPPORT D'AUDIT TECHNIQUE
## Application AWID - Gestion de Commandes et Livraisons B2B

**Date:** 11 janvier 2025

---

## 1. Résumé Exécutif

AWID est une application Flutter multi-rôles (Admin, Cafétéria, Livreur, Cuisine) avec un backend Node.js/Express et une base de données PostgreSQL. L'application cible les grossistes et distributeurs de la région de Kabylie pour gérer leurs commandes et livraisons B2B.

L'audit révèle une architecture globalement solide avec de bonnes pratiques de sécurité, mais identifie plusieurs points d'amélioration pour renforcer la robustesse de l'application en production.

### Scores Globaux

| Critère | Score | Appréciation |
|---------|-------|--------------|
| **Sécurité** | 7.5/10 | Bon |
| **Qualité du Code** | 8/10 | Très bon |
| **Architecture** | 8/10 | Très bon |
| **Maintenabilité** | 6/10 | Moyen |
| **Performance** | 7/10 | Bon |

---

## 2. Architecture Technique

### 2.1 Stack Technologique

| Composant | Technologie |
|-----------|-------------|
| Backend | Node.js + Express.js (API REST) |
| Base de données | PostgreSQL (Supabase) |
| Frontend Mobile | Flutter 3.1+ avec Provider |
| Déploiement API | Vercel |
| Sécurité | JWT, bcryptjs, Helmet, Zod |
| Stockage mobile | flutter_secure_storage |

### 2.2 Structure Multi-tenant

L'application implémente une architecture multi-tenant où chaque organisation a ses propres données isolées. Le filtrage par `organization_id` est appliqué sur toutes les requêtes, ce qui est une bonne pratique.

```
organizations
    └── users (admin, cafeteria, deliverer, kitchen)
    └── products
    └── orders → order_items
    └── deliveries
    └── audit_logs
```

### 2.3 Rôles Utilisateurs

| Rôle | Permissions |
|------|-------------|
| **Admin** | Gestion complète (produits, utilisateurs, commandes, finances) |
| **Cafeteria** | Passer des commandes, voir l'historique |
| **Deliverer** | Voir les livraisons assignées, mettre à jour le statut, GPS |
| **Kitchen** | Voir les commandes à préparer, changer le statut |
| **Super-Admin** | Gestion globale des organisations (via clé API) |

---

## 3. Analyse de Sécurité

### 3.1 Points Forts ✅

- **Authentification JWT robuste**
  - Access tokens courte durée (15 minutes)
  - Refresh tokens longue durée (30 jours)
  - Rotation automatique des refresh tokens
  
- **Stockage sécurisé mobile**
  - Utilisation de `flutter_secure_storage`
  - `encryptedSharedPreferences` activé sur Android

- **Protection contre les attaques**
  - Rate limiting sur endpoints sensibles (login: 10 req/5min, global: 100 req/15min)
  - Helmet.js pour les headers de sécurité
  - Comparaison timing-safe pour la clé super-admin

- **Validation des entrées**
  - Schémas Zod stricts côté serveur
  - Validation UUID sur les IDs critiques

- **Hachage des mots de passe**
  - bcrypt avec facteur de coût 12

- **Audit et traçabilité**
  - Logs complets avec IP et user-agent
  - Traçabilité des actions sensibles

- **Vérifications en production**
  - Longueur minimale des secrets (32 caractères)
  - Crash immédiat si secrets invalides

### 3.2 Vulnérabilités Identifiées

| Sévérité | Constat | Recommandation |
|----------|---------|----------------|
| 🔴 **ÉLEVÉ** | URL API hardcodée dans `api_constants.dart` | Utiliser des variables d'environnement ou config par flavors |
| 🔴 **ÉLEVÉ** | `android:usesCleartextTraffic="true"` dans AndroidManifest | Désactiver en production pour forcer HTTPS |
| 🟠 **MOYEN** | Secret JWT de fallback en développement | Ne jamais avoir de fallback, exiger les variables d'env |
| 🟠 **MOYEN** | `rejectUnauthorized: false` pour SSL PostgreSQL | Configurer correctement les certificats SSL |
| 🟠 **MOYEN** | Pas de validation UUID sur certains paramètres de route | Ajouter middleware de validation UUID |
| 🟡 **FAIBLE** | Refresh tokens non nettoyés automatiquement | Ajouter un job CRON de purge |
| 🟡 **FAIBLE** | Pas de limite sur la taille des audit logs | Implémenter rotation/archivage automatique |

### 3.3 Code Critique à Corriger

#### AndroidManifest.xml (ligne 13)
```xml
<!-- ❌ AVANT (vulnérable) -->
android:usesCleartextTraffic="true"

<!-- ✅ APRÈS (sécurisé) -->
android:usesCleartextTraffic="false"
```

#### api_constants.dart
```dart
// ❌ AVANT (hardcodé)
static const String baseUrl = 'https://app-livraison-one.vercel.app/api';

// ✅ APRÈS (configurable)
static String get baseUrl => const String.fromEnvironment(
  'API_URL', 
  defaultValue: 'https://app-livraison-one.vercel.app/api'
);
```

#### index.js (ligne 38)
```javascript
// ❌ AVANT (SSL non vérifié)
ssl: process.env.NODE_ENV === 'production' ? { rejectUnauthorized: false } : false

// ✅ APRÈS (SSL vérifié avec CA)
ssl: process.env.NODE_ENV === 'production' ? { 
  rejectUnauthorized: true,
  ca: process.env.DATABASE_CA_CERT 
} : false
```

---

## 4. Qualité du Code

### 4.1 Points Positifs ✅

- **Structure Flutter exemplaire**
  - Architecture features-based claire
  - Séparation: `core/`, `features/`, `presentation/`, `providers/`
  
- **Patterns bien appliqués**
  - Singleton pour `ApiService` et `SecureStorage`
  - Provider pour le state management
  - Auto-refresh transparent des tokens

- **Gestion des erreurs**
  - Try/catch systématique
  - Messages d'erreur localisés en français

- **Code lisible**
  - Commentaires pertinents
  - Nommage cohérent

### 4.2 Points d'Amélioration

| Priorité | Constat | Recommandation |
|----------|---------|----------------|
| 🔴 **ÉLEVÉ** | API backend en fichier unique (1900+ lignes) | Découper en modules: `routes/`, `controllers/`, `middleware/` |
| 🔴 **ÉLEVÉ** | HTML super-admin embarqué dans index.js | Extraire dans fichier séparé ou SPA dédiée |
| 🟠 **MOYEN** | Absence de tests unitaires | Ajouter Jest (backend) et flutter_test (mobile) |
| 🟠 **MOYEN** | Pas de typage TypeScript côté backend | Migrer vers TypeScript |
| 🟠 **MOYEN** | Répétition de code dans les routes API | Créer des helpers réutilisables |
| 🟡 **FAIBLE** | Widgets Flutter deprecated | Migrer vers Material 3 |
| 🔵 **INFO** | Pas de CI/CD configuré | Ajouter GitHub Actions |

### 4.3 Proposition de Refactoring Backend

```
api/
├── index.js              # Point d'entrée (50 lignes max)
├── config/
│   ├── database.js
│   ├── jwt.js
│   └── cors.js
├── middleware/
│   ├── auth.js
│   ├── validate.js
│   └── rateLimit.js
├── routes/
│   ├── auth.routes.js
│   ├── products.routes.js
│   ├── orders.routes.js
│   ├── deliveries.routes.js
│   └── superAdmin.routes.js
├── controllers/
│   └── [...]
├── services/
│   ├── audit.service.js
│   └── token.service.js
└── schemas/
    └── validation.js
```

---

## 5. Base de Données

### 5.1 Schéma Actuel

```sql
organizations (id, name, type, active, settings, created_at)
    │
    ├── users (id, organization_id, email, password, name, phone, role, active)
    │       │
    │       └── refresh_tokens (id, user_id, token, expires_at, revoked)
    │
    ├── products (id, organization_id, name, price, image_url, category, sort_order, active)
    │
    ├── orders (id, organization_id, cafeteria_id, date, total, status, payment_status, amount_paid)
    │       │
    │       └── order_items (id, order_id, product_id, quantity, price)
    │
    ├── deliveries (id, organization_id, order_id, deliverer_id, status, payment_status, amount_collected)
    │
    └── audit_logs (id, organization_id, user_id, action, details, ip_address, user_agent)
```

### 5.2 Recommandations

| Action | Description |
|--------|-------------|
| **Index manquants** | Ajouter sur `orders.date`, `orders.status`, `deliveries.status` |
| **Contraintes CHECK** | Valider les valeurs de `status` et `payment_status` |
| **Triggers** | Auto-update de `updated_at` |
| **Partitioning** | Considérer pour `orders` et `audit_logs` si volume important |
| **Nettoyage** | Job CRON pour purger `refresh_tokens` et archiver `audit_logs` |

```sql
-- Exemple d'index recommandés
CREATE INDEX idx_orders_org_date ON orders(organization_id, date DESC);
CREATE INDEX idx_orders_status ON orders(status) WHERE status IN ('pending', 'validated');
CREATE INDEX idx_deliveries_deliverer_status ON deliveries(deliverer_id, status);
```

---

## 6. Performances

### 6.1 État Actuel

| Aspect | État | Note |
|--------|------|------|
| Rate limiting | ✅ En place | 100 req/15min global |
| Cache serveur | ❌ Absent | Redis recommandé |
| Cache mobile | ❌ Limité | Pas de mode offline |
| Requêtes SQL | ⚠️ N+1 potentiels | `getOrderWithItems` |
| Pagination | ✅ Partielle | Présente sur audit logs |

### 6.2 Optimisations Recommandées

#### Backend
```javascript
// ❌ Requête N+1 actuelle
async function getOrdersWithItems(orgId) {
  const orders = await pool.query('SELECT * FROM orders WHERE organization_id = $1', [orgId]);
  for (const order of orders.rows) {
    order.items = await getOrderItems(order.id); // N requêtes supplémentaires!
  }
}

// ✅ Requête optimisée avec JOIN
async function getOrdersWithItems(orgId) {
  const result = await pool.query(`
    SELECT o.*, 
           json_agg(json_build_object(
             'id', oi.id,
             'productId', oi.product_id,
             'quantity', oi.quantity,
             'price', oi.price,
             'productName', p.name
           )) as items
    FROM orders o
    LEFT JOIN order_items oi ON o.id = oi.order_id
    LEFT JOIN products p ON oi.product_id = p.id
    WHERE o.organization_id = $1
    GROUP BY o.id
  `, [orgId]);
  return result.rows;
}
```

#### Mobile (Cache local)
```dart
// Recommandation: Ajouter Hive pour le cache local
dependencies:
  hive: ^2.2.3
  hive_flutter: ^1.1.0

// Permettrait le mode offline et réduirait les appels API
```

---

## 7. Plan d'Action Prioritaire

### 🔴 Court terme (1-2 semaines)

- [ ] Corriger `android:usesCleartextTraffic="false"`
- [ ] Externaliser l'URL API vers configuration d'environnement
- [ ] Corriger la configuration SSL PostgreSQL
- [ ] Ajouter validation UUID sur tous les paramètres `:id`
- [ ] Ajouter les index SQL manquants

### 🟠 Moyen terme (1-2 mois)

- [ ] Refactoriser le backend en modules séparés
- [ ] Migrer vers TypeScript
- [ ] Ajouter tests unitaires (couverture 60%+)
- [ ] Implémenter cache Redis pour produits/config
- [ ] Ajouter job CRON de nettoyage tokens/logs

### 🟡 Long terme (3-6 mois)

- [ ] Mettre en place CI/CD (GitHub Actions)
- [ ] Développer le mode offline complet (Hive)
- [ ] Ajouter notifications push (Firebase)
- [ ] Internationalisation (kabyle, arabe)
- [ ] Dashboard analytics avancé

---

## 8. Conclusion

### Verdict Final

| Critère | Évaluation |
|---------|------------|
| **Prêt pour production limitée** | ✅ Oui |
| **Prêt pour scaling** | ⚠️ Après corrections |
| **Sécurité critique** | 2 points à corriger |
| **Effort de correction** | ~2-3 jours de travail |

L'application AWID présente une **base technique solide** avec de bonnes pratiques de sécurité en place. Les principales faiblesses concernent:

1. La maintenabilité du code backend (fichier monolithique)
2. Quelques configurations de sécurité à corriger pour la production
3. L'absence de tests automatisés

Les corrections critiques sont relativement simples à implémenter et devraient être **prioritaires avant tout déploiement en production** à plus grande échelle.

---

### Annexe: Fichiers Analysés

```
awid-app/
├── api/
│   └── index.js                    # Backend API (1901 lignes) ⚠️
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── constants/api_constants.dart
│   │   ├── models/
│   │   ├── services/
│   │   │   ├── api_service.dart    # Client HTTP avec auto-refresh ✅
│   │   │   └── [autres services]
│   │   └── storage/secure_storage.dart  # Stockage sécurisé ✅
│   └── features/
│       ├── admin/
│       ├── auth/
│       ├── cafeteria/
│       ├── deliverer/
│       └── kitchen/
├── app/src/main/AndroidManifest.xml  # Permissions Android ⚠️
├── pubspec.yaml
└── sql_migrations.sql
```

---

*Rapport généré le 11 janvier 2025*
