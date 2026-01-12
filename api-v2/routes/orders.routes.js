const express = require('express');
const router = express.Router();

const pool = require('../config/database');
const { authenticate, requireAdmin, requireKitchen } = require('../middleware/auth');
const { validate, validateUUID } = require('../middleware/validate');
const { logAudit } = require('../services/audit.service');
const { getOrderItems, getOrderWithItems, formatOrder } = require('../services/order.service');

// GET /api/orders
router.get('/', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT o.*, u.name as cafeteria_name 
       FROM orders o 
       JOIN users u ON o.cafeteria_id = u.id 
       WHERE o.organization_id = $1 
       ORDER BY o.created_at DESC`,
      [req.user.organization_id]
    );
    
    const orders = [];
    for (const order of result.rows) {
      const items = await getOrderItems(order.id);
      orders.push(formatOrder(order, items));
    }
    
    res.json({ success: true, data: orders });
  } catch (error) {
    console.error('Orders error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/orders/my
router.get('/my', authenticate, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT * FROM orders WHERE cafeteria_id = $1 ORDER BY created_at DESC`,
      [req.user.id]
    );
    
    const orders = [];
    for (const order of result.rows) {
      const items = await getOrderItems(order.id);
      orders.push(formatOrder(order, items));
    }
    
    res.json({ success: true, data: orders });
  } catch (error) {
    console.error('My orders error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/orders/kitchen
router.get('/kitchen', authenticate, requireKitchen, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT o.*, u.name as cafeteria_name, u.phone as cafeteria_phone
       FROM orders o 
       JOIN users u ON o.cafeteria_id = u.id 
       WHERE o.organization_id = $1 AND o.status IN ('validated', 'preparing')
       ORDER BY 
         CASE WHEN o.status = 'validated' THEN 0 ELSE 1 END,
         o.created_at ASC`,
      [req.user.organization_id]
    );
    
    const orders = [];
    for (const order of result.rows) {
      const items = await getOrderItems(order.id);
      orders.push({
        id: order.id,
        organizationId: order.organization_id,
        cafeteriaId: order.cafeteria_id,
        date: order.date,
        total: parseFloat(order.total),
        status: order.status,
        createdAt: order.created_at,
        items,
        cafeteria: { 
          id: order.cafeteria_id, 
          name: order.cafeteria_name,
          phone: order.cafeteria_phone
        }
      });
    }
    
    res.json({ success: true, data: orders });
  } catch (error) {
    console.error('Kitchen orders error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// POST /api/orders
router.post('/', authenticate, validate('createOrder'), async (req, res) => {
  try {
    const { items } = req.body;
    const clientId = req.user.id;
    
    let total = 0;
    for (const item of items) {
      const product = await pool.query('SELECT price FROM products WHERE id = $1', [item.productId]);
      if (product.rows.length > 0) {
        total += product.rows[0].price * item.quantity;
      }
    }
    
    if (total === 0) {
      return res.status(400).json({ error: 'Aucun produit valide trouvé' });
    }
    
    // Générer numéro de commande séquentiel
    const seqResult = await pool.query(
      `INSERT INTO order_sequences (organization_id, last_number) 
       VALUES ($1, 1) 
       ON CONFLICT (organization_id) 
       DO UPDATE SET last_number = order_sequences.last_number + 1 
       RETURNING last_number`,
      [req.user.organization_id]
    );
    const orderNumber = seqResult.rows[0].last_number;
    
    const orderResult = await pool.query(
      `INSERT INTO orders (organization_id, cafeteria_id, date, total, status, payment_status, amount_paid, order_number) 
       VALUES ($1, $2, NOW(), $3, 'pending', 'unpaid', 0, $4) RETURNING *`,
      [req.user.organization_id, clientId, total, orderNumber]
    );
    
    const order = orderResult.rows[0];
    
    for (const item of items) {
      const product = await pool.query('SELECT price FROM products WHERE id = $1', [item.productId]);
      if (product.rows.length > 0) {
        await pool.query(
          'INSERT INTO order_items (order_id, product_id, quantity, price) VALUES ($1, $2, $3, $4)',
          [order.id, item.productId, item.quantity, product.rows[0].price]
        );
      }
    }
    
    await logAudit('ORDER_CREATED', req.user.id, req.user.organization_id, { orderId: order.id, total }, req);
    
    const orderItems = await getOrderItems(order.id);
    res.json({ success: true, data: { ...order, items: orderItems } });
  } catch (error) {
    console.error('Create order error:', error);
    res.status(500).json({ error: 'Erreur serveur: ' + error.message });
  }
});

// PUT /api/orders/:id
router.put('/:id', authenticate, validateUUID('id'), validate('updateOrder'), async (req, res) => {
  try {
    const { items } = req.body;
    
    const orderCheck = await pool.query(
      `SELECT * FROM orders WHERE id = $1 AND cafeteria_id = $2 AND status = 'pending'`,
      [req.params.id, req.user.id]
    );
    
    if (orderCheck.rows.length === 0) {
      return res.status(403).json({ error: 'Commande non modifiable' });
    }
    
    await pool.query('DELETE FROM order_items WHERE order_id = $1', [req.params.id]);
    
    let total = 0;
    for (const item of items) {
      const product = await pool.query('SELECT price FROM products WHERE id = $1', [item.productId]);
      if (product.rows.length > 0) {
        const price = product.rows[0].price;
        total += price * item.quantity;
        await pool.query(
          'INSERT INTO order_items (order_id, product_id, quantity, price) VALUES ($1, $2, $3, $4)',
          [req.params.id, item.productId, item.quantity, price]
        );
      }
    }
    
    await pool.query('UPDATE orders SET total = $1, updated_at = NOW() WHERE id = $2', [total, req.params.id]);
    
    await logAudit('ORDER_UPDATED', req.user.id, req.user.organization_id, { orderId: req.params.id, total }, req);
    
    const updatedItems = await getOrderItems(req.params.id);
    res.json({ success: true, data: { id: req.params.id, total, items: updatedItems } });
  } catch (error) {
    console.error('Update order error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// PUT /api/orders/:id/lock
router.put('/:id/lock', authenticate, requireAdmin, validateUUID('id'), async (req, res) => {
  try {
    const orgResult = await pool.query(
      'SELECT kitchen_mode FROM organizations WHERE id = $1',
      [req.user.organization_id]
    );
    
    const kitchenMode = orgResult.rows[0]?.kitchen_mode || false;
    const newStatus = kitchenMode ? 'validated' : 'locked';
    
    await pool.query(
      `UPDATE orders SET status = $1, locked_at = NOW() 
       WHERE id = $2 AND organization_id = $3 AND status = 'pending'`,
      [newStatus, req.params.id, req.user.organization_id]
    );
    
    await logAudit('ORDER_LOCKED', req.user.id, req.user.organization_id, { orderId: req.params.id, newStatus }, req);
    
    res.json({ success: true, status: newStatus });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// POST /api/orders/:id/assign
router.post('/:id/assign', authenticate, requireAdmin, validateUUID('id'), validate('assignDeliverer'), async (req, res) => {
  try {
    const { delivererId } = req.body;
    
    const orderCheck = await pool.query(
      `SELECT * FROM orders WHERE id = $1 AND organization_id = $2 AND status IN ('locked', 'ready')`,
      [req.params.id, req.user.organization_id]
    );
    
    if (orderCheck.rows.length === 0) {
      return res.status(400).json({ error: 'Commande non prête pour assignation' });
    }
    
    const deliveryResult = await pool.query(
      `INSERT INTO deliveries (organization_id, order_id, deliverer_id, status) 
       VALUES ($1, $2, $3, 'assigned') RETURNING *`,
      [req.user.organization_id, req.params.id, delivererId]
    );
    
    await pool.query(`UPDATE orders SET status = 'in_delivery' WHERE id = $1`, [req.params.id]);
    
    await logAudit('ORDER_ASSIGNED', req.user.id, req.user.organization_id, { orderId: req.params.id, delivererId }, req);
    
    res.json({ success: true, data: deliveryResult.rows[0] });
  } catch (error) {
    console.error('Assign error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// PUT /api/orders/:id/kitchen-status
router.put('/:id/kitchen-status', authenticate, requireKitchen, validateUUID('id'), validate('kitchenStatus'), async (req, res) => {
  try {
    const { status } = req.body;
    
    const orderCheck = await pool.query(
      `SELECT status FROM orders WHERE id = $1 AND organization_id = $2`,
      [req.params.id, req.user.organization_id]
    );
    
    if (orderCheck.rows.length === 0) {
      return res.status(404).json({ error: 'Commande non trouvée' });
    }
    
    const currentStatus = orderCheck.rows[0].status;
    
    if (status === 'preparing' && currentStatus !== 'validated') {
      return res.status(400).json({ error: 'La commande doit être validée pour commencer la préparation' });
    }
    if (status === 'ready' && currentStatus !== 'preparing') {
      return res.status(400).json({ error: 'La commande doit être en préparation pour être marquée prête' });
    }
    
    await pool.query(
      `UPDATE orders SET status = $1, updated_at = NOW() WHERE id = $2`,
      [status, req.params.id]
    );
    
    await logAudit('ORDER_KITCHEN_STATUS', req.user.id, req.user.organization_id, { orderId: req.params.id, status }, req);
    
    res.json({ success: true });
  } catch (error) {
    console.error('Kitchen status error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

module.exports = router;
