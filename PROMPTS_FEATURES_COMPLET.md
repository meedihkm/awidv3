# 🚀 AWID - PACK FEATURES BUSINESS COMPLET

## INSTRUCTIONS IMPORTANTES POUR L'AGENT IA

```
⚠️ LIS ATTENTIVEMENT AVANT DE COMMENCER

1. ORDRE OBLIGATOIRE : Feature 1 → 2 → 3 → 4 (ne pas sauter)
2. VALIDATION : Après chaque feature, attendre confirmation avant de continuer
3. INTÉGRATION : Chaque feature doit s'intégrer dans le code EXISTANT, pas le remplacer
4. COHÉRENCE : Utiliser les mêmes patterns, nommages et styles que le code existant
5. TESTS : Chaque feature doit inclure ses tests
6. MIGRATIONS : Les migrations SQL doivent être numérotées séquentiellement

AVANT DE CODER, pour chaque feature :
□ Lire le prompt en entier
□ Vérifier les fichiers existants concernés
□ Identifier les dépendances
□ Planifier les modifications
□ Coder
□ Tester
□ Valider avec l'utilisateur
```

---

## CONTEXTE PROJET AWID

```
APPLICATION : AWID - Gestion de livraison B2B (Algérie)

STACK :
- Backend : Node.js + Express (api-v2/)
- Mobile : Flutter (mobile/)
- Base de données : PostgreSQL
- Cache : Redis
- Notifications : OneSignal

STRUCTURE EXISTANTE :

api-v2/
├── config/
│   ├── database.js
│   ├── redis.js
│   └── cors.js
├── routes/
│   ├── auth.routes.js
│   ├── orders.routes.js
│   ├── deliveries.routes.js
│   └── users.routes.js
├── services/
│   ├── order.service.js
│   ├── notification.service.js
│   └── audit.service.js
├── middleware/
│   ├── auth.middleware.js
│   └── validate.middleware.js
└── migrations/

mobile/lib/
├── core/
│   ├── models/
│   ├── services/
│   ├── providers/
│   └── widgets/
├── features/
│   ├── admin/
│   ├── cafeteria/
│   ├── deliverer/
│   └── kitchen/
└── l10n/

CONVENTIONS :
- Backend : camelCase pour variables, snake_case pour DB
- Mobile : camelCase partout
- Fichiers : snake_case.dart, camelCase.js
- API REST : /api/resource (pluriel)

USERS & ROLES :
- admin : Gestionnaire de l'organisation
- deliverer : Livreur
- cafeteria : Client (passe les commandes)
- kitchen : Cuisine/Préparation

TABLES EXISTANTES IMPORTANTES :
- organizations : Les entreprises utilisant AWID
- users : Tous les utilisateurs (avec role et organization_id)
- orders : Commandes
- order_items : Détail des commandes
- deliveries : Livraisons
- products : Produits
- audit_logs : Historique des actions
```

---

# 📋 PLAN D'EXÉCUTION

| # | Feature | Dépend de | Complexité | Temps estimé |
|---|---------|-----------|------------|--------------|
| 1 | 💰 Gestion Dette | - | ⭐⭐ | 2-3h |
| 2 | ⚠️ Limite Crédit | Feature 1 | ⭐ | 1h |
| 3 | 📦 Consignes | - | ⭐⭐ | 2h |
| 4 | 🔄 Commandes Récurrentes | - | ⭐⭐⭐ | 3-4h |

---

# ═══════════════════════════════════════════════════════════════
# FEATURE 1 : 💰 GESTION FLEXIBLE DE LA DETTE
# ═══════════════════════════════════════════════════════════════

```
CONTEXTE MÉTIER :
En Algérie, le B2B fonctionne sur la confiance. Les clients accumulent des dettes 
et les règlent de manière flexible :
- Certains paient à chaque livraison
- Certains accumulent et paient tout d'un coup
- Certains paient une partie quand ils peuvent

La dette peut être collectée par :
- Le LIVREUR (lors d'une livraison ou passage dédié)
- L'ADMIN (directement au dépôt/bureau)

OBJECTIF :
Permettre la collecte flexible de dette (tout ou partie) par admin ou livreur,
avec historique complet et mise à jour automatique des commandes.
```

## 1.1 MIGRATION BASE DE DONNÉES

**Fichier : `api-v2/migrations/004_add_debt_management.sql`**

```sql
-- =====================================================
-- MIGRATION : Gestion de la dette
-- =====================================================

-- 1. Ajouter colonnes à la table orders (si pas présentes)
ALTER TABLE orders ADD COLUMN IF NOT EXISTS amount_paid DECIMAL(10,2) DEFAULT 0;
ALTER TABLE orders ADD COLUMN IF NOT EXISTS payment_status VARCHAR(20) DEFAULT 'unpaid';
-- payment_status : 'unpaid', 'partial', 'paid'

-- Mettre à jour les commandes existantes
UPDATE orders SET payment_status = 'paid' WHERE amount_paid >= total;
UPDATE orders SET payment_status = 'partial' WHERE amount_paid > 0 AND amount_paid < total;

-- 2. Table des paiements de dette
CREATE TABLE IF NOT EXISTS debt_payments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  customer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  
  -- Montant et type
  amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
  payment_type VARCHAR(20) NOT NULL DEFAULT 'cash',
  -- 'cash', 'check', 'transfer', 'other'
  
  -- Qui a collecté
  collected_by UUID NOT NULL REFERENCES users(id),
  collector_role VARCHAR(20) NOT NULL,
  -- 'admin', 'deliverer'
  
  -- Contexte (optionnel - si collecté lors d'une livraison)
  delivery_id UUID REFERENCES deliveries(id) ON DELETE SET NULL,
  
  -- Métadonnées
  note TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  -- Contraintes
  CONSTRAINT valid_payment_type CHECK (payment_type IN ('cash', 'check', 'transfer', 'other')),
  CONSTRAINT valid_collector_role CHECK (collector_role IN ('admin', 'deliverer'))
);

-- Index pour performance
CREATE INDEX IF NOT EXISTS idx_debt_payments_customer ON debt_payments(customer_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_debt_payments_org ON debt_payments(organization_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_debt_payments_collector ON debt_payments(collected_by, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_debt_payments_delivery ON debt_payments(delivery_id);

-- Index sur orders pour calcul dette
CREATE INDEX IF NOT EXISTS idx_orders_customer_payment ON orders(customer_id, payment_status, organization_id);
```

## 1.2 SERVICE BACKEND

**Fichier : `api-v2/services/debt.service.js`**

