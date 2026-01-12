const express = require('express');
const router = express.Router();

const pool = require('../config/database');
const { authenticate, requireAdmin } = require('../middleware/auth');
const { validate, validateUUID } = require('../middleware/validate');
const { logAudit } = require('../services/audit.service');
const { getOrderWithItems } = require('../services/order.service');

// GET /api/deliveries (avec pagination optionnelle)
router.get('/', authenticate, async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = Math.min(parseInt(req.query.limit) || 50, 100);
    const offset = (page - 1) * limit;
    const status = req.query.status;
    
    let whereClause = 'WHERE d.organization_id = $1';
    const params = [req.user.organization_id];
    
    if (status && status !== 'all') {
      params.push(status);
      whereClause += ` AND d.status = $${params.length}`;
    }
    
    // Compter le total
    const countResult = await pool.query(
      `SELECT COUNT(*) FROM deliveries d ${whereClause}`,
      params
    );
    const total = parseInt(countResult.rows[0].count);
    
    const result = await pool.query(
      `SELECT d.*, u.name as deliverer_name
       FROM deliveries d
       LEFT JOIN users u ON d.deliverer_id = u.id
       ${whereClause}
       ORDER BY d.created_at DESC
       LIMIT $${params.length + 1} OFFSET $${params.length + 2}`,
      [...params, limit, offset]
    );
    
    const deliveries = [];
    for (const d of result.rows) {
      const order = await getOrderWithItems(d.order_id);
      deliveries.push({
        id: d.id,
        orderId: d.order_id,
        delivererId: d.deliverer_id,
        status: d.status,
        paymentStatus: d.payment_status || 'unpaid',
        amountCollected: parseFloat(d.amount_collected || 0),
        comment: d.comment,
        failureReason: d.failure_reason,
        failedAt: d.failed_at,
        postponedTo: d.postponed_to,
        attempts: d.attempts || 0,
        deliveredAt: d.delivered_at,
        createdAt: d.created_at,
        order,
        deliverer: d.deliverer_id ? { id: d.deliverer_id, name: d.deliverer_name } : null
      });
    }
    
    res.json({ 
      success: true, 
      data: deliveries,
      pagination: {
        page,
        limit,
        total,
        totalPages: Math.ceil(total / limit),
        hasMore: page * limit < total
      }
    });
  } catch (error) {
    console.error('Deliveries error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/deliveries/route
router.get('/route', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT d.* FROM deliveries d
       WHERE d.deliverer_id = $1 AND d.status IN ('assigned', 'in_progress', 'postponed')
       ORDER BY CASE WHEN d.status = 'postponed' THEN 1 ELSE 0 END, d.created_at`,
      [req.user.id]
    );
    
    const deliveries = [];
    for (const d of result.rows) {
      const order = await getOrderWithItems(d.order_id);
      deliveries.push({
        id: d.id,
        orderId: d.order_id,
        delivererId: d.deliverer_id,
        status: d.status,
        paymentStatus: d.payment_status || 'unpaid',
        amountCollected: parseFloat(d.amount_collected || 0),
        comment: d.comment,
        failureReason: d.failure_reason,
        failedAt: d.failed_at,
        postponedTo: d.postponed_to,
        attempts: d.attempts || 0,
        createdAt: d.created_at,
        order
      });
    }
    
    res.json({ success: true, data: deliveries });
  } catch (error) {
    console.error('Route error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/deliveries/history
router.get('/history', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT d.* FROM deliveries d
       WHERE d.deliverer_id = $1 AND d.status IN ('delivered', 'failed')
       ORDER BY d.delivered_at DESC NULLS LAST, d.created_at DESC
       LIMIT 100`,
      [req.user.id]
    );
    
    const deliveries = [];
    for (const d of result.rows) {
      const order = await getOrderWithItems(d.order_id);
      deliveries.push({
        id: d.id,
        orderId: d.order_id,
        delivererId: d.deliverer_id,
        status: d.status,
        paymentStatus: d.payment_status || 'unpaid',
        amountCollected: parseFloat(d.amount_collected || 0),
        comment: d.comment,
        failureReason: d.failure_reason,
        deliveredAt: d.delivered_at,
        createdAt: d.created_at,
        order
      });
    }
    
    res.json({ success: true, data: deliveries });
  } catch (error) {
    console.error('History error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/deliveries/:id
router.get('/:id', authenticate, validateUUID('id'), async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT d.*, u.name as deliverer_name
       FROM deliveries d
       LEFT JOIN users u ON d.deliverer_id = u.id
       WHERE d.id = $1`,
      [req.params.id]
    );
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Livraison non trouvée' });
    }
    
    const d = result.rows[0];
    const order = await getOrderWithItems(d.order_id);
    
    res.json({
      success: true,
      data: {
        id: d.id,
        orderId: d.order_id,
        delivererId: d.deliverer_id,
        status: d.status,
        paymentStatus: d.payment_status || 'unpaid',
        amountCollected: parseFloat(d.amount_collected || 0),
        comment: d.comment,
        deliveredAt: d.delivered_at,
        createdAt: d.created_at,
        order,
        deliverer: d.deliverer_id ? { id: d.deliverer_id, name: d.deliverer_name } : null
      }
    });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// PUT /api/deliveries/:id/status
router.put('/:id/status', authenticate, validateUUID('id'), validate('updateDeliveryStatus'), async (req, res) => {
  try {
    const { status, paymentStatus, amountCollected, comment, failureReason, postponedTo } = req.body;
    
    // Vérifier que la livraison existe et appartient au livreur
    const checkDelivery = await pool.query(
      'SELECT id, deliverer_id FROM deliveries WHERE id = $1',
      [req.params.id]
    );
    
    if (checkDelivery.rows.length === 0) {
      return res.status(404).json({ error: 'Livraison non trouvée' });
    }
    
    if (checkDelivery.rows[0].deliverer_id !== req.user.id) {
      return res.status(403).json({ error: 'Cette livraison ne vous est pas assignée' });
    }
    
    if (status === 'delivered') {
      await pool.query(
        `UPDATE deliveries SET status = $1, payment_status = $2, amount_collected = $3, comment = $4, delivered_at = NOW() 
         WHERE id = $5 AND deliverer_id = $6`,
        [status, paymentStatus || 'unpaid', amountCollected || 0, comment || null, req.params.id, req.user.id]
      );
      
      const delivery = await pool.query('SELECT order_id FROM deliveries WHERE id = $1', [req.params.id]);
      if (delivery.rows.length > 0) {
        await pool.query(
          `UPDATE orders SET status = 'delivered', payment_status = $1, amount_paid = amount_paid + $2 
           WHERE id = $3`,
          [paymentStatus || 'unpaid', amountCollected || 0, delivery.rows[0].order_id]
        );
      }
      
      await logAudit('DELIVERY_COMPLETED', req.user.id, req.user.organization_id, { deliveryId: req.params.id, amountCollected }, req);
      
    } else if (status === 'failed') {
      await pool.query(
        `UPDATE deliveries SET status = $1, comment = $2, failure_reason = $3, failed_at = NOW(), attempts = COALESCE(attempts, 0) + 1
         WHERE id = $4 AND deliverer_id = $5`,
        [status, comment || null, failureReason || 'other', req.params.id, req.user.id]
      );
      
      const delivery = await pool.query('SELECT order_id FROM deliveries WHERE id = $1', [req.params.id]);
      if (delivery.rows.length > 0) {
        await pool.query(`UPDATE orders SET status = 'locked' WHERE id = $1`, [delivery.rows[0].order_id]);
      }
      
      await logAudit('DELIVERY_FAILED', req.user.id, req.user.organization_id, { deliveryId: req.params.id, failureReason }, req);
      
    } else if (status === 'postponed') {
      await pool.query(
        `UPDATE deliveries SET status = $1, comment = $2, failure_reason = $3, postponed_to = $4, attempts = COALESCE(attempts, 0) + 1
         WHERE id = $5 AND deliverer_id = $6`,
        [status, comment || null, failureReason || 'other', postponedTo || null, req.params.id, req.user.id]
      );
      
      await logAudit('DELIVERY_POSTPONED', req.user.id, req.user.organization_id, { deliveryId: req.params.id, postponedTo }, req);
      
    } else {
      await pool.query(
        'UPDATE deliveries SET status = $1, comment = $2 WHERE id = $3 AND deliverer_id = $4',
        [status, comment || null, req.params.id, req.user.id]
      );
    }
    
    res.json({ success: true });
  } catch (error) {
    console.error('Delivery status error:', error);
    res.status(500).json({ error: 'Erreur serveur: ' + error.message });
  }
});

// POST /api/deliverers/location
router.post('/location', authenticate, validate('updateLocation'), async (req, res) => {
  try {
    const { latitude, longitude } = req.body;
    
    await pool.query(
      `UPDATE users SET latitude = $1, longitude = $2, location_updated_at = NOW() 
       WHERE id = $3 AND role = 'deliverer'`,
      [latitude, longitude, req.user.id]
    );
    
    res.json({ success: true });
  } catch (error) {
    console.error('Location update error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/deliverers/locations
router.get('/locations', authenticate, requireAdmin, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT id, name, phone, latitude, longitude, location_updated_at
       FROM users 
       WHERE organization_id = $1 AND role = 'deliverer' AND active = true
       AND latitude IS NOT NULL AND longitude IS NOT NULL`,
      [req.user.organization_id]
    );
    
    res.json({ success: true, data: result.rows });
  } catch (error) {
    console.error('Get locations error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/deliverers/:id/history (alias pour compatibilité)
router.get('/:id/history', authenticate, validateUUID('id'), async (req, res) => {
  try {
    const { date } = req.query;
    const result = await pool.query(
      `SELECT latitude, longitude, recorded_at
       FROM location_history 
       WHERE deliverer_id = $1 AND DATE(recorded_at) = $2
       ORDER BY recorded_at`,
      [req.params.id, date || new Date().toISOString().split('T')[0]]
    );
    
    res.json({ success: true, data: result.rows });
  } catch (error) {
    console.error('Get history error:', error);
    // Retourner tableau vide si table n'existe pas
    res.json({ success: true, data: [] });
  }
});

module.exports = router;
