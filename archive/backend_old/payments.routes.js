// =====================================================
// ROUTES : Gestion des Paiements (Refactorisé)
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
  console.log(`[PAYMENTS] ${action}:`, JSON.stringify(details, null, 2));
}

/**
 * Valide les données de paiement
 */
function validatePaymentData(data) {
  const errors = [];

  if (!data.customerId) {
    errors.push("customerId est requis");
  }

  if (!data.amount || data.amount <= 0) {
    errors.push("amount doit être supérieur à 0");
  }

  if (data.mode && !["cash", "card", "transfer", "check"].includes(data.mode)) {
    errors.push("mode invalide (cash, card, transfer, check)");
  }

  return errors;
}

// ─────────────────────────────────────────────────────
// POST /api/payments
// Enregistrer un paiement (Admin ou Livreur)
// Accessible par : admin, deliverer
// ─────────────────────────────────────────────────────
router.post(
  "/",
  authenticate,
  authorize(["admin", "deliverer"]),
  async (req, res) => {
    const startTime = Date.now();
    logAction("RECORD_PAYMENT", {
      userId: req.user.id,
      role: req.user.role,
      body: { ...req.body, customerId: req.body.customerId },
    });

    try {
      const {
        customerId,
        amount,
        mode = "cash",
        deliveryId,
        targetOrders,
        notes,
      } = req.body;

      // Validation
      const validationErrors = validatePaymentData({
        customerId,
        amount,
        mode,
      });
      if (validationErrors.length > 0) {
        logAction("RECORD_PAYMENT_VALIDATION_ERROR", {
          errors: validationErrors,
        });
        return res.status(400).json({ error: validationErrors.join(", ") });
      }

      // Vérifier que le client existe et appartient à l'organisation
      const customerCheck = await pool.query(
        "SELECT id, name FROM users WHERE id = $1::text AND organization_id = $2::text AND role = $3",
        [customerId, req.user.organization_id, "customer"],
      );

      if (customerCheck.rows.length === 0) {
        logAction("RECORD_PAYMENT_CUSTOMER_NOT_FOUND", { customerId });
        return res.status(404).json({ error: "Client non trouvé" });
      }

      const customer = customerCheck.rows[0];

      // Si deliveryId fourni, vérifier qu'elle appartient à l'organisation
      if (deliveryId) {
        const deliveryCheck = await pool.query(
          "SELECT id FROM deliveries WHERE id = $1::text AND organization_id = $2::text",
          [deliveryId, req.user.organization_id],
        );

        if (deliveryCheck.rows.length === 0) {
          logAction("RECORD_PAYMENT_DELIVERY_NOT_FOUND", { deliveryId });
          return res.status(404).json({ error: "Livraison non trouvée" });
        }
      }

      // Calculer la dette actuelle
      const debtResult = await pool.query(
        `SELECT COALESCE(SUM(total - amount_paid), 0) as current_debt
       FROM orders
       WHERE customer_id = $1::text 
         AND organization_id = $2::text 
         AND total > amount_paid`,
        [customerId, req.user.organization_id],
      );

      const currentDebt = parseNumber(debtResult.rows[0].current_debt);

      if (currentDebt === 0) {
        logAction("RECORD_PAYMENT_NO_DEBT", {
          customerId,
          customerName: customer.name,
        });
        return res.status(400).json({ error: "Ce client n'a pas de dette" });
      }

      if (amount > currentDebt) {
        logAction("RECORD_PAYMENT_AMOUNT_TOO_HIGH", {
          customerId,
          amount,
          currentDebt,
        });
        return res.status(400).json({
          error: `Le montant (${amount} DA) est supérieur à la dette (${currentDebt} DA)`,
        });
      }

      // Créer la transaction de paiement
      const transactionResult = await pool.query(
        `INSERT INTO payment_transactions (
        organization_id, client_id, amount, payment_type, payment_mode,
        recorded_by, recorded_by_role, delivery_id, notes
      ) VALUES ($1::text, $2::text, $3, $4, $5, $6::text, $7, $8::text, $9)
      RETURNING id, created_at`,
        [
          req.user.organization_id,
          customerId,
          amount,
          "debt_payment",
          mode,
          req.user.id,
          req.user.role,
          deliveryId || null,
          notes || null,
        ],
      );

      const transaction = transactionResult.rows[0];

      // Appliquer le paiement aux commandes
      let remainingAmount = amount;
      const affectedOrders = [];

      // Si targetOrders est spécifié, appliquer aux commandes ciblées
      const ordersToUpdate =
        targetOrders && targetOrders.length > 0
          ? await pool.query(
              `SELECT id, total, amount_paid, (total - amount_paid) as remaining
           FROM orders
           WHERE id = ANY($1::text[]) 
             AND customer_id = $2::text 
             AND organization_id = $3::text
             AND total > amount_paid
           ORDER BY created_at ASC`,
              [targetOrders, customerId, req.user.organization_id],
            )
          : await pool.query(
              `SELECT id, total, amount_paid, (total - amount_paid) as remaining
           FROM orders
           WHERE customer_id = $1::text 
             AND organization_id = $2::text
             AND total > amount_paid
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

        await pool.query(
          `UPDATE orders 
         SET amount_paid = $1, payment_status = $2, updated_at = NOW()
         WHERE id = $3::text`,
          [newAmountPaid, newPaymentStatus, order.id],
        );

        affectedOrders.push({
          orderId: order.id,
          amountApplied: paymentForOrder,
          newStatus: newPaymentStatus,
        });

        remainingAmount -= paymentForOrder;
      }

      // Mettre à jour la transaction avec les commandes affectées
      await pool.query(
        `UPDATE payment_transactions 
       SET orders_affected = $1::text[]
       WHERE id = $2::text`,
        [affectedOrders.map((o) => o.orderId), transaction.id],
      );

      const newDebt = currentDebt - amount;

      // Logger l'audit
      await logAudit({
        action: "PAYMENT_RECORDED",
        performedBy: req.user.id,
        organizationId: req.user.organization_id,
        targetType: "payment",
        targetId: transaction.id,
        details: {
          customerId,
          customerName: customer.name,
          amount,
          mode,
          debtBefore: currentDebt,
          debtAfter: newDebt,
          ordersAffected: affectedOrders.length,
        },
      });

      const duration = Date.now() - startTime;
      logAction("RECORD_PAYMENT_SUCCESS", {
        transactionId: transaction.id,
        customerId,
        amount,
        ordersAffected: affectedOrders.length,
        duration: `${duration}ms`,
      });

      res.status(201).json({
        success: true,
        data: {
          transactionId: transaction.id,
          customerId,
          customerName: customer.name,
          amount,
          mode,
          debtBefore: currentDebt,
          debtAfter: newDebt,
          ordersAffected: affectedOrders,
          createdAt: transaction.created_at,
        },
      });
    } catch (error) {
      logAction("RECORD_PAYMENT_ERROR", { error: error.message });
      console.error("[PAYMENTS] Error:", error);
      res.status(500).json({ error: "Erreur serveur: " + error.message });
    }
  },
);

// ─────────────────────────────────────────────────────
// GET /api/payments/history
// Historique de tous les paiements
// Accessible par : admin
// ─────────────────────────────────────────────────────
router.get("/history", authenticate, authorize(["admin"]), async (req, res) => {
  logAction("GET_PAYMENT_HISTORY", {
    userId: req.user.id,
    query: req.query,
  });

  try {
    const page = parseInt(req.query.page) || 1;
    const limit = Math.min(parseInt(req.query.limit) || 50, 100);
    const offset = (page - 1) * limit;
    const customerId = req.query.customer_id || null;
    const collectorId = req.query.collector_id || null;
    const dateFrom = req.query.date_from || null;
    const dateTo = req.query.date_to || null;

    // Construction de la requête avec filtres
    let whereClause = "WHERE pt.organization_id = $1::text";
    const params = [req.user.organization_id];
    let paramIndex = 2;

    if (customerId) {
      params.push(customerId);
      whereClause += ` AND pt.client_id = $${paramIndex++}::text`;
    }

    if (collectorId) {
      params.push(collectorId);
      whereClause += ` AND pt.recorded_by = $${paramIndex++}::text`;
    }

    if (dateFrom) {
      params.push(dateFrom);
      whereClause += ` AND pt.created_at >= $${paramIndex++}`;
    }

    if (dateTo) {
      params.push(dateTo);
      whereClause += ` AND pt.created_at <= $${paramIndex++}`;
    }

    // Compter le total
    const countResult = await pool.query(
      `SELECT COUNT(*) FROM payment_transactions pt ${whereClause}`,
      params,
    );
    const total = parseInt(countResult.rows[0].count);

    // Récupérer les transactions
    const result = await pool.query(
      `SELECT 
        pt.id,
        pt.amount,
        pt.payment_type,
        pt.payment_mode,
        pt.created_at,
        pt.notes,
        pt.orders_affected,
        c.id as customer_id,
        c.name as customer_name,
        c.email as customer_email,
        rec.id as recorded_by_id,
        rec.name as recorded_by_name,
        pt.recorded_by_role
      FROM payment_transactions pt
      JOIN users c ON pt.client_id = c.id
      LEFT JOIN users rec ON pt.recorded_by = rec.id
      ${whereClause}
      ORDER BY pt.created_at DESC
      LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`,
      [...params, limit, offset],
    );

    logAction("GET_PAYMENT_HISTORY_SUCCESS", {
      count: result.rows.length,
      total,
    });

    res.json({
      success: true,
      data: result.rows.map((row) => ({
        id: row.id,
        amount: parseNumber(row.amount),
        type: row.payment_type,
        mode: row.payment_mode,
        date: row.created_at,
        notes: row.notes,
        ordersAffected: row.orders_affected,
        customer: {
          id: row.customer_id,
          name: row.customer_name,
          email: row.customer_email,
        },
        recordedBy: {
          id: row.recorded_by_id,
          name: row.recorded_by_name,
          role: row.recorded_by_role,
        },
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
    logAction("GET_PAYMENT_HISTORY_ERROR", { error: error.message });
    console.error("[PAYMENTS] Error:", error);
    res.status(500).json({ error: "Erreur serveur" });
  }
});

// ─────────────────────────────────────────────────────
// GET /api/payments/my-collections
// Historique des collectes du livreur connecté
// Accessible par : deliverer
// ─────────────────────────────────────────────────────
router.get(
  "/my-collections",
  authenticate,
  authorize(["deliverer"]),
  async (req, res) => {
    logAction("GET_MY_COLLECTIONS", { userId: req.user.id });

    try {
      const result = await pool.query(
        `SELECT 
        pt.id,
        pt.amount,
        pt.payment_mode,
        pt.created_at,
        pt.notes,
        pt.orders_affected,
        c.name as customer_name,
        c.phone as customer_phone
      FROM payment_transactions pt
      JOIN users c ON pt.client_id = c.id
      WHERE pt.recorded_by = $1::text
      ORDER BY pt.created_at DESC
      LIMIT 100`,
        [req.user.id],
      );

      const totalCollected = result.rows.reduce(
        (sum, row) => sum + parseNumber(row.amount),
        0,
      );

      logAction("GET_MY_COLLECTIONS_SUCCESS", {
        count: result.rows.length,
        totalCollected,
      });

      res.json({
        success: true,
        data: {
          collections: result.rows.map((row) => ({
            id: row.id,
            amount: parseNumber(row.amount),
            mode: row.payment_mode,
            date: row.created_at,
            notes: row.notes,
            ordersAffected: row.orders_affected,
            customer: {
              name: row.customer_name,
              phone: row.customer_phone,
            },
          })),
          totalCollected,
        },
      });
    } catch (error) {
      logAction("GET_MY_COLLECTIONS_ERROR", { error: error.message });
      console.error("[PAYMENTS] Error:", error);
      res.status(500).json({ error: "Erreur serveur" });
    }
  },
);

// ─────────────────────────────────────────────────────
// GET /api/payments/stats
// Statistiques des paiements
// Accessible par : admin
// ─────────────────────────────────────────────────────
router.get("/stats", authenticate, authorize(["admin"]), async (req, res) => {
  logAction("GET_PAYMENT_STATS", { userId: req.user.id });

  try {
    const result = await pool.query(
      `SELECT 
        COALESCE(SUM(amount) FILTER (WHERE DATE(created_at) = CURRENT_DATE), 0) as collected_today,
        COUNT(*) FILTER (WHERE DATE(created_at) = CURRENT_DATE) as payments_today,
        COALESCE(SUM(amount) FILTER (WHERE DATE_TRUNC('month', created_at) = DATE_TRUNC('month', CURRENT_DATE)), 0) as collected_month,
        COUNT(*) FILTER (WHERE DATE_TRUNC('month', created_at) = DATE_TRUNC('month', CURRENT_DATE)) as payments_month,
        COUNT(DISTINCT client_id) FILTER (WHERE DATE(created_at) = CURRENT_DATE) as customers_paid_today
      FROM payment_transactions
      WHERE organization_id = $1::text`,
      [req.user.organization_id],
    );

    const stats = result.rows[0];

    logAction("GET_PAYMENT_STATS_SUCCESS", stats);

    res.json({
      success: true,
      data: {
        collectedToday: parseNumber(stats.collected_today),
        paymentsToday: parseInt(stats.payments_today),
        collectedMonth: parseNumber(stats.collected_month),
        paymentsMonth: parseInt(stats.payments_month),
        customersPaidToday: parseInt(stats.customers_paid_today),
      },
    });
  } catch (error) {
    logAction("GET_PAYMENT_STATS_ERROR", { error: error.message });
    console.error("[PAYMENTS] Error:", error);
    res.status(500).json({ error: "Erreur serveur" });
  }
});

module.exports = router;
