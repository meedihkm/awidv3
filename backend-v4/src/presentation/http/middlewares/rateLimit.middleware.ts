/**
 * Rate Limiting Middleware
 * Middleware de limitation du taux de requêtes
 */
import { envConfig } from '@/config/env.validation';
import rateLimit from 'express-rate-limit';

/**
 * Rate limiter général
 */
export const generalRateLimiter = rateLimit({
  windowMs: envConfig.RATE_LIMIT_WINDOW * 60 * 1000, // Convert minutes to ms
  max: envConfig.RATE_LIMIT_MAX,
  message: {
    success: false,
    error: 'Trop de requêtes, veuillez réessayer plus tard',
    code: 'RATE_LIMIT_EXCEEDED',
  },
  standardHeaders: true,
  legacyHeaders: false,
});

/**
 * Rate limiter strict pour l'authentification
 */
export const authRateLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 5, // 5 tentatives
  skipSuccessfulRequests: true,
  message: {
    success: false,
    error: 'Trop de tentatives de connexion, veuillez réessayer dans 15 minutes',
    code: 'AUTH_RATE_LIMIT_EXCEEDED',
  },
});

/**
 * Rate limiter pour les endpoints sensibles
 */
export const strictRateLimiter = rateLimit({
  windowMs: 60 * 1000, // 1 minute
  max: 10,
  message: {
    success: false,
    error: 'Trop de requêtes, veuillez ralentir',
    code: 'RATE_LIMIT_EXCEEDED',
  },
});
