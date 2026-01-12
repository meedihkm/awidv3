const express = require('express');
const cors = require('cors');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { Pool } = require('pg');
const rateLimit = require('express-rate-limit');
const helmet = require('helmet');
const { z } = require('zod');
const crypto = require('crypto');

const app = express();

// Trust proxy pour Vercel (nécessaire pour express-rate-limit)
app.set('trust proxy', 1);

// ===== CONFIGURATION SÉCURISÉE =====
const JWT_SECRET = process.env.JWT_SECRET;
const SUPER_ADMIN_KEY = process.env.SUPER_ADMIN_KEY;
const ACCESS_TOKEN_EXPIRY = '15m';  // 15 minutes
const REFRESH_TOKEN_EXPIRY = 30;    // 30 jours

if (process.env.NODE_ENV === 'production') {
  if (!JWT_SECRET || JWT_SECRET.length < 32) {
    console.error('ERREUR CRITIQUE: JWT_SECRET non défini ou trop court en production!');
    process.exit(1);
  }
  if (!SUPER_ADMIN_KEY || SUPER_ADMIN_KEY.length < 32) {
    console.error('ERREUR CRITIQUE: SUPER_ADMIN_KEY non défini ou trop court en production!');
    process.exit(1);
  }
}

const jwtSecret = JWT_SECRET || 'dev-only-secret-change-in-production';
const superAdminKey = SUPER_ADMIN_KEY || 'dev-only-key-change-in-production';

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: process.env.NODE_ENV === 'production' ? { rejectUnauthorized: false } : false
});

// ===== SCHEMAS ZOD POUR VALIDATION =====

const schemas = {
  // Auth
  login: z.object({
    email: z.string().email('Email invalide').max(255),
    password: z.string().min(1, 'Mot de passe requis').max(128)
  }),
  
  // Users
  createUser: z.object({
    email: z.string().email('Email invalide').max(255),
    password: z.string().min(6, 'Mot de passe: minimum 6 caractères').max(128),
    name: z.string().min(1, 'Nom requis').max(100),
    phone: z.string().max(20).optional(),
    role: z.enum(['cafeteria', 'deliverer', 'kitchen'], { errorMap: () => ({ message: 'Rôle invalide' }) })
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
  }).passthrough(),
  
  updateProduct: z.object({
    name: z.string().min(1, 'Nom requis').max(100),
    price: z.number().positive('Prix doit être positif'),
    imageUrl: z.string().optional().nullable(),
    category: z.string().max(50).optional().nullable(),
    isNew: z.boolean().optional(),
    isPromo: z.boolean().optional(),
    promoPrice: z.number().positive().optional().nullable()
  }).passthrough(),
  
  reorderProduct: z.object({
    direction: z.string()
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
    delivererId: z.string().uuid('ID livreur invalide')
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
  }).passthrough(),
  
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
  })
};

// Middleware de validation Zod
const validate = (schema) => (req, res, next) => {
  try {
    schema.parse(req.body);
    next();
  } catch (error) {
    if (error instanceof z.ZodError) {
      const messages = error.errors.map(e => e.message).join(', ');
      return res.status(400).json({ error: messages });
    }
    return res.status(400).json({ error: 'Données invalides' });
  }
};

// ===== AUDIT LOG HELPER =====

async function logAudit(action, userId, organizationId, details = {}, req = null) {
  try {
    const ip = req ? (req.headers['x-forwarded-for'] || req.socket?.remoteAddress || 'unknown') : 'system';
    const userAgent = req ? (req.headers['user-agent'] || 'unknown') : 'system';
    
    await pool.query(
      `INSERT INTO audit_logs (user_id, organization_id, action, details, ip_address, user_agent)
       VALUES ($1, $2, $3, $4, $5, $6)`,
      [userId, organizationId, action, JSON.stringify(details), ip.substring(0, 45), userAgent.substring(0, 255)]
    );
  } catch (error) {
    console.error('Audit log error:', error.message);
  }
}

// ===== REFRESH TOKEN HELPERS =====

function generateRefreshToken() {
  return crypto.randomBytes(64).toString('hex');
}

async function saveRefreshToken(userId, token, expiresInDays = REFRESH_TOKEN_EXPIRY) {
  const expiresAt = new Date();
  expiresAt.setDate(expiresAt.getDate() + expiresInDays);
  
  await pool.query(
    `INSERT INTO refresh_tokens (user_id, token, expires_at) VALUES ($1, $2, $3)`,
    [userId, token, expiresAt]
  );
  return expiresAt;
}

async function validateRefreshToken(token) {
  const result = await pool.query(
    `SELECT rt.*, u.id as user_id, u.organization_id, u.role, u.active
     FROM refresh_tokens rt
     JOIN users u ON rt.user_id = u.id
     WHERE rt.token = $1 AND rt.revoked = false AND rt.expires_at > NOW()`,
    [token]
  );
  return result.rows[0] || null;
}

async function revokeRefreshToken(token) {
  await pool.query(
    `UPDATE refresh_tokens SET revoked = true WHERE token = $1`,
    [token]
  );
}

async function revokeAllUserTokens(userId) {
  await pool.query(
    `UPDATE refresh_tokens SET revoked = true WHERE user_id = $1`,
    [userId]
  );
}

// ===== MIDDLEWARE SÉCURITÉ =====

app.use(helmet({
  contentSecurityPolicy: false,
  crossOriginEmbedderPolicy: false
}));

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  message: { error: 'Trop de requêtes, réessayez plus tard' },
  standardHeaders: true,
  legacyHeaders: false,
});
app.use('/api/', limiter);

const loginLimiter = rateLimit({
  windowMs: 5 * 60 * 1000,
  max: 10,
  message: { error: 'Trop de tentatives de connexion, réessayez dans 5 minutes' },
  standardHeaders: true,
  legacyHeaders: false,
});

// Rate limiter strict pour super-admin
const superAdminLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 20,
  message: { error: 'Trop de requêtes super-admin, réessayez plus tard' },
  standardHeaders: true,
  legacyHeaders: false,
});

const allowedOrigins = process.env.CORS_ORIGINS 
  ? process.env.CORS_ORIGINS.split(',') 
  : ['http://localhost:3000', 'http://localhost:8080', 'https://app-livraison-one.vercel.app'];

app.use(cors({ 
  origin: (origin, callback) => {
    // Permettre les requêtes sans origin (apps mobiles, Postman)
    if (!origin) return callback(null, true);
    // En production, vérifier l'origin
    if (process.env.NODE_ENV === 'production') {
      if (allowedOrigins.includes(origin)) {
        return callback(null, true);
      }
      // Permettre les sous-domaines vercel
      if (origin.includes('vercel.app')) {
        return callback(null, true);
      }
      return callback(new Error('CORS non autorisé'), false);
    }
    // En dev, tout autoriser
    return callback(null, true);
  },
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization', 'x-super-admin-key']
}));

app.use(express.json({ limit: '1mb' }));

// Middleware d'authentification
const authenticate = async (req, res, next) => {
  try {
    const authHeader = req.headers.authorization;
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return res.status(401).json({ error: 'Token manquant' });
    }
    
    const token = authHeader.substring(7);
    if (!token || token.length < 10) {
      return res.status(401).json({ error: 'Token invalide' });
    }
    
    const decoded = jwt.verify(token, jwtSecret);
    
    if (decoded.exp && Date.now() >= decoded.exp * 1000) {
      return res.status(401).json({ error: 'Token expiré' });
    }
    
    const result = await pool.query(
      'SELECT id, organization_id, role, active FROM users WHERE id = $1',
      [decoded.id]
    );
    
    if (result.rows.length === 0) {
      return res.status(401).json({ error: 'Utilisateur non trouvé' });
    }
    
    const user = result.rows[0];
    
    if (!user.active) {
      return res.status(403).json({ error: 'Compte désactivé' });
    }
    
    req.user = user;
    next();
  } catch (error) {
    if (error.name === 'TokenExpiredError') {
      return res.status(401).json({ error: 'Token expiré' });
    }
    if (error.name === 'JsonWebTokenError') {
      return res.status(401).json({ error: 'Token invalide' });
    }
    console.error('Auth error:', error.message);
    res.status(401).json({ error: 'Erreur d\'authentification' });
  }
};

