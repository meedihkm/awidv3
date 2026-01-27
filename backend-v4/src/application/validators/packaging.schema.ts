/**
 * Packaging Zod Schemas
 * Schémas de validation pour les consignes
 */
import { z } from 'zod';
import { moneySchema, uuidSchema } from './common.schema';

export const createPackagingSchema = z.object({
  name: z.string().min(2).max(100),
  description: z.string().max(500).optional(),
  depositAmount: moneySchema,
  unit: z.string().min(1).max(50),
});

export const updatePackagingSchema = createPackagingSchema.partial();

export const packagingTransactionTypeSchema = z.enum(['deposit', 'return']);

export const recordPackagingTransactionSchema = z.object({
  customerId: uuidSchema,
  packagingId: uuidSchema,
  type: packagingTransactionTypeSchema,
  quantity: z.number().int().min(1).max(1000),
  deliveryId: uuidSchema.optional(),
  notes: z.string().max(500).optional(),
});

// Types inférés
export type CreatePackagingInput = z.infer<typeof createPackagingSchema>;
export type UpdatePackagingInput = z.infer<typeof updatePackagingSchema>;
export type PackagingTransactionType = z.infer<typeof packagingTransactionTypeSchema>;
export type RecordPackagingTransactionInput = z.infer<typeof recordPackagingTransactionSchema>;
