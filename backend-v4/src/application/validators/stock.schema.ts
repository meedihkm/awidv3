/**
 * Stock Zod Schemas
 * Schémas de validation pour les stocks
 */
import { z } from 'zod';
import { uuidSchema } from './common.schema';

export const stockMovementTypeSchema = z.enum(['in', 'out', 'adjustment', 'transfer']);

export const createStockSchema = z.object({
  productId: uuidSchema,
  quantity: z.number().min(0),
  unit: z.string().min(1).max(50),
  minThreshold: z.number().min(0),
  reorderQuantity: z.number().min(1),
  location: z.string().max(100).optional(),
});

export const updateStockSchema = z.object({
  quantity: z.number().min(0).optional(),
  minThreshold: z.number().min(0).optional(),
  reorderQuantity: z.number().min(1).optional(),
  location: z.string().max(100).optional(),
});

export const recordStockMovementSchema = z.object({
  productId: uuidSchema,
  type: stockMovementTypeSchema,
  quantity: z.number().refine((val) => val !== 0, 'La quantité ne peut pas être zéro'),
  reason: z.string().max(200).optional(),
  reference: z.string().max(50).optional(),
});

export const adjustStockSchema = z.object({
  quantity: z.number().min(0),
  reason: z.string().max(200),
});

// Types inférés
export type StockMovementType = z.infer<typeof stockMovementTypeSchema>;
export type CreateStockInput = z.infer<typeof createStockSchema>;
export type UpdateStockInput = z.infer<typeof updateStockSchema>;
export type RecordStockMovementInput = z.infer<typeof recordStockMovementSchema>;
export type AdjustStockInput = z.infer<typeof adjustStockSchema>;