const requireAdmin = (req, res, next) => {
  if (req.user.role !== 'admin') {
    return res.status(403).json({ error: 'Accès admin requis' });
  }
  next();
};

const requireKitchen = (req, res, next) => {
  if (req.user.role !== 'kitchen') {
    return res.status(403).json({ error: 'Accès atelier requis' });
  }
  next();
};

const authenticateSuperAdmin = (req, res, next) => {
  const key = req.headers['x-super-admin-key'];
  if (!key || key.length !== superAdminKey.length) {
    return res.status(403).json({ error: 'Accès super-admin requis' });
  }
  
  const keyBuffer = Buffer.from(key);
  const secretBuffer = Buffer.from(superAdminKey);
  
  if (!crypto.timingSafeEqual(keyBuffer, secretBuffer)) {
    return res.status(403).json({ error: 'Accès super-admin requis' });
  }
  next();
};

// ===== HELPERS =====

// Helper pour parsing sécurisé (évite NaN si valeur null/undefined)
const safeParseFloat = (value) => {
  if (value === null || value === undefined) return 0;
  const parsed = parseFloat(value);
  return isNaN(parsed) ? 0 : parsed;
};

async function getOrderItems(orderId) {
  const itemsResult = await pool.query(
    `SELECT oi.*, p.name as product_name 
     FROM order_items oi 
     JOIN products p ON oi.product_id = p.id 
     WHERE oi.order_id = $1`,
    [orderId]
  );
  return itemsResult.rows.map(item => ({
    id: item.id,
    orderId: item.order_id,
    productId: item.product_id,
    productName: item.product_name || '',
    unitPrice: safeParseFloat(item.price),
    quantity: item.quantity || 0
  }));
}

async function getOrderWithItems(orderId) {
  const orderResult = await pool.query(
    `SELECT o.*, u.name as cafeteria_name, u.phone as cafeteria_phone, u.address as cafeteria_address, u.address_lat as cafeteria_lat, u.address_lng as cafeteria_lng
     FROM orders o 
     JOIN users u ON o.cafeteria_id = u.id 
     WHERE o.id = $1`,
    [orderId]
  );
  if (orderResult.rows.length === 0) return null;
  
  const order = orderResult.rows[0];
  const items = await getOrderItems(orderId);
  
  return {
    id: order.id,
    organizationId: order.organization_id,
    cafeteriaId: order.cafeteria_id,
    date: order.date || '',
    total: safeParseFloat(order.total),
    status: order.status || 'pending',
    paymentStatus: order.payment_status || 'unpaid',
    amountPaid: safeParseFloat(order.amount_paid),
    createdAt: order.created_at,
    items,
    cafeteria: {
      id: order.cafeteria_id,
      name: order.cafeteria_name || '',
      phone: order.cafeteria_phone || null,
      address: order.cafeteria_address || null,
      latitude: order.cafeteria_lat ? parseFloat(order.cafeteria_lat) : null,
      longitude: order.cafeteria_lng ? parseFloat(order.cafeteria_lng) : null
    }
  };
}

// ===== ROUTES PUBLIQUES =====

app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});


// ===== ROUTES AUTH =====

