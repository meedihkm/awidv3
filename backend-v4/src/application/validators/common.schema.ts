/**
 * Common Zod Schemas
 * Schémas réutilisables pour la validation
 */
import { z } from 'zod';

// Primitives
export const uuidSchema = z.string().uuid('Format UUID invalide');

export const phoneSchema = z
  .string()
  .regex(/^(\+213|0)(5|6|7)[0-9]{8}$/, 'Numéro de téléphone algérien invalide (ex: 0551234567)');

export const emailSchema = z.string().email('Email invalide').toLowerCase().trim();

export const passwordSchema = z
  .string()
  .min(8, 'Minimum 8 caractères')
  .regex(/[A-Z]/, 'Au moins une majuscule requise')
  .regex(/[a-z]/, 'Au moins une minuscule requise')
  .regex(/[0-9]/, 'Au moins un chiffre requis');

// Montant monétaire (DZD)
export const moneySchema = z
  .number()
  .positive('Montant positif requis')
  .max(100_000_000, 'Montant maximum: 100M DZD')
  .transform((v) => Math.round(v * 100) / 100); // 2 décimales

// Pagination
export const paginationSchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(100).default(50),
});

// Période
export const dateRangeSchema = z
  .object({
    dateFrom: z.coerce.date().optional(),
    dateTo: z.coerce.date().optional(),
  })
  .refine(
    (data) => {
      if (data.dateFrom && data.dateTo) {
        return data.dateFrom <= data.dateTo;
      }
      return true;
    },
    { message: 'dateFrom doit être avant dateTo', path: ['dateTo'] }
  );

// Coordonnées GPS
export const coordinatesSchema = z.object({
  lat: z.number().min(-90).max(90),
  lng: z.number().min(-180).max(180),
});

// Adresse
export const addressSchema = z.object({
  street: z.string().min(5, 'Adresse trop courte').max(200),
  city: z.string().min(2).max(100),
  wilaya: z.string().max(50).optional(),
  postalCode: z.string().regex(/^[0-9]{5}$/, 'Code postal: 5 chiffres').optional(),
  coordinates: coordinatesSchema.optional(),
});

// Types inférés
export type UUID = z.infer<typeof uuidSchema>;
export type Phone = z.infer<typeof phoneSchema>;
export type Email = z.infer<typeof emailSchema>;
export type Money = z.infer<typeof moneySchema>;
export type Pagination = z.infer<typeof paginationSchema>;
export type DateRange = z.infer<typeof dateRangeSchema>;
export type Coordinates = z.infer<typeof coordinatesSchema>;
export type Address = z.infer<typeof addressSchema>;
