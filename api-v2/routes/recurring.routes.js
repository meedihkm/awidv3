/**
 * Recurring Orders Routes
 * API endpoints pour la gestion des commandes récurrentes
 */

const express = require('express');
const router = express.Router();

const { authenticate, requireAdmin } = require('../middleware/auth');
const { validateUUID } = require('../middleware/validate');
const { logAudit } = require('../services/audit.service');
const recurringService = require('../services/recurring.service');

// ===== CAFETERIA ROUTES =====

/**
 * GET /api/recurring
 * Liste les commandes récurrentes de la cafétéria connectée
 */
router.get('/', authenticate, async (req, res) => {
    try {
        if (req.user.role !== 'cafeteria') {
            return res.status(403).json({ error: 'Réservé aux cafétérias' });
        }

        const orders = await recurringService.getRecurringOrders(req.user.id, req.user.organization_id);
        res.json({ success: true, data: orders });
    } catch (error) {
        console.error('Error fetching recurring orders:', error);
        res.status(500).json({ error: 'Erreur serveur' });
    }
});

/**
 * GET /api/recurring/:id
 * Récupère une commande récurrente par ID
 */
router.get('/:id', authenticate, validateUUID('id'), async (req, res) => {
    try {
        const order = await recurringService.getRecurringOrderById(req.params.id, req.user.organization_id);

        if (!order) {
            return res.status(404).json({ error: 'Commande récurrente non trouvée' });
        }

        // Vérifier que c'est bien la cafétéria propriétaire ou un admin
        if (req.user.role !== 'admin' && order.customerId !== req.user.id) {
            return res.status(403).json({ error: 'Accès non autorisé' });
        }

        res.json({ success: true, data: order });
    } catch (error) {
        console.error('Error fetching recurring order:', error);
        res.status(500).json({ error: 'Erreur serveur' });
    }
});

/**
 * POST /api/recurring
 * Crée une nouvelle commande récurrente
 */
router.post('/', authenticate, async (req, res) => {
    try {
        if (req.user.role !== 'cafeteria' && req.user.role !== 'admin') {
            return res.status(403).json({ error: 'Non autorisé' });
        }

        const { name, frequency, dayOfWeek, dayOfMonth, timeOfDay, items, customerId } = req.body;

        if (!frequency || !['daily', 'weekly', 'monthly'].includes(frequency)) {
            return res.status(400).json({ error: 'Fréquence invalide (daily, weekly, monthly)' });
        }

        if (!items || items.length === 0) {
            return res.status(400).json({ error: 'Au moins un produit requis' });
        }

        // Déterminer le customerId
        const targetCafeteriaId = req.user.role === 'admin' && customerId ? customerId : req.user.id;

        const order = await recurringService.createRecurringOrder({
            organizationId: req.user.organization_id,
            customerId: targetCafeteriaId,
            name,
            frequency,
            dayOfWeek,
            dayOfMonth,
            timeOfDay,
            items
        });

        await logAudit({
            action: 'CREATE_RECURRING_ORDER',
            performedBy: req.user.id,
            organizationId: req.user.organization_id,
            targetType: 'recurring_order',
            targetId: order.id,
            details: { name, frequency, itemsCount: items.length }
        });

        res.status(201).json({ success: true, data: order });
    } catch (error) {
        console.error('Error creating recurring order:', error);
        res.status(500).json({ error: 'Erreur serveur' });
    }
});

/**
 * PUT /api/recurring/:id
 * Met à jour une commande récurrente
 */
router.put('/:id', authenticate, validateUUID('id'), async (req, res) => {
    try {
        // Vérifier l'accès
        const existing = await recurringService.getRecurringOrderById(req.params.id, req.user.organization_id);
        if (!existing) {
            return res.status(404).json({ error: 'Commande récurrente non trouvée' });
        }

        if (req.user.role !== 'admin' && existing.customerId !== req.user.id) {
            return res.status(403).json({ error: 'Accès non autorisé' });
        }

        const order = await recurringService.updateRecurringOrder(req.params.id, req.user.organization_id, req.body);

        await logAudit({
            action: 'UPDATE_RECURRING_ORDER',
            performedBy: req.user.id,
            organizationId: req.user.organization_id,
            targetType: 'recurring_order',
            targetId: req.params.id,
            details: req.body
        });

        res.json({ success: true, data: order });
    } catch (error) {
        console.error('Error updating recurring order:', error);
        res.status(500).json({ error: 'Erreur serveur' });
    }
});

/**
 * DELETE /api/recurring/:id
 * Supprime une commande récurrente
 */
router.delete('/:id', authenticate, validateUUID('id'), async (req, res) => {
    try {
        // Vérifier l'accès
        const existing = await recurringService.getRecurringOrderById(req.params.id, req.user.organization_id);
        if (!existing) {
            return res.status(404).json({ error: 'Commande récurrente non trouvée' });
        }

        if (req.user.role !== 'admin' && existing.customerId !== req.user.id) {
            return res.status(403).json({ error: 'Accès non autorisé' });
        }

        await recurringService.deleteRecurringOrder(req.params.id, req.user.organization_id);

        await logAudit({
            action: 'DELETE_RECURRING_ORDER',
            performedBy: req.user.id,
            organizationId: req.user.organization_id,
            targetType: 'recurring_order',
            targetId: req.params.id
        });

        res.json({ success: true, message: 'Commande récurrente supprimée' });
    } catch (error) {
        console.error('Error deleting recurring order:', error);
        res.status(500).json({ error: 'Erreur serveur' });
    }
});

/**
 * POST /api/recurring/:id/toggle
 * Active/désactive une commande récurrente
 */
router.post('/:id/toggle', authenticate, validateUUID('id'), async (req, res) => {
    try {
        // Vérifier l'accès
        const existing = await recurringService.getRecurringOrderById(req.params.id, req.user.organization_id);
        if (!existing) {
            return res.status(404).json({ error: 'Commande récurrente non trouvée' });
        }

        if (req.user.role !== 'admin' && existing.customerId !== req.user.id) {
            return res.status(403).json({ error: 'Accès non autorisé' });
        }

        const order = await recurringService.toggleRecurringOrder(req.params.id, req.user.organization_id);

        await logAudit({
            action: order.active ? 'RESUME_RECURRING_ORDER' : 'PAUSE_RECURRING_ORDER',
            performedBy: req.user.id,
            organizationId: req.user.organization_id,
            targetType: 'recurring_order',
            targetId: req.params.id
        });

        res.json({ success: true, data: order });
    } catch (error) {
        console.error('Error toggling recurring order:', error);
        res.status(500).json({ error: 'Erreur serveur' });
    }
});

// ===== ADMIN ROUTES =====

/**
 * GET /api/recurring/admin/all
 * Admin: Liste toutes les commandes récurrentes de l'organisation
 */
router.get('/admin/all', authenticate, requireAdmin, async (req, res) => {
    try {
        const { active } = req.query;
        const options = {};
        if (active !== undefined) {
            options.active = active === 'true';
        }

        const orders = await recurringService.getAllRecurringOrders(req.user.organization_id, options);
        res.json({ success: true, data: orders });
    } catch (error) {
        console.error('Error fetching all recurring orders:', error);
        res.status(500).json({ error: 'Erreur serveur' });
    }
});

module.exports = router;
