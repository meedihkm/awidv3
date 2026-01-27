/**
 * MIDDLEWARE DE VALIDATION ZOD - AWID v3.0
 * Remplace les validators Joi existants
 */

import { Request, Response, NextFunction, RequestHandler } from 'express';
import { AnyZodObject, ZodError, ZodSchema } from 'zod';

// ═══════════════════════════════════════════════════════════════════════════
// TYPES
// ═══════════════════════════════════════════════════════════════════════════

type ValidationTarget = 'body' | 'query' | 'params';

interface ValidationOptions {
  stripUnknown?: boolean;  // Supprimer les champs non définis (défaut: true)
  abortEarly?: boolean;    // Arrêter à la première erreur (défaut: false)
}

interface ValidationErrorResponse {
  success: false;
  error: string;
  code: string;
  details: Array<{
    field: string;
    message: string;
    code: string;
  }>;
}

// ═══════════════════════════════════════════════════════════════════════════
// FORMATAGE DES ERREURS
// ═══════════════════════════════════════════════════════════════════════════

const formatZodErrors = (error: ZodError): ValidationErrorResponse => {
  return {
    success: false,
    error: 'Données invalides',
    code: 'VALIDATION_ERROR',
    details: error.errors.map(err => ({
      field: err.path.join('.') || 'root',
      message: err.message,
      code: err.code,
    })),
  };
};

// ═══════════════════════════════════════════════════════════════════════════
// MIDDLEWARE PRINCIPAL
// ═══════════════════════════════════════════════════════════════════════════

/**
 * Middleware générique de validation Zod
 * 
 * @example
 * router.post('/orders', validate(createOrderSchema, 'body'), controller.create);
 * router.get('/orders', validate(orderQuerySchema, 'query'), controller.list);
 */
export const validate = <T extends ZodSchema>(
  schema: T,
  target: ValidationTarget = 'body',
  options: ValidationOptions = {}
): RequestHandler => {
  const { stripUnknown = true } = options;

  return async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      // Parse et valide les données
      const parsed = await schema.parseAsync(req[target]);
      
      // Remplacer par les données validées et transformées
      // (coercion des types, valeurs par défaut, etc.)
      (req as any)[target] = parsed;
      
      next();
    } catch (error) {
      if (error instanceof ZodError) {
        const response = formatZodErrors(error);
        res.status(400).json(response);
        return;
      }
      
      // Erreur inattendue
      console.error('Validation unexpected error:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur de validation interne',
        code: 'VALIDATION_INTERNAL_ERROR',
      });
    }
  };
};

// ═══════════════════════════════════════════════════════════════════════════
// RACCOURCIS PRATIQUES
// ═══════════════════════════════════════════════════════════════════════════

/**
 * Valider le body de la requête
 * @example router.post('/users', validateBody(createUserSchema), controller.create)
 */
export const validateBody = <T extends ZodSchema>(schema: T) => 
  validate(schema, 'body');

/**
 * Valider les query params
 * @example router.get('/users', validateQuery(userQuerySchema), controller.list)
 */
export const validateQuery = <T extends ZodSchema>(schema: T) => 
  validate(schema, 'query');

/**
 * Valider les params d'URL
 * @example router.get('/users/:id', validateParams(idParamSchema), controller.get)
 */
export const validateParams = <T extends ZodSchema>(schema: T) => 
  validate(schema, 'params');

// ═══════════════════════════════════════════════════════════════════════════
// VALIDATION COMBINÉE
// ═══════════════════════════════════════════════════════════════════════════

interface CombinedSchemas {
  body?: ZodSchema;
  query?: ZodSchema;
  params?: ZodSchema;
}

/**
 * Valider plusieurs cibles en une fois
 * 
 * @example
 * router.put('/orders/:id',
 *   validateAll({
 *     params: idParamSchema,
 *     body: updateOrderSchema,
 *     query: optionsSchema,
 *   }),
 *   controller.update
 * );
 */
export const validateAll = (schemas: CombinedSchemas): RequestHandler => {
  return async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    const errors: Array<{ target: string; details: any[] }> = [];

    // Valider chaque cible
    for (const [target, schema] of Object.entries(schemas)) {
      if (!schema) continue;

      try {
        const parsed = await schema.parseAsync((req as any)[target]);
        (req as any)[target] = parsed;
      } catch (error) {
        if (error instanceof ZodError) {
          errors.push({
            target,
            details: error.errors.map(err => ({
              field: err.path.join('.') || 'root',
              message: err.message,
              code: err.code,
            })),
          });
        }
      }
    }

    if (errors.length > 0) {
      res.status(400).json({
        success: false,
        error: 'Données invalides',
        code: 'VALIDATION_ERROR',
        validationErrors: errors,
      });
      return;
    }

    next();
  };
};

// ═══════════════════════════════════════════════════════════════════════════
// UTILITAIRES
// ═══════════════════════════════════════════════════════════════════════════

/**
 * Créer un schéma pour les paramètres d'ID
 */
import { z } from 'zod';

export const idParamSchema = z.object({
  id: z.string().uuid('ID invalide'),
});

export const customerIdParamSchema = z.object({
  customerId: z.string().uuid('ID client invalide'),
});

export const orderIdParamSchema = z.object({
  orderId: z.string().uuid('ID commande invalide'),
});

// Types inférés
export type IdParam = z.infer<typeof idParamSchema>;
export type CustomerIdParam = z.infer<typeof customerIdParamSchema>;
export type OrderIdParam = z.infer<typeof orderIdParamSchema>;

// ═══════════════════════════════════════════════════════════════════════════
// EXAMPLE D'UTILISATION DANS UNE ROUTE
// ═══════════════════════════════════════════════════════════════════════════

/*
// routes/orders.routes.ts
import { Router } from 'express';
import { 
  validateBody, 
  validateQuery, 
  validateParams, 
  idParamSchema 
} from '@/middleware/validate';
import { 
  createOrderSchema, 
  updateOrderSchema, 
  orderQuerySchema,
  CreateOrderInput,
  OrderQuery 
} from '@/validators/order.schema';

const router = Router();

// GET /api/orders
router.get('/',
  authenticate,
  authorize(['admin', 'kitchen']),
  validateQuery(orderQuerySchema),
  async (req, res) => {
    // req.query est maintenant typé comme OrderQuery
    const query = req.query as OrderQuery;
    const orders = await orderService.findAll(query);
    res.json({ success: true, data: orders });
  }
);

// POST /api/orders
router.post('/',
  authenticate,
  authorize(['admin', 'customer']),
  validateBody(createOrderSchema),
  async (req, res) => {
    // req.body est maintenant typé comme CreateOrderInput
    const input = req.body as CreateOrderInput;
    const order = await orderService.create(input, req.user);
    res.status(201).json({ success: true, data: order });
  }
);

// PUT /api/orders/:id
router.put('/:id',
  authenticate,
  authorize(['admin']),
  validateParams(idParamSchema),
  validateBody(updateOrderSchema),
  async (req, res) => {
    const { id } = req.params;
    const input = req.body;
    const order = await orderService.update(id, input);
    res.json({ success: true, data: order });
  }
);

export default router;
*/
