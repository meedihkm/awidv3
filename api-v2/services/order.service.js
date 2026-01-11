const pool = require('../config/database');

// Helper pour parsing sécurisé
const safeParseFloat = (value) => {
  if (value === null || value === undefined) return 0;
  const parsed = parseFloat(value);
  return isNaN(parsed) ? 0 : parsed;
};

/**
 * Récupère les items d'une commande
 */
async function getOrderItems(orderId) {
  const result = await pool.query(
    `SELECT oi.*, p.name as product_name 
     FROM order_items oi 
     JOIN products p ON oi.product_id = p.id 
     WHERE oi.order_id = $1`,
    [orderId]
  );
  return result.rows.map(item => ({
    id: item.id,
    orderId: item.order_id,
    productId: item.product_id,
    productName: item.product_name || '',
    unitPrice: safeParseFloat(item.price),
    quantity: item.quantity || 0
  }));
}

/**
 * Récupère une commande avec ses items
 */
async function getOrderWithItems(orderId) {
  const orderResult = await pool.query(
    `SELECT o.*, u.name as cafeteria_name, u.phone as cafeteria_phone
     FROM orders o 
     JOIN users u ON o.cafeteria_id = u.id 
     WHERE o.id = $1`,
    [orderId]
  );
  
  if (orderResult.rows.length === 0) return null;
  
  const order = orderResult.rows[0];
  const items = await getOrderItems(orderId);
  
  return {
    id: order.id,
    organizationId: order.organization_id,
    cafeteriaId: order.cafeteria_id,
    date: order.date || '',
    total: safeParseFloat(order.total),
    status: order.status || 'pending',
    paymentStatus: order.payment_status || 'unpaid',
    amountPaid: safeParseFloat(order.amount_paid),
    createdAt: order.created_at,
    items,
    cafeteria: {
      id: order.cafeteria_id,
      name: order.cafeteria_name || '',
      phone: order.cafeteria_phone || null
    }
  };
}

/**
 * Formate une commande pour la réponse API
 */
function formatOrder(order, items, cafeteria = null) {
  return {
    id: order.id,
    organizationId: order.organization_id,
    cafeteriaId: order.cafeteria_id,
    date: order.date || '',
    total: safeParseFloat(order.total),
    status: order.status || 'pending',
    paymentStatus: order.payment_status || 'unpaid',
    amountPaid: safeParseFloat(order.amount_paid),
    createdAt: order.created_at,
    items,
    cafeteria: cafeteria || { id: order.cafeteria_id, name: order.cafeteria_name || '' }
  };
}

module.exports = {
  getOrderItems,
  getOrderWithItems,
  formatOrder,
};
