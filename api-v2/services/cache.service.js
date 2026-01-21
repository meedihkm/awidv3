const redis = require('../config/redis');

/**
 * Service de Cache Wrapper
 * Gère les interactions avec Redis de manière résiliente.
 * Si Redis est down, les méthodes retournent null ou ignorent l'opération sans crasher l'app.
 */
class CacheService {
    constructor() {
        this.isConnected = false;

        // Suivre l'état de la connexion pour optimiser les appels
        redis.on('ready', () => { this.isConnected = true; });
        redis.on('end', () => { this.isConnected = false; });
        redis.on('error', () => { this.isConnected = false; });

        // Tenter une connexion initiale (sans bloquer)
        redis.connect().catch(() => { });
    }

    /**
     * Récupère une valeur du cache
     * @param {string} key 
     * @returns {Promise<any|null>} Donnée parsée ou null
     */
    async get(key) {
        if (!this.isConnected) return null;
        try {
            const data = await redis.get(key);
            return data ? JSON.parse(data) : null;
        } catch (error) {
            return null;
        }
    }

    /**
     * Stocke une valeur dans le cache
     * @param {string} key 
     * @param {any} value 
     * @param {number} ttlSeconds Durée de vie en secondes (défaut 300s = 5min)
     */
    async set(key, value, ttlSeconds = 300) {
        if (!this.isConnected) return;
        try {
            const stringValue = JSON.stringify(value);
            await redis.setex(key, ttlSeconds, stringValue);
        } catch (error) {
            // Ignorer erreur d'écriture
        }
    }

    /**
     * Supprime une clé ou un pattern
     * @param {string} pattern Clé exacte ou pattern (ex: "products:*")
     */
    async invalidate(pattern) {
        if (!this.isConnected) return;
        try {
            if (pattern.includes('*')) {
                // Suppression par pattern (Scan)
                const stream = redis.scanStream({ match: pattern });
                stream.on('data', (keys) => {
                    if (keys.length) {
                        const pipeline = redis.pipeline();
                        keys.forEach(key => pipeline.del(key));
                        pipeline.exec();
                    }
                });
            } else {
                // Suppression simple
                await redis.del(pattern);
            }
        } catch (error) {
            console.error('Cache invalidation error:', error.message);
        }
    }

    /**
     * Génère une clé de cache standardisée
     * @param {string} prefix (ex: 'products')
     * @param {string} orgId 
     * @param {object} params (query params ou autres identifiants)
     */
    generateKey(prefix, orgId, params = {}) {
        const sortedParams = Object.keys(params).sort().map(k => `${k}:${params[k]}`).join(':');
        return `cache:${prefix}:${orgId}${sortedParams ? ':' + sortedParams : ''}`;
    }
}

module.exports = new CacheService();