```javascript
// =====================================================
// SERVICE : Gestion de la dette
// =====================================================

const db = require('../config/database');
const auditService = require('./audit.service');
const notificationService = require('./notification.service');
const logger = require('../config/logger');

class DebtService {
  
  /**
   * Récupérer la dette totale d'un client
   * @param {string} customerId 
   * @param {string} organizationId 
   * @returns {Promise<Object>} Détails de la dette
   */
  async getCustomerDebt(customerId, organizationId) {
    const result = await db.query(`
      SELECT 
        u.id as customer_id,
        u.name as customer_name,
        u.phone as customer_phone,
        COALESCE(SUM(o.total) - SUM(o.amount_paid), 0)::numeric as total_debt,
        COUNT(*) FILTER (WHERE o.payment_status != 'paid') as unpaid_orders,
        MAX(o.created_at) as last_order_date
      FROM users u
      LEFT JOIN orders o ON u.id = o.customer_id 
        AND o.organization_id = $2 
        AND o.status != 'cancelled'
      WHERE u.id = $1
      GROUP BY u.id, u.name, u.phone
    `, [customerId, organizationId]);
    
    if (result.rows.length === 0) {
      return null;
    }
    
    // Récupérer dernier paiement
    const lastPayment = await db.query(`
      SELECT created_at, amount 
      FROM debt_payments 
      WHERE customer_id = $1 AND organization_id = $2
      ORDER BY created_at DESC 
      LIMIT 1
    `, [customerId, organizationId]);
    
    return {
      ...result.rows[0],
      total_debt: parseFloat(result.rows[0].total_debt) || 0,
      last_payment_date: lastPayment.rows[0]?.created_at || null,
      last_payment_amount: lastPayment.rows[0]?.amount || null
    };
  }

  /**
   * Liste des clients avec dette > 0
   * @param {string} organizationId 
   * @param {Object} options - { sort, minDebt, page, limit }
   * @returns {Promise<Object>} { data, summary, pagination }
   */
  async getCustomersWithDebt(organizationId, options = {}) {
    const { 
      sort = 'amount_desc', 
      minDebt = 0,
      page = 1,
      limit = 50 
    } = options;
    
    const offset = (page - 1) * limit;
    const orderBy = sort === 'amount_desc' ? 'total_debt DESC' : 
                    sort === 'amount_asc' ? 'total_debt ASC' :
                    sort === 'name' ? 'u.name ASC' : 'total_debt DESC';
    
    // Données paginées
    const result = await db.query(`
      SELECT 
        u.id as customer_id,
        u.name,
        u.phone,
        COALESCE(SUM(o.total) - SUM(o.amount_paid), 0)::numeric as total_debt,
        COUNT(*) FILTER (WHERE o.payment_status != 'paid') as unpaid_orders,
        MAX(o.created_at) as last_order_date
      FROM users u
      LEFT JOIN orders o ON u.id = o.customer_id 
        AND o.organization_id = $1 
        AND o.status != 'cancelled'
      WHERE u.organization_id = $1 
        AND u.role = 'cafeteria'
        AND u.is_active = true
      GROUP BY u.id, u.name, u.phone
      HAVING COALESCE(SUM(o.total) - SUM(o.amount_paid), 0) >= $2
      ORDER BY ${orderBy}
      LIMIT $3 OFFSET $4
    `, [organizationId, minDebt, limit, offset]);
    
    // Total pour pagination
    const countResult = await db.query(`
      SELECT COUNT(DISTINCT u.id) as total
      FROM users u
      LEFT JOIN orders o ON u.id = o.customer_id 
        AND o.organization_id = $1 
        AND o.status != 'cancelled'
      WHERE u.organization_id = $1 
        AND u.role = 'cafeteria'
        AND u.is_active = true
      GROUP BY u.id
      HAVING COALESCE(SUM(o.total) - SUM(o.amount_paid), 0) >= $2
    `, [organizationId, minDebt]);
    
    // Résumé global
    const summaryResult = await db.query(`
      SELECT 
        COUNT(DISTINCT o.customer_id) as total_customers_with_debt,
        COALESCE(SUM(o.total) - SUM(o.amount_paid), 0)::numeric as total_debt_amount
      FROM orders o
      WHERE o.organization_id = $1 
        AND o.payment_status != 'paid'
        AND o.status != 'cancelled'
    `, [organizationId]);
    
    const total = countResult.rows.length;
    
    return {
      data: result.rows.map(r => ({
        ...r,
        total_debt: parseFloat(r.total_debt) || 0
      })),
      summary: {
        total_customers_with_debt: parseInt(summaryResult.rows[0]?.total_customers_with_debt) || 0,
        total_debt_amount: parseFloat(summaryResult.rows[0]?.total_debt_amount) || 0
      },
      pagination: {
        page,
        limit,
        total,
        totalPages: Math.ceil(total / limit),
        hasNext: page * limit < total,
        hasPrev: page > 1
      }
    };
  }

  /**
   * Enregistrer un paiement de dette
   * @param {Object} data - { customer_id, amount, payment_type, delivery_id?, note? }
   * @param {string} collectorId - ID de celui qui collecte
   * @param {string} collectorRole - 'admin' ou 'deliverer'
   * @param {string} organizationId 
   * @returns {Promise<Object>} Paiement créé + nouvelle dette
   */
  async recordDebtPayment(data, collectorId, collectorRole, organizationId) {
    const { customer_id, amount, payment_type = 'cash', delivery_id, note } = data;
    
    // Validation
    if (!customer_id || !amount || amount <= 0) {
      throw new Error('customer_id et amount (> 0) sont requis');
    }
    
    // Vérifier que le client existe et a une dette
    const debt = await this.getCustomerDebt(customer_id, organizationId);
    if (!debt) {
      throw new Error('Client non trouvé');
    }
    
    if (debt.total_debt <= 0) {
      throw new Error('Ce client n\'a pas de dette');
    }
    
    if (amount > debt.total_debt) {
      throw new Error(`Montant supérieur à la dette (${debt.total_debt.toFixed(2)} DA)`);
    }
    
    // Transaction pour atomicité
    const client = await db.getClient();
    
    try {
      await client.query('BEGIN');
      
      // 1. Créer le paiement
      const paymentResult = await client.query(`
        INSERT INTO debt_payments 
          (organization_id, customer_id, amount, payment_type, collected_by, collector_role, delivery_id, note)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
        RETURNING *
      `, [organizationId, customer_id, amount, payment_type, collectorId, collectorRole, delivery_id, note]);
      
      const payment = paymentResult.rows[0];
      
      // 2. Appliquer le paiement aux commandes (FIFO)
      await this.applyPaymentToOrders(client, customer_id, amount, organizationId);
      
      await client.query('COMMIT');
      
      // 3. Récupérer nouvelle dette
      const newDebt = await this.getCustomerDebt(customer_id, organizationId);
      
      // 4. Audit log
      await auditService.log({
        action: 'DEBT_PAYMENT_RECORDED',
        user_id: collectorId,
        organization_id: organizationId,
        entity_type: 'debt_payment',
        entity_id: payment.id,
        details: {
          customer_id,
          amount,
          payment_type,
          delivery_id,
          previous_debt: debt.total_debt,
          new_debt: newDebt.total_debt
        }
      });
      
      // 5. Notification à l'admin (si collecté par livreur)
      if (collectorRole === 'deliverer') {
        const collector = await db.query('SELECT name FROM users WHERE id = $1', [collectorId]);
        await notificationService.sendToRole('admin', organizationId, {
          title: 'Paiement dette reçu',
          message: `${amount.toFixed(0)} DA reçus de ${debt.customer_name} par ${collector.rows[0]?.name || 'Livreur'}`,
          data: { 
            type: 'debt_payment', 
            customer_id, 
            payment_id: payment.id 
          }
        });
      }
      
      logger.info('Debt payment recorded', { 
        paymentId: payment.id, 
        customerId: customer_id, 
        amount,
        collectorId 
      });
      
      return {
        payment,
        previous_debt: debt.total_debt,
        new_debt: newDebt.total_debt,
        customer_name: debt.customer_name
      };
      
    } catch (error) {
      await client.query('ROLLBACK');
      logger.error('Error recording debt payment', { error: error.message, data });
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Appliquer un paiement aux commandes (FIFO - plus anciennes d'abord)
   * @private
   */
  async applyPaymentToOrders(client, customerId, amount, organizationId) {
    let remaining = parseFloat(amount);
    
    // Récupérer commandes non payées, plus anciennes d'abord
    const orders = await client.query(`
      SELECT id, total, amount_paid, (total - amount_paid) as due
      FROM orders
      WHERE customer_id = $1 
        AND organization_id = $2 
        AND payment_status != 'paid'
        AND status != 'cancelled'
      ORDER BY created_at ASC
    `, [customerId, organizationId]);
    
    for (const order of orders.rows) {
      if (remaining <= 0) break;
      
      const due = parseFloat(order.due);
      const toApply = Math.min(remaining, due);
      const newAmountPaid = parseFloat(order.amount_paid) + toApply;
      const newStatus = newAmountPaid >= parseFloat(order.total) ? 'paid' : 'partial';
      
      await client.query(`
        UPDATE orders 
        SET amount_paid = $1, payment_status = $2, updated_at = NOW()
        WHERE id = $3
      `, [newAmountPaid, newStatus, order.id]);
      
      remaining -= toApply;
      
      logger.debug('Applied payment to order', { 
        orderId: order.id, 
        applied: toApply, 
        newStatus 
      });
    }
  }

  /**
   * Historique des paiements
   * @param {string} organizationId 
   * @param {Object} options - { customer_id?, collector_id?, from?, to?, page, limit }
   */
  async getPaymentHistory(organizationId, options = {}) {
    const { 
      customer_id, 
      collector_id, 
      from, 
      to, 
      page = 1, 
      limit = 50 
    } = options;
    
    const offset = (page - 1) * limit;
    const conditions = ['dp.organization_id = $1'];
    const params = [organizationId];
    let paramIndex = 2;
    
    if (customer_id) {
      conditions.push(`dp.customer_id = $${paramIndex++}`);
      params.push(customer_id);
    }
    
    if (collector_id) {
      conditions.push(`dp.collected_by = $${paramIndex++}`);
      params.push(collector_id);
    }
    
    if (from) {
      conditions.push(`dp.created_at >= $${paramIndex++}`);
      params.push(from);
    }
    
    if (to) {
      conditions.push(`dp.created_at <= $${paramIndex++}`);
      params.push(to);
    }
    
    const whereClause = conditions.join(' AND ');
    
    const result = await db.query(`
      SELECT 
        dp.*,
        c.name as customer_name,
        col.name as collector_name
      FROM debt_payments dp
      JOIN users c ON dp.customer_id = c.id
      JOIN users col ON dp.collected_by = col.id
      WHERE ${whereClause}
      ORDER BY dp.created_at DESC
      LIMIT $${paramIndex++} OFFSET $${paramIndex}
    `, [...params, limit, offset]);
    
    // Count total
    const countResult = await db.query(`
      SELECT COUNT(*) as total FROM debt_payments dp WHERE ${whereClause}
    `, params);
    
    const total = parseInt(countResult.rows[0].total);
    
    return {
      data: result.rows,
      pagination: {
        page,
        limit,
        total,
        totalPages: Math.ceil(total / limit),
        hasNext: page * limit < total,
        hasPrev: page > 1
      }
    };
  }

  /**
   * Commandes impayées d'un client (pour détail)
   */
  async getUnpaidOrders(customerId, organizationId) {
    const result = await db.query(`
      SELECT 
        id, 
        created_at, 
        total, 
        amount_paid, 
        (total - amount_paid) as due,
        payment_status
      FROM orders
      WHERE customer_id = $1 
        AND organization_id = $2 
        AND payment_status != 'paid'
        AND status != 'cancelled'
      ORDER BY created_at ASC
    `, [customerId, organizationId]);
    
    return result.rows;
  }
}

module.exports = new DebtService();
```

## 1.3 ROUTES BACKEND

**Fichier : `api-v2/routes/debt.routes.js`**

```javascript
// =====================================================
// ROUTES : Gestion de la dette
// =====================================================

const router = require('express').Router();
const debtService = require('../services/debt.service');
const { authenticate, authorize } = require('../middleware/auth.middleware');
const { validate } = require('../middleware/validate.middleware');
const Joi = require('joi');

// Tous les endpoints nécessitent authentification
router.use(authenticate);

// ─────────────────────────────────────────────────────
// GET /api/customers/:id/debt - Dette d'un client spécifique
// Accessible par : admin, deliverer
// ─────────────────────────────────────────────────────
router.get('/customers/:id/debt', 
  authorize(['admin', 'deliverer']),
  async (req, res, next) => {
    try {
      const debt = await debtService.getCustomerDebt(
        req.params.id,
        req.user.organization_id
      );
      
      if (!debt) {
        return res.status(404).json({ error: 'Client non trouvé' });
      }
      
      res.json(debt);
    } catch (error) {
      next(error);
    }
  }
);

// ─────────────────────────────────────────────────────
// GET /api/customers/:id/unpaid-orders - Commandes impayées d'un client
// Accessible par : admin
// ─────────────────────────────────────────────────────
router.get('/customers/:id/unpaid-orders',
  authorize(['admin']),
  async (req, res, next) => {
    try {
      const orders = await debtService.getUnpaidOrders(
        req.params.id,
        req.user.organization_id
      );
      res.json(orders);
    } catch (error) {
      next(error);
    }
  }
);

// ─────────────────────────────────────────────────────
// GET /api/debts - Liste tous les clients avec dette
// Accessible par : admin
// ─────────────────────────────────────────────────────
router.get('/debts',
  authorize(['admin']),
  async (req, res, next) => {
    try {
      const result = await debtService.getCustomersWithDebt(
        req.user.organization_id,
        {
          sort: req.query.sort,
          minDebt: parseFloat(req.query.min_debt) || 0,
          page: parseInt(req.query.page) || 1,
          limit: parseInt(req.query.limit) || 50
        }
      );
      res.json(result);
    } catch (error) {
      next(error);
    }
  }
);

// ─────────────────────────────────────────────────────
// POST /api/debt-payments - Enregistrer un paiement de dette
// Accessible par : admin, deliverer
// ─────────────────────────────────────────────────────
const debtPaymentSchema = Joi.object({
  customer_id: Joi.string().uuid().required(),
  amount: Joi.number().positive().required(),
  payment_type: Joi.string().valid('cash', 'check', 'transfer', 'other').default('cash'),
  delivery_id: Joi.string().uuid().optional(),
  note: Joi.string().max(500).optional()
});

router.post('/debt-payments',
  authorize(['admin', 'deliverer']),
  validate(debtPaymentSchema),
  async (req, res, next) => {
    try {
      const result = await debtService.recordDebtPayment(
        req.body,
        req.user.id,
        req.user.role,
        req.user.organization_id
      );
      
      res.status(201).json(result);
    } catch (error) {
      if (error.message.includes('supérieur') || 
          error.message.includes('pas de dette') ||
          error.message.includes('non trouvé')) {
        return res.status(400).json({ error: error.message });
      }
      next(error);
    }
  }
);

// ─────────────────────────────────────────────────────
// GET /api/debt-payments - Historique des paiements
// Accessible par : admin
// ─────────────────────────────────────────────────────
router.get('/debt-payments',
  authorize(['admin']),
  async (req, res, next) => {
    try {
      const result = await debtService.getPaymentHistory(
        req.user.organization_id,
        {
          customer_id: req.query.customer_id,
          collector_id: req.query.collector_id,
          from: req.query.from,
          to: req.query.to,
          page: parseInt(req.query.page) || 1,
          limit: parseInt(req.query.limit) || 50
        }
      );
      res.json(result);
    } catch (error) {
      next(error);
    }
  }
);

module.exports = router;
```

