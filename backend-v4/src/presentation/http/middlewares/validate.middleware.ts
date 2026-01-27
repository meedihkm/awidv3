/**
 * Validation Middleware
 * Middleware de validation Zod pour Express
 */
import { ValidationError } from '@/shared/errors/ValidationError';
import { NextFunction, Request, Response } from 'express';
import { AnyZodObject, ZodError } from 'zod';

type ValidationTarget = 'body' | 'query' | 'params';

/**
 * Middleware générique de validation Zod
 */
export const validate = (schema: AnyZodObject, target: ValidationTarget = 'body') => {
  return async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      // Parse et valide les données
      const parsed = await schema.parseAsync(req[target]);

      // Remplacer par les données validées et transformées
      (req as any)[target] = parsed;

      next();
    } catch (error) {
      if (error instanceof ZodError) {
        // Formater les erreurs de manière lisible
        const details = error.errors.map((err) => ({
          field: err.path.join('.') || 'root',
          message: err.message,
          code: err.code,
        }));

        next(new ValidationError('Données invalides', details));
        return;
      }

      next(error);
    }
  };
};

/**
 * Raccourcis pratiques
 */
export const validateBody = (schema: AnyZodObject) => validate(schema, 'body');
export const validateQuery = (schema: AnyZodObject) => validate(schema, 'query');
export const validateParams = (schema: AnyZodObject) => validate(schema, 'params');
