/**
 * Order Zod Schemas
 * Schémas de validation pour les commandes
 */
import { z } from 'zod';
import { addressSchema, dateRangeSchema, moneySchema, paginationSchema, uuidSchema } from './common.schema';

export const orderStatusSchema = z.enum([
  'pending',
  'confirmed',
  'preparing',
  'ready',
  'assigned',
  'in_delivery',
  'delivered',
  'cancelled',
]);

export const paymentStatusSchema = z.enum(['unpaid', 'partial', 'paid']);

export const prioritySchema = z.enum(['normal', 'urgent', 'scheduled']);

// Item de commande
export const orderItemSchema = z.object({
  productId: uuidSchema,
  quantity: z.number().int().min(1).max(10000),
  price: moneySchema.optional(),
  notes: z.string().max(200).optional(),
});

// Création de commande
export const createOrderSchema = z.object({
  customerId: uuidSchema,
  items: z
    .array(orderItemSchema)
    .min(1, 'Au moins un article requis')
    .max(100, 'Maximum 100 articles'),
  deliveryDate: z.coerce
    .date()
    .min(new Date(Date.now() - 86400000), 'Date passée non autorisée')
    .optional(),
  deliveryAddress: addressSchema.optional(),
  priority: prioritySchema.default('normal'),
  notes: z.string().max(500).optional().nullable(),
});

// Mise à jour de commande
export const updateOrderSchema = z.object({
  items: z.array(orderItemSchema).min(1).max(100).optional(),
  deliveryDate: z.coerce.date().optional(),
  deliveryAddress: addressSchema.optional(),
  priority: prioritySchema.optional(),
  notes: z.string().max(500).optional().nullable(),
});

// Changement de statut
export const updateOrderStatusSchema = z.object({
  status: orderStatusSchema,
  notes: z.string().max(500).optional(),
  notifyCustomer: z.boolean().default(true),
});

// Assignation livreur
export const assignDelivererSchema = z.object({
  delivererId: uuidSchema,
  priority: z.number().int().min(1).max(100).default(50),
  notes: z.string().max(500).optional(),
});

// Requête commandes
export const orderQuerySchema = paginationSchema.merge(dateRangeSchema).extend({
  status: orderStatusSchema.optional(),
  paymentStatus: paymentStatusSchema.optional(),
  customerId: uuidSchema.optional(),
  delivererId: uuidSchema.optional(),
  priority: prioritySchema.optional(),
  search: z.string().max(100).optional(),
  sortBy: z.enum(['createdAt', 'deliveryDate', 'total', 'status']).default('createdAt'),
  sortOrder: z.enum(['asc', 'desc']).default('desc'),
});

// Types inférés
export type OrderStatus = z.infer<typeof orderStatusSchema>;
export type PaymentStatus = z.infer<typeof paymentStatusSchema>;
export type Priority = z.infer<typeof prioritySchema>;
export type OrderItem = z.infer<typeof orderItemSchema>;
export type CreateOrderInput = z.infer<typeof createOrderSchema>;
export type UpdateOrderInput = z.infer<typeof updateOrderSchema>;
export type UpdateOrderStatusInput = z.infer<typeof updateOrderStatusSchema>;
export type AssignDelivererInput = z.infer<typeof assignDelivererSchema>;
export type OrderQuery = z.infer<typeof orderQuerySchema>;

// Export grouped schemas for convenience
export const orderSchemas = {
  create: createOrderSchema,
  update: updateOrderSchema,
  updateStatus: updateOrderStatusSchema,
  assignDeliverer: assignDelivererSchema,
  query: orderQuerySchema,
};
