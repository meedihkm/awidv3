// =====================================================
// ROUTES : Gestion Financière Unifiée
// Paiements + Dettes + Statistiques
// =====================================================

const express = require("express");
const router = express.Router();
const pool = require("../config/database");
const { authenticate, authorize } = require("../middleware/auth");
const { logAudit } = require("../services/audit.service");

// ─────────────────────────────────────────────────────
// HELPERS
// ─────────────────────────────────────────────────────

function parseNumber(value, defaultValue = 0) {
  const parsed = parseFloat(value);
  return isNaN(parsed) ? defaultValue : parsed;
}

function logAction(action, details) {
  console.log(`[FINANCIAL] ${action}:`, JSON.stringify(details, null, 2));
}

// ─────────────────────────────────────────────────────
// GET /api/financial/overview
// Vue d'ensemble financière (Admin)
// ─────────────────────────────────────────────────────
router.get(
  "/overview",
  authenticate,
  authorize(["admin"]),
  async (req, res) => {
    logAction("GET_OVERVIEW", { userId: req.user.id });

    try {
      const { dateFrom, dateTo } = req.query;
      const orgId = req.user.organization_id;

      // Construire les filtres de date
      let dateFilter = "";
      const params = [orgId];
      let paramIndex = 2;

      if (dateFrom) {
        params.push(dateFrom);
        dateFilter += ` AND o.created_at >= $${paramIndex++}`;
      }

      if (dateTo) {
        params.push(dateTo);
        dateFilter += ` AND o.created_at <= $${paramIndex++}`;
      }

      // Statistiques globales
      const statsResult = await pool.query(
        `SELECT 
        -- Revenus
        COALESCE(SUM(o.total), 0) as total_revenue,
        COALESCE(SUM(o.amount_paid), 0) as total_collected,
        COALESCE(SUM(o.total - o.amount_paid), 0) as total_unpaid,
        
        -- Compteurs de commandes
        COUNT(*) as total_orders,
        COUNT(*) FILTER (WHERE o.status = 'delivered') as delivered_orders,
        COUNT(*) FILTER (WHERE o.payment_status = 'paid') as paid_orders,
        COUNT(*) FILTER (WHERE o.payment_status = 'unpaid') as unpaid_orders,
        COUNT(*) FILTER (WHERE o.payment_status = 'partial') as partial_orders,
        
        -- Clients
        COUNT(DISTINCT o.customer_id) as total_customers,
        COUNT(DISTINCT o.customer_id) FILTER (WHERE o.total > o.amount_paid) as customers_with_debt
      FROM orders o
      WHERE o.organization_id = $1
        AND o.status != 'cancelled'
        ${dateFilter}`,
        params,
      );

      const stats = statsResult.rows[0];

      // Top 5 clients par CA
      const topClientsResult = await pool.query(
        `SELECT 
        u.id,
        u.name,
        u.phone,
        COALESCE(SUM(o.total), 0) as total_revenue,
        COALESCE(SUM(o.amount_paid), 0) as total_paid,
        COALESCE(SUM(o.total - o.amount_paid), 0) as total_debt,
        COUNT(*) as order_count
      FROM users u
      JOIN orders o ON u.id = o.customer_id
      WHERE o.organization_id = $1
        AND o.status != 'cancelled'
        ${dateFilter}
      GROUP BY u.id, u.name, u.phone
      ORDER BY total_revenue DESC
      LIMIT 5`,
        params,
      );

      // Stats par livreur
      const delivererStatsResult = await pool.query(
        `SELECT 
        u.id,
        u.name,
        COUNT(d.id) as total_deliveries,
        COUNT(*) FILTER (WHERE d.status = 'delivered') as delivered_count,
        COALESCE(SUM(o.amount_paid) FILTER (WHERE d.status = 'delivered'), 0) as amount_collected
      FROM users u
      LEFT JOIN deliveries d ON u.id = d.deliverer_id AND d.organization_id = $1
      LEFT JOIN orders o ON d.order_id = o.id
      WHERE u.role = 'deliverer'
        AND u.organization_id = $1
        AND u.active = true
        ${dateFilter.replace(/o\./g, "o.")}
      GROUP BY u.id, u.name
      ORDER BY delivered_count DESC`,
        params,
      );

      logAction("GET_OVERVIEW_SUCCESS", { stats });

      res.json({
        success: true,
        data: {
          summary: {
            totalRevenue: parseNumber(stats.total_revenue),
            totalCollected: parseNumber(stats.total_collected),
            totalUnpaid: parseNumber(stats.total_unpaid),
            totalOrders: parseInt(stats.total_orders),
            deliveredOrders: parseInt(stats.delivered_orders),
            paidOrders: parseInt(stats.paid_orders),
            unpaidOrders: parseInt(stats.unpaid_orders),
            partialOrders: parseInt(stats.partial_orders),
            totalCustomers: parseInt(stats.total_customers),
            customersWithDebt: parseInt(stats.customers_with_debt),
          },
          topClients: topClientsResult.rows.map((row) => ({
            id: row.id,
            name: row.name,
            phone: row.phone,
            totalRevenue: parseNumber(row.total_revenue),
            totalPaid: parseNumber(row.total_paid),
            totalDebt: parseNumber(row.total_debt),
            orderCount: parseInt(row.order_count),
          })),
          delivererStats: delivererStatsResult.rows.map((row) => ({
            id: row.id,
            name: row.name,
            totalDeliveries: parseInt(row.total_deliveries),
            deliveredCount: parseInt(row.delivered_count),
            amountCollected: parseNumber(row.amount_collected),
          })),
        },
      });
    } catch (error) {
      logAction("GET_OVERVIEW_ERROR", { error: error.message });
      console.error("[FINANCIAL] Error:", error);
      res.status(500).json({ error: "Erreur serveur" });
    }
  },
);

