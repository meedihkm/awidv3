/**
 * Rate Limiting Middleware
 * Middleware de limitation du taux de requêtes
 */
import { config } from '@/config/env.validation';
import rateLimit from 'express-rate-limit';

/**
 * Rate limiter général
 */
export const generalRateLimiter = rateLimit({
  windowMs: config.RATE_LIMIT_WINDOW_MS,
  max: config.RATE_LIMIT_MAX_REQUESTS,
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
