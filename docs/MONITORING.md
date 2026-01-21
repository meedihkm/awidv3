# 📊 AWID Monitoring & Observabilité

**Version**: 1.0.0  
**Stack**: Sentry (Error/APM) + Prometheus (Metrics) + Winston (Logs)

---

## 1. Vue d'ensemble

Le système de monitoring d'AWID repose sur trois piliers :
1. **Gestion des Erreurs (Sentry)** : Capture des crashs, erreurs 500 et tracing distribué.
2. **Métriques (Prometheus)** : Suivi des performances, latences et saturation.
3. **Logs Structurés (Winston)** : Journaux au format JSON contextuels.

---

## 2. Configuration Sentry

### Backend (Node.js)
Sentry capture automatiquement :
- Les exceptions non capturées
- Les erreurs 500 via middleware Express
- Les transactions HTTP (Tracing)
- Le profiling CPU (Node.js)

**Configuration (.env)** :
```bash
SENTRY_DSN="https://xxxx@xxxx.ingest.sentry.io/xxxx"
```

**Filtrage PII** :
Les données sensibles sont masquées avant envoi:
- Headers: `Authorization`, `x-super-admin-key`
- Body: `password`, `token`, `creditCard`

### Mobile (Flutter)
`sentry_flutter` capture :
- Les crashs natifs (Android) et Dart
- Les erreurs de rendu UI
- Les transactions de navigation

**Utilisation** :
```dart
// Log manuel
await SentryService.captureException(e, stackTrace: stack);
await SentryService.captureMessage('Action utilisateur');
```

---

## 3. Métriques Prometheus

Le backend expose ses métriques sur `/metrics`.

**Métriques Clés** :

| Métrique | Type | Description |
|----------|------|-------------|
| `http_requests_total` | Counter | Nombre total de requêtes (labels: route, method, status) |
| `http_request_duration_seconds` | Histogram | Latence des requêtes (buckets: 0.1s à 10s) |
| `active_connections` | Gauge | Nombre de sockets ouverts simultanément |

**Alertes Recommandées (Prometheus/Grafana)** :
1. **Taux d'erreur élevé** : `rate(http_requests_total{status_code=~"5.."}[5m]) > 5`
2. **Latence élevée** : `histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m])) > 0.5` (P95 > 500ms)

---

## 4. Logs Structurés (Winston)

En production, tous les logs sont au format **JSON** pour faciliter l'ingestion par des outils comme Datadog, CloudWatch ou ELK.

**Exemple de log** :
```json
{
  "level": "http",
  "message": "GET /api/orders 200 45ms",
  "timestamp": "2026-01-20T20:30:00.000Z",
  "metadata": {
    "method": "GET",
    "url": "/api/orders",
    "status": 200,
    "duration": 45,
    "userId": "123e4567-e89b-..."
  }
}
```

**Utilisation dans le code** :
```javascript
const logger = require('./config/logger');

// Info
logger.info('Commande créée', { orderId: 123 });

// Erreur (avec stack trace auto)
logger.error('Échec paiement', error);
```

---

## 5. Health Checks

Endpoints standardisés pour Kubernetes / Load Balancers :

- **`/api/health`** (Liveness) : Retourne 200 OK si le serveur Node.js répond.
  - Usage: Redémarrer le conteneur si échec.

- **`/api/health/ready`** (Readiness) : Retourne 200 OK si DB et services critiques sont connectés.
  - Usage: Ne pas envoyer de trafic si échec.

---

## Checklist Déploiement

- [ ] Installer dépendances backend : `npm install`
- [ ] Installer dépendances mobile : `flutter pub get`
- [ ] Configurer `SENTRY_DSN` dans les variables d'environnement
- [ ] Configurer le scraper Prometheus sur l'endpoint `/metrics`
- [ ] Vérifier que les logs de production sont bien en JSON

---

*Document généré le 20 Janvier 2026 - AWID Sprint 1.2 Monitoring*
