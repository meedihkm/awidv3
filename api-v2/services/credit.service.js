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
     * @returns {Promise<Object>} { status, level, ratio, debt, limit }
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
        try {
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

            const notification = messages[status.level];

            // Envoyer notification aux admins
            await notificationService.sendToRole('admin', organizationId, {
                title: notification.title,
                message: notification.message,
                data: {
                    type: 'credit_alert',
                    customerId,
                    level: status.level,
                    ratio: status.ratio
                }
            });

            logger.info(`Credit alert sent for customer ${customerId}`, { level: status.level, ratio: status.ratio });

            return status;
        } catch (error) {
            logger.error('Error checking credit status', error);
            // Ne pas bloquer le flux principal
            return null;
        }
    }
}

module.exports = new CreditService();
