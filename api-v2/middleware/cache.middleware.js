const cacheService = require('../services/cache.service');
const { cacheHitsTotal, cacheMissesTotal } = require('./metrics.middleware');

/**
 * Middleware de Cache
 * @param {number} ttlSeconds Durée de vie en secondes
 * @param {string} keyPrefix Préfixe pour la clé de cache (ex: 'users')
 */
const cacheMiddleware = (ttlSeconds = 300, keyPrefix = null) => {
    return async (req, res, next) => {
        // Ne cacher que les requêtes GET
        if (req.method !== 'GET') {
            return next();
        }

        try {
            // Déterminer le préfixe (soit passé explicitement, soit basé sur l'URL)
            const prefix = keyPrefix || req.baseUrl.split('/').pop() || 'global';
            const orgId = req.user ? req.user.organization_id : 'public';

            // Générer la clé unique (inclure path pour unicité)
            const cachedParams = { ...req.query, ...req.params };
            if (req.path && req.path !== '/') cachedParams._path = req.path;
            const key = cacheService.generateKey(prefix, orgId, cachedParams);

            // 1. Essayer de récupérer du cache
            const cachedData = await cacheService.get(key);

            if (cachedData) {
                // HIT: Retourner directement la donnée
                res.setHeader('X-Cache', 'HIT');
                cacheHitsTotal.inc({ route: req.baseUrl });
                return res.json(cachedData);
            }

            // MISS: Surcharger res.json pour capturer et cacher la réponse
            res.setHeader('X-Cache', 'MISS');
            cacheMissesTotal.inc({ route: req.baseUrl });
            const originalJson = res.json;

            res.json = function (body) {
                // Restaurer la fonction d'origine pour éviter boucle infinie si rappelée
                res.json = originalJson;

                // Ne cacher que les succès (200-299)
                if (res.statusCode >= 200 && res.statusCode < 300) {
                    // Stocker en arrière-plan (ne bloque pas la réponse)
                    cacheService.set(key, body, ttlSeconds).catch(() => { });
                }

                // Envoyer la réponse
                return originalJson.call(this, body);
            };

            next();
        } catch (error) {
            console.error('Cache middleware error:', error);
            next(); // Continuer sans cache en cas d'erreur
        }
    };
};

module.exports = cacheMiddleware;
