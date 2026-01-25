// =====================================================
// SERVICE : Gestion de la dette
// =====================================================

const db = require("../config/database");
const auditService = require("./audit.service");
const notificationService = require("./notification.service");
const logger = require("../config/logger");

class DebtService {
  /**
   * Récupérer la dette totale d'un client
   * @param {string} customerId
   * @param {string} organizationId
   * @returns {Promise<Object>} Détails de la dette
   */
  async getCustomerDebt(customerId, organizationId) {
    const result = await db.query(
      `
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
    `,
      [customerId, organizationId],
    );

    if (result.rows.length === 0) {
      return null;
    }

    // Récupérer dernier paiement
    const lastPayment = await db.query(
      `
      SELECT created_at, amount 
      FROM debt_payments 
      WHERE customer_id = $1 AND organization_id = $2
      ORDER BY created_at DESC 
      LIMIT 1
    `,
      [customerId, organizationId],
    );

    return {
      ...result.rows[0],
      total_debt: parseFloat(result.rows[0].total_debt) || 0,
      last_payment_date: lastPayment.rows[0]?.created_at || null,
      last_payment_amount: lastPayment.rows[0]?.amount || null,
    };
  }

  /**
   * Liste des clients avec dette > 0
   * @param {string} organizationId
   * @param {Object} options - { sort, minDebt, page, limit, customerId, delivererId, dateFrom, dateTo }
   * @returns {Promise<Object>} { data, summary, pagination }
   */
  async getCustomersWithDebt(organizationId, options = {}) {
    const {
      sort = "amount_desc",
      minDebt = 0,
      page = 1,
      limit = 50,
      customerId = null,
      delivererId = null,
      dateFrom = null,
      dateTo = null,
    } = options;

    const offset = (page - 1) * limit;
    const orderBy =
      sort === "amount_desc"
        ? "total_debt DESC"
        : sort === "amount_asc"
          ? "total_debt ASC"
          : sort === "name"
            ? "u.name ASC"
            : "total_debt DESC";

    // Construire les conditions et paramètres
    const params = [organizationId, minDebt, limit, offset];
    const conditions = [];
    let paramIndex = 5;

    // Filtre par client spécifique
    if (customerId) {
      conditions.push(`u.id = $${paramIndex}`);
      params.push(customerId);
      paramIndex++;
    }

    // Filtre par livreur - uniquement clients avec livraisons actives
    if (delivererId) {
      conditions.push(`u.id IN (
                SELECT DISTINCT ord.customer_id
                FROM deliveries d 
                JOIN orders ord ON d.order_id = ord.id
                WHERE d.deliverer_id = $${paramIndex}
                AND d.status IN ('assigned', 'in_progress')
            )`);
      params.push(delivererId);
      paramIndex++;
    }

    // Filtre par date
    if (dateFrom) {
      conditions.push(`o.created_at >= $${paramIndex}::timestamp`);
      params.push(dateFrom);
      paramIndex++;
    }

    if (dateTo) {
      conditions.push(`o.created_at <= $${paramIndex}::timestamp`);
      params.push(dateTo);
      paramIndex++;
    }

    const whereConditions =
      conditions.length > 0 ? `AND ${conditions.join(" AND ")}` : "";

    // Requête principale
    const result = await db.query(
      `
            SELECT 
                u.id as customer_id,
                u.name,
                u.phone,
                u.email,
                COALESCE(SUM(o.total) - SUM(o.amount_paid), 0)::numeric as total_debt,
                COUNT(*) FILTER (WHERE o.payment_status != 'paid') as unpaid_orders,
                MAX(o.created_at) as last_order_date
            FROM users u
            LEFT JOIN orders o ON u.id = o.customer_id 
                AND o.organization_id = $1 
                AND o.status != 'cancelled'
            WHERE u.organization_id = $1 
                AND (u.role = 'customer')
                AND u.active = true
                ${whereConditions}
            GROUP BY u.id, u.name, u.phone, u.email
            HAVING COALESCE(SUM(o.total) - SUM(o.amount_paid), 0) >= $2
            ORDER BY ${orderBy}
            LIMIT $3 OFFSET $4
        `,
      params,
    );

    // Count pour pagination
    const countParams = [organizationId, minDebt];
    const countConditions = [];
    let countParamIndex = 3;

    if (customerId) {
      countConditions.push(`u.id = $${countParamIndex}`);
      countParams.push(customerId);
      countParamIndex++;
    }

    if (delivererId) {
      countConditions.push(`u.id IN (
                SELECT DISTINCT ord.customer_id
                FROM deliveries d 
                JOIN orders ord ON d.order_id = ord.id
                WHERE d.deliverer_id = $${countParamIndex}
                AND d.status IN ('assigned', 'in_progress')
            )`);
      countParams.push(delivererId);
      countParamIndex++;
    }

    if (dateFrom) {
      countConditions.push(`o.created_at >= $${countParamIndex}::timestamp`);
      countParams.push(dateFrom);
      countParamIndex++;
    }

    if (dateTo) {
      countConditions.push(`o.created_at <= $${countParamIndex}::timestamp`);
      countParams.push(dateTo);
      countParamIndex++;
    }

    const countWhereConditions =
      countConditions.length > 0 ? `AND ${countConditions.join(" AND ")}` : "";

    const countResult = await db.query(
      `
            SELECT COUNT(*) as total
            FROM (
                SELECT u.id
                FROM users u
                LEFT JOIN orders o ON u.id = o.customer_id 
                    AND o.organization_id = $1 
                    AND o.status != 'cancelled'
                WHERE u.organization_id = $1 
                    AND u.role = 'customer'
                    AND u.active = true
                    ${countWhereConditions}
                GROUP BY u.id
                HAVING COALESCE(SUM(o.total) - SUM(o.amount_paid), 0) >= $2
            ) as subquery
        `,
      countParams,
    );

    // Résumé global
    const summaryResult = await db.query(
      `
            SELECT 
                COUNT(DISTINCT o.customer_id) as total_customers_with_debt,
                COALESCE(SUM(o.total) - SUM(o.amount_paid), 0)::numeric as total_debt_amount
            FROM orders o
            WHERE o.organization_id = $1 
                AND o.payment_status != 'paid'
                AND o.status != 'cancelled'
        `,
      [organizationId],
    );

    const total = parseInt(countResult.rows[0]?.total || 0);

    return {
      data: result.rows.map((row) => ({
        id: row.customer_id,
        name: row.name,
        phone: row.phone,
        email: row.email,
        debt: parseFloat(row.total_debt),
        order_count: parseInt(row.unpaid_orders),
        last_order: row.last_order_date,
      })),
      summary: {
        total_customers: parseInt(
          summaryResult.rows[0]?.total_customers_with_debt || 0,
        ),
        total_debt: parseFloat(summaryResult.rows[0]?.total_debt_amount || 0),
      },
      pagination: {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit),
      },
    };
  }

  /**
   * Récupérer les commandes impayées d'un client
   */
  async getUnpaidOrders(customerId, organizationId) {
    const result = await db.query(
      `
            SELECT 
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
                AND o.payment_status != 'paid'
                AND o.status != 'cancelled'
            ORDER BY o.created_at ASC
        `,
      [customerId, organizationId],
    );

    return result.rows;
  }

  /**
   * Enregistrer un paiement de dette
   */
  async recordDebtPayment(data, collectorId, collectorRole, organizationId) {
    const { customer_id, amount, payment_type = "cash", note } = data;

    if (!customer_id || !amount || amount <= 0) {
      throw new Error("Données invalides");
    }

    // Vérifier que le client existe et a une dette
    const debt = await this.getCustomerDebt(customer_id, organizationId);
    if (!debt || debt.total_debt <= 0) {
      throw new Error("Ce client n'a pas de dette");
    }

    if (amount > debt.total_debt) {
      throw new Error("Le montant est supérieur à la dette totale");
    }

    // Enregistrer le paiement
    const paymentResult = await db.query(
      `
            INSERT INTO debt_payments (
                customer_id, 
                organization_id, 
                amount, 
                payment_type, 
                collected_by, 
                note
            ) VALUES ($1, $2, $3, $4, $5, $6)
            RETURNING *
        `,
      [customer_id, organizationId, amount, payment_type, collectorId, note],
    );

    // Répartir le paiement sur les commandes impayées (FIFO)
    const unpaidOrders = await this.getUnpaidOrders(
      customer_id,
      organizationId,
    );
    let remainingAmount = amount;
    const ordersAffected = [];

    for (const order of unpaidOrders) {
      if (remainingAmount <= 0) break;

      const orderRemaining = parseFloat(order.remaining);
      const amountToApply = Math.min(remainingAmount, orderRemaining);

      await db.query(
        `
                UPDATE orders 
                SET amount_paid = amount_paid + $1,
                    payment_status = CASE 
                        WHEN (amount_paid + $1) >= total THEN 'paid'
                        ELSE 'partial'
                    END
                WHERE id = $2
            `,
        [amountToApply, order.id],
      );

      ordersAffected.push({
        order_id: order.id,
        order_number: order.order_number,
        amount_applied: amountToApply,
      });

      remainingAmount -= amountToApply;
    }

    // Audit
    await auditService.logAudit(
      "DEBT_PAYMENT_RECORDED",
      collectorId,
      organizationId,
      { customerId: customer_id, amount, ordersAffected },
      null,
    );

    // Notification
    try {
      await notificationService.sendNotification({
        userId: customer_id,
        organizationId,
        type: "payment_received",
        title: "Paiement reçu",
        message: `Paiement de ${amount} DA enregistré`,
        data: { amount, payment_id: paymentResult.rows[0].id },
      });
    } catch (err) {
      logger.error("Notification error:", err);
    }

    // Nouvelle dette
    const newDebt = await this.getCustomerDebt(customer_id, organizationId);

    return {
      success: true,
      data: {
        payment_id: paymentResult.rows[0].id,
        amount_applied: amount,
        orders_affected: ordersAffected,
        debt_before: debt.total_debt,
        debt_after: newDebt?.total_debt || 0,
        debt_cleared: (newDebt?.total_debt || 0) === 0,
      },
    };
  }

  /**
   * Historique des paiements de dette
   */
  async getDebtPaymentHistory(organizationId, options = {}) {
    const {
      customerId = null,
      collectedBy = null,
      dateFrom = null,
      dateTo = null,
      page = 1,
      limit = 50,
    } = options;

    const offset = (page - 1) * limit;
    const params = [organizationId, limit, offset];
    const conditions = [];
    let paramIndex = 4;

    if (customerId) {
      conditions.push(`dp.customer_id = $${paramIndex}`);
      params.push(customerId);
      paramIndex++;
    }

    if (collectedBy) {
      conditions.push(`dp.collected_by = $${paramIndex}`);
      params.push(collectedBy);
      paramIndex++;
    }

    if (dateFrom) {
      conditions.push(`dp.created_at >= $${paramIndex}::timestamp`);
      params.push(dateFrom);
      paramIndex++;
    }

    if (dateTo) {
      conditions.push(`dp.created_at <= $${paramIndex}::timestamp`);
      params.push(dateTo);
      paramIndex++;
    }

    const whereClause =
      conditions.length > 0 ? `AND ${conditions.join(" AND ")}` : "";

    const result = await db.query(
      `
            SELECT 
                dp.*,
                c.name as client_name,
                c.phone as client_phone,
                u.name as collector_name
            FROM debt_payments dp
            JOIN users c ON dp.customer_id = c.id
            LEFT JOIN users u ON dp.collected_by = u.id
            WHERE dp.organization_id = $1
                ${whereClause}
            ORDER BY dp.created_at DESC
            LIMIT $2 OFFSET $3
        `,
      params,
    );

    return {
      success: true,
      data: result.rows,
    };
  }

  /**
   * Mes collectes (pour livreur)
   */
  async getMyCollections(collectorId, organizationId) {
    const result = await db.query(
      `
            SELECT 
                dp.*,
                c.name as client_name,
                c.phone as client_phone
            FROM debt_payments dp
            JOIN users c ON dp.customer_id = c.id
            WHERE dp.collected_by = $1
                AND dp.organization_id = $2
            ORDER BY dp.created_at DESC
            LIMIT 100
        `,
      [collectorId, organizationId],
    );

    return {
      success: true,
      data: result.rows,
    };
  }
}

module.exports = new DebtService();
