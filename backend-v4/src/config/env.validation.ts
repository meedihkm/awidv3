/**
 * Environment Variables Validation
 * Validation des variables d'environnement avec Zod
 */
import * as dotenv from 'dotenv';
import { z } from 'zod';

dotenv.config();

const envSchema = z.object({
  // App
  NODE_ENV: z.enum(['development', 'test', 'production']).default('development'),
  PORT: z.coerce.number().default(3000),
  API_VERSION: z.string().default('v1'),

  // Database PostgreSQL
  DB_HOST: z.string().default('localhost'),
  DB_PORT: z.coerce.number().default(5432),
  DB_NAME: z.string().default('awid_v4'),
  DB_USER: z.string().default('postgres'),
  DB_PASSWORD: z.string().default('postgres'),
  DB_POOL_MIN: z.coerce.number().default(2),
  DB_POOL_MAX: z.coerce.number().default(10),

  // Redis
  REDIS_HOST: z.string().default('localhost'),
  REDIS_PORT: z.coerce.number().default(6379),
  REDIS_PASSWORD: z.string().optional(),

  // JWT
  JWT_SECRET: z.string().min(32, 'JWT_SECRET doit contenir au moins 32 caractères'),
  JWT_REFRESH_SECRET: z.string().min(32, 'JWT_REFRESH_SECRET doit contenir au moins 32 caractères'),
  JWT_EXPIRES_IN: z.string().default('15m'),
  JWT_REFRESH_EXPIRES_IN: z.string().default('7d'),

  // External Services
  GOOGLE_MAPS_API_KEY: z.string().optional(),
  ONESIGNAL_APP_ID: z.string().optional(),
  ONESIGNAL_API_KEY: z.string().optional(),
  SENTRY_DSN: z.string().url().optional().or(z.literal('')),

  // Email
  SMTP_HOST: z.string().optional(),
  SMTP_PORT: z.coerce.number().default(587),
  SMTP_USER: z.string().optional(),
  SMTP_PASSWORD: z.string().optional(),
  SMTP_FROM: z.string().email().default('noreply@awid.dz'),

  // SMS
  SMS_PROVIDER: z.enum(['mobilis', 'djezzy', 'ooredoo']).default('mobilis'),
  SMS_API_KEY: z.string().optional(),
  SMS_SENDER: z.string().default('AWID'),

  // Storage
  STORAGE_TYPE: z.enum(['local', 's3']).default('local'),
  UPLOAD_DIR: z.string().default('./uploads'),
  S3_BUCKET: z.string().optional(),
  S3_REGION: z.string().optional(),
  S3_ACCESS_KEY: z.string().optional(),
  S3_SECRET_KEY: z.string().optional(),

  // Features Flags
  FEATURE_ROUTE_OPTIMIZATION: z.coerce.boolean().default(false),
  FEATURE_REALTIME_TRACKING: z.coerce.boolean().default(true),
  FEATURE_MULTI_ORG: z.coerce.boolean().default(false),
  FEATURE_OFFLINE_SYNC: z.coerce.boolean().default(true),

  // Security
  CORS_ORIGIN: z.string().default('*'),
  RATE_LIMIT_WINDOW: z.coerce.number().default(15), // minutes
  RATE_LIMIT_MAX: z.coerce.number().default(100),
  BCRYPT_ROUNDS: z.coerce.number().default(12),
  MAX_FILE_SIZE: z.coerce.number().default(10485760), // 10MB

  // Monitoring
  LOG_LEVEL: z.enum(['error', 'warn', 'info', 'debug']).default('info'),
  ENABLE_METRICS: z.coerce.boolean().default(true),
});

export type EnvConfig = z.infer<typeof envSchema>;

/**
 * Valide les variables d'environnement au démarrage
 */
export const validateEnv = (): EnvConfig => {
  const parsed = envSchema.safeParse(process.env);

  if (!parsed.success) {
    console.error('❌ Configuration invalide:');
    console.error(JSON.stringify(parsed.error.format(), null, 2));
    process.exit(1);
  }

  return parsed.data;
};

export const envConfig = validateEnv();
