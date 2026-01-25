// =====================================================
// ROUTES : Commandes Récurrentes (Refactorisé)
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
 * Log une action avec contexte
 */
function logAction(action, details) {
  console.log(
    `[RECURRING_ORDERS] ${action}:`,
    JSON.stringify(details, null, 2),
  );
}

/**
 * Valide les données de commande récurrente
 */
function validateRecurringOrderData(data) {
  const errors = [];

  if (
    !data.frequency ||
    !["daily", "weekly", "monthly"].includes(data.frequency)
  ) {
    errors.push("frequency doit être daily, weekly ou monthly");
  }

  if (
    data.frequency === "weekly" &&
    (data.dayOfWeek < 0 || data.dayOfWeek > 6)
  ) {
    errors.push("dayOfWeek doit être entre 0 (dimanche) et 6 (samedi)");
  }

  if (
    data.frequency === "monthly" &&
    (data.dayOfMonth < 1 || data.dayOfMonth > 31)
  ) {
    errors.push("dayOfMonth doit être entre 1 et 31");
  }

  if (!data.items || !Array.isArray(data.items) || data.items.length === 0) {
    errors.push("items doit contenir au moins un produit");
  }

  return errors;
}

/**
 * Formate une commande récurrente pour la réponse
 */
function formatRecurringOrder(row) {
  return {
    id: row.id,
    organizationId: row.organization_id,
    customerId: row.customer_id,
    name: row.name,
    frequency: row.frequency,
    dayOfWeek: row.day_of_week,
    dayOfMonth: row.day_of_month,
    timeOfDay: row.time_of_day,
    active: row.active,
    lastExecuted: row.last_executed,
    nextExecution: row.next_execution,
    createdAt: row.created_at,
    items: row.items || [],
  };
}

// ─────────────────────────────────────────────────────
// GET /api/recurring-orders
// Liste les commandes récurrentes du client connecté
// Accessible par : customer
// ─────────────────────────────────────────────────────
router.get("/", authenticate, authorize(["customer"]), async (req, res) => {
  logAction("GET_RECURRING_ORDERS", {
    userId: req.user.id,
    role: req.user.role,
  });

  try {
    const result = await pool.query(
      `SELECT ro.*, 
        (SELECT json_agg(json_build_object(
          'id', roi.id,
          'productId', roi.product_id,
          'productName', p.name,
          'quantity', roi.quantity
        )) FROM recurring_order_items roi 
        JOIN products p ON roi.product_id = p.id
        WHERE roi.recurring_order_id = ro.id) as items
      FROM recurring_orders ro
      WHERE ro.customer_id = $1::text 
        AND ro.organization_id = $2::text
      ORDER BY ro.created_at DESC`,
      [req.user.id, req.user.organization_id],
    );

    logAction("GET_RECURRING_ORDERS_SUCCESS", {
      count: result.rows.length,
    });

    res.json({
      success: true,
      data: result.rows.map(formatRecurringOrder),
    });
  } catch (error) {
    logAction("GET_RECURRING_ORDERS_ERROR", { error: error.message });
    console.error("[RECURRING_ORDERS] Error:", error);
    res.status(500).json({ error: "Erreur serveur" });
  }
});

