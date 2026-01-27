/**
 * EXEMPLE MIGRATION ZOD - AWID v3.0
 * Ce fichier montre comment structurer la validation avec Zod
 */

import { z } from 'zod';

// ═══════════════════════════════════════════════════════════════════════════
// 📦 SCHÉMAS DE BASE RÉUTILISABLES
// ═══════════════════════════════════════════════════════════════════════════

// Primitives
export const uuid = z.string().uuid('Format UUID invalide');

export const phone = z.string()
  .regex(/^(\+213|0)(5|6|7)[0-9]{8}$/, 'Numéro algérien invalide (ex: 0551234567)');

export const email = z.string()
  .email('Email invalide')
  .toLowerCase()
  .trim();

export const password = z.string()
  .min(8, 'Minimum 8 caractères')
  .regex(/[A-Z]/, 'Au moins une majuscule requise')
  .regex(/[a-z]/, 'Au moins une minuscule requise')
  .regex(/[0-9]/, 'Au moins un chiffre requis');

// Montant monétaire (DZD)
export const money = z.number()
  .positive('Montant positif requis')
  .max(100_000_000, 'Montant maximum: 100M DZD')
  .transform(v => Math.round(v * 100) / 100); // 2 décimales

// Pagination
export const pagination = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(100).default(50),
});

// Période
export const dateRange = z.object({
  dateFrom: z.coerce.date().optional(),
  dateTo: z.coerce.date().optional(),
}).refine(
  (data) => {
    if (data.dateFrom && data.dateTo) {
      return data.dateFrom <= data.dateTo;
    }
    return true;
  },
  { message: 'dateFrom doit être avant dateTo', path: ['dateTo'] }
);

// Coordonnées GPS
export const coordinates = z.object({
  lat: z.number().min(-90).max(90),
  lng: z.number().min(-180).max(180),
});

// Adresse
export const address = z.object({
  street: z.string().min(5, 'Adresse trop courte').max(200),
  city: z.string().min(2).max(100),
  wilaya: z.string().max(50).optional(),
  postalCode: z.string().regex(/^[0-9]{5}$/, 'Code postal: 5 chiffres').optional(),
  coordinates: coordinates.optional(),
});

// ═══════════════════════════════════════════════════════════════════════════
// 🔐 AUTH SCHEMAS
// ═══════════════════════════════════════════════════════════════════════════

export const loginSchema = z.object({
  email: email,
  password: z.string().min(1, 'Mot de passe requis'),
  remember: z.boolean().default(false),
  deviceInfo: z.object({
    platform: z.enum(['ios', 'android', 'web']).optional(),
    deviceId: z.string().max(100).optional(),
    appVersion: z.string().max(20).optional(),
  }).optional(),
});

export const registerSchema = z.object({
  email: email,
  password: password,
  confirmPassword: z.string(),
  name: z.string().min(2, 'Nom trop court').max(100),
  phone: phone,
  role: z.enum(['customer', 'deliverer', 'kitchen']).default('customer'),
}).refine(
  (data) => data.password === data.confirmPassword,
  { message: 'Les mots de passe ne correspondent pas', path: ['confirmPassword'] }
);

export const changePasswordSchema = z.object({
  currentPassword: z.string().min(1, 'Mot de passe actuel requis'),
  newPassword: password,
  confirmNewPassword: z.string(),
}).refine(
  (data) => data.newPassword === data.confirmNewPassword,
  { message: 'Les mots de passe ne correspondent pas', path: ['confirmNewPassword'] }
).refine(
  (data) => data.currentPassword !== data.newPassword,
  { message: 'Le nouveau mot de passe doit être différent', path: ['newPassword'] }
);

export const refreshTokenSchema = z.object({
  refreshToken: z.string().min(32, 'Token invalide').max(256),
});

// ═══════════════════════════════════════════════════════════════════════════
// 👤 USER SCHEMAS
// ═══════════════════════════════════════════════════════════════════════════

export const userRoleSchema = z.enum(['admin', 'kitchen', 'deliverer', 'customer']);

export const createUserSchema = z.object({
  email: email,
  password: password,
  name: z.string().min(2).max(100),
  phone: phone,
  role: userRoleSchema,
  address: address.optional(),
  creditLimit: money.optional(),
  creditLimitEnabled: z.boolean().default(false),
  notes: z.string().max(500).optional(),
});

export const updateUserSchema = createUserSchema.partial().omit({ password: true });

export const userQuerySchema = pagination.extend({
  role: userRoleSchema.optional(),
  active: z.coerce.boolean().optional(),
  search: z.string().max(100).optional(),
  sortBy: z.enum(['name', 'created_at', 'email']).default('name'),
  sortOrder: z.enum(['asc', 'desc']).default('asc'),
});