**Ajouter dans `api-v2/app.js` ou `api-v2/routes/index.js` :**

```javascript
const debtRoutes = require('./routes/debt.routes');
app.use('/api', debtRoutes);
```

## 1.4 MODELS FLUTTER

**Fichier : `mobile/lib/core/models/debt.dart`**

```dart
// =====================================================
// MODELS : Gestion de la dette
// =====================================================

class CustomerDebt {
  final String customerId;
  final String customerName;
  final String? customerPhone;
  final double totalDebt;
  final int unpaidOrders;
  final DateTime? lastOrderDate;
  final DateTime? lastPaymentDate;
  final double? lastPaymentAmount;

  CustomerDebt({
    required this.customerId,
    required this.customerName,
    this.customerPhone,
    required this.totalDebt,
    required this.unpaidOrders,
    this.lastOrderDate,
    this.lastPaymentDate,
    this.lastPaymentAmount,
  });

  factory CustomerDebt.fromJson(Map<String, dynamic> json) => CustomerDebt(
    customerId: json['customer_id'],
    customerName: json['customer_name'] ?? json['name'] ?? '',
    customerPhone: json['customer_phone'] ?? json['phone'],
    totalDebt: (json['total_debt'] as num?)?.toDouble() ?? 0,
    unpaidOrders: json['unpaid_orders'] ?? 0,
    lastOrderDate: json['last_order_date'] != null 
      ? DateTime.parse(json['last_order_date']) 
      : null,
    lastPaymentDate: json['last_payment_date'] != null 
      ? DateTime.parse(json['last_payment_date']) 
      : null,
    lastPaymentAmount: (json['last_payment_amount'] as num?)?.toDouble(),
  );

  bool get hasDebt => totalDebt > 0;
}

class DebtPayment {
  final String id;
  final String customerId;
  final String? customerName;
  final double amount;
  final String paymentType;
  final String collectedBy;
  final String? collectorName;
  final String collectorRole;
  final String? deliveryId;
  final String? note;
  final DateTime createdAt;

  DebtPayment({
    required this.id,
    required this.customerId,
    this.customerName,
    required this.amount,
    required this.paymentType,
    required this.collectedBy,
    this.collectorName,
    required this.collectorRole,
    this.deliveryId,
    this.note,
    required this.createdAt,
  });

  factory DebtPayment.fromJson(Map<String, dynamic> json) => DebtPayment(
    id: json['id'],
    customerId: json['customer_id'],
    customerName: json['customer_name'],
    amount: (json['amount'] as num).toDouble(),
    paymentType: json['payment_type'] ?? 'cash',
    collectedBy: json['collected_by'],
    collectorName: json['collector_name'],
    collectorRole: json['collector_role'],
    deliveryId: json['delivery_id'],
    note: json['note'],
    createdAt: DateTime.parse(json['created_at']),
  );

  String get paymentTypeLabel {
    switch (paymentType) {
      case 'cash': return 'Espèces';
      case 'check': return 'Chèque';
      case 'transfer': return 'Virement';
      default: return 'Autre';
    }
  }
}

class DebtPaymentResult {
  final DebtPayment payment;
  final double previousDebt;
  final double newDebt;
  final String customerName;

  DebtPaymentResult({
    required this.payment,
    required this.previousDebt,
    required this.newDebt,
    required this.customerName,
  });

  factory DebtPaymentResult.fromJson(Map<String, dynamic> json) => DebtPaymentResult(
    payment: DebtPayment.fromJson(json['payment']),
    previousDebt: (json['previous_debt'] as num).toDouble(),
    newDebt: (json['new_debt'] as num).toDouble(),
    customerName: json['customer_name'] ?? '',
  );
}
```

## 1.5 SERVICE FLUTTER

**Fichier : `mobile/lib/core/services/debt_service.dart`**

```dart
// =====================================================
// SERVICE : Gestion de la dette
// =====================================================

import '../models/debt.dart';
import 'api_service.dart';

class DebtService {
  final ApiService _api;

  DebtService(this._api);

  /// Récupérer la dette d'un client
  Future<CustomerDebt> getCustomerDebt(String customerId) async {
    final response = await _api.get('/customers/$customerId/debt');
    return CustomerDebt.fromJson(response);
  }

  /// Liste des clients avec dette (admin)
  Future<DebtListResponse> getCustomersWithDebt({
    String? sort,
    double? minDebt,
    int page = 1,
    int limit = 50,
  }) async {
    final params = <String, String>{
      'page': page.toString(),
      'limit': limit.toString(),
    };
    if (sort != null) params['sort'] = sort;
    if (minDebt != null) params['min_debt'] = minDebt.toString();

    final response = await _api.get('/debts', queryParams: params);
    return DebtListResponse.fromJson(response);
  }

  /// Enregistrer un paiement de dette
  Future<DebtPaymentResult> recordPayment({
    required String customerId,
    required double amount,
    String paymentType = 'cash',
    String? deliveryId,
    String? note,
  }) async {
    final response = await _api.post('/debt-payments', body: {
      'customer_id': customerId,
      'amount': amount,
      'payment_type': paymentType,
      if (deliveryId != null) 'delivery_id': deliveryId,
      if (note != null && note.isNotEmpty) 'note': note,
    });
    return DebtPaymentResult.fromJson(response);
  }

  /// Historique des paiements (admin)
  Future<PaymentHistoryResponse> getPaymentHistory({
    String? customerId,
    String? collectorId,
    DateTime? from,
    DateTime? to,
    int page = 1,
    int limit = 50,
  }) async {
    final params = <String, String>{
      'page': page.toString(),
      'limit': limit.toString(),
    };
    if (customerId != null) params['customer_id'] = customerId;
    if (collectorId != null) params['collector_id'] = collectorId;
    if (from != null) params['from'] = from.toIso8601String();
    if (to != null) params['to'] = to.toIso8601String();

    final response = await _api.get('/debt-payments', queryParams: params);
    return PaymentHistoryResponse.fromJson(response);
  }
}

// Response classes
class DebtListResponse {
  final List<CustomerDebt> data;
  final DebtSummary summary;
  final Pagination pagination;

  DebtListResponse({
    required this.data,
    required this.summary,
    required this.pagination,
  });

  factory DebtListResponse.fromJson(Map<String, dynamic> json) => DebtListResponse(
    data: (json['data'] as List).map((e) => CustomerDebt.fromJson(e)).toList(),
    summary: DebtSummary.fromJson(json['summary']),
    pagination: Pagination.fromJson(json['pagination']),
  );
}

class DebtSummary {
  final int totalCustomersWithDebt;
  final double totalDebtAmount;

  DebtSummary({
    required this.totalCustomersWithDebt,
    required this.totalDebtAmount,
  });

  factory DebtSummary.fromJson(Map<String, dynamic> json) => DebtSummary(
    totalCustomersWithDebt: json['total_customers_with_debt'] ?? 0,
    totalDebtAmount: (json['total_debt_amount'] as num?)?.toDouble() ?? 0,
  );
}

class PaymentHistoryResponse {
  final List<DebtPayment> data;
  final Pagination pagination;

  PaymentHistoryResponse({
    required this.data,
    required this.pagination,
  });

  factory PaymentHistoryResponse.fromJson(Map<String, dynamic> json) => PaymentHistoryResponse(
    data: (json['data'] as List).map((e) => DebtPayment.fromJson(e)).toList(),
    pagination: Pagination.fromJson(json['pagination']),
  );
}

class Pagination {
  final int page;
  final int limit;
  final int total;
  final int totalPages;
  final bool hasNext;
  final bool hasPrev;

  Pagination({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrev,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    page: json['page'] ?? 1,
    limit: json['limit'] ?? 50,
    total: json['total'] ?? 0,
    totalPages: json['totalPages'] ?? 1,
    hasNext: json['hasNext'] ?? false,
    hasPrev: json['hasPrev'] ?? false,
  );
}
```

## 1.6 UI COMPOSANTS FLUTTER

**Fichier : `mobile/lib/core/widgets/collect_debt_dialog.dart`**

```dart
// =====================================================
// WIDGET : Dialog de collecte de dette
// Utilisable par Admin et Livreur
// =====================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/debt.dart';
import '../services/debt_service.dart';

class CollectDebtDialog extends StatefulWidget {
  final CustomerDebt customer;
  final String? deliveryId;
  final VoidCallback onPaymentRecorded;

  const CollectDebtDialog({
    Key? key,
    required this.customer,
    this.deliveryId,
    required this.onPaymentRecorded,
  }) : super(key: key);

  @override
  State<CollectDebtDialog> createState() => _CollectDebtDialogState();
}

class _CollectDebtDialogState extends State<CollectDebtDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  String _paymentType = 'cash';
  bool _payAll = true;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _amountController.text = widget.customer.totalDebt.toStringAsFixed(0);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                children: [
                  Icon(Icons.payments, color: theme.primaryColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Encaisser - ${widget.customer.customerName}',
                      style: theme.textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              
              // Dette totale
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Dette totale :'),
                    Text(
                      '${widget.customer.totalDebt.toStringAsFixed(0)} DA',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Toggle : Tout payer ou partiel
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Tout payer'),
                      selected: _payAll,
                      onSelected: (selected) {
                        setState(() {
                          _payAll = true;
                          _amountController.text = 
                            widget.customer.totalDebt.toStringAsFixed(0);
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Paiement partiel'),
                      selected: !_payAll,
                      onSelected: (selected) {
                        setState(() {
                          _payAll = false;
                          _amountController.clear();
                        });
                        // Focus sur le champ montant
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Montant
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Montant',
                  suffixText: 'DA',
                  border: const OutlineInputBorder(),
                  enabled: !_payAll,
                  filled: _payAll,
                  fillColor: _payAll ? Colors.grey.shade100 : null,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Montant requis';
                  final amount = double.tryParse(value);
                  if (amount == null || amount <= 0) return 'Montant invalide';
                  if (amount > widget.customer.totalDebt) {
                    return 'Max: ${widget.customer.totalDebt.toStringAsFixed(0)} DA';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Type de paiement
              DropdownButtonFormField<String>(
                value: _paymentType,
                decoration: const InputDecoration(
                  labelText: 'Mode de paiement',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'cash', child: Text('💵 Espèces')),
                  DropdownMenuItem(value: 'check', child: Text('📝 Chèque')),
                  DropdownMenuItem(value: 'transfer', child: Text('🏦 Virement')),
                  DropdownMenuItem(value: 'other', child: Text('📋 Autre')),
                ],
                onChanged: (value) => setState(() => _paymentType = value!),
              ),
              const SizedBox(height: 16),

              // Note optionnelle
              TextFormField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: 'Note (optionnel)',
                  hintText: 'Ex: Chèque #12345, Paiement partiel...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
                maxLength: 500,
              ),
              const SizedBox(height: 24),

              // Bouton valider
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _loading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: _loading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Confirmer l\'encaissement',
                        style: TextStyle(fontSize: 16),
                      ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      final amount = double.parse(_amountController.text);
      final debtService = DebtService(/* inject api service */);
      
      final result = await debtService.recordPayment(
        customerId: widget.customer.customerId,
        amount: amount,
        paymentType: _paymentType,
        deliveryId: widget.deliveryId,
        note: _noteController.text.isEmpty ? null : _noteController.text,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Paiement de ${amount.toStringAsFixed(0)} DA enregistré.\n'
              'Nouvelle dette: ${result.newDebt.toStringAsFixed(0)} DA'
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );

        widget.onPaymentRecorded();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }
}

// Helper pour afficher le dialog
void showCollectDebtDialog(
  BuildContext context, {
  required CustomerDebt customer,
  String? deliveryId,
  required VoidCallback onPaymentRecorded,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => CollectDebtDialog(
      customer: customer,
      deliveryId: deliveryId,
      onPaymentRecorded: onPaymentRecorded,
    ),
  );
}
```

