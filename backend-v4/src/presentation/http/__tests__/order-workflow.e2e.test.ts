/**
 * E2E Test: Order Workflow
 * Tests du workflow complet de commande
 */
import { randomUUID } from 'crypto';
import { afterAll, beforeAll, describe, expect, it } from 'vitest';
import { db } from '../../../infrastructure/database/PostgresConnection';

describe('Order Workflow E2E', () => {
  let testOrgId: string;
  let testCustomerId: string;
  let testProductId: string;
  let testDelivererId: string;
  let testOrderId: string;

  beforeAll(async () => {
    await db.connect();

    // Créer organisation de test
    testOrgId = randomUUID();
    await db.query(
      `INSERT INTO organizations (id, name, type, phone, address_city, is_active)
       VALUES ($1, 'Test Restaurant', 'restaurant', '+213555123456', 'Algiers', true)`,
      [testOrgId]
    );

    // Créer client de test
    testCustomerId = randomUUID();
    await db.query(
      `INSERT INTO users (id, organization_id, first_name, last_name, email, phone, password_hash, role, is_active, email_verified, phone_verified)
       VALUES ($1, $2, 'Test', 'Customer', 'customer@test.com', '+213555123456', 'hash', 'customer', true, true, true)`,
      [testCustomerId, testOrgId]
    );

    // Créer livreur de test
    testDelivererId = randomUUID();
    await db.query(
      `INSERT INTO users (id, organization_id, first_name, last_name, email, phone, password_hash, role, is_available, is_active, email_verified, phone_verified)
       VALUES ($1, $2, 'Test', 'Deliverer', 'deliverer@test.com', '+213555123457', 'hash', 'deliverer', true, true, true, true)`,
      [testDelivererId, testOrgId]
    );

    // Créer produit de test
    testProductId = randomUUID();
    await db.query(
      `INSERT INTO products (id, organization_id, name, category, base_price, is_available)
       VALUES ($1, $2, 'Test Pizza', 'Main Course', 80000, true)`,
      [testProductId, testOrgId]
    );
  });

  afterAll(async () => {
    // Nettoyer les données de test
    await db.query('DELETE FROM orders WHERE organization_id = $1', [testOrgId]);
    await db.query('DELETE FROM products WHERE organization_id = $1', [testOrgId]);
    await db.query('DELETE FROM users WHERE organization_id = $1', [testOrgId]);
    await db.query('DELETE FROM organizations WHERE id = $1', [testOrgId]);
    await db.disconnect();
  });

  it('should complete full order workflow', async () => {
    // 1. Créer une commande
    testOrderId = randomUUID();
    const orderResult = await db.query(
      `INSERT INTO orders (
        id, organization_id, customer_id, order_number,
        delivery_address_street, delivery_address_city, delivery_address_state,
        subtotal, delivery_fee, total, status
      )
      VALUES ($1, $2, $3, 'ORD-001', '123 Test St', 'Algiers', 'Algiers', 160000, 20000, 180000, 'pending')
      RETURNING *`,
      [testOrderId, testOrgId, testCustomerId]
    );

    expect(orderResult).toHaveLength(1);
    expect(orderResult[0].status).toBe('pending');

    // 2. Ajouter des items à la commande
    const itemId = randomUUID();
    await db.query(
      `INSERT INTO order_items (id, order_id, product_id, product_name, quantity, unit_price, subtotal)
       VALUES ($1, $2, $3, 'Test Pizza', 2, 80000, 160000)`,
      [itemId, testOrderId, testProductId]
    );

    // 3. Confirmer la commande
    await db.query(
      `UPDATE orders SET status = 'confirmed', updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [testOrderId]
    );

    const confirmedOrder = await db.query('SELECT * FROM orders WHERE id = $1', [testOrderId]);
    expect(confirmedOrder[0].status).toBe('confirmed');

    // 4. Assigner un livreur
    await db.query(
      `UPDATE orders SET deliverer_id = $2, updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [testOrderId, testDelivererId]
    );

    const assignedOrder = await db.query('SELECT * FROM orders WHERE id = $1', [testOrderId]);
    expect(assignedOrder[0].deliverer_id).toBe(testDelivererId);

    // 5. Passer en préparation
    await db.query(
      `UPDATE orders SET status = 'preparing', updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [testOrderId]
    );

    // 6. Marquer comme prêt
    await db.query(
      `UPDATE orders SET status = 'ready', updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [testOrderId]
    );

    // 7. En livraison
    await db.query(
      `UPDATE orders SET status = 'in_delivery', updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [testOrderId]
    );

    // 8. Livré
    await db.query(
      `UPDATE orders SET status = 'delivered', delivered_at = CURRENT_TIMESTAMP, updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [testOrderId]
    );

    const deliveredOrder = await db.query('SELECT * FROM orders WHERE id = $1', [testOrderId]);
    expect(deliveredOrder[0].status).toBe('delivered');
    expect(deliveredOrder[0].delivered_at).toBeDefined();
  });

  it('should handle order cancellation', async () => {
    // Créer une commande à annuler
    const cancelOrderId = randomUUID();
    await db.query(
      `INSERT INTO orders (
        id, organization_id, customer_id, order_number,
        delivery_address_street, delivery_address_city, delivery_address_state,
        subtotal, delivery_fee, total, status
      )
      VALUES ($1, $2, $3, 'ORD-002', '123 Test St', 'Algiers', 'Algiers', 80000, 20000, 100000, 'pending')
      RETURNING *`,
      [cancelOrderId, testOrgId, testCustomerId]
    );

    // Annuler la commande
    await db.query(
      `UPDATE orders 
       SET status = 'cancelled', 
           cancel_reason = 'Customer request',
           cancelled_at = CURRENT_TIMESTAMP,
           updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [cancelOrderId]
    );

    const cancelledOrder = await db.query('SELECT * FROM orders WHERE id = $1', [cancelOrderId]);
    expect(cancelledOrder[0].status).toBe('cancelled');
    expect(cancelledOrder[0].cancel_reason).toBe('Customer request');
    expect(cancelledOrder[0].cancelled_at).toBeDefined();

    // Nettoyer
    await db.query('DELETE FROM orders WHERE id = $1', [cancelOrderId]);
  });

  it('should track order items correctly', async () => {
    // Créer commande avec plusieurs items
    const multiItemOrderId = randomUUID();
    await db.query(
      `INSERT INTO orders (
        id, organization_id, customer_id, order_number,
        delivery_address_street, delivery_address_city, delivery_address_state,
        subtotal, delivery_fee, total, status
      )
      VALUES ($1, $2, $3, 'ORD-003', '123 Test St', 'Algiers', 'Algiers', 240000, 20000, 260000, 'pending')`,
      [multiItemOrderId, testOrgId, testCustomerId]
    );

    // Ajouter plusieurs items
    const item1Id = randomUUID();
    const item2Id = randomUUID();

    await db.query(
      `INSERT INTO order_items (id, order_id, product_id, product_name, quantity, unit_price, subtotal)
       VALUES 
       ($1, $2, $3, 'Pizza', 2, 80000, 160000),
       ($4, $2, $3, 'Salad', 1, 80000, 80000)`,
      [item1Id, multiItemOrderId, testProductId, item2Id]
    );

    // Vérifier les items
    const items = await db.query('SELECT * FROM order_items WHERE order_id = $1', [
      multiItemOrderId,
    ]);
    expect(items).toHaveLength(2);
    expect(items[0].quantity).toBe(2);
    expect(items[1].quantity).toBe(1);

    // Nettoyer
    await db.query('DELETE FROM order_items WHERE order_id = $1', [multiItemOrderId]);
    await db.query('DELETE FROM orders WHERE id = $1', [multiItemOrderId]);
  });
});
