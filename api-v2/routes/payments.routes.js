const express = require('express');
const router = express.Router();

const pool = require('../config/database');
const { authenticate, requireAdmin } = require('../middleware/auth');
const { validate, validateUUID } = require('../middleware/validate');
const { logAudit } = require('../services/audit.service');

// POST /api/payments/record
// Enregistrer un paiement (Admin ou Livreur)
router.post('/record', authenticate, validate('recordPayment'), async (req, res) => {
  try {
    const { clientId, amount, mode, deliveryId, targetOrders, notes } = req.body;
    
    // Vérifier que le client appartient à la même organisation
    const clientCheck = await pool.query(
      'SELECT id, name FROM users WHERE id = $1 AND organization_id = $2 AND role = $3',
      [clientId, req.user.organization_id, 'cafeteria']
    );
    
    if (clientCheck.rows.length === 0) {
      return res.status(404).json({ error: 'Client non trouvé' });
    }
    
    // Si deliveryId fourni, vérifier qu'elle appartient à l'organisation
    if (deliveryId) {
      const deliveryCheck = await pool.query(
        'SELECT id FROM deliveries WHERE id = $1 AND organization_id = $2',
        [deliveryId, req.user.organization_id]
      );
      
      if (deliveryCheck.rows.length === 0) {
        return res.status(404).json({ error: 'Livraison non trouvée' });
      }
    }
    
    // Appeler la fonction PostgreSQL pour appliquer le paiement
    const result = await pool.query(
      `SELECT apply_payment_to_client(
        $1::UUID, $2::DECIMAL, $3::TEXT, $4::UUID, $5::VARCHAR,
        $6::VARCHAR, $7::UUID, $8::UUID[], $9::TEXT
      ) as result`,
      [
        clientId,
        amount,
        req.user.organization_id,
        req.user.id,
        req.user.role,
        mode || 'auto',
        deliveryId || null,
        targetOrders || null,
        notes || null
      ]
    );
    
    const paymentResult = result.rows[0].result;
    
    // Logger l'action
    await logAudit('PAYMENT_RECORDED', req.user.id, req.user.organization_id, {
      clientId,
      clientName: clientCheck.rows[0].name,
      amount,
      mode: mode || 'auto',
      transactionId: paymentResult.transaction_id,
      debtBefore: paymentResult.debt_before,
      debtAfter: paymentResult.debt_after
    }, req);
    
    res.json({
      success: true,
      data: paymentResult
    });
  } catch (error) {
    console.error('Record payment error:', error);
    res.status(500).json({ error: 'Erreur serveur: ' + error.message });
  }
});

// GET /api/payments/client/:clientId/details
// Obtenir les détails de dette d'un client
router.get('/client/:clientId/details', authenticate, validateUUID('clientId'), async (req, res) => {
  try {
    // Vérifier que le client appartient à la même organisation
    const clientCheck = await pool.query(
      'SELECT id FROM users WHERE id = $1 AND organization_id = $2',
      [req.params.clientId, req.user.organization_id]
    );
    
    if (clientCheck.rows.length === 0) {
      return res.status(404).json({ error: 'Client non trouvé' });
    }
    
    // Obtenir les détails via la fonction PostgreSQL
    const result = await pool.query(
      'SELECT get_client_debt_details($1::UUID) as details',
      [req.params.clientId]
    );
    
    res.json({
      success: true,
      data: result.rows[0].details
    });
  } catch (error) {
    console.error('Get client debt details error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/payments/history
// Historique de tous les paiements (Admin uniquement)
router.get('/history', authenticate, requireAdmin, async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = Math.min(parseInt(req.query.limit) || 50, 100);
    const offset = (page - 1) * limit;
    
    // Compter le total
    const countResult = await pool.query(
      'SELECT COUNT(*) FROM payment_transactions WHERE organization_id = $1',
      [req.user.organization_id]
    );
    const total = parseInt(countResult.rows[0].count);
    
    // Récupérer les transactions
    const result = await pool.query(
      `SELECT 
        pt.*,
        c.name as client_name,
        c.email as client_email,
        rec.name as recorded_by_name
       FROM payment_transactions pt
       JOIN users c ON pt.client_id = c.id
       LEFT JOIN users rec ON pt.recorded_by = rec.id
       WHERE pt.organization_id = $1
       ORDER BY pt.created_at DESC
       LIMIT $2 OFFSET $3`,
      [req.user.organization_id, limit, offset]
    );
    
    res.json({
      success: true,
      data: result.rows,
      pagination: {
        page,
        limit,
        total,
        totalPages: Math.ceil(total / limit),
        hasMore: page * limit < total
      }
    });
  } catch (error) {
    console.error('Payment history error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/payments/my-collections
// Historique des collectes du livreur connecté
router.get('/my-collections', authenticate, async (req, res) => {
  try {
    if (req.user.role !== 'deliverer') {
      return res.status(403).json({ error: 'Accès réservé aux livreurs' });
    }
    
    const result = await pool.query(
      `SELECT 
        pt.*,
        c.name as client_name,
        c.email as client_email
       FROM payment_transactions pt
       JOIN users c ON pt.client_id = c.id
       WHERE pt.recorded_by = $1
       ORDER BY pt.created_at DESC
       LIMIT 100`,
      [req.user.id]
    );
    
    res.json({
      success: true,
      data: result.rows
    });
  } catch (error) {
    console.error('My collections error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/payments/my-payments
// Historique des paiements du client connecté
router.get('/my-payments', authenticate, async (req, res) => {
  try {
    if (req.user.role !== 'cafeteria') {
      return res.status(403).json({ error: 'Accès réservé aux clients' });
    }
    
    // Obtenir les détails via la fonction PostgreSQL
    const result = await pool.query(
      'SELECT get_client_debt_details($1::UUID) as details',
      [req.user.id]
    );
    
    res.json({
      success: true,
      data: result.rows[0].details
    });
  } catch (error) {
    console.error('My payments error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/payments/stats
// Statistiques des paiements (Admin uniquement)
router.get('/stats', authenticate, requireAdmin, async (req, res) => {
  try {
    const today = new Date().toISOString().split('T')[0];
    
    const result = await pool.query(
      `SELECT 
        COALESCE(SUM(amount), 0) as total_collected_today,
        COUNT(*) as payments_count_today,
        (SELECT COALESCE(SUM(amount), 0) FROM payment_transactions 
         WHERE organization_id = $1 AND DATE(created_at) >= DATE_TRUNC('month', NOW())) as total_collected_month,
        (SELECT COUNT(DISTINCT client_id) FROM payment_transactions 
         WHERE organization_id = $1 AND DATE(created_at) = $2) as clients_paid_today
       FROM payment_transactions
       WHERE organization_id = $1 AND DATE(created_at) = $2`,
      [req.user.organization_id, today]
    );
    
    res.json({
      success: true,
      data: {
        total_collected_today: parseFloat(result.rows[0].total_collected_today) || 0,
        payments_count_today: parseInt(result.rows[0].payments_count_today) || 0,
        total_collected_month: parseFloat(result.rows[0].total_collected_month) || 0,
        clients_paid_today: parseInt(result.rows[0].clients_paid_today) || 0
      }
    });
  } catch (error) {
    console.error('Payment stats error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

module.exports = router;
