const { z } = require('zod');

const schemas = {
  // Auth
  login: z.object({
    email: z.string().email('Email invalide').max(255),
    password: z.string().min(1, 'Mot de passe requis').max(128)
  }),
  
  refreshToken: z.object({
    refreshToken: z.string().min(1, 'Refresh token requis')
  }),
  
  // Users
  createUser: z.object({
    email: z.string().email('Email invalide').max(255),
    password: z.string().min(6, 'Mot de passe: minimum 6 caractères').max(128),
    name: z.string().min(1, 'Nom requis').max(100),
    phone: z.string().max(20).optional(),
    role: z.enum(['cafeteria', 'deliverer', 'kitchen'], { 
      errorMap: () => ({ message: 'Rôle invalide' }) 
    })
  }),
  
  // Products
  createProduct: z.object({
    name: z.string().min(1, 'Nom requis').max(100),
    price: z.number().positive('Prix doit être positif'),
    imageUrl: z.string().optional().nullable(),
    category: z.string().max(50).optional().nullable(),
    isNew: z.boolean().optional(),
    isPromo: z.boolean().optional(),
    promoPrice: z.number().positive().optional().nullable()
  }),
  
  updateProduct: z.object({
    name: z.string().min(1, 'Nom requis').max(100),
    price: z.number().positive('Prix doit être positif'),
    imageUrl: z.string().optional().nullable(),
    category: z.string().max(50).optional().nullable(),
    isNew: z.boolean().optional(),
    isPromo: z.boolean().optional(),
    promoPrice: z.number().positive().optional().nullable()
  }),
  
  reorderProduct: z.object({
    direction: z.enum(['up', 'down'])
  }),
  
  // Orders
  createOrder: z.object({
    items: z.array(z.object({
      productId: z.string().uuid('ID produit invalide'),
      quantity: z.number().int().positive('Quantité doit être positive')
    })).min(1, 'Au moins un article requis')
  }),
  
  updateOrder: z.object({
    items: z.array(z.object({
      productId: z.string().uuid('ID produit invalide'),
      quantity: z.number().int().positive('Quantité doit être positive')
    })).min(1, 'Au moins un article requis')
  }),
  
  assignDeliverer: z.object({
    delivererId: z.string().min(1, 'ID livreur requis')
  }),
  
  // Deliveries
  updateDeliveryStatus: z.object({
    status: z.enum(['in_progress', 'delivered', 'failed', 'postponed']),
    paymentStatus: z.enum(['unpaid', 'partial', 'paid']).optional(),
    amountCollected: z.number().min(0).optional(),
    comment: z.string().max(500).optional().nullable(),
    failureReason: z.string().max(100).optional().nullable(),
    postponedTo: z.string().optional().nullable()
  }),
  
  // Location
  updateLocation: z.object({
    latitude: z.number().min(-90).max(90),
    longitude: z.number().min(-180).max(180)
  }),
  
  // Organization
  updateOrgSettings: z.object({
    kitchenMode: z.boolean().optional()
  }),
  
  // Kitchen
  kitchenStatus: z.object({
    status: z.enum(['preparing', 'ready'])
  }),
  
  // Super Admin
  createOrganization: z.object({
    name: z.string().min(1, 'Nom requis').max(100),
    type: z.string().max(50).optional(),
    adminEmail: z.string().email('Email admin invalide').max(255),
    adminPassword: z.string().min(6, 'Mot de passe: minimum 6 caractères').max(128),
    adminName: z.string().min(1, 'Nom admin requis').max(100),
    adminPhone: z.string().max(20).optional()
  }),
  
  toggleOrgStatus: z.object({
    active: z.boolean()
  }),
  
  // Payments
  recordPayment: z.object({
    clientId: z.string().uuid('ID client invalide'),
    amount: z.number().positive('Montant doit être positif'),
    mode: z.enum(['auto', 'manual']).optional(),
    deliveryId: z.string().uuid('ID livraison invalide').optional().nullable(),
    targetOrders: z.array(z.string().uuid()).optional().nullable(),
    notes: z.string().max(500).optional().nullable()
  }),
  
  // Favorites
  createFavorite: z.object({
    name: z.string().min(1, 'Nom requis').max(100),
    items: z.array(z.object({
      productId: z.string().uuid('ID produit invalide'),
      productName: z.string().min(1),
      quantity: z.number().int().positive('Quantité doit être positive'),
      unitPrice: z.number().positive('Prix doit être positif')
    })).min(1, 'Au moins un article requis'),
    fromPattern: z.boolean().optional()
  }),
  
  updateFavorite: z.object({
    name: z.string().min(1, 'Nom requis').max(100),
    items: z.array(z.object({
      productId: z.string().uuid('ID produit invalide'),
      productName: z.string().min(1),
      quantity: z.number().int().positive('Quantité doit être positive'),
      unitPrice: z.number().positive('Prix doit être positif')
    })).min(1, 'Au moins un article requis')
  }),
  
  // UUID param validation
  uuidParam: z.object({
    id: z.string().uuid('ID invalide')
  })
};

module.exports = schemas;
