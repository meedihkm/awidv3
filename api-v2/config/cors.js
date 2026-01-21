/**
 * Configuration CORS sécurisée pour AWID API v2
 * Whitelist stricte des domaines autorisés
 */

// Domaines autorisés (production)
const getWhitelistedOrigins = () => {
  const envOrigins = process.env.ALLOWED_ORIGINS || process.env.CORS_ORIGINS;

  if (envOrigins) {
    return envOrigins.split(',').map(origin => origin.trim()).filter(Boolean);
  }

  // Défauts pour le développement uniquement
  if (process.env.NODE_ENV !== 'production') {
    return [
      'http://localhost:3000',
      'http://localhost:8080',
      'http://127.0.0.1:3000',
      'http://127.0.0.1:8080'
    ];
  }

  // En production sans ALLOWED_ORIGINS configuré, bloquer tout
  console.warn('[SECURITY] ALLOWED_ORIGINS non configuré en production - CORS restrictif activé');
  return [];
};

const allowedOrigins = getWhitelistedOrigins();

const corsOptions = {
  origin: (origin, callback) => {
    // Permettre les requêtes sans origin (apps mobiles natives, Postman en dev)
    if (!origin) {
      // En production, logger les requêtes sans origin pour monitoring
      if (process.env.NODE_ENV === 'production') {
        // Accepté pour les apps mobiles natives
      }
      return callback(null, true);
    }

    // Vérification stricte de la whitelist
    if (allowedOrigins.includes(origin)) {
      return callback(null, true);
    }

    // En développement, permettre localhost variants
    if (process.env.NODE_ENV !== 'production') {
      if (origin.includes('localhost') || origin.includes('127.0.0.1')) {
        return callback(null, true);
      }
    }

    // Rejet - logger en production
    if (process.env.NODE_ENV === 'production') {
      console.warn(`[CORS] Origine bloquée: ${origin}`);
    }

    // Retourner une erreur CORS avec code 403
    const error = new Error(`CORS: Origine '${origin}' non autorisée`);
    error.status = 403;
    return callback(error, false);
  },

  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
  allowedHeaders: [
    'Content-Type',
    'Authorization',
    'x-super-admin-key',
    'x-2fa-code'
  ],

  // Durée de cache pour preflight (1 heure)
  maxAge: 3600,

  // Exposer les headers personnalisés au client
  exposedHeaders: ['X-RateLimit-Remaining', 'X-RateLimit-Reset']
};

// Handler d'erreur CORS personnalisé
const corsErrorHandler = (err, req, res, next) => {
  if (err.message && err.message.startsWith('CORS:')) {
    return res.status(403).json({
      error: 'Accès non autorisé',
      message: 'Origine de la requête non autorisée par la politique CORS',
      code: 'CORS_BLOCKED'
    });
  }
  next(err);
};

module.exports = corsOptions;
module.exports.corsErrorHandler = corsErrorHandler;
module.exports.allowedOrigins = allowedOrigins;