## 1.7 INTÉGRATION DANS LES PAGES EXISTANTES

### A) Page Admin - Ajouter accès gestion dettes

**Modifier : `mobile/lib/features/admin/admin_dashboard.dart`**

Ajouter un bouton/menu vers la page de gestion des dettes.

### B) Page Livreur - Afficher dette client

**Modifier : `mobile/lib/features/deliverer/delivery_detail_page.dart`**

```dart
// Ajouter dans le build, après les infos de livraison :

// Widget dette client (si dette > 0)
FutureBuilder<CustomerDebt>(
  future: _debtService.getCustomerDebt(delivery.customerId),
  builder: (context, snapshot) {
    if (!snapshot.hasData || !snapshot.data!.hasDebt) {
      return const SizedBox.shrink();
    }
    
    final debt = snapshot.data!;
    return Card(
      color: Colors.orange.shade50,
      margin: const EdgeInsets.all(16),
      child: ListTile(
        leading: const Icon(Icons.warning_amber, color: Colors.orange),
        title: Text(
          'Dette: ${debt.totalDebt.toStringAsFixed(0)} DA',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${debt.unpaidOrders} commande(s) impayée(s)'),
        trailing: ElevatedButton(
          onPressed: () => showCollectDebtDialog(
            context,
            customer: debt,
            deliveryId: delivery.id,
            onPaymentRecorded: () {
              Navigator.pop(context);
              setState(() {}); // Refresh
            },
          ),
          child: const Text('Encaisser'),
        ),
      ),
    );
  },
),
```

### C) Page Historique Client - Header avec dette

**Modifier : `mobile/lib/features/cafeteria/order_history_page.dart`**

```dart
// Ajouter en haut de la liste, un header sticky avec la dette totale
// Voir les principes UX définis : dette affichée UNE SEULE FOIS en header
```

## 1.8 TESTS

**Fichier : `api-v2/__tests__/unit/services/debt.service.test.js`**

```javascript
const debtService = require('../../../services/debt.service');

describe('DebtService', () => {
  describe('getCustomerDebt', () => {
    it('should return correct total debt', async () => {
      // Mock et test
    });

    it('should return 0 for customer with no orders', async () => {
      // Mock et test
    });

    it('should exclude cancelled orders from debt', async () => {
      // Mock et test
    });
  });

  describe('recordDebtPayment', () => {
    it('should create payment record', async () => {});
    it('should reduce customer debt', async () => {});
    it('should apply payment to oldest orders first (FIFO)', async () => {});
    it('should reject payment exceeding debt', async () => {});
    it('should handle partial payment correctly', async () => {});
    it('should mark order as paid when fully covered', async () => {});
    it('should mark order as partial when partially covered', async () => {});
  });
});
```

## 1.9 CHECKLIST VALIDATION FEATURE 1

```
□ Migration SQL exécutée sans erreur
□ Routes ajoutées dans app.js
□ GET /api/customers/:id/debt retourne la dette
□ GET /api/debts retourne la liste des clients avec dette
□ POST /api/debt-payments crée un paiement
□ Le paiement réduit correctement la dette
□ FIFO fonctionne (commandes anciennes payées en premier)
□ Notification envoyée à l'admin (si livreur collecte)
□ Mobile : Dialog de collecte fonctionne
□ Mobile : Admin voit la liste des dettes
□ Mobile : Livreur voit la dette sur page livraison
□ Tests backend passent
□ Pas de régression sur les fonctionnalités existantes
```

---

# ═══════════════════════════════════════════════════════════════
# FEATURE 2 : ⚠️ LIMITE DE CRÉDIT (NOTIFICATION)
# ═══════════════════════════════════════════════════════════════

```
PRÉREQUIS : Feature 1 (Dette) doit être implémentée

CONTEXTE :
La limite de crédit existe peut-être déjà dans le projet.
On veut un système de NOTIFICATION (pas de blocage) avec 3 niveaux d'alerte.
L'admin garde le contrôle final.

NIVEAUX :
- 80% du plafond → 🟡 Notification info
- 100% du plafond → 🟠 Notification warning  
- 120% du plafond → 🔴 Notification urgente
```

## 2.1 MIGRATION

**Fichier : `api-v2/migrations/005_add_credit_limit.sql`**

```sql
-- =====================================================
-- MIGRATION : Limite de crédit
-- =====================================================

-- Ajouter colonne credit_limit si pas présente
ALTER TABLE users ADD COLUMN IF NOT EXISTS credit_limit DECIMAL(10,2) DEFAULT NULL;
-- NULL = pas de limite

-- Index pour les requêtes
CREATE INDEX IF NOT EXISTS idx_users_credit_limit ON users(organization_id, credit_limit) 
  WHERE credit_limit IS NOT NULL;

COMMENT ON COLUMN users.credit_limit IS 'Plafond de crédit en DA. NULL = pas de limite.';
```

## 2.2 SERVICE

**Fichier : `api-v2/services/credit.service.js`**

```javascript
// =====================================================
// SERVICE : Limite de crédit
// =====================================================

const db = require('../config/database');
const debtService = require('./debt.service');
const notificationService = require('./notification.service');
const logger = require('../config/logger');

class CreditService {
  
  /**
   * Vérifier le statut crédit d'un client
   * @returns {Object} { status, level, ratio, debt, limit }
   */
  async checkCreditStatus(customerId, organizationId) {
    // Récupérer limite et dette
    const result = await db.query(`
      SELECT 
        u.credit_limit,
        COALESCE(SUM(o.total) - SUM(o.amount_paid), 0)::numeric as current_debt
      FROM users u
      LEFT JOIN orders o ON u.id = o.customer_id 
        AND o.organization_id = $2 
        AND o.payment_status != 'paid'
        AND o.status != 'cancelled'
      WHERE u.id = $1
      GROUP BY u.id, u.credit_limit
    `, [customerId, organizationId]);
    
    if (result.rows.length === 0) {
      return { status: 'not_found', level: null };
    }
    
    const { credit_limit, current_debt } = result.rows[0];
    const debt = parseFloat(current_debt) || 0;
    const limit = parseFloat(credit_limit);
    
    // Pas de limite configurée
    if (!credit_limit || limit <= 0) {
      return { status: 'no_limit', level: null, debt };
    }
    
    const ratio = debt / limit;
    const percentage = Math.round(ratio * 100);
    
    if (ratio >= 1.2) {
      return { 
        status: 'critical', 
        level: 'urgent',
        ratio: percentage,
        debt,
        limit
      };
    } else if (ratio >= 1.0) {
      return { 
        status: 'over_limit', 
        level: 'warning',
        ratio: percentage,
        debt,
        limit
      };
    } else if (ratio >= 0.8) {
      return { 
        status: 'approaching', 
        level: 'info',
        ratio: percentage,
        debt,
        limit
      };
    }
    
    return { 
      status: 'ok', 
      level: null, 
      ratio: percentage,
      debt,
      limit
    };
  }

  /**
   * Appelé après création/modification de commande
   * Notifie les admins si seuil atteint
   */
  async checkAndNotify(customerId, organizationId) {
    const status = await this.checkCreditStatus(customerId, organizationId);
    
    if (!status.level) {
      return null; // Pas d'alerte nécessaire
    }
    
    // Récupérer nom du client
    const customerResult = await db.query(
      'SELECT name FROM users WHERE id = $1', 
      [customerId]
    );
    const customerName = customerResult.rows[0]?.name || 'Client';
    
    const messages = {
      info: {
        title: '📊 Crédit client',
        message: `${customerName} approche sa limite (${status.ratio}% - ${status.debt.toFixed(0)}/${status.limit.toFixed(0)} DA)`
      },
      warning: {
        title: '⚠️ Limite atteinte',
        message: `${customerName} a atteint sa limite de crédit (${status.ratio}% - ${status.debt.toFixed(0)}/${status.limit.toFixed(0)} DA)`
      },
      urgent: {
        title: '🔴 Dépassement crédit',
        message: `${customerName} dépasse sa limite (${status.ratio}% - ${status.debt.toFixed(0)}/${status.limit.toFixed(0)} DA)`
      }
    };
    
    const notif = messages[status.level];
    
    // Envoyer notification aux admins
    await notificationService.sendToRole('admin', organizationId, {
      title: notif.title,
      message: notif.message,
      data: {
        type: 'credit_alert',
        customer_id: customerId,
        level: status.level,
        ratio: status.ratio
      }
    });
    
    logger.info('Credit alert sent', { 
      customerId, 
      level: status.level, 
      ratio: status.ratio 
    });
    
    return status;
  }

  /**
   * Mettre à jour la limite de crédit d'un client
   */
  async updateCreditLimit(customerId, creditLimit, organizationId) {
    const result = await db.query(`
      UPDATE users 
      SET credit_limit = $1, updated_at = NOW()
      WHERE id = $2 AND organization_id = $3
      RETURNING id, name, credit_limit
    `, [creditLimit || null, customerId, organizationId]);
    
    if (result.rows.length === 0) {
      throw new Error('Client non trouvé');
    }
    
    return result.rows[0];
  }

  /**
   * Liste des clients avec leur statut crédit
   */
  async getCustomersCreditStatus(organizationId) {
    const result = await db.query(`
      SELECT 
        u.id,
        u.name,
        u.credit_limit,
        COALESCE(SUM(o.total) - SUM(o.amount_paid), 0)::numeric as current_debt,
        CASE 
          WHEN u.credit_limit IS NULL OR u.credit_limit = 0 THEN NULL
          ELSE ROUND((COALESCE(SUM(o.total) - SUM(o.amount_paid), 0) / u.credit_limit * 100)::numeric)
        END as ratio
      FROM users u
      LEFT JOIN orders o ON u.id = o.customer_id 
        AND o.organization_id = $1 
        AND o.payment_status != 'paid'
        AND o.status != 'cancelled'
      WHERE u.organization_id = $1 
        AND u.role = 'cafeteria'
        AND u.is_active = true
      GROUP BY u.id, u.name, u.credit_limit
      ORDER BY ratio DESC NULLS LAST
    `, [organizationId]);
    
    return result.rows.map(r => ({
      ...r,
      current_debt: parseFloat(r.current_debt) || 0,
      credit_limit: r.credit_limit ? parseFloat(r.credit_limit) : null,
      ratio: r.ratio ? parseInt(r.ratio) : null,
      status: this._getStatusFromRatio(r.ratio)
    }));
  }

  _getStatusFromRatio(ratio) {
    if (ratio === null) return 'no_limit';
    if (ratio >= 120) return 'critical';
    if (ratio >= 100) return 'over_limit';
    if (ratio >= 80) return 'approaching';
    return 'ok';
  }
}

module.exports = new CreditService();
```