// ─────────────────────────────────────────────────────
// GET /api/recurring-orders/:id
// Récupère une commande récurrente par ID
// Accessible par : customer, admin
// ─────────────────────────────────────────────────────
router.get(
  "/:id",
  authenticate,
  authorize(["customer", "admin"]),
  validateUUID("id"),
  async (req, res) => {
    logAction("GET_RECURRING_ORDER", {
      orderId: req.params.id,
      userId: req.user.id,
    });

    try {
      const result = await pool.query(
        `SELECT ro.*, 
        (SELECT json_agg(json_build_object(
          'id', roi.id,
          'productId', roi.product_id,
          'productName', p.name,
          'quantity', roi.quantity
        )) FROM recurring_order_items roi 
        JOIN products p ON roi.product_id = p.id
        WHERE roi.recurring_order_id = ro.id) as items
      FROM recurring_orders ro
      WHERE ro.id = $1::text 
        AND ro.organization_id = $2::text`,
        [req.params.id, req.user.organization_id],
      );

      if (result.rows.length === 0) {
        logAction("GET_RECURRING_ORDER_NOT_FOUND", { orderId: req.params.id });
        return res
          .status(404)
          .json({ error: "Commande récurrente non trouvée" });
      }

      const order = result.rows[0];

      // Vérifier l'accès
      if (req.user.role !== "admin" && order.customer_id !== req.user.id) {
        logAction("GET_RECURRING_ORDER_FORBIDDEN", {
          orderId: req.params.id,
          userId: req.user.id,
        });
        return res.status(403).json({ error: "Accès non autorisé" });
      }

      logAction("GET_RECURRING_ORDER_SUCCESS", { orderId: req.params.id });

      res.json({
        success: true,
        data: formatRecurringOrder(order),
      });
    } catch (error) {
      logAction("GET_RECURRING_ORDER_ERROR", { error: error.message });
      console.error("[RECURRING_ORDERS] Error:", error);
      res.status(500).json({ error: "Erreur serveur" });
    }
  },
);

// ─────────────────────────────────────────────────────
// POST /api/recurring-orders
// Crée une nouvelle commande récurrente
// Accessible par : customer, admin
// ─────────────────────────────────────────────────────
router.post(
  "/",
  authenticate,
  authorize(["customer", "admin"]),
  async (req, res) => {
    const startTime = Date.now();
    logAction("CREATE_RECURRING_ORDER", {
      userId: req.user.id,
      role: req.user.role,
      body: req.body,
    });

    try {
      const {
        name,
        frequency,
        dayOfWeek,
        dayOfMonth,
        timeOfDay,
        items,
        customerId,
      } = req.body;

      // Validation
      const validationErrors = validateRecurringOrderData({
        frequency,
        dayOfWeek,
        dayOfMonth,
        items,
      });
      if (validationErrors.length > 0) {
        logAction("CREATE_RECURRING_ORDER_VALIDATION_ERROR", {
          errors: validationErrors,
        });
        return res.status(400).json({ error: validationErrors.join(", ") });
      }

      // Déterminer le customerId
      const targetCustomerId =
        req.user.role === "admin" && customerId ? customerId : req.user.id;

      // Vérifier que le client existe
      if (req.user.role === "admin" && customerId) {
        const customerCheck = await pool.query(
          "SELECT id FROM users WHERE id = $1::text AND organization_id = $2::text AND role = $3",
          [customerId, req.user.organization_id, "customer"],
        );

        if (customerCheck.rows.length === 0) {
          logAction("CREATE_RECURRING_ORDER_CUSTOMER_NOT_FOUND", {
            customerId,
          });
          return res.status(404).json({ error: "Client non trouvé" });
        }
      }

      // Créer la commande récurrente
      const orderResult = await pool.query(
        `INSERT INTO recurring_orders (
        organization_id, customer_id, name, frequency, 
        day_of_week, day_of_month, time_of_day, active
      ) VALUES ($1::text, $2::text, $3, $4, $5, $6, $7, true)
      RETURNING id, created_at`,
        [
          req.user.organization_id,
          targetCustomerId,
          name || `Commande ${frequency}`,
          frequency,
          dayOfWeek || null,
          dayOfMonth || null,
          timeOfDay || "08:00",
        ],
      );

      const orderId = orderResult.rows[0].id;

      // Ajouter les items
      for (const item of items) {
        await pool.query(
          `INSERT INTO recurring_order_items (
          recurring_order_id, product_id, quantity
        ) VALUES ($1::text, $2::text, $3)`,
          [orderId, item.productId, item.quantity],
        );
      }

      // Récupérer la commande complète
      const completeOrder = await pool.query(
        `SELECT ro.*, 
        (SELECT json_agg(json_build_object(
          'id', roi.id,
          'productId', roi.product_id,
          'productName', p.name,
          'quantity', roi.quantity
        )) FROM recurring_order_items roi 
        JOIN products p ON roi.product_id = p.id
        WHERE roi.recurring_order_id = ro.id) as items
      FROM recurring_orders ro
      WHERE ro.id = $1::text`,
        [orderId],
      );

      // Logger l'audit
      await logAudit({
        action: "CREATE_RECURRING_ORDER",
        performedBy: req.user.id,
        organizationId: req.user.organization_id,
        targetType: "recurring_order",
        targetId: orderId,
        details: {
          name,
          frequency,
          itemsCount: items.length,
          customerId: targetCustomerId,
        },
      });

      const duration = Date.now() - startTime;
      logAction("CREATE_RECURRING_ORDER_SUCCESS", {
        orderId,
        duration: `${duration}ms`,
      });

      res.status(201).json({
        success: true,
        data: formatRecurringOrder(completeOrder.rows[0]),
      });
    } catch (error) {
      logAction("CREATE_RECURRING_ORDER_ERROR", { error: error.message });
      console.error("[RECURRING_ORDERS] Error:", error);
      res.status(500).json({ error: "Erreur serveur" });
    }
  },
);