// Login avec refresh token
app.post('/api/auth/login', loginLimiter, validate(schemas.login), async (req, res) => {
  try {
    const { email, password } = req.body;
    
    const result = await pool.query(
      'SELECT u.*, o.name as org_name, o.type as org_type, o.active as org_active FROM users u JOIN organizations o ON u.organization_id = o.id WHERE LOWER(u.email) = LOWER($1)',
      [email.trim()]
    );
    
    if (result.rows.length === 0) {
      await bcrypt.hash('dummy', 10);
      await logAudit('LOGIN_FAILED', null, null, { email, reason: 'user_not_found' }, req);
      return res.status(401).json({ error: 'Identifiants incorrects' });
    }
    
    const user = result.rows[0];
    
    if (!user.org_active) {
      await logAudit('LOGIN_FAILED', user.id, user.organization_id, { reason: 'org_disabled' }, req);
      return res.status(403).json({ error: 'Organisation désactivée' });
    }
    
    if (!user.active) {
      await logAudit('LOGIN_FAILED', user.id, user.organization_id, { reason: 'user_disabled' }, req);
      return res.status(403).json({ error: 'Compte désactivé' });
    }
    
    const isValid = await bcrypt.compare(password, user.password);
    
    if (!isValid) {
      await logAudit('LOGIN_FAILED', user.id, user.organization_id, { reason: 'wrong_password' }, req);
      return res.status(401).json({ error: 'Identifiants incorrects' });
    }
    
    // Générer access token (courte durée)
    const accessToken = jwt.sign(
      { id: user.id, organizationId: user.organization_id, role: user.role },
      jwtSecret,
      { expiresIn: ACCESS_TOKEN_EXPIRY }
    );
    
    // Générer refresh token (longue durée)
    const refreshToken = generateRefreshToken();
    await saveRefreshToken(user.id, refreshToken);
    
    await logAudit('LOGIN_SUCCESS', user.id, user.organization_id, {}, req);
    
    res.json({
      success: true,
      accessToken,
      refreshToken,
      expiresIn: 900, // 15 minutes en secondes
      user: {
        id: user.id,
        email: user.email,
        name: user.name,
        role: user.role,
        organizationId: user.organization_id,
        organization: { id: user.organization_id, name: user.org_name || '', type: user.org_type || '' }
      }
    });
  } catch (error) {
    console.error('Login error:', error.message);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// Refresh token endpoint
app.post('/api/auth/refresh', async (req, res) => {
  try {
    const { refreshToken } = req.body;
    
    if (!refreshToken) {
      return res.status(400).json({ error: 'Refresh token requis' });
    }
    
    const tokenData = await validateRefreshToken(refreshToken);
    
    if (!tokenData) {
      return res.status(401).json({ error: 'Refresh token invalide ou expiré' });
    }
    
    if (!tokenData.active) {
      await revokeRefreshToken(refreshToken);
      return res.status(403).json({ error: 'Compte désactivé' });
    }
    
    // Révoquer l'ancien refresh token
    await revokeRefreshToken(refreshToken);
    
    // Générer nouveaux tokens
    const accessToken = jwt.sign(
      { id: tokenData.user_id, organizationId: tokenData.organization_id, role: tokenData.role },
      jwtSecret,
      { expiresIn: ACCESS_TOKEN_EXPIRY }
    );
    
    const newRefreshToken = generateRefreshToken();
    await saveRefreshToken(tokenData.user_id, newRefreshToken);
    
    await logAudit('TOKEN_REFRESH', tokenData.user_id, tokenData.organization_id, {}, req);
    
    res.json({
      success: true,
      accessToken,
      refreshToken: newRefreshToken,
      expiresIn: 900
    });
  } catch (error) {
    console.error('Refresh error:', error.message);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// Logout (révoquer refresh token)
app.post('/api/auth/logout', authenticate, async (req, res) => {
  try {
    const { refreshToken } = req.body;
    
    if (refreshToken) {
      await revokeRefreshToken(refreshToken);
    }
    
    await logAudit('LOGOUT', req.user.id, req.user.organization_id, {}, req);
    
    res.json({ success: true });
  } catch (error) {
    console.error('Logout error:', error.message);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// Logout all devices (révoquer tous les refresh tokens)
app.post('/api/auth/logout-all', authenticate, async (req, res) => {
  try {
    await revokeAllUserTokens(req.user.id);
    await logAudit('LOGOUT_ALL_DEVICES', req.user.id, req.user.organization_id, {}, req);
    res.json({ success: true });
  } catch (error) {
    console.error('Logout all error:', error.message);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.get('/api/auth/me', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT u.*, o.name as org_name, o.type as org_type FROM users u JOIN organizations o ON u.organization_id = o.id WHERE u.id = $1',
      [req.user.id]
    );
    
    const user = result.rows[0];
    res.json({
      success: true,
      user: {
        id: user.id,
        email: user.email,
        name: user.name,
        role: user.role,
        organizationId: user.organization_id,
        organization: { id: user.organization_id, name: user.org_name || '', type: user.org_type || '' }
      }
    });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// ===== ROUTES PRODUITS =====

app.get('/api/products', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT * FROM products WHERE organization_id = $1 ORDER BY COALESCE(sort_order, 999999), name',
      [req.user.organization_id]
    );
    res.json({ success: true, data: result.rows });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.get('/api/products/categories', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT DISTINCT category FROM products WHERE organization_id = $1 AND category IS NOT NULL ORDER BY category',
      [req.user.organization_id]
    );
    res.json({ success: true, data: result.rows.map(r => r.category) });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.post('/api/products', authenticate, requireAdmin, validate(schemas.createProduct), async (req, res) => {
  try {
    const { name, price, imageUrl, category, isNew, isPromo, promoPrice } = req.body;
    
    const maxOrder = await pool.query(
      'SELECT COALESCE(MAX(sort_order), 0) + 1 as next_order FROM products WHERE organization_id = $1',
      [req.user.organization_id]
    );
    const sortOrder = maxOrder.rows[0].next_order;
    
    const result = await pool.query(
      'INSERT INTO products (organization_id, name, price, image_url, category, sort_order, is_new, is_promo, promo_price) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *',
      [req.user.organization_id, name, price, imageUrl || null, category || null, sortOrder, isNew || false, isPromo || false, promoPrice || null]
    );
    
    await logAudit('PRODUCT_CREATED', req.user.id, req.user.organization_id, { productId: result.rows[0].id, name, price }, req);
    
    res.json({ success: true, data: result.rows[0] });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.put('/api/products/:id', authenticate, requireAdmin, validate(schemas.updateProduct), async (req, res) => {
  try {
    const { name, price, imageUrl, category, isNew, isPromo, promoPrice } = req.body;
    const result = await pool.query(
      'UPDATE products SET name = $1, price = $2, image_url = $3, category = $4, is_new = $5, is_promo = $6, promo_price = $7, updated_at = NOW() WHERE id = $8 AND organization_id = $9 RETURNING *',
      [name, price, imageUrl || null, category || null, isNew || false, isPromo || false, promoPrice || null, req.params.id, req.user.organization_id]
    );
    
    await logAudit('PRODUCT_UPDATED', req.user.id, req.user.organization_id, { productId: req.params.id, name, price }, req);
    
    res.json({ success: true, data: result.rows[0] });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.put('/api/products/:id/reorder', authenticate, requireAdmin, validate(schemas.reorderProduct), async (req, res) => {
  try {
    const { direction } = req.body;
    const productId = req.params.id;
    
    const current = await pool.query(
      'SELECT id, sort_order FROM products WHERE id = $1 AND organization_id = $2',
      [productId, req.user.organization_id]
    );
    if (current.rows.length === 0) {
      return res.status(404).json({ error: 'Produit non trouvé' });
    }
    
    const currentOrder = current.rows[0].sort_order || 0;
    
    let neighbor;
    if (direction === 'up') {
      neighbor = await pool.query(
        'SELECT id, sort_order FROM products WHERE organization_id = $1 AND COALESCE(sort_order, 999999) < $2 ORDER BY COALESCE(sort_order, 999999) DESC LIMIT 1',
        [req.user.organization_id, currentOrder]
      );
    } else {
      neighbor = await pool.query(
        'SELECT id, sort_order FROM products WHERE organization_id = $1 AND COALESCE(sort_order, 999999) > $2 ORDER BY COALESCE(sort_order, 999999) ASC LIMIT 1',
        [req.user.organization_id, currentOrder]
      );
    }
    
    if (neighbor.rows.length === 0) {
      return res.json({ success: true, message: 'Déjà en position extrême' });
    }
    
    const neighborOrder = neighbor.rows[0].sort_order || 0;
    const neighborId = neighbor.rows[0].id;
    
    await pool.query('UPDATE products SET sort_order = $1 WHERE id = $2', [neighborOrder, productId]);
    await pool.query('UPDATE products SET sort_order = $1 WHERE id = $2', [currentOrder, neighborId]);
    
    res.json({ success: true });
  } catch (error) {
    console.error('Reorder error:', error.message);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.put('/api/products/:id/toggle', authenticate, requireAdmin, async (req, res) => {
  try {
    await pool.query(
      'UPDATE products SET active = NOT active WHERE id = $1 AND organization_id = $2',
      [req.params.id, req.user.organization_id]
    );
    
    await logAudit('PRODUCT_TOGGLED', req.user.id, req.user.organization_id, { productId: req.params.id }, req);
    
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.delete('/api/products/:id', authenticate, requireAdmin, async (req, res) => {
  try {
    await pool.query(
      'DELETE FROM products WHERE id = $1 AND organization_id = $2',
      [req.params.id, req.user.organization_id]
    );
    
    await logAudit('PRODUCT_DELETED', req.user.id, req.user.organization_id, { productId: req.params.id }, req);
    
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});


// ===== ROUTES UTILISATEURS =====

app.get('/api/users', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT id, email, name, phone, role, active, created_at, address, address_lat, address_lng FROM users WHERE organization_id = $1 AND role != $2',
      [req.user.organization_id, 'admin']
    );
    res.json({ success: true, data: result.rows });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.get('/api/users/deliverers', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT id, email, name, phone, active FROM users WHERE organization_id = $1 AND role = $2 AND active = true',
      [req.user.organization_id, 'deliverer']
    );
    res.json({ success: true, data: result.rows });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.post('/api/users', authenticate, requireAdmin, validate(schemas.createUser), async (req, res) => {
  try {
    const { email, password, name, phone, role } = req.body;
    
    const existingUser = await pool.query('SELECT id FROM users WHERE LOWER(email) = LOWER($1)', [email.trim()]);
    if (existingUser.rows.length > 0) {
      return res.status(400).json({ error: 'Email déjà utilisé' });
    }
    
    const hashedPassword = await bcrypt.hash(password, 12);
    const sanitizedPhone = phone ? phone.replace(/[^0-9+\-\s]/g, '').substring(0, 20) : '';
    
    const result = await pool.query(
      'INSERT INTO users (organization_id, email, password, name, phone, role) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id, email, name, phone, role',
      [req.user.organization_id, email.trim().toLowerCase(), hashedPassword, name.trim(), sanitizedPhone, role]
    );
    
    await logAudit('USER_CREATED', req.user.id, req.user.organization_id, { newUserId: result.rows[0].id, email, role }, req);
    
    res.json({ success: true, data: result.rows[0] });
  } catch (error) {
    console.error('Create user error:', error.message);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.delete('/api/users/:id', authenticate, requireAdmin, async (req, res) => {
  try {
    const userId = req.params.id;
    
    const userCheck = await pool.query(
      'SELECT id, role FROM users WHERE id = $1 AND organization_id = $2',
      [userId, req.user.organization_id]
    );
    
    if (userCheck.rows.length === 0) {
      return res.status(404).json({ error: 'Utilisateur non trouvé' });
    }
    
    if (userCheck.rows[0].role === 'admin') {
      return res.status(403).json({ error: 'Impossible de supprimer un admin' });
    }
    
    const ordersCheck = await pool.query(
      'SELECT COUNT(*) as count FROM orders WHERE cafeteria_id = $1',
      [userId]
    );
    
    if (parseInt(ordersCheck.rows[0].count) > 0) {
      await pool.query('UPDATE users SET active = false WHERE id = $1', [userId]);
      await logAudit('USER_DEACTIVATED', req.user.id, req.user.organization_id, { targetUserId: userId, reason: 'has_orders' }, req);
      return res.json({ success: true, message: 'Utilisateur désactivé (commandes existantes)', deactivated: true });
    }
    
    await pool.query('UPDATE deliveries SET deliverer_id = NULL WHERE deliverer_id = $1', [userId]);
    await pool.query('DELETE FROM users WHERE id = $1', [userId]);
    
    await logAudit('USER_DELETED', req.user.id, req.user.organization_id, { targetUserId: userId }, req);
    
    res.json({ success: true });
  } catch (error) {
    console.error('Delete user error:', error.message);
    res.status(500).json({ error: 'Erreur serveur: ' + error.message });
  }
});

app.put('/api/users/:id/toggle', authenticate, requireAdmin, async (req, res) => {
  try {
    await pool.query(
      'UPDATE users SET active = NOT active WHERE id = $1 AND organization_id = $2',
      [req.params.id, req.user.organization_id]
    );
    
    await logAudit('USER_TOGGLED', req.user.id, req.user.organization_id, { targetUserId: req.params.id }, req);
    
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// Mettre à jour l'adresse d'un client (avec géocodage OSM)
app.put('/api/users/:id/address', authenticate, async (req, res) => {
  try {
    const { address, latitude, longitude } = req.body;
    const userId = req.params.id;
    
    // Vérifier que l'utilisateur appartient à la même organisation
    const userCheck = await pool.query(
      'SELECT id FROM users WHERE id = $1 AND organization_id = $2',
      [userId, req.user.organization_id]
    );
    
    if (userCheck.rows.length === 0) {
      return res.status(404).json({ error: 'Utilisateur non trouvé' });
    }
    
    let lat = latitude;
    let lng = longitude;
    
    // Si pas de coordonnées fournies, géocoder l'adresse via Nominatim (OSM)
    if (address && (!lat || !lng)) {
      try {
        const response = await fetch(
          `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(address)}&limit=1`,
          { headers: { 'User-Agent': 'Awid-Delivery-App/1.0' } }
        );
        const data = await response.json();
        if (data && data.length > 0) {
          lat = parseFloat(data[0].lat);
          lng = parseFloat(data[0].lon);
        }
      } catch (geoError) {
        console.error('Geocoding error:', geoError.message);
      }
    }
    
    await pool.query(
      'UPDATE users SET address = $1, address_lat = $2, address_lng = $3 WHERE id = $4',
      [address || null, lat || null, lng || null, userId]
    );
    
    await logAudit('USER_ADDRESS_UPDATED', req.user.id, req.user.organization_id, { targetUserId: userId, address }, req);
    
    res.json({ success: true, data: { address, latitude: lat, longitude: lng } });
  } catch (error) {
    console.error('Update address error:', error.message);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// ===== ROUTES COMMANDES =====

app.get('/api/orders', authenticate, async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = Math.min(parseInt(req.query.limit) || 50, 100);
    const offset = (page - 1) * limit;
    const status = req.query.status;
    
    let whereClause = 'WHERE o.organization_id = $1';
    const params = [req.user.organization_id];
    
    if (status && status !== 'all') {
      params.push(status);
      whereClause += ` AND o.status = $${params.length}`;
    }
    
    const countResult = await pool.query(
      `SELECT COUNT(*) FROM orders o ${whereClause}`,
      params
    );
    const total = parseInt(countResult.rows[0].count);
    
    const result = await pool.query(
      `SELECT o.*, u.name as cafeteria_name, u.phone as cafeteria_phone
       FROM orders o 
       JOIN users u ON o.cafeteria_id = u.id 
       ${whereClause}
       ORDER BY o.created_at DESC
       LIMIT $${params.length + 1} OFFSET $${params.length + 2}`,
      [...params, limit, offset]
    );
    
    const orders = [];
    for (const order of result.rows) {
      const items = await getOrderItems(order.id);
      orders.push({
        id: order.id,
        orderNumber: order.order_number || null,
        organizationId: order.organization_id,
        cafeteriaId: order.cafeteria_id,
        date: order.date,
        total: safeParseFloat(order.total),
        status: order.status,
        paymentStatus: order.payment_status || 'unpaid',
        amountPaid: safeParseFloat(order.amount_paid),
        createdAt: order.created_at,
        items,
        cafeteria: { id: order.cafeteria_id, name: order.cafeteria_name, phone: order.cafeteria_phone }
      });
    }
    
    res.json({ 
      success: true, 
      data: orders,
      pagination: { page, limit, total, totalPages: Math.ceil(total / limit), hasMore: page * limit < total }
    });
  } catch (error) {
    console.error('Orders error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.get('/api/orders/my', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT * FROM orders WHERE cafeteria_id = $1 ORDER BY created_at DESC`,
      [req.user.id]
    );
    
    const orders = [];
    for (const order of result.rows) {
      const items = await getOrderItems(order.id);
      orders.push({
        id: order.id,
        organizationId: order.organization_id,
        cafeteriaId: order.cafeteria_id,
        date: order.date,
        total: safeParseFloat(order.total),
        status: order.status,
        paymentStatus: order.payment_status || 'unpaid',
        amountPaid: safeParseFloat(order.amount_paid),
        createdAt: order.created_at,
        items
      });
    }
    
    res.json({ success: true, data: orders });
  } catch (error) {
    console.error('My orders error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.post('/api/orders', authenticate, validate(schemas.createOrder), async (req, res) => {
  try {
    const { items } = req.body;
    const clientId = req.user.id;
    
    let total = 0;
    for (const item of items) {
      const product = await pool.query('SELECT price FROM products WHERE id = $1', [item.productId]);
      if (product.rows.length > 0) {
        total += product.rows[0].price * item.quantity;
      }
    }
    
    if (total === 0) {
      return res.status(400).json({ error: 'Aucun produit valide trouvé' });
    }
    
    // Générer numéro de commande séquentiel
    const seqResult = await pool.query(
      `INSERT INTO order_sequences (organization_id, last_number) 
       VALUES ($1, 1) 
       ON CONFLICT (organization_id) 
       DO UPDATE SET last_number = order_sequences.last_number + 1 
       RETURNING last_number`,
      [req.user.organization_id]
    );
    const orderNumber = seqResult.rows[0].last_number;
    
    const orderResult = await pool.query(
      `INSERT INTO orders (organization_id, cafeteria_id, date, total, status, payment_status, amount_paid, order_number) 
       VALUES ($1, $2, NOW(), $3, 'pending', 'unpaid', 0, $4) RETURNING *`,
      [req.user.organization_id, clientId, total, orderNumber]
    );
    
    const order = orderResult.rows[0];
    
    for (const item of items) {
      const product = await pool.query('SELECT price FROM products WHERE id = $1', [item.productId]);
      if (product.rows.length > 0) {
        await pool.query(
          'INSERT INTO order_items (order_id, product_id, quantity, price) VALUES ($1, $2, $3, $4)',
          [order.id, item.productId, item.quantity, product.rows[0].price]
        );
      }
    }
    
    await logAudit('ORDER_CREATED', req.user.id, req.user.organization_id, { orderId: order.id, total }, req);
    
    const orderItems = await getOrderItems(order.id);
    res.json({ success: true, data: { ...order, items: orderItems } });
  } catch (error) {
    console.error('Create order error:', error);
    res.status(500).json({ error: 'Erreur serveur: ' + error.message });
  }
});

app.put('/api/orders/:id', authenticate, validate(schemas.updateOrder), async (req, res) => {
  try {
    const { items } = req.body;
    
    const orderCheck = await pool.query(
      `SELECT * FROM orders WHERE id = $1 AND cafeteria_id = $2 AND status = 'pending'`,
      [req.params.id, req.user.id]
    );
    
    if (orderCheck.rows.length === 0) {
      return res.status(403).json({ error: 'Commande non modifiable' });
    }
    
    await pool.query('DELETE FROM order_items WHERE order_id = $1', [req.params.id]);
    
    let total = 0;
    for (const item of items) {
      const product = await pool.query('SELECT price FROM products WHERE id = $1', [item.productId]);
      if (product.rows.length > 0) {
        const price = product.rows[0].price;
        total += price * item.quantity;
        await pool.query(
          'INSERT INTO order_items (order_id, product_id, quantity, price) VALUES ($1, $2, $3, $4)',
          [req.params.id, item.productId, item.quantity, price]
        );
      }
    }
    
    await pool.query('UPDATE orders SET total = $1, updated_at = NOW() WHERE id = $2', [total, req.params.id]);
    
    await logAudit('ORDER_UPDATED', req.user.id, req.user.organization_id, { orderId: req.params.id, total }, req);
    
    const updatedItems = await getOrderItems(req.params.id);
    res.json({ success: true, data: { id: req.params.id, total, items: updatedItems } });
  } catch (error) {
    console.error('Update order error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.put('/api/orders/:id/lock', authenticate, requireAdmin, async (req, res) => {
  try {
    const orgResult = await pool.query(
      'SELECT kitchen_mode FROM organizations WHERE id = $1',
      [req.user.organization_id]
    );
    
    const kitchenMode = orgResult.rows[0]?.kitchen_mode || false;
    const newStatus = kitchenMode ? 'validated' : 'locked';
    
    await pool.query(
      `UPDATE orders SET status = $1, locked_at = NOW() 
       WHERE id = $2 AND organization_id = $3 AND status = 'pending'`,
      [newStatus, req.params.id, req.user.organization_id]
    );
    
    await logAudit('ORDER_LOCKED', req.user.id, req.user.organization_id, { orderId: req.params.id, newStatus }, req);
    
    res.json({ success: true, status: newStatus });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.post('/api/orders/:id/assign', authenticate, requireAdmin, validate(schemas.assignDeliverer), async (req, res) => {
  try {
    const { delivererId } = req.body;
    
    const orderCheck = await pool.query(
      `SELECT * FROM orders WHERE id = $1 AND organization_id = $2 AND status IN ('locked', 'ready')`,
      [req.params.id, req.user.organization_id]
    );
    
    if (orderCheck.rows.length === 0) {
      return res.status(400).json({ error: 'Commande non prête pour assignation' });
    }
    
    const deliveryResult = await pool.query(
      `INSERT INTO deliveries (organization_id, order_id, deliverer_id, status) 
       VALUES ($1, $2, $3, 'assigned') RETURNING *`,
      [req.user.organization_id, req.params.id, delivererId]
    );
    
    await pool.query(`UPDATE orders SET status = 'in_delivery' WHERE id = $1`, [req.params.id]);
    
    await logAudit('ORDER_ASSIGNED', req.user.id, req.user.organization_id, { orderId: req.params.id, delivererId }, req);
    
    res.json({ success: true, data: deliveryResult.rows[0] });
  } catch (error) {
    console.error('Assign error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});


// ===== ROUTES LIVRAISONS =====

app.get('/api/deliveries', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT d.*, u.name as deliverer_name
       FROM deliveries d
       LEFT JOIN users u ON d.deliverer_id = u.id
       WHERE d.organization_id = $1
       ORDER BY d.created_at DESC`,
      [req.user.organization_id]
    );
    
    const deliveries = [];
    for (const d of result.rows) {
      const order = await getOrderWithItems(d.order_id);
      deliveries.push({
        id: d.id,
        orderId: d.order_id,
        delivererId: d.deliverer_id,
        status: d.status,
        paymentStatus: d.payment_status || 'unpaid',
        amountCollected: safeParseFloat(d.amount_collected),
        comment: d.comment,
        failureReason: d.failure_reason,
        failedAt: d.failed_at,
        postponedTo: d.postponed_to,
        attempts: d.attempts || 0,
        deliveredAt: d.delivered_at,
        createdAt: d.created_at,
        order,
        deliverer: d.deliverer_id ? { id: d.deliverer_id, name: d.deliverer_name } : null
      });
    }
    
    res.json({ success: true, data: deliveries });
  } catch (error) {
    console.error('Deliveries error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.get('/api/deliveries/route', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT d.* FROM deliveries d
       WHERE d.deliverer_id = $1 AND d.status IN ('assigned', 'in_progress', 'postponed')
       ORDER BY CASE WHEN d.status = 'postponed' THEN 1 ELSE 0 END, d.created_at`,
      [req.user.id]
    );
    
    const deliveries = [];
    for (const d of result.rows) {
      const order = await getOrderWithItems(d.order_id);
      deliveries.push({
        id: d.id,
        orderId: d.order_id,
        delivererId: d.deliverer_id,
        status: d.status,
        paymentStatus: d.payment_status || 'unpaid',
        amountCollected: safeParseFloat(d.amount_collected),
        comment: d.comment,
        failureReason: d.failure_reason,
        failedAt: d.failed_at,
        postponedTo: d.postponed_to,
        attempts: d.attempts || 0,
        createdAt: d.created_at,
        order
      });
    }
    
    res.json({ success: true, data: deliveries });
  } catch (error) {
    console.error('Route error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// Historique des livraisons du livreur (terminées)
app.get('/api/deliveries/history', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT d.* FROM deliveries d
       WHERE d.deliverer_id = $1 AND d.status IN ('delivered', 'failed')
       ORDER BY d.delivered_at DESC NULLS LAST, d.created_at DESC
       LIMIT 100`,
      [req.user.id]
    );
    
    const deliveries = [];
    for (const d of result.rows) {
      const order = await getOrderWithItems(d.order_id);
      deliveries.push({
        id: d.id,
        orderId: d.order_id,
        delivererId: d.deliverer_id,
        status: d.status,
        paymentStatus: d.payment_status || 'unpaid',
        amountCollected: safeParseFloat(d.amount_collected),
        comment: d.comment,
        failureReason: d.failure_reason,
        deliveredAt: d.delivered_at,
        createdAt: d.created_at,
        order
      });
    }
    
    res.json({ success: true, data: deliveries });
  } catch (error) {
    console.error('History error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.get('/api/deliveries/:id', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT d.*, u.name as deliverer_name
       FROM deliveries d
       LEFT JOIN users u ON d.deliverer_id = u.id
       WHERE d.id = $1`,
      [req.params.id]
    );
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Livraison non trouvée' });
    }
    
    const d = result.rows[0];
    const order = await getOrderWithItems(d.order_id);
    
    res.json({
      success: true,
      data: {
        id: d.id,
        orderId: d.order_id,
        delivererId: d.deliverer_id,
        status: d.status,
        paymentStatus: d.payment_status || 'unpaid',
        amountCollected: safeParseFloat(d.amount_collected),
        comment: d.comment,
        deliveredAt: d.delivered_at,
        createdAt: d.created_at,
        order,
        deliverer: d.deliverer_id ? { id: d.deliverer_id, name: d.deliverer_name } : null
      }
    });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.put('/api/deliveries/:id/status', authenticate, validate(schemas.updateDeliveryStatus), async (req, res) => {
  try {
    const { status, paymentStatus, amountCollected, comment, failureReason, postponedTo } = req.body;
    
    if (status === 'delivered') {
      await pool.query(
        `UPDATE deliveries SET status = $1, payment_status = $2, amount_collected = $3, comment = $4, delivered_at = NOW() 
         WHERE id = $5 AND deliverer_id = $6`,
        [status, paymentStatus || 'unpaid', amountCollected || 0, comment || null, req.params.id, req.user.id]
      );
      
      const delivery = await pool.query('SELECT order_id FROM deliveries WHERE id = $1', [req.params.id]);
      if (delivery.rows.length > 0) {
        await pool.query(
          `UPDATE orders SET status = 'delivered', payment_status = $1, amount_paid = amount_paid + $2 
           WHERE id = $3`,
          [paymentStatus || 'unpaid', amountCollected || 0, delivery.rows[0].order_id]
        );
      }
      
      await logAudit('DELIVERY_COMPLETED', req.user.id, req.user.organization_id, { deliveryId: req.params.id, amountCollected }, req);
      
    } else if (status === 'failed') {
      await pool.query(
        `UPDATE deliveries SET status = $1, comment = $2, failure_reason = $3, failed_at = NOW(), attempts = COALESCE(attempts, 0) + 1
         WHERE id = $4 AND deliverer_id = $5`,
        [status, comment || null, failureReason || 'other', req.params.id, req.user.id]
      );
      
      const delivery = await pool.query('SELECT order_id FROM deliveries WHERE id = $1', [req.params.id]);
      if (delivery.rows.length > 0) {
        await pool.query(`UPDATE orders SET status = 'locked' WHERE id = $1`, [delivery.rows[0].order_id]);
      }
      
      await logAudit('DELIVERY_FAILED', req.user.id, req.user.organization_id, { deliveryId: req.params.id, failureReason }, req);
      
    } else if (status === 'postponed') {
      await pool.query(
        `UPDATE deliveries SET status = $1, comment = $2, failure_reason = $3, postponed_to = $4, attempts = COALESCE(attempts, 0) + 1
         WHERE id = $5 AND deliverer_id = $6`,
        [status, comment || null, failureReason || 'other', postponedTo || null, req.params.id, req.user.id]
      );
      
      await logAudit('DELIVERY_POSTPONED', req.user.id, req.user.organization_id, { deliveryId: req.params.id, postponedTo }, req);
      
    } else {
      await pool.query(
        'UPDATE deliveries SET status = $1, comment = $2 WHERE id = $3 AND deliverer_id = $4',
        [status, comment || null, req.params.id, req.user.id]
      );
    }
    
    res.json({ success: true });
  } catch (error) {
    console.error('Delivery status error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// ===== ROUTES LOCALISATION LIVREURS =====

app.post('/api/deliverers/location', authenticate, validate(schemas.updateLocation), async (req, res) => {
  try {
    const { latitude, longitude } = req.body;
    
    await pool.query(
      `UPDATE users SET latitude = $1, longitude = $2, location_updated_at = NOW() 
       WHERE id = $3 AND role = 'deliverer'`,
      [latitude, longitude, req.user.id]
    );
    
    res.json({ success: true });
  } catch (error) {
    console.error('Location update error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.get('/api/deliverers/locations', authenticate, requireAdmin, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT id, name, phone, latitude, longitude, location_updated_at
       FROM users 
       WHERE organization_id = $1 AND role = 'deliverer' AND active = true
       AND latitude IS NOT NULL AND longitude IS NOT NULL`,
      [req.user.organization_id]
    );
    
    res.json({ success: true, data: result.rows });
  } catch (error) {
    console.error('Get locations error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.get('/api/deliverers/:id/history', authenticate, async (req, res) => {
  try {
    const { date } = req.query;
    const result = await pool.query(
      `SELECT latitude, longitude, recorded_at
       FROM location_history 
       WHERE deliverer_id = $1 AND DATE(recorded_at) = $2
       ORDER BY recorded_at`,
      [req.params.id, date || new Date().toISOString().split('T')[0]]
    );
    
    res.json({ success: true, data: result.rows });
  } catch (error) {
    console.error('Get history error:', error);
    res.json({ success: true, data: [] });
  }
});

// ===== ROUTES FINANCIÈRES =====

app.get('/api/financial/daily', authenticate, async (req, res) => {
  try {
    const today = new Date().toISOString().split('T')[0];
    const result = await pool.query(
      `SELECT COALESCE(SUM(total), 0) as total_orders, COALESCE(SUM(amount_paid), 0) as total_collected, COUNT(*) as order_count
       FROM orders 
       WHERE organization_id = $1 AND DATE(created_at) = $2`,
      [req.user.organization_id, today]
    );
    res.json({ success: true, data: result.rows[0] });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.get('/api/financial/debts', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT u.id, u.name, u.email, 
              COALESCE(SUM(o.total - o.amount_paid), 0) as debt,
              COUNT(o.id) as order_count,
              MAX(o.created_at) as last_order
       FROM users u
       LEFT JOIN orders o ON u.id = o.cafeteria_id AND o.total > o.amount_paid
       WHERE u.organization_id = $1 AND u.role = 'cafeteria'
       GROUP BY u.id, u.name, u.email
       HAVING COALESCE(SUM(o.total - o.amount_paid), 0) > 0
       ORDER BY debt DESC`,
      [req.user.organization_id]
    );
    res.json({ success: true, data: result.rows });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// ===== ROUTES ORGANISATION SETTINGS =====

app.get('/api/organization/settings', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT id, name, type, kitchen_mode FROM organizations WHERE id = $1',
      [req.user.organization_id]
    );
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Organisation non trouvée' });
    }
    
    const org = result.rows[0];
    res.json({
      success: true,
      data: {
        id: org.id,
        name: org.name,
        type: org.type,
        kitchenMode: org.kitchen_mode || false
      }
    });
  } catch (error) {
    console.error('Get org settings error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.put('/api/organization/settings', authenticate, requireAdmin, validate(schemas.updateOrgSettings), async (req, res) => {
  try {
    const { kitchenMode } = req.body;
    
    await pool.query(
      'UPDATE organizations SET kitchen_mode = $1 WHERE id = $2',
      [kitchenMode || false, req.user.organization_id]
    );
    
    await logAudit('ORG_SETTINGS_UPDATED', req.user.id, req.user.organization_id, { kitchenMode }, req);
    
    res.json({ success: true });
  } catch (error) {
    console.error('Update org settings error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// ===== ROUTES ATELIER (KITCHEN) =====

app.get('/api/orders/kitchen', authenticate, requireKitchen, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT o.*, u.name as cafeteria_name, u.phone as cafeteria_phone
       FROM orders o 
       JOIN users u ON o.cafeteria_id = u.id 
       WHERE o.organization_id = $1 AND o.status IN ('validated', 'preparing')
       ORDER BY 
         CASE WHEN o.status = 'validated' THEN 0 ELSE 1 END,
         o.created_at ASC`,
      [req.user.organization_id]
    );
    
    const orders = [];
    for (const order of result.rows) {
      const items = await getOrderItems(order.id);
      orders.push({
        id: order.id,
        organizationId: order.organization_id,
        cafeteriaId: order.cafeteria_id,
        date: order.date,
        total: safeParseFloat(order.total),
        status: order.status,
        createdAt: order.created_at,
        items,
        cafeteria: { 
          id: order.cafeteria_id, 
          name: order.cafeteria_name,
          phone: order.cafeteria_phone
        }
      });
    }
    
    res.json({ success: true, data: orders });
  } catch (error) {
    console.error('Kitchen orders error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.put('/api/orders/:id/kitchen-status', authenticate, requireKitchen, validate(schemas.kitchenStatus), async (req, res) => {
  try {
    const { status } = req.body;
    
    const orderCheck = await pool.query(
      `SELECT status FROM orders WHERE id = $1 AND organization_id = $2`,
      [req.params.id, req.user.organization_id]
    );
    
    if (orderCheck.rows.length === 0) {
      return res.status(404).json({ error: 'Commande non trouvée' });
    }
    
    const currentStatus = orderCheck.rows[0].status;
    
    if (status === 'preparing' && currentStatus !== 'validated') {
      return res.status(400).json({ error: 'La commande doit être validée pour commencer la préparation' });
    }
    if (status === 'ready' && currentStatus !== 'preparing') {
      return res.status(400).json({ error: 'La commande doit être en préparation pour être marquée prête' });
    }
    
    await pool.query(
      `UPDATE orders SET status = $1, updated_at = NOW() WHERE id = $2`,
      [status, req.params.id]
    );
    
    await logAudit('ORDER_KITCHEN_STATUS', req.user.id, req.user.organization_id, { orderId: req.params.id, status }, req);
    
    res.json({ success: true });
  } catch (error) {
    console.error('Kitchen status error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// ===== ROUTES AUDIT LOGS (Admin) =====

app.get('/api/audit-logs', authenticate, requireAdmin, async (req, res) => {
  try {
    const { limit = 100, offset = 0, action, userId } = req.query;
    
    let query = `
      SELECT al.*, u.name as user_name, u.email as user_email
      FROM audit_logs al
      LEFT JOIN users u ON al.user_id = u.id
      WHERE al.organization_id = $1
    `;
    const params = [req.user.organization_id];
    let paramIndex = 2;
    
    if (action) {
      query += ` AND al.action = $${paramIndex}`;
      params.push(action);
      paramIndex++;
    }
    
    if (userId) {
      query += ` AND al.user_id = $${paramIndex}`;
      params.push(userId);
      paramIndex++;
    }
    
    query += ` ORDER BY al.created_at DESC LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`;
    params.push(parseInt(limit), parseInt(offset));
    
    const result = await pool.query(query, params);
    
    res.json({ success: true, data: result.rows });
  } catch (error) {
    console.error('Audit logs error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});


// ===== ROUTES SUPER ADMIN =====

app.get('/api/super-admin/test', superAdminLimiter, authenticateSuperAdmin, (req, res) => {
  res.json({ success: true, message: 'Super-admin OK' });
});

app.get('/api/super-admin/stats', authenticateSuperAdmin, async (req, res) => {
  try {
    const orgs = await pool.query('SELECT COUNT(*) as count FROM organizations');
    const activeOrgs = await pool.query('SELECT COUNT(*) as count FROM organizations WHERE active = true');
    const users = await pool.query('SELECT COUNT(*) as count FROM users');
    const orders = await pool.query('SELECT COUNT(*) as count FROM orders');
    
    res.json({
      success: true,
      data: {
        totalOrganizations: parseInt(orgs.rows[0].count),
        activeOrganizations: parseInt(activeOrgs.rows[0].count),
        totalUsers: parseInt(users.rows[0].count),
        totalOrders: parseInt(orders.rows[0].count)
      }
    });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.get('/api/super-admin/organizations', authenticateSuperAdmin, async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM organizations ORDER BY created_at DESC');
    res.json({ success: true, data: result.rows });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.post('/api/super-admin/organizations', authenticateSuperAdmin, validate(schemas.createOrganization), async (req, res) => {
  try {
    const { name, type, adminEmail, adminPassword, adminName, adminPhone } = req.body;
    
    const orgResult = await pool.query(
      'INSERT INTO organizations (name, type) VALUES ($1, $2) RETURNING *',
      [name, type || 'restaurant']
    );
    const org = orgResult.rows[0];
    
    const hashedPassword = await bcrypt.hash(adminPassword, 12);
    await pool.query(
      'INSERT INTO users (organization_id, email, password, name, phone, role) VALUES ($1, $2, $3, $4, $5, $6)',
      [org.id, adminEmail.trim().toLowerCase(), hashedPassword, adminName, adminPhone || '', 'admin']
    );
    
    await logAudit('ORG_CREATED', null, org.id, { name, adminEmail }, req);
    
    res.json({ success: true, data: org });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur', details: error.message });
  }
});

app.delete('/api/super-admin/organizations/:id', authenticateSuperAdmin, async (req, res) => {
  try {
    // Supprimer les refresh tokens des utilisateurs de cette org
    await pool.query(`
      DELETE FROM refresh_tokens WHERE user_id IN (
        SELECT id FROM users WHERE organization_id = $1
      )
    `, [req.params.id]);
    
    // Supprimer les audit logs
    await pool.query('DELETE FROM audit_logs WHERE organization_id = $1', [req.params.id]);
    
    // Supprimer les order_items
    await pool.query(`
      DELETE FROM order_items WHERE order_id IN (
        SELECT id FROM orders WHERE organization_id = $1
      )
    `, [req.params.id]);
    
    // Supprimer les livraisons
    await pool.query('DELETE FROM deliveries WHERE organization_id = $1', [req.params.id]);
    
    // Supprimer les commandes
    await pool.query('DELETE FROM orders WHERE organization_id = $1', [req.params.id]);
    
    // Supprimer les produits
    await pool.query('DELETE FROM products WHERE organization_id = $1', [req.params.id]);
    
    // Supprimer les utilisateurs
    await pool.query('DELETE FROM users WHERE organization_id = $1', [req.params.id]);
    
    // Supprimer l'organisation
    await pool.query('DELETE FROM organizations WHERE id = $1', [req.params.id]);
    
    res.json({ success: true });
  } catch (error) {
    console.error('Delete org error:', error);
    res.status(500).json({ error: 'Erreur serveur: ' + error.message });
  }
});

app.get('/api/super-admin/users', authenticateSuperAdmin, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT u.id, u.email, u.name, u.phone, u.role, u.active, u.created_at, 
              o.name as organization_name, o.id as organization_id
       FROM users u 
       JOIN organizations o ON u.organization_id = o.id 
       ORDER BY u.created_at DESC`
    );
    res.json({ success: true, data: result.rows });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

app.patch('/api/super-admin/organizations/:id/status', authenticateSuperAdmin, validate(schemas.toggleOrgStatus), async (req, res) => {
  try {
    const { active } = req.body;
    await pool.query('UPDATE organizations SET active = $1 WHERE id = $2', [active, req.params.id]);
    await pool.query('UPDATE users SET active = $1 WHERE organization_id = $2', [active, req.params.id]);
    
    // Révoquer tous les tokens si désactivation
    if (!active) {
      await pool.query(`
        UPDATE refresh_tokens SET revoked = true WHERE user_id IN (
          SELECT id FROM users WHERE organization_id = $1
        )
      `, [req.params.id]);
    }
    
    await logAudit('ORG_STATUS_CHANGED', null, req.params.id, { active }, req);
    
    res.json({ success: true });
  } catch (error) {
    console.error('Toggle org status error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// Super Admin Audit Logs
app.get('/api/super-admin/audit-logs', authenticateSuperAdmin, async (req, res) => {
  try {
    const { limit = 200, offset = 0 } = req.query;
    
    const result = await pool.query(
      `SELECT al.*, u.name as user_name, u.email as user_email, o.name as org_name
       FROM audit_logs al
       LEFT JOIN users u ON al.user_id = u.id
       LEFT JOIN organizations o ON al.organization_id = o.id
       ORDER BY al.created_at DESC
       LIMIT $1 OFFSET $2`,
      [parseInt(limit), parseInt(offset)]
    );
    
    res.json({ success: true, data: result.rows });
  } catch (error) {
    console.error('Super admin audit logs error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// Page Super Admin HTML
app.get('/api/admin', (req, res) => {
  res.send(`<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Super Admin - Awid</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #1a1a2e; color: #fff; padding: 20px; }
        .container { max-width: 1200px; margin: 0 auto; }
        h1 { color: #2E7D32; margin-bottom: 20px; }
        h2 { color: #2E7D32; margin-bottom: 15px; }
        .card { background: #16213e; border-radius: 10px; padding: 20px; margin-bottom: 20px; }
        .stats { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin-top: 15px; }
        .stat-box { background: #0f3460; padding: 20px; border-radius: 8px; text-align: center; }
        .stat-box h3 { color: #2E7D32; font-size: 2em; }
        .stat-box p { color: #aaa; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #0f3460; }
        th { background: #0f3460; color: #2E7D32; }
        tr:hover { background: #0f3460; }
        .btn { padding: 8px 16px; border: none; border-radius: 5px; cursor: pointer; margin: 2px; }
        .btn-danger { background: #e94560; color: #fff; }
        .btn-success { background: #2E7D32; color: #fff; }
        .btn-warning { background: #f39c12; color: #000; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; color: #aaa; }
        .form-group input { width: 100%; padding: 10px; border: 1px solid #0f3460; border-radius: 5px; background: #1a1a2e; color: #fff; }
        .tabs { display: flex; gap: 10px; margin-bottom: 20px; flex-wrap: wrap; }
        .tab { padding: 10px 20px; background: #0f3460; border: none; color: #fff; cursor: pointer; border-radius: 5px; }
        .tab.active { background: #2E7D32; color: #fff; }
        .hidden { display: none; }
        .status-active { color: #00ff00; }
        .status-inactive { color: #ff0000; }
        .error { color: #e94560; padding: 10px; background: #2a1a2e; border-radius: 5px; margin: 10px 0; }
        #login-section { max-width: 400px; margin: 50px auto; }
        #main-content { display: none; }
        .log-entry { padding: 8px; border-bottom: 1px solid #0f3460; font-size: 0.9em; }
        .log-entry:hover { background: #0f3460; }
        .log-action { color: #2E7D32; font-weight: bold; }
        .log-time { color: #888; font-size: 0.85em; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🌿 Awid - Super Admin</h1>
        
        <div id="login-section" class="card">
            <h2>Authentification</h2>
            <form id="login-form">
                <div class="form-group">
                    <label>Cle Super Admin</label>
                    <input type="password" id="admin-key" required placeholder="Entrez votre cle secrete">
                </div>
                <button type="submit" class="btn btn-success" style="width:100%">Se connecter</button>
                <p id="login-error" class="error hidden"></p>
            </form>
        </div>
        
        <div id="main-content">
            <div class="tabs">
                <button class="tab active" onclick="showTab('stats')">Stats</button>
                <button class="tab" onclick="showTab('orgs')">Organisations</button>
                <button class="tab" onclick="showTab('users')">Utilisateurs</button>
                <button class="tab" onclick="showTab('logs')">Audit Logs</button>
                <button class="tab" onclick="showTab('create')">Creer Organisation</button>
                <button class="btn btn-danger" onclick="logout()" style="margin-left:auto">Deconnexion</button>
            </div>

            <div id="stats" class="card">
                <h2>Statistiques Globales</h2>
                <div id="stats-content" class="stats"></div>
            </div>

            <div id="orgs" class="card hidden">
                <h2>Organisations</h2>
                <table>
                    <thead><tr><th>ID</th><th>Nom</th><th>Type</th><th>Statut</th><th>Actions</th></tr></thead>
                    <tbody id="orgs-table"></tbody>
                </table>
            </div>

            <div id="users" class="card hidden">
                <h2>Tous les Utilisateurs</h2>
                <table>
                    <thead><tr><th>Nom</th><th>Email</th><th>Role</th><th>Organisation</th><th>Statut</th></tr></thead>
                    <tbody id="users-table"></tbody>
                </table>
            </div>

            <div id="logs" class="card hidden">
                <h2>Audit Logs (derniers 100)</h2>
                <div id="logs-content"></div>
            </div>

            <div id="create" class="card hidden">
                <h2>Creer une Organisation</h2>
                <form id="create-form">
                    <div class="form-group"><label>Nom organisation</label><input type="text" id="org-name" required></div>
                    <div class="form-group"><label>Type</label><input type="text" id="org-type" value="restaurant"></div>
                    <div class="form-group"><label>Email Admin</label><input type="email" id="admin-email" required></div>
                    <div class="form-group"><label>Mot de passe Admin (min 6 car.)</label><input type="password" id="admin-password" required minlength="6"></div>
                    <div class="form-group"><label>Nom Admin</label><input type="text" id="admin-name" required></div>
                    <div class="form-group"><label>Telephone</label><input type="text" id="admin-phone"></div>
                    <button type="submit" class="btn btn-success">Creer</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        const API = '/api';
        let KEY = '';
        function getHeaders() { return { 'Content-Type': 'application/json', 'x-super-admin-key': KEY }; }

        document.getElementById('login-form').onsubmit = async function(e) {
            e.preventDefault();
            KEY = document.getElementById('admin-key').value;
            try {
                const res = await fetch(API + '/super-admin/test', { headers: getHeaders() });
                const data = await res.json();
                if (data.success) {
                    sessionStorage.setItem('superAdminKey', KEY);
                    document.getElementById('login-section').style.display = 'none';
                    document.getElementById('main-content').style.display = 'block';
                    loadStats(); loadOrgs(); loadUsers(); loadLogs();
                } else {
                    document.getElementById('login-error').textContent = 'Cle invalide';
                    document.getElementById('login-error').classList.remove('hidden');
                }
            } catch (err) {
                document.getElementById('login-error').textContent = 'Erreur connexion';
                document.getElementById('login-error').classList.remove('hidden');
            }
        };

        function logout() {
            sessionStorage.removeItem('superAdminKey');
            KEY = '';
            document.getElementById('login-section').style.display = 'block';
            document.getElementById('main-content').style.display = 'none';
        }

        function checkAuth() {
            const saved = sessionStorage.getItem('superAdminKey');
            if (saved) { KEY = saved; document.getElementById('login-section').style.display = 'none'; document.getElementById('main-content').style.display = 'block'; loadStats(); loadOrgs(); loadUsers(); loadLogs(); }
        }

        async function fetchAPI(endpoint) {
            const res = await fetch(API + endpoint, { headers: getHeaders() });
            if (res.status === 403) { logout(); return { success: false }; }
            return res.json();
        }

        function escapeHtml(t) { if (!t) return ''; return String(t).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;'); }

        async function loadStats() {
            const data = await fetchAPI('/super-admin/stats');
            if (data.success) {
                document.getElementById('stats-content').innerHTML = '<div class="stat-box"><h3>'+data.data.totalOrganizations+'</h3><p>Organisations</p></div><div class="stat-box"><h3>'+data.data.activeOrganizations+'</h3><p>Actives</p></div><div class="stat-box"><h3>'+data.data.totalUsers+'</h3><p>Utilisateurs</p></div><div class="stat-box"><h3>'+data.data.totalOrders+'</h3><p>Commandes</p></div>';
            }
        }

        async function loadOrgs() {
            const data = await fetchAPI('/super-admin/organizations');
            if (data.success && data.data.length > 0) {
                document.getElementById('orgs-table').innerHTML = data.data.map(function(o) {
                    return '<tr><td>'+escapeHtml(o.id).substring(0,8)+'...</td><td>'+escapeHtml(o.name)+'</td><td>'+escapeHtml(o.type)+'</td><td class="'+(o.active?'status-active':'status-inactive')+'">'+(o.active?'Actif':'Inactif')+'</td><td><button class="btn btn-warning" onclick="toggleOrg(\\''+o.id+'\\','+(!o.active)+')">'+(o.active?'Desactiver':'Activer')+'</button> <button class="btn btn-danger" onclick="deleteOrg(\\''+o.id+'\\')">Supprimer</button></td></tr>';
                }).join('');
            } else { document.getElementById('orgs-table').innerHTML = '<tr><td colspan="5">Aucune organisation</td></tr>'; }
        }

        async function loadUsers() {
            const data = await fetchAPI('/super-admin/users');
            if (data.success && data.data.length > 0) {
                document.getElementById('users-table').innerHTML = data.data.map(function(u) {
                    return '<tr><td>'+escapeHtml(u.name)+'</td><td>'+escapeHtml(u.email)+'</td><td>'+escapeHtml(u.role)+'</td><td>'+escapeHtml(u.organization_name)+'</td><td class="'+(u.active?'status-active':'status-inactive')+'">'+(u.active?'Actif':'Inactif')+'</td></tr>';
                }).join('');
            } else { document.getElementById('users-table').innerHTML = '<tr><td colspan="5">Aucun utilisateur</td></tr>'; }
        }

        async function loadLogs() {
            const data = await fetchAPI('/super-admin/audit-logs?limit=100');
            if (data.success && data.data.length > 0) {
                document.getElementById('logs-content').innerHTML = data.data.map(function(l) {
                    const date = new Date(l.created_at).toLocaleString('fr-FR');
                    return '<div class="log-entry"><span class="log-action">'+escapeHtml(l.action)+'</span> - '+(l.user_name || 'System')+' ('+(l.org_name || 'N/A')+') <span class="log-time">'+date+'</span></div>';
                }).join('');
            } else { document.getElementById('logs-content').innerHTML = '<p>Aucun log</p>'; }
        }

        async function toggleOrg(id, active) {
            try {
                const res = await fetch(API + '/super-admin/organizations/' + id + '/status', { method: 'PATCH', headers: getHeaders(), body: JSON.stringify({ active: active }) });
                const data = await res.json();
                if (!data.success) alert('Erreur: ' + (data.error || 'Echec'));
                loadOrgs(); loadStats(); loadLogs();
            } catch(e) { alert('Erreur: ' + e.message); }
        }

        async function deleteOrg(id) {
            if (confirm('Supprimer cette organisation et toutes ses donnees ?')) {
                try {
                    const res = await fetch(API + '/super-admin/organizations/' + id, { method: 'DELETE', headers: getHeaders() });
                    const data = await res.json();
                    if (!data.success) alert('Erreur: ' + (data.error || 'Echec'));
                    loadOrgs(); loadUsers(); loadStats(); loadLogs();
                } catch(e) { alert('Erreur: ' + e.message); }
            }
        }

        document.getElementById('create-form').onsubmit = async function(e) {
            e.preventDefault();
            var body = { name: document.getElementById('org-name').value, type: document.getElementById('org-type').value, adminEmail: document.getElementById('admin-email').value, adminPassword: document.getElementById('admin-password').value, adminName: document.getElementById('admin-name').value, adminPhone: document.getElementById('admin-phone').value };
            var res = await fetch(API + '/super-admin/organizations', { method: 'POST', headers: getHeaders(), body: JSON.stringify(body) });
            var data = await res.json();
            if (data.success) { alert('Organisation creee !'); e.target.reset(); loadOrgs(); loadStats(); loadLogs(); }
            else alert('Erreur: ' + (data.error || 'Inconnue'));
        };

        function showTab(tab) {
            document.querySelectorAll('#main-content .card').forEach(function(c) { c.classList.add('hidden'); });
            document.querySelectorAll('.tab').forEach(function(t) { t.classList.remove('active'); });
            document.getElementById(tab).classList.remove('hidden');
            event.target.classList.add('active');
        }

        checkAuth();
    </script>
</body>
</html>`);
});

// Export pour Vercel
module.exports = app;
