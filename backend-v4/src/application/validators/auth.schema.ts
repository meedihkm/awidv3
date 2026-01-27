/**
 * Auth Zod Schemas
 * Schémas de validation pour l'authentification
 */
import { z } from 'zod';
import { emailSchema, passwordSchema, phoneSchema } from './common.schema';

export const loginSchema = z.object({
  email: emailSchema,
  password: z.string().min(1, 'Mot de passe requis'),
  remember: z.boolean().default(false),
  deviceInfo: z
    .object({
      platform: z.enum(['ios', 'android', 'web']).optional(),
      deviceId: z.string().max(100).optional(),
      appVersion: z.string().max(20).optional(),
    })
    .optional(),
});

export const registerSchema = z
  .object({
    email: emailSchema,
    password: passwordSchema,
    confirmPassword: z.string(),
    name: z.string().min(2, 'Nom trop court').max(100),
    phone: phoneSchema,
    role: z.enum(['customer', 'deliverer', 'kitchen']).default('customer'),
  })
  .refine((data) => data.password === data.confirmPassword, {
    message: 'Les mots de passe ne correspondent pas',
    path: ['confirmPassword'],
  });

export const changePasswordSchema = z
  .object({
    currentPassword: z.string().min(1, 'Mot de passe actuel requis'),
    newPassword: passwordSchema,
    confirmNewPassword: z.string(),
  })
  .refine((data) => data.newPassword === data.confirmNewPassword, {
    message: 'Les mots de passe ne correspondent pas',
    path: ['confirmNewPassword'],
  })
  .refine((data) => data.currentPassword !== data.newPassword, {
    message: 'Le nouveau mot de passe doit être différent',
    path: ['newPassword'],
  });

export const refreshTokenSchema = z.object({
  refreshToken: z.string().min(32, 'Token invalide').max(256),
});

export const forgotPasswordSchema = z.object({
  email: emailSchema,
});

export const resetPasswordSchema = z
  .object({
    token: z.string().min(32),
    newPassword: passwordSchema,
    confirmPassword: z.string(),
  })
  .refine((data) => data.newPassword === data.confirmPassword, {
    message: 'Les mots de passe ne correspondent pas',
    path: ['confirmPassword'],
  });

// Types inférés
export type LoginInput = z.infer<typeof loginSchema>;
export type RegisterInput = z.infer<typeof registerSchema>;
export type ChangePasswordInput = z.infer<typeof changePasswordSchema>;
export type RefreshTokenInput = z.infer<typeof refreshTokenSchema>;
export type ForgotPasswordInput = z.infer<typeof forgotPasswordSchema>;
export type ResetPasswordInput = z.infer<typeof resetPasswordSchema>;

// Export grouped schemas for convenience
export const authSchemas = {
  login: loginSchema,
  register: registerSchema,
  changePassword: changePasswordSchema,
  refreshToken: refreshTokenSchema,
  forgotPassword: forgotPasswordSchema,
  resetPassword: resetPasswordSchema,
};