// ─────────────────────────────────────────────────────
// PUT /api/recurring-orders/:id
// Met à jour une commande récurrente
// Accessible par : customer, admin
// ─────────────────────────────────────────────────────
router.put(
  "/:id",
  authenticate,
  authorize(["customer", "admin"]),
  validateUUID("id"),
  async (req, res) => {
    logAction("UPDATE_RECURRING_ORDER", {
      orderId: req.params.id,
      userId: req.user.id,
      body: req.body,
    });

    try {
      // Vérifier que la commande existe et l'accès
      const existing = await pool.query(
        "SELECT * FROM recurring_orders WHERE id = $1::text AND organization_id = $2::text",
        [req.params.id, req.user.organization_id],
      );

      if (existing.rows.length === 0) {
        logAction("UPDATE_RECURRING_ORDER_NOT_FOUND", {
          orderId: req.params.id,
        });
        return res
          .status(404)
          .json({ error: "Commande récurrente non trouvée" });
      }

      const order = existing.rows[0];

      if (req.user.role !== "admin" && order.customer_id !== req.user.id) {
        logAction("UPDATE_RECURRING_ORDER_FORBIDDEN", {
          orderId: req.params.id,
          userId: req.user.id,
        });
        return res.status(403).json({ error: "Accès non autorisé" });
      }

      const { name, frequency, dayOfWeek, dayOfMonth, timeOfDay, items } =
        req.body;

      // Validation si frequency est modifiée
      if (frequency) {
        const validationErrors = validateRecurringOrderData({
          frequency,
          dayOfWeek,
          dayOfMonth,
          items: items || [{}],
        });
        if (
          validationErrors.length > 0 &&
          validationErrors.some((e) => e.includes("frequency"))
        ) {
          logAction("UPDATE_RECURRING_ORDER_VALIDATION_ERROR", {
            errors: validationErrors,
          });
          return res.status(400).json({ error: validationErrors.join(", ") });
        }
      }

      // Mettre à jour la commande
      await pool.query(
        `UPDATE recurring_orders 
       SET name = COALESCE($1, name),
           frequency = COALESCE($2, frequency),
           day_of_week = COALESCE($3, day_of_week),
           day_of_month = COALESCE($4, day_of_month),
           time_of_day = COALESCE($5, time_of_day),
           updated_at = NOW()
       WHERE id = $6::text`,
        [name, frequency, dayOfWeek, dayOfMonth, timeOfDay, req.params.id],
      );

      // Mettre à jour les items si fournis
      if (items && items.length > 0) {
        // Supprimer les anciens items
        await pool.query(
          "DELETE FROM recurring_order_items WHERE recurring_order_id = $1::text",
          [req.params.id],
        );

        // Ajouter les nouveaux items
        for (const item of items) {
          await pool.query(
            `INSERT INTO recurring_order_items (
            recurring_order_id, product_id, quantity
          ) VALUES ($1::text, $2::text, $3)`,
            [req.params.id, item.productId, item.quantity],
          );
        }
      }

      // Récupérer la commande mise à jour
      const updated = await pool.query(
        `SELECT ro.*, 
        (SELECT json_agg(json_build_object(
          'id', roi.id,
          'productId', roi.product_id,
          'productName', p.name,
          'quantity', roi.quantity
        )) FROM recurring_order_items roi 
        JOIN products p ON roi.product_id = p.id
        WHERE roi.recurring_order_id = ro.id) as items
      FROM recurring_orders ro
      WHERE ro.id = $1::text`,
        [req.params.id],
      );

      // Logger l'audit
      await logAudit({
        action: "UPDATE_RECURRING_ORDER",
        performedBy: req.user.id,
        organizationId: req.user.organization_id,
        targetType: "recurring_order",
        targetId: req.params.id,
        details: req.body,
      });

      logAction("UPDATE_RECURRING_ORDER_SUCCESS", { orderId: req.params.id });

      res.json({
        success: true,
        data: formatRecurringOrder(updated.rows[0]),
      });
    } catch (error) {
      logAction("UPDATE_RECURRING_ORDER_ERROR", { error: error.message });
      console.error("[RECURRING_ORDERS] Error:", error);
      res.status(500).json({ error: "Erreur serveur" });
    }
  },
);

