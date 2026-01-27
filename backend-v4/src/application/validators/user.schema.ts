import { z } from 'zod';
import { commonSchemas } from './common.schema';

export const userSchemas = {
  create: z.object({
    body: z.object({
      firstName: z.string().min(2).max(100),
      lastName: z.string().min(2).max(100),
      email: z.string().email(),
      phone: z.string().min(10).max(20),
      password: z.string().min(8),
      role: z.enum(['admin', 'kitchen', 'deliverer', 'customer']),
      address: z
        .object({
          street: z.string(),
          city: z.string(),
          state: z.string(),
          postalCode: z.string(),
          country: z.string().optional(),
          coordinates: z
            .object({
              latitude: z.number(),
              longitude: z.number(),
            })
            .optional(),
        })
        .optional(),
      creditLimit: z.number().int().positive().optional(),
      creditDays: z.number().int().positive().optional(),
      vehicleType: z.string().optional(),
      vehiclePlate: z.string().optional(),
    }),
  }),

  update: z.object({
    params: z.object({
      id: commonSchemas.uuid,
    }),
    body: z.object({
      firstName: z.string().min(2).max(100).optional(),
      lastName: z.string().min(2).max(100).optional(),
      isActive: z.boolean().optional(),
    }),
  }),
};

export type CreateUserInput = z.infer<typeof userSchemas.create>;
export type UpdateUserInput = z.infer<typeof userSchemas.update>;