// ═══════════════════════════════════════════════════════════════════════════
// 📦 PRODUCT SCHEMAS
// ═══════════════════════════════════════════════════════════════════════════

export const productCategorySchema = z.enum([
  'bakery', 'pastry', 'beverage', 'dairy', 'meat', 'vegetable', 'other'
]);

export const createProductSchema = z.object({
  name: z.string().min(2).max(100),
  description: z.string().max(500).optional(),
  category: productCategorySchema,
  price: money,
  unit: z.enum(['piece', 'kg', 'g', 'l', 'ml', 'box', 'pack']).default('piece'),
  minQuantity: z.number().int().min(1).default(1),
  maxQuantity: z.number().int().max(10000).optional(),
  sku: z.string().max(50).optional(),
  barcode: z.string().max(50).optional(),
  isAvailable: z.boolean().default(true),
  tags: z.array(z.string().max(30)).max(10).optional(),
});

export const updateProductSchema = createProductSchema.partial();

export const productQuerySchema = pagination.extend({
  category: productCategorySchema.optional(),
  available: z.coerce.boolean().optional(),
  search: z.string().max(100).optional(),
  minPrice: z.coerce.number().positive().optional(),
  maxPrice: z.coerce.number().positive().optional(),
});

// ═══════════════════════════════════════════════════════════════════════════
// 🛒 ORDER SCHEMAS
// ═══════════════════════════════════════════════════════════════════════════

export const orderStatusSchema = z.enum([
  'pending',      // En attente de confirmation
  'confirmed',    // Confirmée
  'preparing',    // En préparation
  'ready',        // Prête pour livraison
  'assigned',     // Assignée à un livreur
  'in_delivery',  // En cours de livraison
  'delivered',    // Livrée
  'cancelled',    // Annulée
]);

export const paymentStatusSchema = z.enum(['unpaid', 'partial', 'paid']);

export const prioritySchema = z.enum(['normal', 'urgent', 'scheduled']);

// Item de commande
export const orderItemSchema = z.object({
  productId: uuid,
  quantity: z.number().int().min(1).max(10000),
  price: money.optional(), // Si vide, utiliser le prix produit
  notes: z.string().max(200).optional(),
});

// Création de commande
export const createOrderSchema = z.object({
  customerId: uuid,
  items: z.array(orderItemSchema)
    .min(1, 'Au moins un article requis')
    .max(100, 'Maximum 100 articles'),
  deliveryDate: z.coerce.date()
    .min(new Date(Date.now() - 86400000), 'Date passée non autorisée') // -1 jour tolérance
    .optional(),
  deliveryAddress: address.optional(),
  priority: prioritySchema.default('normal'),
  notes: z.string().max(500).optional().nullable(),
  // Récurrence
  recurring: z.object({
    enabled: z.boolean(),
    frequency: z.enum(['daily', 'weekly', 'monthly']),
    daysOfWeek: z.array(z.number().int().min(0).max(6)).optional(), // 0=Dim, 6=Sam
    endDate: z.coerce.date().optional(),
  }).optional(),
});

// Mise à jour de commande
export const updateOrderSchema = z.object({
  items: z.array(orderItemSchema).min(1).max(100).optional(),
  deliveryDate: z.coerce.date().optional(),
  deliveryAddress: address.optional(),
  priority: prioritySchema.optional(),
  notes: z.string().max(500).optional().nullable(),
});

// Changement de statut
export const updateOrderStatusSchema = z.object({
  status: orderStatusSchema,
  notes: z.string().max(500).optional(),
  notifyCustomer: z.boolean().default(true),
});

// Requête commandes
export const orderQuerySchema = pagination.merge(dateRange).extend({
  status: orderStatusSchema.optional(),
  paymentStatus: paymentStatusSchema.optional(),
  customerId: uuid.optional(),
  delivererId: uuid.optional(),
  priority: prioritySchema.optional(),
  search: z.string().max(100).optional(), // Recherche par numéro
  sortBy: z.enum(['created_at', 'delivery_date', 'total', 'status']).default('created_at'),
  sortOrder: z.enum(['asc', 'desc']).default('desc'),
});

// ═══════════════════════════════════════════════════════════════════════════
// 🚚 DELIVERY SCHEMAS
// ═══════════════════════════════════════════════════════════════════════════

export const deliveryStatusSchema = z.enum([
  'pending',      // En attente d'assignation
  'assigned',     // Assignée
  'picked_up',    // Récupérée
  'in_transit',   // En route
  'delivered',    // Livrée
  'failed',       // Échec
  'returned',     // Retournée
]);

// Assignation livraison
export const assignDeliverySchema = z.object({
  orderId: uuid,
  delivererId: uuid,
  priority: z.number().int().min(1).max(100).default(50),
  notes: z.string().max(500).optional(),
});