## 2.3 INTÉGRATION DANS ORDER SERVICE

**Modifier : `api-v2/services/order.service.js`**

```javascript
// Ajouter en haut
const creditService = require('./credit.service');

// Dans la méthode createOrder(), après la création de la commande :
async createOrder(orderData) {
  // ... code existant de création ...
  
  const order = result.rows[0];
  
  // Vérifier crédit et notifier si nécessaire
  await creditService.checkAndNotify(
    order.customer_id,
    order.organization_id
  );
  
  return order;
}
```

## 2.4 ROUTES

**Ajouter dans `api-v2/routes/users.routes.js` ou créer `credit.routes.js` :**

```javascript
// PUT /api/customers/:id/credit-limit - Modifier limite (admin)
router.put('/customers/:id/credit-limit',
  authorize(['admin']),
  async (req, res, next) => {
    try {
      const { credit_limit } = req.body;
      const result = await creditService.updateCreditLimit(
        req.params.id,
        credit_limit,
        req.user.organization_id
      );
      res.json(result);
    } catch (error) {
      next(error);
    }
  }
);

// GET /api/customers/credit-status - Liste avec statut crédit (admin)
router.get('/customers/credit-status',
  authorize(['admin']),
  async (req, res, next) => {
    try {
      const result = await creditService.getCustomersCreditStatus(
        req.user.organization_id
      );
      res.json(result);
    } catch (error) {
      next(error);
    }
  }
);
```

## 2.5 MOBILE - BADGE CRÉDIT

**Fichier : `mobile/lib/core/widgets/credit_badge.dart`**

```dart
import 'package:flutter/material.dart';

class CreditBadge extends StatelessWidget {
  final int? ratio; // Pourcentage d'utilisation
  final double? debt;
  final double? limit;

  const CreditBadge({
    Key? key,
    this.ratio,
    this.debt,
    this.limit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ratio == null || limit == null) return const SizedBox.shrink();

    Color color;
    if (ratio! >= 120) {
      color = Colors.red;
    } else if (ratio! >= 100) {
      color = Colors.orange;
    } else if (ratio! >= 80) {
      color = Colors.amber;
    } else {
      return const SizedBox.shrink(); // Pas de badge si < 80%
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$ratio%',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
```

## 2.6 MOBILE - CHAMP LIMITE DANS ÉDITION CLIENT

**Ajouter dans le formulaire d'édition client (admin) :**

```dart
TextFormField(
  controller: _creditLimitController,
  decoration: const InputDecoration(
    labelText: 'Limite de crédit',
    hintText: 'Laisser vide = pas de limite',
    suffixText: 'DA',
    border: OutlineInputBorder(),
  ),
  keyboardType: TextInputType.number,
  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
),
```

## 2.7 CHECKLIST VALIDATION FEATURE 2

```
□ Migration SQL exécutée
□ credit.service.js créé
□ Intégration dans order.service.js
□ Routes ajoutées
□ Client à 80% → notification info envoyée
□ Client à 100% → notification warning envoyée
□ Client à 120% → notification urgente envoyée
□ Badge affiché dans liste clients (mobile)
□ Admin peut modifier la limite par client
□ Client sans limite → pas de notification
□ Tests passent
```

---

# ═══════════════════════════════════════════════════════════════
# FEATURE 3 : 📦 GESTION DES CONSIGNES
# ═══════════════════════════════════════════════════════════════

```
CONTEXTE :
Les organisations prêtent des emballages aux clients (casiers, bouteilles, palettes).
Chaque organisation définit ses propres types de consignes.
Le livreur peut noter les mouvements rapidement (ou ignorer si pas d'échange).

UX LIVREUR :
- Widget simple avec [+] Déposé et [-] Repris
- Optionnel : si pas d'échange, ne rien toucher
- Long press pour saisie manuelle de quantité
```

## 3.1 MIGRATION

**Fichier : `api-v2/migrations/006_add_consignments.sql`**

```sql
-- =====================================================
-- MIGRATION : Gestion des consignes
-- =====================================================

-- 1. Types de consignes par organisation
CREATE TABLE IF NOT EXISTS consignment_types (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  unit_value DECIMAL(10,2) DEFAULT 0,
  alert_threshold INT DEFAULT NULL,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  UNIQUE(organization_id, name)
);

CREATE INDEX idx_consignment_types_org ON consignment_types(organization_id, is_active);

-- 2. Mouvements de consignes
CREATE TABLE IF NOT EXISTS consignment_movements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  consignment_type_id UUID NOT NULL REFERENCES consignment_types(id) ON DELETE CASCADE,
  customer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  
  quantity INT NOT NULL, -- Positif = déposé, Négatif = repris
  
  delivery_id UUID REFERENCES deliveries(id) ON DELETE SET NULL,
  recorded_by UUID NOT NULL REFERENCES users(id),
  note TEXT,
  
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_consignment_movements_customer ON consignment_movements(customer_id, consignment_type_id);
CREATE INDEX idx_consignment_movements_org ON consignment_movements(organization_id, created_at DESC);
CREATE INDEX idx_consignment_movements_delivery ON consignment_movements(delivery_id);

-- 3. Vue pour solde par client
CREATE OR REPLACE VIEW customer_consignments AS
SELECT 
  cm.organization_id,
  cm.customer_id,
  cm.consignment_type_id,
  ct.name as type_name,
  ct.unit_value,
  ct.alert_threshold,
  COALESCE(SUM(cm.quantity), 0) as balance,
  COALESCE(SUM(cm.quantity), 0) * ct.unit_value as total_value
FROM consignment_types ct
LEFT JOIN consignment_movements cm ON ct.id = cm.consignment_type_id
WHERE ct.is_active = true
GROUP BY cm.organization_id, cm.customer_id, cm.consignment_type_id, 
         ct.name, ct.unit_value, ct.alert_threshold;
```

## 3.2 SERVICE

**Fichier : `api-v2/services/consignment.service.js`**

```javascript
// =====================================================
// SERVICE : Gestion des consignes
// =====================================================

const db = require('../config/database');
const notificationService = require('./notification.service');
const logger = require('../config/logger');

class ConsignmentService {
  
  /**
   * Récupérer les types de consignes d'une organisation
   */
  async getTypes(organizationId) {
    const result = await db.query(`
      SELECT * FROM consignment_types 
      WHERE organization_id = $1 AND is_active = true
      ORDER BY name
    `, [organizationId]);
    return result.rows;
  }

  /**
   * Créer un type de consigne
   */
  async createType(data, organizationId) {
    const { name, unit_value = 0, alert_threshold } = data;
    
    const result = await db.query(`
      INSERT INTO consignment_types (organization_id, name, unit_value, alert_threshold)
      VALUES ($1, $2, $3, $4)
      RETURNING *
    `, [organizationId, name, unit_value, alert_threshold]);
    
    return result.rows[0];
  }

  /**
   * Solde consignes d'un client
   */
  async getCustomerConsignments(customerId, organizationId) {
    const result = await db.query(`
      SELECT 
        ct.id as type_id,
        ct.name as type_name,
        ct.unit_value,
        ct.alert_threshold,
        COALESCE(SUM(cm.quantity), 0) as balance,
        COALESCE(SUM(cm.quantity), 0) * ct.unit_value as total_value
      FROM consignment_types ct
      LEFT JOIN consignment_movements cm 
        ON ct.id = cm.consignment_type_id AND cm.customer_id = $1
      WHERE ct.organization_id = $2 AND ct.is_active = true
      GROUP BY ct.id, ct.name, ct.unit_value, ct.alert_threshold
      ORDER BY ct.name
    `, [customerId, organizationId]);
    
    return result.rows.map(r => ({
      ...r,
      balance: parseInt(r.balance) || 0,
      total_value: parseFloat(r.total_value) || 0,
      is_over_threshold: r.alert_threshold && r.balance > r.alert_threshold
    }));
  }

  /**
   * Enregistrer des mouvements de consignes
   * @param {Object} data - { customer_id, movements: [{type_id, deposited, retrieved}], delivery_id?, note? }
   */
  async recordMovements(data, recordedBy, organizationId) {
    const { customer_id, movements, delivery_id, note } = data;
    
    if (!movements || movements.length === 0) {
      return [];
    }
    
    const results = [];
    
    for (const m of movements) {
      // Ignorer si pas de mouvement
      if ((!m.deposited || m.deposited === 0) && (!m.retrieved || m.retrieved === 0)) {
        continue;
      }
      
      // Déposé = positif
      if (m.deposited && m.deposited > 0) {
        const dep = await db.query(`
          INSERT INTO consignment_movements 
          (organization_id, consignment_type_id, customer_id, quantity, delivery_id, recorded_by, note)
          VALUES ($1, $2, $3, $4, $5, $6, $7)
          RETURNING *
        `, [organizationId, m.type_id, customer_id, m.deposited, delivery_id, recordedBy, note]);
        results.push({ ...dep.rows[0], action: 'deposited' });
      }
      
      // Repris = négatif
      if (m.retrieved && m.retrieved > 0) {
        const ret = await db.query(`
          INSERT INTO consignment_movements 
          (organization_id, consignment_type_id, customer_id, quantity, delivery_id, recorded_by, note)
          VALUES ($1, $2, $3, $4, $5, $6, $7)
          RETURNING *
        `, [organizationId, m.type_id, customer_id, -m.retrieved, delivery_id, recordedBy, note]);
        results.push({ ...ret.rows[0], action: 'retrieved' });
      }
    }
    
    // Vérifier alertes
    await this.checkAlerts(customer_id, organizationId);
    
    logger.info('Consignment movements recorded', { 
      customerId: customer_id, 
      count: results.length 
    });
    
    return results;
  }

  /**
   * Vérifier et envoyer alertes si seuil dépassé
   */
  async checkAlerts(customerId, organizationId) {
    const consignments = await this.getCustomerConsignments(customerId, organizationId);
    const overThreshold = consignments.filter(c => c.is_over_threshold);
    
    if (overThreshold.length === 0) return;
    
    const customerResult = await db.query(
      'SELECT name FROM users WHERE id = $1', 
      [customerId]
    );
    const customerName = customerResult.rows[0]?.name || 'Client';
    
    for (const c of overThreshold) {
      await notificationService.sendToRole('admin', organizationId, {
        title: '📦 Alerte consignes',
        message: `${customerName} a ${c.balance} ${c.type_name} (seuil: ${c.alert_threshold})`,
        data: {
          type: 'consignment_alert',
          customer_id: customerId,
          consignment_type: c.type_name
        }
      });
    }
  }

  /**
   * Résumé global pour admin
   */
  async getSummary(organizationId) {
    // Stock total chez clients par type
    const summary = await db.query(`
      SELECT 
        ct.id,
        ct.name,
        ct.unit_value,
        ct.alert_threshold,
        COALESCE(SUM(cm.quantity), 0) as total_at_customers,
        COALESCE(SUM(cm.quantity) * ct.unit_value, 0) as total_value
      FROM consignment_types ct
      LEFT JOIN consignment_movements cm ON ct.id = cm.consignment_type_id
      WHERE ct.organization_id = $1 AND ct.is_active = true
      GROUP BY ct.id, ct.name, ct.unit_value, ct.alert_threshold
      ORDER BY ct.name
    `, [organizationId]);
    
    // Clients en alerte
    const alerts = await db.query(`
      SELECT 
        u.id as customer_id,
        u.name as customer_name,
        ct.name as type_name,
        SUM(cm.quantity) as balance,
        ct.alert_threshold
      FROM consignment_movements cm
      JOIN users u ON cm.customer_id = u.id
      JOIN consignment_types ct ON cm.consignment_type_id = ct.id
      WHERE cm.organization_id = $1 
        AND ct.alert_threshold IS NOT NULL
      GROUP BY u.id, u.name, ct.id, ct.name, ct.alert_threshold
      HAVING SUM(cm.quantity) > ct.alert_threshold
      ORDER BY SUM(cm.quantity) DESC
    `, [organizationId]);
    
    return {
      summary: summary.rows,
      alerts: alerts.rows
    };
  }
}

module.exports = new ConsignmentService();
```