// ─────────────────────────────────────────────────────
// GET /api/financial/debts
// Liste des clients avec dette
// ─────────────────────────────────────────────────────
router.get(
  "/debts",
  authenticate,
  authorize(["admin", "deliverer"]),
  async (req, res) => {
    logAction("GET_DEBTS", { userId: req.user.id, query: req.query });

    try {
      const page = parseInt(req.query.page) || 1;
      const limit = Math.min(parseInt(req.query.limit) || 50, 100);
      const offset = (page - 1) * limit;
      const minDebt = parseNumber(req.query.minDebt, 0);
      const customerId = req.query.customerId || null;
      const delivererId =
        req.user.role === "deliverer"
          ? req.user.id
          : req.query.delivererId || null;

      // Construction de la requête
      let whereClause =
        "WHERE o.organization_id = $1 AND o.total > o.amount_paid AND o.status != 'cancelled'";
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

      // Compter le total
      const countResult = await pool.query(
        `SELECT COUNT(DISTINCT o.customer_id) as count
      FROM orders o
      ${whereClause}`,
        params,
      );
      const total = parseInt(countResult.rows[0].count);

      // Récupérer les dettes
      const result = await pool.query(
        `SELECT 
        u.id as customer_id,
        u.name,
        u.email,
        u.phone,
        COUNT(o.id) as unpaid_orders,
        COALESCE(SUM(o.total - o.amount_paid), 0) as total_debt,
        MAX(o.created_at) as last_order_date
      FROM orders o
      JOIN users u ON o.customer_id = u.id
      ${whereClause}
      GROUP BY u.id, u.name, u.email, u.phone
      HAVING COALESCE(SUM(o.total - o.amount_paid), 0) >= $${paramIndex}
      ORDER BY total_debt DESC
      LIMIT $${paramIndex + 1} OFFSET $${paramIndex + 2}`,
        [...params, minDebt, limit, offset],
      );

      logAction("GET_DEBTS_SUCCESS", { count: result.rows.length, total });

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
        })),
        pagination: {
          page,
          limit,
          total,
          totalPages: Math.ceil(total / limit),
        },
      });
    } catch (error) {
      logAction("GET_DEBTS_ERROR", { error: error.message });
      console.error("[FINANCIAL] Error:", error);
      res.status(500).json({ error: "Erreur serveur" });
    }
  },
);