// Compléter livraison
export const completeDeliverySchema = z.object({
  status: z.enum(['delivered', 'failed', 'returned']),
  amountCollected: money.optional(),
  paymentMode: z.enum(['cash', 'bank', 'check', 'mobile', 'none']).default('none'),
  failureReason: z.string().max(500).optional(),
  notes: z.string().max(500).optional(),
  // Preuve de livraison
  proofOfDelivery: z.object({
    signature: z.string().max(100000).optional(), // Base64 SVG
    signedBy: z.string().max(100).optional(),
    photos: z.array(z.string().url()).max(5).optional(),
    location: coordinates.optional(),
  }).optional(),
});

// Position livreur
export const updatePositionSchema = z.object({
  location: coordinates,
  speed: z.number().min(0).max(200).optional(), // km/h
  heading: z.number().min(0).max(360).optional(), // degrés
  accuracy: z.number().min(0).optional(), // mètres
  battery: z.number().min(0).max(100).optional(), // %
});

// Requête livraisons
export const deliveryQuerySchema = pagination.merge(dateRange).extend({
  status: deliveryStatusSchema.optional(),
  delivererId: uuid.optional(),
  sortBy: z.enum(['created_at', 'priority', 'status']).default('priority'),
  sortOrder: z.enum(['asc', 'desc']).default('desc'),
});

// ═══════════════════════════════════════════════════════════════════════════
// 💰 PAYMENT SCHEMAS
// ═══════════════════════════════════════════════════════════════════════════

export const paymentModeSchema = z.enum(['cash', 'bank', 'check', 'mobile', 'transfer']);

export const recordPaymentSchema = z.object({
  customerId: uuid,
  amount: money,
  mode: paymentModeSchema.default('cash'),
  // Optionnel: cibler des commandes spécifiques (sinon FIFO)
  targetOrders: z.array(uuid).max(50).optional(),
  deliveryId: uuid.optional().nullable(),
  notes: z.string().max(500).optional().nullable(),
  receiptNumber: z.string().max(50).optional(),
});

// Requête historique paiements
export const paymentQuerySchema = pagination.merge(dateRange).extend({
  customerId: uuid.optional(),
  collectorId: uuid.optional(),
  mode: paymentModeSchema.optional(),
  minAmount: z.coerce.number().positive().optional(),
  maxAmount: z.coerce.number().positive().optional(),
});

// Modification limite crédit
export const updateCreditLimitSchema = z.object({
  limit: money,
  enabled: z.boolean().default(true),
});

// ═══════════════════════════════════════════════════════════════════════════
// 📊 REPORT SCHEMAS
// ═══════════════════════════════════════════════════════════════════════════

export const reportTypeSchema = z.enum([
  'daily_summary',
  'weekly_summary',
  'monthly_summary',
  'aging_report',
  'cash_flow',
  'deliverer_performance',
  'customer_analysis',
]);

export const generateReportSchema = z.object({
  type: reportTypeSchema,
  dateRange: dateRange,
  format: z.enum(['json', 'csv', 'pdf']).default('json'),
  filters: z.object({
    customerId: uuid.optional(),
    delivererId: uuid.optional(),
    status: orderStatusSchema.optional(),
  }).optional(),
  email: email.optional(), // Envoyer par email
});

export const forecastQuerySchema = z.object({
  days: z.coerce.number().int().min(7).max(90).default(30),
});

export const agingReportQuerySchema = z.object({
  minDebt: z.coerce.number().min(0).optional(),
  riskLevel: z.enum(['low', 'medium', 'high', 'critical']).optional(),
});

// ═══════════════════════════════════════════════════════════════════════════
// 🔔 NOTIFICATION SCHEMAS
// ═══════════════════════════════════════════════════════════════════════════

export const notificationChannelSchema = z.enum(['push', 'sms', 'email', 'in_app']);

export const sendNotificationSchema = z.object({
  userId: uuid.optional(),
  userIds: z.array(uuid).max(1000).optional(),
  channel: notificationChannelSchema,
  title: z.string().min(1).max(100),
  body: z.string().min(1).max(500),
  data: z.record(z.string()).optional(),
  scheduledAt: z.coerce.date().optional(),
}).refine(
  (data) => data.userId || (data.userIds && data.userIds.length > 0),
  { message: 'userId ou userIds requis' }
);

// ═══════════════════════════════════════════════════════════════════════════
// 🎫 CLAIM SCHEMAS (Réclamations)
// ═══════════════════════════════════════════════════════════════════════════

export const claimTypeSchema = z.enum([
  'quality',    // Problème qualité produit
  'delay',      // Retard livraison
  'missing',    // Article manquant
  'wrong',      // Mauvais article
  'damage',     // Produit endommagé
  'behavior',   // Comportement livreur
  'other',
]);