// ─────────────────────────────────────────────────────
// DELETE /api/recurring-orders/:id
// Supprime une commande récurrente
// Accessible par : customer, admin
// ─────────────────────────────────────────────────────
router.delete(
  "/:id",
  authenticate,
  authorize(["customer", "admin"]),
  validateUUID("id"),
  async (req, res) => {
    logAction("DELETE_RECURRING_ORDER", {
      orderId: req.params.id,
      userId: req.user.id,
    });

    try {
      // Vérifier que la commande existe et l'accès
      const existing = await pool.query(
        "SELECT * FROM recurring_orders WHERE id = $1::text AND organization_id = $2::text",
        [req.params.id, req.user.organization_id],
      );

      if (existing.rows.length === 0) {
        logAction("DELETE_RECURRING_ORDER_NOT_FOUND", {
          orderId: req.params.id,
        });
        return res
          .status(404)
          .json({ error: "Commande récurrente non trouvée" });
      }

      const order = existing.rows[0];

      if (req.user.role !== "admin" && order.customer_id !== req.user.id) {
        logAction("DELETE_RECURRING_ORDER_FORBIDDEN", {
          orderId: req.params.id,
          userId: req.user.id,
        });
        return res.status(403).json({ error: "Accès non autorisé" });
      }

      // Supprimer les items
      await pool.query(
        "DELETE FROM recurring_order_items WHERE recurring_order_id = $1::text",
        [req.params.id],
      );

      // Supprimer la commande
      await pool.query("DELETE FROM recurring_orders WHERE id = $1::text", [
        req.params.id,
      ]);

      // Logger l'audit
      await logAudit({
        action: "DELETE_RECURRING_ORDER",
        performedBy: req.user.id,
        organizationId: req.user.organization_id,
        targetType: "recurring_order",
        targetId: req.params.id,
      });

      logAction("DELETE_RECURRING_ORDER_SUCCESS", { orderId: req.params.id });

      res.json({
        success: true,
        message: "Commande récurrente supprimée",
      });
    } catch (error) {
      logAction("DELETE_RECURRING_ORDER_ERROR", { error: error.message });
      console.error("[RECURRING_ORDERS] Error:", error);
      res.status(500).json({ error: "Erreur serveur" });
    }
  },
);

