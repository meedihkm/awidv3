const rateLimit = require('express-rate-limit');

// Rate limiter global
const globalLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100,
  message: { error: 'Trop de requêtes, réessayez plus tard' },
  standardHeaders: true,
  legacyHeaders: false,
});

// Rate limiter strict pour login
const loginLimiter = rateLimit({
  windowMs: 5 * 60 * 1000, // 5 minutes
  max: 10,
  message: { error: 'Trop de tentatives de connexion, réessayez dans 5 minutes' },
  standardHeaders: true,
  legacyHeaders: false,
});

// Rate limiter pour super-admin
const superAdminLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 20,
  message: { error: 'Trop de requêtes super-admin, réessayez plus tard' },
  standardHeaders: true,
  legacyHeaders: false,
});

// Rate limiter pour création de ressources
const createLimiter = rateLimit({
  windowMs: 60 * 1000, // 1 minute
  max: 30,
  message: { error: 'Trop de créations, réessayez plus tard' },
  standardHeaders: true,
  legacyHeaders: false,
});

module.exports = {
  globalLimiter,
  loginLimiter,
  superAdminLimiter,
  createLimiter,
};
