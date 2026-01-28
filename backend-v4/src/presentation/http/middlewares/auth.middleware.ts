/**
 * Authentication Middleware
 * Middleware d'authentification JWT
 */
import { envConfig } from '@/config/env.validation';
import { ForbiddenError } from '@/shared/errors/ForbiddenError';
import { UnauthorizedError } from '@/shared/errors/UnauthorizedError';
import { NextFunction, Request, Response } from 'express';
import * as jwt from 'jsonwebtoken';

export interface JWTPayload {
  userId: string;
  organizationId: string;
  role: string;
  type: 'access' | 'refresh';
}

// Étendre le type Request pour inclure user
declare global {
  namespace Express {
    interface Request {
      user?: JWTPayload;
    }
  }
}

/**
 * Middleware d'authentification
 * Vérifie le token JWT et ajoute les infos utilisateur à req.user
 */
export const authMiddleware = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    // Récupérer le token du header Authorization
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      throw new UnauthorizedError('Token manquant');
    }

    const token = authHeader.substring(7); // Enlever "Bearer "

    // Vérifier et décoder le token
    const decoded = jwt.verify(token, envConfig.JWT_SECRET) as JWTPayload;

    // Vérifier que c'est un access token
    if (decoded.type !== 'access') {
      throw new UnauthorizedError('Type de token invalide');
    }

    // Ajouter les infos utilisateur à la requête
    req.user = decoded;

    next();
  } catch (error) {
    if (error instanceof jwt.JsonWebTokenError) {
      next(new UnauthorizedError('Token invalide'));
    } else if (error instanceof jwt.TokenExpiredError) {
      next(new UnauthorizedError('Token expiré'));
    } else {
      next(error);
    }
  }
};

/**
 * Middleware d'autorisation par rôle
 * Vérifie que l'utilisateur a l'un des rôles autorisés
 */
export const authorize = (allowedRoles: string[]) => {
  return (req: Request, res: Response, next: NextFunction): void => {
    if (!req.user) {
      next(new UnauthorizedError('Non authentifié'));
      return;
    }

    if (!allowedRoles.includes(req.user.role)) {
      next(new ForbiddenError('Accès refusé'));
      return;
    }

    next();
  };
};

/**
 * Middleware de contexte organisation
 * Assure que toutes les requêtes sont filtrées par organizationId
 */
export const organizationContext = (req: Request, res: Response, next: NextFunction): void => {
  if (!req.user) {
    next(new UnauthorizedError('Non authentifié'));
    return;
  }

  // Ajouter l'organizationId aux query params pour filtrage automatique
  if (!req.query.organizationId) {
    req.query.organizationId = req.user.organizationId;
  }

  next();
};
