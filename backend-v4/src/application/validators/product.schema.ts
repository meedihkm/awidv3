import { z } from 'zod';
import { commonSchemas } from './common.schema';

export const productSchemas = {
  create: z.object({
    body: z.object({
      name: z.string().min(2).max(255),
      description: z.string().optional(),
      sku: z.string().optional(),
      category: z.string().min(2).max(100),
      basePrice: z.number().int().positive(),
      imageUrl: z.string().url().optional(),
      thumbnailUrl: z.string().url().optional(),
      trackStock: z.boolean().optional(),
      currentStock: z.number().int().min(0).optional(),
      minStockLevel: z.number().int().min(0).optional(),
      unit: z.string().optional(),
      isAvailable: z.boolean().optional(),
      tags: z.array(z.string()).optional(),
      metadata: z.record(z.any()).optional(),
    }),
  }),

  update: z.object({
    params: z.object({
      id: commonSchemas.uuid,
    }),
    body: z.object({
      name: z.string().min(2).max(255).optional(),
      description: z.string().optional(),
      basePrice: z.number().int().positive().optional(),
      isAvailable: z.boolean().optional(),
    }),
  }),
};

export type CreateProductInput = z.infer<typeof productSchemas.create>;
export type UpdateProductInput = z.infer<typeof productSchemas.update>;