// ─────────────────────────────────────────────────────
// POST /api/recurring-orders/:id/toggle
// Active/désactive une commande récurrente
// Accessible par : customer, admin
// ─────────────────────────────────────────────────────
router.post(
  "/:id/toggle",
  authenticate,
  authorize(["customer", "admin"]),
  validateUUID("id"),
  async (req, res) => {
    logAction("TOGGLE_RECURRING_ORDER", {
      orderId: req.params.id,
      userId: req.user.id,
    });

    try {
      // Vérifier que la commande existe et l'accès
      const existing = await pool.query(
        "SELECT * FROM recurring_orders WHERE id = $1::text AND organization_id = $2::text",
        [req.params.id, req.user.organization_id],
      );

      if (existing.rows.length === 0) {
        logAction("TOGGLE_RECURRING_ORDER_NOT_FOUND", {
          orderId: req.params.id,
        });
        return res
          .status(404)
          .json({ error: "Commande récurrente non trouvée" });
      }

      const order = existing.rows[0];

      if (req.user.role !== "admin" && order.customer_id !== req.user.id) {
        logAction("TOGGLE_RECURRING_ORDER_FORBIDDEN", {
          orderId: req.params.id,
          userId: req.user.id,
        });
        return res.status(403).json({ error: "Accès non autorisé" });
      }

      // Toggle active
      const newActive = !order.active;
      await pool.query(
        "UPDATE recurring_orders SET active = $1, updated_at = NOW() WHERE id = $2::text",
        [newActive, req.params.id],
      );

      // Récupérer la commande mise à jour
      const updated = await pool.query(
        `SELECT ro.*, 
        (SELECT json_agg(json_build_object(
          'id', roi.id,
          'productId', roi.product_id,
          'productName', p.name,
          'quantity', roi.quantity
        )) FROM recurring_order_items roi 
        JOIN products p ON roi.product_id = p.id
        WHERE roi.recurring_order_id = ro.id) as items
      FROM recurring_orders ro
      WHERE ro.id = $1::text`,
        [req.params.id],
      );

      // Logger l'audit
      await logAudit({
        action: newActive ? "RESUME_RECURRING_ORDER" : "PAUSE_RECURRING_ORDER",
        performedBy: req.user.id,
        organizationId: req.user.organization_id,
        targetType: "recurring_order",
        targetId: req.params.id,
      });

      logAction("TOGGLE_RECURRING_ORDER_SUCCESS", {
        orderId: req.params.id,
        newActive,
      });

      res.json({
        success: true,
        data: formatRecurringOrder(updated.rows[0]),
      });
    } catch (error) {
      logAction("TOGGLE_RECURRING_ORDER_ERROR", { error: error.message });
      console.error("[RECURRING_ORDERS] Error:", error);
      res.status(500).json({ error: "Erreur serveur" });
    }
  },
);

// ─────────────────────────────────────────────────────
// GET /api/recurring-orders/admin/all
// Admin: Liste toutes les commandes récurrentes
// Accessible par : admin
// ─────────────────────────────────────────────────────
router.get(
  "/admin/all",
  authenticate,
  authorize(["admin"]),
  async (req, res) => {
    logAction("GET_ALL_RECURRING_ORDERS", {
      userId: req.user.id,
      query: req.query,
    });

    try {
      const active = req.query.active;
      let whereClause = "WHERE ro.organization_id = $1::text";
      const params = [req.user.organization_id];

      if (active !== undefined) {
        params.push(active === "true");
        whereClause += " AND ro.active = $2";
      }

      const result = await pool.query(
        `SELECT ro.*, 
        u.name as customer_name,
        (SELECT json_agg(json_build_object(
          'id', roi.id,
          'productId', roi.product_id,
          'productName', p.name,
          'quantity', roi.quantity
        )) FROM recurring_order_items roi 
        JOIN products p ON roi.product_id = p.id
        WHERE roi.recurring_order_id = ro.id) as items
      FROM recurring_orders ro
      JOIN users u ON ro.customer_id = u.id
      ${whereClause}
      ORDER BY ro.created_at DESC`,
        params,
      );

      logAction("GET_ALL_RECURRING_ORDERS_SUCCESS", {
        count: result.rows.length,
      });

      res.json({
        success: true,
        data: result.rows.map((row) => ({
          ...formatRecurringOrder(row),
          customerName: row.customer_name,
        })),
      });
    } catch (error) {
      logAction("GET_ALL_RECURRING_ORDERS_ERROR", { error: error.message });
      console.error("[RECURRING_ORDERS] Error:", error);
      res.status(500).json({ error: "Erreur serveur" });
    }
  },
);

module.exports = router;
