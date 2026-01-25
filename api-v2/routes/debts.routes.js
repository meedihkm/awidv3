// =====================================================
// ROUTES : Gestion des Dettes (Refactorisé)
// Architecture propre avec logs et validation
// =====================================================

const express = require("express");
const router = express.Router();
const pool = require("../config/database");
const { authenticate, authorize } = require("../middleware/auth");
const { validateUUID } = require("../middleware/validate");
const { logAudit } = require("../services/audit.service");

// ─────────────────────────────────────────────────────
// HELPERS
// ─────────────────────────────────────────────────────

/**
 * Parse un nombre de manière sécurisée
 */
function parseNumber(value, defaultValue = 0) {
  const parsed = parseFloat(value);
  return isNaN(parsed) ? defaultValue : parsed;
}

/**
 * Log une action avec contexte
 */
function logAction(action, details) {
  console.log(`[DEBTS] ${action}:`, JSON.stringify(details, null, 2));
}

// ─────────────────────────────────────────────────────
// GET /api/debts
// Liste tous les clients avec dette
// Accessible par : admin, deliverer
// ─────────────────────────────────────────────────────
router.get(
  "/",
  authenticate,
  authorize(["admin", "deliverer"]),
  async (req, res) => {
    const startTime = Date.now();
    logAction("GET_DEBTS_LIST", {
      userId: req.user.id,
      role: req.user.role,
      query: req.query,
    });

    try {
      const page = parseInt(req.query.page) || 1;
      const limit = Math.min(parseInt(req.query.limit) || 50, 100);
      const offset = (page - 1) * limit;
      const minDebt = parseNumber(req.query.min_debt, 0);
      const customerId = req.query.customer_id || null;
      const delivererId =
        req.user.role === "deliverer"
          ? req.user.id
          : req.query.deliverer_id || null;
      const dateFrom = req.query.date_from || null;
      const dateTo = req.query.date_to || null;

      // Construction de la requête avec filtres
      let whereClause =
        "WHERE o.organization_id = $1 AND o.total > o.amount_paid";
      const params = [req.user.organization_id];
      let paramIndex = 2;

      if (customerId) {
        params.push(customerId);
        whereClause += ` AND o.customer_id = $${paramIndex++}`;
      }

      if (delivererId) {
        params.push(delivererId);
        whereClause += ` AND EXISTS (
        SELECT 1 FROM deliveries d 
        WHERE d.order_id = o.id AND d.deliverer_id = $${paramIndex++}
      )`;
      }

      if (dateFrom) {
        params.push(dateFrom);
        whereClause += ` AND o.created_at >= $${paramIndex++}`;
      }

      if (dateTo) {
        params.push(dateTo);
        whereClause += ` AND o.created_at <= $${paramIndex++}`;
      }

      // Compter le total
      const countQuery = `
      SELECT COUNT(DISTINCT o.customer_id) as count
      FROM orders o
      ${whereClause}
    `;
      const countResult = await pool.query(countQuery, params);
      const total = parseInt(countResult.rows[0].count);

      // Récupérer les dettes groupées par client
      const query = `
      SELECT 
        u.id as customer_id,
        u.name,
        u.email,
        u.phone,
        COUNT(o.id) as unpaid_orders,
        SUM(o.total - o.amount_paid) as total_debt,
        MAX(o.created_at) as last_order_date,
        MIN(o.created_at) as first_unpaid_date
      FROM orders o
      JOIN users u ON o.customer_id = u.id
      ${whereClause}
      GROUP BY u.id, u.name, u.email, u.phone
      HAVING SUM(o.total - o.amount_paid) >= $${paramIndex}
      ORDER BY total_debt DESC
      LIMIT $${paramIndex + 1} OFFSET $${paramIndex + 2}
    `;

      const result = await pool.query(query, [
        ...params,
        minDebt,
        limit,
        offset,
      ]);

      const duration = Date.now() - startTime;
      logAction("GET_DEBTS_LIST_SUCCESS", {
        count: result.rows.length,
        total,
        duration: `${duration}ms`,
      });

      res.json({
        success: true,
        data: result.rows.map((row) => ({
          customerId: row.customer_id,
          name: row.name,
          email: row.email,
          phone: row.phone,
          unpaidOrders: parseInt(row.unpaid_orders),
          totalDebt: parseNumber(row.total_debt),
          lastOrderDate: row.last_order_date,
          firstUnpaidDate: row.first_unpaid_date,
        })),
        pagination: {
          page,
          limit,
          total,
          totalPages: Math.ceil(total / limit),
          hasMore: page * limit < total,
        },
      });
    } catch (error) {
      logAction("GET_DEBTS_LIST_ERROR", { error: error.message });
      console.error("[DEBTS] Error:", error);
      res.status(500).json({ error: "Erreur serveur" });
    }
  },
);

