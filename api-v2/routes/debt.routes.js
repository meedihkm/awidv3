// =====================================================
// ROUTES : Gestion de la dette
// =====================================================

const router = require('express').Router();
const debtService = require('../services/debt.service');
const { authenticate, authorize } = require('../middleware/auth');
const { validate } = require('../middleware/validate');
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
                    limit: parseInt(req.query.limit) || 50,
                    customerId: req.query.customer_id || null,
                    delivererId: req.query.deliverer_id || null,
                    dateFrom: req.query.date_from || null,
                    dateTo: req.query.date_to || null
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
router.post('/debt-payments',
    authorize(['admin', 'deliverer']),
    validate('recordDebtPayment'),
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
