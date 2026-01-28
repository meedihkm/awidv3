/**
 * Role-based Authorization Middleware
 * Middleware d'autorisation basé sur les rôles
 */
import { NextFunction, Request, Response } from 'express';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { UnauthorizedError } from '../../../shared/errors/UnauthorizedError';

/**
 * Middleware d'autorisation par rôle
 * Vérifie que l'utilisateur a l'un des rôles autorisés
 */
export const roleMiddleware = (allowedRoles: string[]) => {
    return (req: Request, res: Response, next: NextFunction): void => {
        if (!req.user) {
            next(new UnauthorizedError('Non authentifié'));
            return;
        }

        if (!allowedRoles.includes(req.user.role)) {
            next(new ForbiddenError('Accès refusé pour ce rôle'));
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