// ─────────────────────────────────────────────────────
// GET /api/financial/debts/:customerId
// Détail de la dette d'un client
// ─────────────────────────────────────────────────────
router.get(
  "/debts/:customerId",
  authenticate,
  authorize(["admin", "deliverer"]),
  async (req, res) => {
    logAction("GET_CUSTOMER_DEBT", { customerId: req.params.customerId });

    try {
      const { customerId } = req.params;

      // Vérifier que le client existe
      const customerCheck = await pool.query(
        "SELECT id, name, email, phone FROM users WHERE id = $1 AND organization_id = $2 AND role = 'customer'",
        [customerId, req.user.organization_id],
      );

      if (customerCheck.rows.length === 0) {
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
        o.payment_status
      FROM orders o
      WHERE o.customer_id = $1 
        AND o.organization_id = $2 
        AND o.total > o.amount_paid
        AND o.status != 'cancelled'
      ORDER BY o.created_at ASC`,
        [customerId, req.user.organization_id],
      );

      const totalDebt = ordersResult.rows.reduce(
        (sum, order) => sum + parseNumber(order.remaining),
        0,
      );

      logAction("GET_CUSTOMER_DEBT_SUCCESS", { customerId, totalDebt });

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
          })),
        },
      });
    } catch (error) {
      logAction("GET_CUSTOMER_DEBT_ERROR", { error: error.message });
      console.error("[FINANCIAL] Error:", error);
      res.status(500).json({ error: "Erreur serveur" });
    }
  },
);

// ─────────────────────────────────────────────────────
// POST /api/financial/payments
// Enregistrer un paiement
// ─────────────────────────────────────────────────────
router.post(
  "/payments",
  authenticate,
  authorize(["admin", "deliverer"]),
  async (req, res) => {
    logAction("RECORD_PAYMENT", { userId: req.user.id, body: req.body });

    const client = await pool.connect();
    try {
      await client.query("BEGIN");

      const {
        customerId,
        amount,
        mode = "cash",
        notes,
        targetOrders,
      } = req.body;

      // Validation
      if (!customerId || !amount || amount <= 0) {
        await client.query("ROLLBACK");
        return res.status(400).json({ error: "Données invalides" });
      }

      // Vérifier le client
      const customerCheck = await client.query(
        "SELECT id, name FROM users WHERE id = $1 AND organization_id = $2 AND role = 'customer'",
        [customerId, req.user.organization_id],
      );

      if (customerCheck.rows.length === 0) {
        await client.query("ROLLBACK");
        return res.status(404).json({ error: "Client non trouvé" });
      }

      const customer = customerCheck.rows[0];

      // Calculer la dette actuelle
      const debtResult = await client.query(
        `SELECT COALESCE(SUM(total - amount_paid), 0) as current_debt
       FROM orders
       WHERE customer_id = $1 AND organization_id = $2 AND total > amount_paid AND status != 'cancelled'`,
        [customerId, req.user.organization_id],
      );

      const currentDebt = parseNumber(debtResult.rows[0].current_debt);

      if (currentDebt === 0) {
        await client.query("ROLLBACK");
        return res.status(400).json({ error: "Ce client n'a pas de dette" });
      }

      if (amount > currentDebt) {
        await client.query("ROLLBACK");
        return res.status(400).json({
          error: `Le montant (${amount} DA) est supérieur à la dette (${currentDebt} DA)`,
        });
      }

      // Appliquer le paiement aux commandes (FIFO)
      let remainingAmount = amount;
      const affectedOrders = [];

      const ordersToUpdate =
        targetOrders && targetOrders.length > 0
          ? await client.query(
              `SELECT id, total, amount_paid, (total - amount_paid) as remaining
           FROM orders
           WHERE id = ANY($1::text[]) AND customer_id = $2 AND organization_id = $3 AND total > amount_paid
           ORDER BY created_at ASC`,
              [targetOrders, customerId, req.user.organization_id],
            )
          : await client.query(
              `SELECT id, total, amount_paid, (total - amount_paid) as remaining
           FROM orders
           WHERE customer_id = $1 AND organization_id = $2 AND total > amount_paid AND status != 'cancelled'
           ORDER BY created_at ASC`,
              [customerId, req.user.organization_id],
            );

      for (const order of ordersToUpdate.rows) {
        if (remainingAmount <= 0) break;

        const orderRemaining = parseNumber(order.remaining);
        const paymentForOrder = Math.min(remainingAmount, orderRemaining);
        const newAmountPaid = parseNumber(order.amount_paid) + paymentForOrder;
        const newPaymentStatus =
          newAmountPaid >= parseNumber(order.total) ? "paid" : "partial";

        await client.query(
          `UPDATE orders 
         SET amount_paid = $1, payment_status = $2, updated_at = NOW()
         WHERE id = $3`,
          [newAmountPaid, newPaymentStatus, order.id],
        );

        affectedOrders.push({
          orderId: order.id,
          amountApplied: paymentForOrder,
          newStatus: newPaymentStatus,
        });

        remainingAmount -= paymentForOrder;
      }

      // Enregistrer dans l'audit
      await logAudit({
        action: "PAYMENT_RECORDED",
        performedBy: req.user.id,
        organizationId: req.user.organization_id,
        targetType: "payment",
        targetId: customerId,
        details: {
          customerId,
          customerName: customer.name,
          amount,
          mode,
          debtBefore: currentDebt,
          debtAfter: currentDebt - amount,
          ordersAffected: affectedOrders.length,
        },
      });

      await client.query("COMMIT");

      const newDebt = currentDebt - amount;

      logAction("RECORD_PAYMENT_SUCCESS", {
        customerId,
        amount,
        ordersAffected: affectedOrders.length,
      });

      res.status(201).json({
        success: true,
        data: {
          customerId,
          customerName: customer.name,
          amount,
          mode,
          debtBefore: currentDebt,
          debtAfter: newDebt,
          ordersAffected: affectedOrders,
        },
      });
    } catch (error) {
      await client.query("ROLLBACK");
      logAction("RECORD_PAYMENT_ERROR", { error: error.message });
      console.error("[FINANCIAL] Error:", error);
      res.status(500).json({ error: "Erreur serveur: " + error.message });
    } finally {
      client.release();
    }
  },
);

module.exports = router;
