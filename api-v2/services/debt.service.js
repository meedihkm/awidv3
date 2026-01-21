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

        const total = parseInt(countResult.rows[0]?.total || 0);

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
