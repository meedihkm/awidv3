/**
 * Payment Zod Schemas
 * Schémas de validation pour les paiements
 */
import { z } from 'zod';
import { dateRangeSchema, moneySchema, paginationSchema, uuidSchema } from './common.schema';
import { paymentModeSchema } from './delivery.schema';

export const recordPaymentSchema = z.object({
  customerId: uuidSchema,
  amount: moneySchema,
  mode: paymentModeSchema.default('cash'),
  targetOrders: z.array(uuidSchema).max(50).optional(),
  deliveryId: uuidSchema.optional().nullable(),
  notes: z.string().max(500).optional().nullable(),
  receiptNumber: z.string().max(50).optional(),
});

export const paymentQuerySchema = paginationSchema.merge(dateRangeSchema).extend({
  customerId: uuidSchema.optional(),
  collectorId: uuidSchema.optional(),
  mode: paymentModeSchema.optional(),
  minAmount: z.coerce.number().positive().optional(),
  maxAmount: z.coerce.number().positive().optional(),
});

export const allocatePaymentSchema = z.object({
  orderIds: z.array(uuidSchema).min(1).max(50),
});

// Types inférés
export type RecordPaymentInput = z.infer<typeof recordPaymentSchema>;
export type PaymentQuery = z.infer<typeof paymentQuerySchema>;
export type AllocatePaymentInput = z.infer<typeof allocatePaymentSchema>;
