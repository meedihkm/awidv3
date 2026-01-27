/**
 * Delivery Zod Schemas
 * Schémas de validation pour les livraisons
 */
import { z } from 'zod';
import { coordinatesSchema, dateRangeSchema, moneySchema, paginationSchema, uuidSchema } from './common.schema';

export const deliveryStatusSchema = z.enum([
  'pending',
  'assigned',
  'picked_up',
  'in_transit',
  'delivered',
  'failed',
  'returned',
]);

export const paymentModeSchema = z.enum(['cash', 'bank', 'check', 'mobile', 'none']);

export const proofOfDeliverySchema = z.object({
  signature: z.string().max(100000).optional(), // Base64 SVG
  signedBy: z.string().max(100).optional(),
  photos: z.array(z.string().url()).max(5).optional(),
  location: coordinatesSchema,
  timestamp: z.coerce.date(),
});

export const assignDeliverySchema = z.object({
  orderId: uuidSchema,
  delivererId: uuidSchema,
  priority: z.number().int().min(1).max(100).default(50),
  notes: z.string().max(500).optional(),
});

export const updateDeliveryStatusSchema = z.object({
  status: deliveryStatusSchema,
  notes: z.string().max(500).optional(),
});

export const completeDeliverySchema = z.object({
  status: z.enum(['delivered', 'failed', 'returned']),
  amountCollected: moneySchema.optional(),
  paymentMode: paymentModeSchema.default('none'),
  failureReason: z.string().max(500).optional(),
  notes: z.string().max(500).optional(),
  proofOfDelivery: proofOfDeliverySchema.optional(),
});

export const updateDelivererLocationSchema = z.object({
  location: coordinatesSchema,
  speed: z.number().min(0).max(200).optional(), // km/h
  heading: z.number().min(0).max(360).optional(), // degrés
  accuracy: z.number().min(0).optional(), // mètres
  battery: z.number().min(0).max(100).optional(), // %
});

export const deliveryQuerySchema = paginationSchema.merge(dateRangeSchema).extend({
  status: deliveryStatusSchema.optional(),
  delivererId: uuidSchema.optional(),
  sortBy: z.enum(['createdAt', 'priority', 'status']).default('priority'),
  sortOrder: z.enum(['asc', 'desc']).default('desc'),
});

// Types inférés
export type DeliveryStatus = z.infer<typeof deliveryStatusSchema>;
export type PaymentMode = z.infer<typeof paymentModeSchema>;
export type ProofOfDelivery = z.infer<typeof proofOfDeliverySchema>;
export type AssignDeliveryInput = z.infer<typeof assignDeliverySchema>;
export type UpdateDeliveryStatusInput = z.infer<typeof updateDeliveryStatusSchema>;
export type CompleteDeliveryInput = z.infer<typeof completeDeliverySchema>;
export type UpdateDelivererLocationInput = z.infer<typeof updateDelivererLocationSchema>;
export type DeliveryQuery = z.infer<typeof deliveryQuerySchema>;

// Export grouped schemas for convenience
export const deliverySchemas = {
  create: assignDeliverySchema,
  updateStatus: updateDeliveryStatusSchema,
  complete: completeDeliverySchema,
  recordTracking: updateDelivererLocationSchema,
  query: deliveryQuerySchema,
};