// ─────────────────────────────────────────────────────
// GET /api/debts/customers/:customerId
// Dette détaillée d'un client spécifique
// Accessible par : admin, deliverer
// ─────────────────────────────────────────────────────
router.get(
  "/customers/:customerId",
  authenticate,
  authorize(["admin", "deliverer"]),
  validateUUID("customerId"),
  async (req, res) => {
    logAction("GET_CUSTOMER_DEBT", {
      customerId: req.params.customerId,
      requestedBy: req.user.id,
    });

    try {
      // Vérifier que le client existe et appartient à l'organisation
      const customerCheck = await pool.query(
        "SELECT id, name, email, phone FROM users WHERE id = $1::text AND organization_id = $2::text AND role = $3",
        [req.params.customerId, req.user.organization_id, "customer"],
      );

      if (customerCheck.rows.length === 0) {
        logAction("GET_CUSTOMER_DEBT_NOT_FOUND", {
          customerId: req.params.customerId,
        });
        return res.status(404).json({ error: "Client non trouvé" });
      }

      const customer = customerCheck.rows[0];

      // Récupérer les commandes impayées
      const ordersResult = await pool.query(
        `SELECT 
        o.id,
        o.order_number,
        o.created_at,
        o.total,
        o.amount_paid,
        (o.total - o.amount_paid) as remaining,
        o.status,
        o.payment_status,
        COALESCE(
          json_agg(
            json_build_object(
              'id', oi.id,
              'productName', p.name,
              'quantity', oi.quantity,
              'unitPrice', oi.price
            ) ORDER BY oi.created_at
          ) FILTER (WHERE oi.id IS NOT NULL),
          '[]'
        ) as items
      FROM orders o
      LEFT JOIN order_items oi ON o.id = oi.order_id
      LEFT JOIN products p ON oi.product_id = p.id
      WHERE o.customer_id = $1::text 
        AND o.organization_id = $2::text 
        AND o.total > o.amount_paid
      GROUP BY o.id
      ORDER BY o.created_at ASC`,
        [req.params.customerId, req.user.organization_id],
      );

      // Récupérer l'historique des paiements
      const paymentsResult = await pool.query(
        `SELECT 
        pt.id,
        pt.amount,
        pt.payment_type,
        pt.payment_mode,
        pt.created_at,
        pt.notes,
        pt.orders_affected,
        u.name as recorded_by_name,
        pt.recorded_by_role
      FROM payment_transactions pt
      LEFT JOIN users u ON pt.recorded_by = u.id
      WHERE pt.client_id = $1::text
      ORDER BY pt.created_at DESC
      LIMIT 50`,
        [req.params.customerId],
      );

      const totalDebt = ordersResult.rows.reduce(
        (sum, order) => sum + parseNumber(order.remaining),
        0,
      );

      logAction("GET_CUSTOMER_DEBT_SUCCESS", {
        customerId: req.params.customerId,
        totalDebt,
        unpaidOrders: ordersResult.rows.length,
      });

      res.json({
        success: true,
        data: {
          customer: {
            id: customer.id,
            name: customer.name,
            email: customer.email,
            phone: customer.phone,
          },
          totalDebt,
          unpaidOrders: ordersResult.rows.map((order) => ({
            id: order.id,
            orderNumber: order.order_number,
            date: order.created_at,
            total: parseNumber(order.total),
            amountPaid: parseNumber(order.amount_paid),
            remaining: parseNumber(order.remaining),
            status: order.status,
            paymentStatus: order.payment_status,
            items: order.items,
          })),
          paymentHistory: paymentsResult.rows.map((payment) => ({
            id: payment.id,
            amount: parseNumber(payment.amount),
            type: payment.payment_type,
            mode: payment.payment_mode,
            date: payment.created_at,
            notes: payment.notes,
            ordersAffected: payment.orders_affected,
            recordedBy: {
              name: payment.recorded_by_name,
              role: payment.recorded_by_role,
            },
          })),
        },
      });
    } catch (error) {
      logAction("GET_CUSTOMER_DEBT_ERROR", { error: error.message });
      console.error("[DEBTS] Error:", error);
      res.status(500).json({ error: "Erreur serveur" });
    }
  },
);

// ─────────────────────────────────────────────────────
// GET /api/debts/stats
// Statistiques globales des dettes
// Accessible par : admin
// ─────────────────────────────────────────────────────
router.get("/stats", authenticate, authorize(["admin"]), async (req, res) => {
  logAction("GET_DEBT_STATS", { userId: req.user.id });

  try {
    const result = await pool.query(
      `SELECT 
        COUNT(DISTINCT o.customer_id) as customers_with_debt,
        COUNT(o.id) as total_unpaid_orders,
        COALESCE(SUM(o.total - o.amount_paid), 0) as total_debt,
        COALESCE(AVG(o.total - o.amount_paid), 0) as avg_debt_per_order,
        COALESCE(MAX(o.total - o.amount_paid), 0) as max_debt_order
      FROM orders o
      WHERE o.organization_id = $1::text 
        AND o.total > o.amount_paid`,
      [req.user.organization_id],
    );

    const stats = result.rows[0];

    logAction("GET_DEBT_STATS_SUCCESS", stats);

    res.json({
      success: true,
      data: {
        customersWithDebt: parseInt(stats.customers_with_debt),
        totalUnpaidOrders: parseInt(stats.total_unpaid_orders),
        totalDebt: parseNumber(stats.total_debt),
        avgDebtPerOrder: parseNumber(stats.avg_debt_per_order),
        maxDebtOrder: parseNumber(stats.max_debt_order),
      },
    });
  } catch (error) {
    logAction("GET_DEBT_STATS_ERROR", { error: error.message });
    console.error("[DEBTS] Error:", error);
    res.status(500).json({ error: "Erreur serveur" });
  }
});

module.exports = router;