export const claimStatusSchema = z.enum([
  'open',
  'investigating',
  'resolved',
  'rejected',
]);

export const createClaimSchema = z.object({
  orderId: uuid,
  type: claimTypeSchema,
  description: z.string().min(10).max(1000),
  photos: z.array(z.string().url()).max(5).optional(),
});

export const resolveClaimSchema = z.object({
  resolution: z.enum(['refund', 'replacement', 'credit', 'apology', 'rejected']),
  amount: money.optional(),
  notes: z.string().max(500),
});

// ═══════════════════════════════════════════════════════════════════════════
// ⭐ RATING SCHEMAS (Évaluations)
// ═══════════════════════════════════════════════════════════════════════════

export const ratingValueSchema = z.number().int().min(1).max(5);

export const createRatingSchema = z.object({
  deliveryId: uuid,
  overall: ratingValueSchema,
  categories: z.object({
    punctuality: ratingValueSchema,
    productQuality: ratingValueSchema,
    delivererBehavior: ratingValueSchema,
  }),
  comment: z.string().max(500).optional(),
  isAnonymous: z.boolean().default(false),
});

// ═══════════════════════════════════════════════════════════════════════════
// 📦 STOCK SCHEMAS (Inventaire)
// ═══════════════════════════════════════════════════════════════════════════

export const stockMovementTypeSchema = z.enum([
  'in',        // Entrée
  'out',       // Sortie
  'adjustment', // Ajustement inventaire
  'transfer',  // Transfert entre emplacements
]);

export const recordStockMovementSchema = z.object({
  productId: uuid,
  type: stockMovementTypeSchema,
  quantity: z.number().positive(),
  reason: z.string().max(200).optional(),
  reference: z.string().max(50).optional(), // Numéro bon, facture, etc.
});

export const updateStockThresholdSchema = z.object({
  productId: uuid,
  minThreshold: z.number().int().min(0),
  reorderQuantity: z.number().int().min(1),
});

// ═══════════════════════════════════════════════════════════════════════════
// 🔧 TYPES INFÉRÉS (à utiliser dans le code)
// ═══════════════════════════════════════════════════════════════════════════

// Auth
export type LoginInput = z.infer<typeof loginSchema>;
export type RegisterInput = z.infer<typeof registerSchema>;
export type ChangePasswordInput = z.infer<typeof changePasswordSchema>;

// Users
export type UserRole = z.infer<typeof userRoleSchema>;
export type CreateUserInput = z.infer<typeof createUserSchema>;
export type UpdateUserInput = z.infer<typeof updateUserSchema>;
export type UserQuery = z.infer<typeof userQuerySchema>;

// Products
export type ProductCategory = z.infer<typeof productCategorySchema>;
export type CreateProductInput = z.infer<typeof createProductSchema>;
export type UpdateProductInput = z.infer<typeof updateProductSchema>;
export type ProductQuery = z.infer<typeof productQuerySchema>;

// Orders
export type OrderStatus = z.infer<typeof orderStatusSchema>;
export type PaymentStatus = z.infer<typeof paymentStatusSchema>;
export type Priority = z.infer<typeof prioritySchema>;
export type OrderItem = z.infer<typeof orderItemSchema>;
export type CreateOrderInput = z.infer<typeof createOrderSchema>;
export type UpdateOrderInput = z.infer<typeof updateOrderSchema>;
export type UpdateOrderStatusInput = z.infer<typeof updateOrderStatusSchema>;
export type OrderQuery = z.infer<typeof orderQuerySchema>;

// Deliveries
export type DeliveryStatus = z.infer<typeof deliveryStatusSchema>;
export type AssignDeliveryInput = z.infer<typeof assignDeliverySchema>;
export type CompleteDeliveryInput = z.infer<typeof completeDeliverySchema>;
export type UpdatePositionInput = z.infer<typeof updatePositionSchema>;
export type DeliveryQuery = z.infer<typeof deliveryQuerySchema>;

// Payments
export type PaymentMode = z.infer<typeof paymentModeSchema>;
export type RecordPaymentInput = z.infer<typeof recordPaymentSchema>;
export type PaymentQuery = z.infer<typeof paymentQuerySchema>;
export type UpdateCreditLimitInput = z.infer<typeof updateCreditLimitSchema>;

// Reports
export type ReportType = z.infer<typeof reportTypeSchema>;
export type GenerateReportInput = z.infer<typeof generateReportSchema>;

// Common
export type Pagination = z.infer<typeof pagination>;
export type DateRange = z.infer<typeof dateRange>;
export type Coordinates = z.infer<typeof coordinates>;
export type Address = z.infer<typeof address>;
