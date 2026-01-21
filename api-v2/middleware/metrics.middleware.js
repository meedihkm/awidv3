/**
 * Middleware Prometheus pour AWID API v2
 * Collecte les métriques RED (Rate, Errors, Duration)
 */

const client = require('prom-client');
const responseTime = require('response-time');

// Initialisation du registre
const register = new client.Registry();

// Ajouter les métriques par défaut (CPU, Memory, etc.)
client.collectDefaultMetrics({
    register,
    labels: { app: 'awid-api-v2' }
});

// Métrique: Durée des requêtes HTTP
const httpRequestDurationMicroseconds = new client.Histogram({
    name: 'http_request_duration_seconds',
    help: 'Duration of HTTP requests in seconds',
    labelNames: ['method', 'route', 'status_code'],
    buckets: [0.1, 0.3, 0.5, 0.7, 1, 3, 5, 7, 10] // Buckets pertinents pour API
});

// Métrique: Compteur total de requêtes
const httpRequestsTotal = new client.Counter({
    name: 'http_requests_total',
    help: 'Total number of HTTP requests',
    labelNames: ['method', 'route', 'status_code']
});

// Métrique: Connexions actives
const activeConnections = new client.Gauge({
    name: 'active_connections',
    help: 'Number of active connections currently being handled',
});

// Métriques Cache
const cacheHitsTotal = new client.Counter({
    name: 'cache_hits_total',
    help: 'Total number of cache hits',
    labelNames: ['route']
});

const cacheMissesTotal = new client.Counter({
    name: 'cache_misses_total',
    help: 'Total number of cache misses',
    labelNames: ['route']
});

register.registerMetric(httpRequestDurationMicroseconds);
register.registerMetric(httpRequestsTotal);
register.registerMetric(activeConnections);
register.registerMetric(cacheHitsTotal);
register.registerMetric(cacheMissesTotal);

/**
 * Middleware pour collecter les métriques de chaque requête
 */
const metricsMiddleware = responseTime((req, res, time) => {
    // Ignorer les routes de metrics et healthcheck pour ne pas polluer
    if (req.path === '/metrics' || req.path.startsWith('/api/health')) {
        return;
    }

    // Normaliser la route (éviter explosion de cardinalité avec les IDs)
    // Ex: /api/orders/123 -> /api/orders/:id
    const route = req.route ? req.route.path : req.path;

    // Incrémenter total
    httpRequestsTotal.inc({
        method: req.method,
        route: route,
        status_code: res.statusCode
    });

    // Observer durée (convertir ms en secondes)
    httpRequestDurationMicroseconds.observe(
        {
            method: req.method,
            route: route,
            status_code: res.statusCode
        },
        time / 1000
    );
});

/**
 * Endpoint pour exposer les métriques à Prometheus
 */
const metricsEndpoint = async (req, res) => {
    // Protection basique: Vérifier token ou IP si nécessaire
    // Pour l'instant, protection via réseau interne (Vercel/Private)

    res.set('Content-Type', register.contentType);
    res.end(await register.metrics());
};

module.exports = {
    metricsMiddleware,
    metricsEndpoint,
    register,
    cacheHitsTotal,
    cacheMissesTotal
};