## 3.3 ROUTES

**Fichier : `api-v2/routes/consignment.routes.js`**

```javascript
const router = require('express').Router();
const consignmentService = require('../services/consignment.service');
const { authenticate, authorize } = require('../middleware/auth.middleware');

router.use(authenticate);

// GET /api/consignment-types
router.get('/consignment-types', async (req, res, next) => {
  try {
    const types = await consignmentService.getTypes(req.user.organization_id);
    res.json(types);
  } catch (error) {
    next(error);
  }
});

// POST /api/consignment-types (admin)
router.post('/consignment-types', authorize(['admin']), async (req, res, next) => {
  try {
    const type = await consignmentService.createType(req.body, req.user.organization_id);
    res.status(201).json(type);
  } catch (error) {
    next(error);
  }
});

// GET /api/customers/:id/consignments
router.get('/customers/:id/consignments', async (req, res, next) => {
  try {
    const consignments = await consignmentService.getCustomerConsignments(
      req.params.id,
      req.user.organization_id
    );
    res.json(consignments);
  } catch (error) {
    next(error);
  }
});

// POST /api/consignment-movements
router.post('/consignment-movements', 
  authorize(['admin', 'deliverer']), 
  async (req, res, next) => {
    try {
      const results = await consignmentService.recordMovements(
        req.body,
        req.user.id,
        req.user.organization_id
      );
      res.status(201).json(results);
    } catch (error) {
      next(error);
    }
  }
);

// GET /api/consignments/summary (admin)
router.get('/consignments/summary', authorize(['admin']), async (req, res, next) => {
  try {
    const summary = await consignmentService.getSummary(req.user.organization_id);
    res.json(summary);
  } catch (error) {
    next(error);
  }
});

module.exports = router;
```

## 3.4 WIDGET FLUTTER LIVREUR

**Fichier : `mobile/lib/core/widgets/consignment_input.dart`**

```dart
// Widget simple pour le livreur
// [+] [-] pour chaque type de consigne
// Long press pour saisie manuelle

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConsignmentType {
  final String id;
  final String name;
  final double unitValue;
  final int? alertThreshold;

  ConsignmentType({
    required this.id,
    required this.name,
    required this.unitValue,
    this.alertThreshold,
  });

  factory ConsignmentType.fromJson(Map<String, dynamic> json) => ConsignmentType(
    id: json['id'],
    name: json['name'],
    unitValue: (json['unit_value'] as num?)?.toDouble() ?? 0,
    alertThreshold: json['alert_threshold'],
  );
}

class ConsignmentMovement {
  final String typeId;
  final int deposited;
  final int retrieved;

  ConsignmentMovement({
    required this.typeId,
    required this.deposited,
    required this.retrieved,
  });

  Map<String, dynamic> toJson() => {
    'type_id': typeId,
    'deposited': deposited,
    'retrieved': retrieved,
  };
  
  bool get hasMovement => deposited > 0 || retrieved > 0;
}

class ConsignmentInput extends StatefulWidget {
  final List<ConsignmentType> types;
  final Function(List<ConsignmentMovement>) onChanged;

  const ConsignmentInput({
    Key? key,
    required this.types,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ConsignmentInput> createState() => _ConsignmentInputState();
}

class _ConsignmentInputState extends State<ConsignmentInput> {
  late Map<String, int> _deposited;
  late Map<String, int> _retrieved;

  @override
  void initState() {
    super.initState();
    _deposited = {for (var t in widget.types) t.id: 0};
    _retrieved = {for (var t in widget.types) t.id: 0};
  }

  void _notifyChange() {
    final movements = widget.types
      .map((t) => ConsignmentMovement(
        typeId: t.id,
        deposited: _deposited[t.id] ?? 0,
        retrieved: _retrieved[t.id] ?? 0,
      ))
      .where((m) => m.hasMovement)
      .toList();
    widget.onChanged(movements);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.types.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.inventory_2, 
                  color: Theme.of(context).primaryColor, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Consignes (optionnel)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...widget.types.map((type) => _buildTypeRow(type)),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeRow(ConsignmentType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          // Nom
          Expanded(
            flex: 2,
            child: Text(type.name, overflow: TextOverflow.ellipsis),
          ),
          // Déposé
          Expanded(
            flex: 3,
            child: _CounterWidget(
              label: 'Dép.',
              value: _deposited[type.id] ?? 0,
              color: Colors.green,
              onChanged: (val) {
                setState(() => _deposited[type.id] = val);
                _notifyChange();
              },
            ),
          ),
          // Repris
          Expanded(
            flex: 3,
            child: _CounterWidget(
              label: 'Rep.',
              value: _retrieved[type.id] ?? 0,
              color: Colors.orange,
              onChanged: (val) {
                setState(() => _retrieved[type.id] = val);
                _notifyChange();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CounterWidget extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  final Function(int) onChanged;

  const _CounterWidget({
    required this.label,
    required this.value,
    required this.color,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(fontSize: 11)),
        const SizedBox(width: 4),
        // Bouton -
        _CircleButton(
          icon: Icons.remove,
          color: value > 0 ? color : Colors.grey.shade300,
          onTap: value > 0 ? () => onChanged(value - 1) : null,
        ),
        // Valeur (long press pour éditer)
        GestureDetector(
          onLongPress: () => _showEditDialog(context),
          child: Container(
            width: 32,
            alignment: Alignment.center,
            child: Text(
              '$value',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: value > 0 ? color : Colors.grey,
              ),
            ),
          ),
        ),
        // Bouton +
        _CircleButton(
          icon: Icons.add,
          color: color,
          onTap: () => onChanged(value + 1),
        ),
      ],
    );
  }

  void _showEditDialog(BuildContext context) {
    final controller = TextEditingController(text: value.toString());
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(label),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          autofocus: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              final val = int.tryParse(controller.text) ?? 0;
              onChanged(val.clamp(0, 999));
              Navigator.pop(ctx);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const _CircleButton({
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 16, color: color),
      ),
    );
  }
}
```

## 3.5 INTÉGRATION LIVREUR

**Modifier : `mobile/lib/features/deliverer/delivery_detail_page.dart`**

```dart
// Ajouter le widget ConsignmentInput avant le bouton de validation
// Récupérer les mouvements et les envoyer avec la validation de livraison
```

## 3.6 CHECKLIST VALIDATION FEATURE 3

```
□ Migration SQL exécutée
□ Routes ajoutées
□ Admin peut créer des types de consignes
□ Livreur voit le widget (si types existent pour l'org)
□ Livreur peut ignorer (laisser à 0)
□ Livreur peut noter déposé/repris rapidement
□ Long press → saisie manuelle
□ Mouvements enregistrés correctement
□ Admin voit le résumé global
□ Alertes si seuil dépassé
□ Tests passent
```

---

# ═══════════════════════════════════════════════════════════════
# FEATURE 4 : 🔄 COMMANDES RÉCURRENTES
# ═══════════════════════════════════════════════════════════════

```
CONTEXTE :
Deux modes de commande selon le type de commerce :

1. MODE ABONNEMENT (Opt-out)
   - Ex: Pizzeria → Cafétéria (pain, croissants quotidiens)
   - Commande automatique si pas d'annulation
   - Client notifié la veille, peut annuler/modifier avant heure limite
   - Sinon commande auto-confirmée

2. MODE À LA DEMANDE (Opt-in)  
   - Ex: Grossiste → Épicerie
   - Client commande quand il veut
   - Bouton "Recommander" depuis historique pour faciliter

L'admin configure le mode pour chaque client.
```

## 4.1 MIGRATION

**Fichier : `api-v2/migrations/007_add_recurring_orders.sql`**

