/**
 * Error Handler Middleware
 * Middleware de gestion centralisée des erreurs
 */
import { config } from '@/config/env.validation';
import { AppError } from '@/shared/errors/AppError';
import { NextFunction, Request, Response } from 'express';

/**
 * Middleware de gestion des erreurs
 * Doit être le dernier middleware de l'application
 */
export const errorHandler = (
  error: Error,
  req: Request,
  res: Response,
  next: NextFunction
): void => {
  // Si les headers sont déjà envoyés, déléguer à Express
  if (res.headersSent) {
    next(error);
    return;
  }

  // Erreur opérationnelle (AppError)
  if (error instanceof AppError) {
    res.status(error.statusCode).json(error.toJSON());
    return;
  }

  // Erreur non gérée
  console.error('Erreur non gérée:', error);

  // En production, ne pas exposer les détails de l'erreur
  const statusCode = 500;
  const message =
    config.NODE_ENV === 'production'
      ? 'Une erreur interne est survenue'
      : error.message;

  res.status(statusCode).json({
    success: false,
    error: message,
    code: 'INTERNAL_ERROR',
    ...(config.NODE_ENV === 'development' && { stack: error.stack }),
  });
};

/**
 * Middleware pour les routes non trouvées (404)
 */
export const notFoundHandler = (req: Request, res: Response): void => {
  res.status(404).json({
    success: false,
    error: 'Route non trouvée',
    code: 'NOT_FOUND',
    path: req.path,
  });
};