```sql
-- =====================================================
-- MIGRATION : Commandes récurrentes
-- =====================================================

-- 1. Ajouter colonnes aux users (clients)
ALTER TABLE users ADD COLUMN IF NOT EXISTS order_mode VARCHAR(20) DEFAULT 'on_demand';
-- 'on_demand' = à la demande (défaut)
-- 'subscription' = abonnement

ALTER TABLE users ADD COLUMN IF NOT EXISTS subscription_days JSONB DEFAULT NULL;
-- Ex: ["sunday", "monday", "tuesday", "wednesday", "thursday"]

ALTER TABLE users ADD COLUMN IF NOT EXISTS subscription_cutoff_time TIME DEFAULT '18:00';
-- Heure limite pour annuler/modifier (la veille)

-- 2. Commande type par client
CREATE TABLE IF NOT EXISTS default_orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  customer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  
  items JSONB NOT NULL DEFAULT '[]',
  -- Ex: [{"product_id": "xxx", "quantity": 20, "product_name": "Pain"}, ...]
  
  last_used_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  UNIQUE(organization_id, customer_id)
);

-- 3. Commandes d'abonnement (générées automatiquement)
CREATE TABLE IF NOT EXISTS subscription_orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  customer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  
  scheduled_date DATE NOT NULL,
  
  status VARCHAR(20) DEFAULT 'pending',
  -- 'pending' = en attente (client peut modifier/annuler)
  -- 'confirmed' = confirmée (transformée en vraie commande)
  -- 'modified' = modifiée par client
  -- 'cancelled' = annulée par client
  
  order_id UUID REFERENCES orders(id) ON DELETE SET NULL,
  -- Lien vers la vraie commande une fois confirmée
  
  items JSONB NOT NULL,
  -- Copie de default_order au moment de la création
  
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  confirmed_at TIMESTAMP WITH TIME ZONE,
  cancelled_at TIMESTAMP WITH TIME ZONE,
  
  UNIQUE(customer_id, scheduled_date)
);

CREATE INDEX idx_subscription_orders_date ON subscription_orders(scheduled_date, status);
CREATE INDEX idx_subscription_orders_customer ON subscription_orders(customer_id, scheduled_date DESC);
```

## 4.2 SERVICE

**Fichier : `api-v2/services/subscription.service.js`**

```javascript
// =====================================================
// SERVICE : Commandes récurrentes
// =====================================================

const db = require('../config/database');
const orderService = require('./order.service');
const notificationService = require('./notification.service');
const logger = require('../config/logger');

class SubscriptionService {
  
  /**
   * CRON JOB : Générer les commandes du lendemain
   * À exécuter chaque jour à 14h
   */
  async generateTomorrowOrders() {
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    const dayNames = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'];
    const dayName = dayNames[tomorrow.getDay()];
    const dateStr = tomorrow.toISOString().split('T')[0];
    
    logger.info('Generating subscription orders', { date: dateStr, day: dayName });
    
    // Trouver clients abonnés qui livrent demain
    const subscribers = await db.query(`
      SELECT 
        u.id as customer_id,
        u.organization_id,
        u.name as customer_name,
        do.items
      FROM users u
      JOIN default_orders do ON u.id = do.customer_id
      WHERE u.order_mode = 'subscription'
        AND u.is_active = true
        AND u.subscription_days ? $1
        AND do.items IS NOT NULL
        AND jsonb_array_length(do.items) > 0
        AND NOT EXISTS (
          SELECT 1 FROM subscription_orders so 
          WHERE so.customer_id = u.id AND so.scheduled_date = $2
        )
    `, [dayName, dateStr]);
    
    let count = 0;
    
    for (const sub of subscribers.rows) {
      try {
        // Créer subscription_order
        await db.query(`
          INSERT INTO subscription_orders 
          (organization_id, customer_id, scheduled_date, items, status)
          VALUES ($1, $2, $3, $4, 'pending')
        `, [sub.organization_id, sub.customer_id, dateStr, sub.items]);
        
        // Notifier le client
        await notificationService.sendToUser(sub.customer_id, {
          title: '📦 Commande de demain',
          message: 'Votre commande habituelle sera livrée demain. Tap pour modifier ou annuler.',
          data: { 
            type: 'subscription_reminder', 
            date: dateStr 
          }
        });
        
        count++;
      } catch (error) {
        logger.error('Error creating subscription order', { 
          customerId: sub.customer_id, 
          error: error.message 
        });
      }
    }
    
    logger.info('Subscription orders generated', { count, date: dateStr });
    return count;
  }

  /**
   * CRON JOB : Confirmer les commandes pending après heure limite
   * À exécuter toutes les heures
   */
  async confirmPendingOrders() {
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    const dateStr = tomorrow.toISOString().split('T')[0];
    
    // Trouver les subscription_orders pending dont l'heure limite est passée
    const pending = await db.query(`
      SELECT 
        so.*,
        u.subscription_cutoff_time,
        u.name as customer_name
      FROM subscription_orders so
      JOIN users u ON so.customer_id = u.id
      WHERE so.scheduled_date = $1
        AND so.status IN ('pending', 'modified')
        AND CURRENT_TIME >= u.subscription_cutoff_time
    `, [dateStr]);
    
    let count = 0;
    
    for (const sub of pending.rows) {
      try {
        // Créer la vraie commande
        const order = await orderService.createFromSubscription({
          customer_id: sub.customer_id,
          organization_id: sub.organization_id,
          items: sub.items
        });
        
        // Mettre à jour subscription_order
        await db.query(`
          UPDATE subscription_orders 
          SET status = 'confirmed', order_id = $1, confirmed_at = NOW()
          WHERE id = $2
        `, [order.id, sub.id]);
        
        logger.info('Subscription order confirmed', { 
          subscriptionId: sub.id, 
          orderId: order.id 
        });
        
        count++;
      } catch (error) {
        logger.error('Error confirming subscription order', { 
          subscriptionId: sub.id, 
          error: error.message 
        });
      }
    }
    
    logger.info('Subscription orders confirmed', { count });
    return count;
  }

  /**
   * Client : Voir sa commande de demain
   */
  async getTomorrowOrder(customerId) {
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    const dateStr = tomorrow.toISOString().split('T')[0];
    
    const result = await db.query(`
      SELECT * FROM subscription_orders
      WHERE customer_id = $1 AND scheduled_date = $2
    `, [customerId, dateStr]);
    
    return result.rows[0] || null;
  }

  /**
   * Client : Annuler sa commande de demain
   */
  async cancelTomorrowOrder(customerId) {
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    const dateStr = tomorrow.toISOString().split('T')[0];
    
    const result = await db.query(`
      UPDATE subscription_orders
      SET status = 'cancelled', cancelled_at = NOW()
      WHERE customer_id = $1 
        AND scheduled_date = $2 
        AND status IN ('pending', 'modified')
      RETURNING *
    `, [customerId, dateStr]);
    
    if (result.rows.length === 0) {
      throw new Error('Commande non trouvée ou déjà confirmée');
    }
    
    return result.rows[0];
  }

  /**
   * Client : Modifier sa commande de demain
   */
  async modifyTomorrowOrder(customerId, newItems) {
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    const dateStr = tomorrow.toISOString().split('T')[0];
    
    const result = await db.query(`
      UPDATE subscription_orders
      SET status = 'modified', items = $3, updated_at = NOW()
      WHERE customer_id = $1 
        AND scheduled_date = $2 
        AND status IN ('pending', 'modified')
      RETURNING *
    `, [customerId, dateStr, JSON.stringify(newItems)]);
    
    if (result.rows.length === 0) {
      throw new Error('Commande non trouvée ou déjà confirmée');
    }
    
    return result.rows[0];
  }

  /**
   * Admin : Récupérer ou créer commande type d'un client
   */
  async getDefaultOrder(customerId, organizationId) {
    let result = await db.query(`
      SELECT * FROM default_orders
      WHERE customer_id = $1 AND organization_id = $2
    `, [customerId, organizationId]);
    
    if (result.rows.length === 0) {
      // Créer depuis dernière commande si existe
      const lastOrder = await db.query(`
        SELECT 
          json_agg(
            json_build_object(
              'product_id', oi.product_id,
              'quantity', oi.quantity,
              'product_name', p.name
            )
          ) as items
        FROM orders o
        JOIN order_items oi ON o.id = oi.order_id
        JOIN products p ON oi.product_id = p.id
        WHERE o.customer_id = $1 
          AND o.organization_id = $2
          AND o.status != 'cancelled'
        GROUP BY o.id
        ORDER BY o.created_at DESC
        LIMIT 1
      `, [customerId, organizationId]);
      
      if (lastOrder.rows.length > 0 && lastOrder.rows[0].items) {
        result = await db.query(`
          INSERT INTO default_orders (organization_id, customer_id, items)
          VALUES ($1, $2, $3)
          RETURNING *
        `, [organizationId, customerId, JSON.stringify(lastOrder.rows[0].items)]);
      }
    }
    
    return result.rows[0] || null;
  }

  /**
   * Admin : Mettre à jour commande type
   */
  async updateDefaultOrder(customerId, items, organizationId) {
    const result = await db.query(`
      INSERT INTO default_orders (organization_id, customer_id, items)
      VALUES ($1, $2, $3)
      ON CONFLICT (organization_id, customer_id) 
      DO UPDATE SET items = $3, updated_at = NOW()
      RETURNING *
    `, [organizationId, customerId, JSON.stringify(items)]);
    
    return result.rows[0];
  }

  /**
   * Admin : Configurer mode abonnement d'un client
   */
  async updateSubscriptionConfig(customerId, config, organizationId) {
    const { order_mode, subscription_days, subscription_cutoff_time } = config;
    
    const result = await db.query(`
      UPDATE users SET 
        order_mode = $2,
        subscription_days = $3,
        subscription_cutoff_time = COALESCE($4, '18:00'),
        updated_at = NOW()
      WHERE id = $1 AND organization_id = $5
      RETURNING id, name, order_mode, subscription_days, subscription_cutoff_time
    `, [
      customerId, 
      order_mode, 
      subscription_days ? JSON.stringify(subscription_days) : null,
      subscription_cutoff_time,
      organizationId
    ]);
    
    if (result.rows.length === 0) {
      throw new Error('Client non trouvé');
    }
    
    return result.rows[0];
  }

  /**
   * Client on-demand : Recommander une commande passée
   */
  async reorder(orderId, customerId, organizationId) {
    // Récupérer items de la commande originale
    const original = await db.query(`
      SELECT 
        o.customer_id,
        json_agg(
          json_build_object(
            'product_id', oi.product_id,
            'quantity', oi.quantity
          )
        ) as items
      FROM orders o
      JOIN order_items oi ON o.id = oi.order_id
      WHERE o.id = $1 AND o.customer_id = $2 AND o.organization_id = $3
      GROUP BY o.id, o.customer_id
    `, [orderId, customerId, organizationId]);
    
    if (original.rows.length === 0) {
      throw new Error('Commande non trouvée');
    }
    
    // Créer nouvelle commande
    const newOrder = await orderService.create({
      customer_id: customerId,
      organization_id: organizationId,
      items: original.rows[0].items
    });
    
    return newOrder;
  }
}

module.exports = new SubscriptionService();
```

## 4.3 ROUTES

**Fichier : `api-v2/routes/subscription.routes.js`**

```javascript
const router = require('express').Router();
const subscriptionService = require('../services/subscription.service');
const { authenticate, authorize } = require('../middleware/auth.middleware');

router.use(authenticate);

// ═══════════════════════════════════════════════════
// ROUTES CLIENT
// ═══════════════════════════════════════════════════

// GET /api/subscription/tomorrow - Ma commande de demain
router.get('/subscription/tomorrow', async (req, res, next) => {
  try {
    const order = await subscriptionService.getTomorrowOrder(req.user.id);
    res.json(order);
  } catch (error) {
    next(error);
  }
});

// PUT /api/subscription/tomorrow/cancel - Annuler
router.put('/subscription/tomorrow/cancel', async (req, res, next) => {
  try {
    const result = await subscriptionService.cancelTomorrowOrder(req.user.id);
    res.json(result);
  } catch (error) {
    if (error.message.includes('non trouvée')) {
      return res.status(400).json({ error: error.message });
    }
    next(error);
  }
});

// PUT /api/subscription/tomorrow/modify - Modifier
router.put('/subscription/tomorrow/modify', async (req, res, next) => {
  try {
    const result = await subscriptionService.modifyTomorrowOrder(
      req.user.id,
      req.body.items
    );
    res.json(result);
  } catch (error) {
    if (error.message.includes('non trouvée')) {
      return res.status(400).json({ error: error.message });
    }
    next(error);
  }
});

// POST /api/orders/:id/reorder - Recommander (on-demand)
router.post('/orders/:id/reorder', async (req, res, next) => {
  try {
    const newOrder = await subscriptionService.reorder(
      req.params.id,
      req.user.id,
      req.user.organization_id
    );
    res.status(201).json(newOrder);
  } catch (error) {
    if (error.message.includes('non trouvée')) {
      return res.status(404).json({ error: error.message });
    }
    next(error);
  }
});

// ═══════════════════════════════════════════════════
// ROUTES ADMIN
// ═══════════════════════════════════════════════════

// GET /api/customers/:id/default-order - Commande type
router.get('/customers/:id/default-order', 
  authorize(['admin']), 
  async (req, res, next) => {
    try {
      const result = await subscriptionService.getDefaultOrder(
        req.params.id,
        req.user.organization_id
      );
      res.json(result);
    } catch (error) {
      next(error);
    }
  }
);

// PUT /api/customers/:id/default-order - Modifier commande type
router.put('/customers/:id/default-order',
  authorize(['admin']),
  async (req, res, next) => {
    try {
      const result = await subscriptionService.updateDefaultOrder(
        req.params.id,
        req.body.items,
        req.user.organization_id
      );
      res.json(result);
    } catch (error) {
      next(error);
    }
  }
);

// PUT /api/customers/:id/subscription - Configurer abonnement
router.put('/customers/:id/subscription',
  authorize(['admin']),
  async (req, res, next) => {
    try {
      const result = await subscriptionService.updateSubscriptionConfig(
        req.params.id,
        req.body,
        req.user.organization_id
      );
      res.json(result);
    } catch (error) {
      next(error);
    }
  }
);

module.exports = router;
```

## 4.4 JOBS CRON (BullMQ)

**Fichier : `api-v2/jobs/subscription.jobs.js`**

```javascript
const { Queue, Worker } = require('bullmq');
const subscriptionService = require('../services/subscription.service');
const { redisConnection } = require('../config/redis');
const logger = require('../config/logger');

// Créer la queue
const subscriptionQueue = new Queue('subscription', { connection: redisConnection });

// Programmer les jobs
async function setupSubscriptionJobs() {
  // Générer commandes du lendemain - tous les jours à 14h
  await subscriptionQueue.add(
    'generateTomorrowOrders',
    {},
    {
      repeat: { pattern: '0 14 * * *' }, // 14:00 chaque jour
      removeOnComplete: 100,
      removeOnFail: 50
    }
  );

  // Confirmer commandes pending - toutes les heures
  await subscriptionQueue.add(
    'confirmPendingOrders',
    {},
    {
      repeat: { pattern: '0 * * * *' }, // Chaque heure
      removeOnComplete: 100,
      removeOnFail: 50
    }
  );
  
  logger.info('Subscription jobs scheduled');
}

// Worker pour traiter les jobs
const subscriptionWorker = new Worker(
  'subscription',
  async (job) => {
    logger.info(`Processing job: ${job.name}`);
    
    try {
      if (job.name === 'generateTomorrowOrders') {
        const count = await subscriptionService.generateTomorrowOrders();
        return { success: true, count };
      }

      if (job.name === 'confirmPendingOrders') {
        const count = await subscriptionService.confirmPendingOrders();
        return { success: true, count };
      }
    } catch (error) {
      logger.error(`Job ${job.name} failed`, { error: error.message });
      throw error;
    }
  },
  { connection: redisConnection }
);

subscriptionWorker.on('completed', (job, result) => {
  logger.info(`Job ${job.name} completed`, result);
});

subscriptionWorker.on('failed', (job, error) => {
  logger.error(`Job ${job.name} failed`, { error: error.message });
});

module.exports = { setupSubscriptionJobs, subscriptionQueue, subscriptionWorker };
```

**Ajouter dans le démarrage de l'app :**

```javascript
const { setupSubscriptionJobs } = require('./jobs/subscription.jobs');

// Au démarrage
setupSubscriptionJobs();
```

## 4.5 MOBILE - WIDGET ABONNEMENT CLIENT

**Fichier : `mobile/lib/core/widgets/subscription_card.dart`**

```dart
// Widget pour afficher/gérer la commande de demain (client abonné)

import 'package:flutter/material.dart';

class SubscriptionCard extends StatefulWidget {
  const SubscriptionCard({Key? key}) : super(key: key);

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  Map<String, dynamic>? _tomorrowOrder;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadTomorrowOrder();
  }

  Future<void> _loadTomorrowOrder() async {
    setState(() => _loading = true);
    try {
      // _tomorrowOrder = await subscriptionService.getTomorrowOrder();
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const SizedBox.shrink();
    if (_tomorrowOrder == null) return const SizedBox.shrink();

    final status = _tomorrowOrder!['status'];
    final isCancelled = status == 'cancelled';
    final items = _tomorrowOrder!['items'] as List? ?? [];

    return Card(
      margin: const EdgeInsets.all(16),
      color: isCancelled ? Colors.grey.shade100 : Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isCancelled ? Icons.cancel : Icons.event_available,
                  color: isCancelled ? Colors.grey : Colors.green,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Commande de demain',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                _StatusBadge(status: status),
              ],
            ),
            const SizedBox(height: 12),

            if (isCancelled)
              const Text('Cette commande a été annulée.')
            else ...[
              Text('${items.length} article(s)'),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _showModifyDialog,
                      icon: const Icon(Icons.edit),
                      label: const Text('Modifier'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _cancelOrder,
                      icon: const Icon(Icons.cancel),
                      label: const Text('Annuler'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _cancelOrder() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Annuler la commande ?'),
        content: const Text('Voulez-vous annuler votre commande de demain ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Non'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Oui, annuler'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      // await subscriptionService.cancelTomorrow();
      _loadTomorrowOrder();
    }
  }

  void _showModifyDialog() {
    // Ouvrir dialog/page de modification
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String label;

    switch (status) {
      case 'pending':
        color = Colors.blue;
        label = 'En attente';
        break;
      case 'modified':
        color = Colors.orange;
        label = 'Modifiée';
        break;
      case 'confirmed':
        color = Colors.green;
        label = 'Confirmée';
        break;
      case 'cancelled':
        color = Colors.grey;
        label = 'Annulée';
        break;
      default:
        color = Colors.grey;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
```

## 4.6 MOBILE - BOUTON RECOMMANDER

**Ajouter dans `order_history_page.dart` ou dans le card de commande :**

```dart
IconButton(
  icon: const Icon(Icons.replay),
  tooltip: 'Recommander',
  onPressed: () => _reorder(order.id),
),

Future<void> _reorder(String orderId) async {
  final confirm = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Recommander ?'),
      content: const Text('Créer une nouvelle commande avec les mêmes articles ?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: const Text('Oui'),
        ),
      ],
    ),
  );

  if (confirm == true) {
    try {
      // final newOrder = await orderService.reorder(orderId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Commande créée !'),
          backgroundColor: Colors.green,
        ),
      );
      // Navigator vers nouvelle commande
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: $e'), backgroundColor: Colors.red),
      );
    }
  }
}
```

## 4.7 CHECKLIST VALIDATION FEATURE 4

```
□ Migration SQL exécutée
□ Routes ajoutées
□ Jobs CRON configurés et fonctionnent
□ Admin peut configurer client en mode "abonnement"
□ Admin peut définir jours de livraison
□ Admin peut définir commande type
□ Client abonné reçoit notification la veille
□ Client peut voir sa commande de demain
□ Client peut annuler avant heure limite
□ Client peut modifier avant heure limite
□ Commande auto-confirmée après heure limite
□ Client on-demand peut "Recommander" depuis historique
□ Tests passent
```

---

# ═══════════════════════════════════════════════════════════════
# ✅ VALIDATION FINALE
# ═══════════════════════════════════════════════════════════════

```
Après avoir implémenté les 4 features, vérifier :

INTÉGRATION GLOBALE :
□ Toutes les migrations exécutées sans erreur
□ Toutes les routes ajoutées dans app.js
□ Pas de conflit entre les features
□ npm test passe
□ flutter test passe
□ flutter analyze sans erreur

FONCTIONNEL :
□ Feature 1 : Admin/Livreur peut collecter dette
□ Feature 2 : Notifications crédit envoyées aux bons seuils
□ Feature 3 : Consignes trackées correctement
□ Feature 4 : Abonnements et recommander fonctionnent

PERFORMANCE :
□ Pas de requête SQL > 500ms
□ App mobile fluide

SÉCURITÉ :
□ Toutes les routes protégées par auth
□ Vérification organization_id partout
□ Validation des inputs
```

---

# 📚 RAPPEL : FICHIERS À CRÉER/MODIFIER

## Backend (api-v2/)

**Nouveaux fichiers :**
- migrations/004_add_debt_management.sql
- migrations/005_add_credit_limit.sql
- migrations/006_add_consignments.sql
- migrations/007_add_recurring_orders.sql
- services/debt.service.js
- services/credit.service.js
- services/consignment.service.js
- services/subscription.service.js
- routes/debt.routes.js
- routes/consignment.routes.js
- routes/subscription.routes.js
- jobs/subscription.jobs.js

**Fichiers à modifier :**
- app.js (ajouter routes)
- services/order.service.js (intégrer crédit check)

## Mobile (mobile/lib/)

**Nouveaux fichiers :**
- core/models/debt.dart
- core/services/debt_service.dart
- core/widgets/collect_debt_dialog.dart
- core/widgets/credit_badge.dart
- core/widgets/consignment_input.dart
- core/widgets/subscription_card.dart

**Fichiers à modifier :**
- features/admin/admin_dashboard.dart
- features/deliverer/delivery_detail_page.dart
- features/cafeteria/order_history_page.dart
