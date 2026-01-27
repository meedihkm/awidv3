/**
 * E2E Test: Delivery Workflow
 * Tests du workflow complet de livraison
 */
import { randomUUID } from 'crypto';
import { afterAll, beforeAll, describe, expect, it } from 'vitest';
import { db } from '../../../infrastructure/database/PostgresConnection';

describe('Delivery Workflow E2E', () => {
  let testOrgId: string;
  let testCustomerId: string;
  let testDelivererId: string;
  let testOrderId: string;
  let testDeliveryId: string;

  beforeAll(async () => {
    await db.connect();

    // Créer organisation
    testOrgId = randomUUID();
    await db.query(
      `INSERT INTO organizations (id, name, type, phone, address_city, is_active)
       VALUES ($1, 'Test Restaurant', 'restaurant', '+213555123456', 'Algiers', true)`,
      [testOrgId]
    );

    // Créer client
    testCustomerId = randomUUID();
    await db.query(
      `INSERT INTO users (id, organization_id, first_name, last_name, email, phone, password_hash, role, is_active, email_verified, phone_verified)
       VALUES ($1, $2, 'Test', 'Customer', 'customer@test.com', '+213555123456', 'hash', 'customer', true, true, true)`,
      [testCustomerId, testOrgId]
    );

    // Créer livreur
    testDelivererId = randomUUID();
    await db.query(
      `INSERT INTO users (id, organization_id, first_name, last_name, email, phone, password_hash, role, is_available, is_active, email_verified, phone_verified)
       VALUES ($1, $2, 'Test', 'Deliverer', 'deliverer@test.com', '+213555123457', 'hash', 'deliverer', true, true, true, true)`,
      [testDelivererId, testOrgId]
    );

    // Créer commande
    testOrderId = randomUUID();
    await db.query(
      `INSERT INTO orders (
        id, organization_id, customer_id, deliverer_id, order_number,
        delivery_address_street, delivery_address_city, delivery_address_state,
        subtotal, delivery_fee, total, status
      )
      VALUES ($1, $2, $3, $4, 'ORD-DEL-001', '123 Test St', 'Algiers', 'Algiers', 100000, 20000, 120000, 'ready')`,
      [testOrderId, testOrgId, testCustomerId, testDelivererId]
    );
  });

  afterAll(async () => {
    await db.query('DELETE FROM deliveries WHERE organization_id = $1', [testOrgId]);
    await db.query('DELETE FROM orders WHERE organization_id = $1', [testOrgId]);
    await db.query('DELETE FROM users WHERE organization_id = $1', [testOrgId]);
    await db.query('DELETE FROM organizations WHERE id = $1', [testOrgId]);
    await db.disconnect();
  });

  it('should complete full delivery workflow', async () => {
    // 1. Créer une livraison
    testDeliveryId = randomUUID();
    const deliveryResult = await db.query(
      `INSERT INTO deliveries (
        id, organization_id, order_id, deliverer_id, delivery_number, status
      )
      VALUES ($1, $2, $3, $4, 'DEL-001', 'pending')
      RETURNING *`,
      [testDeliveryId, testOrgId, testOrderId, testDelivererId]
    );

    expect(deliveryResult).toHaveLength(1);
    expect(deliveryResult[0].status).toBe('pending');

    // 2. Prise en charge
    await db.query(
      `UPDATE deliveries 
       SET status = 'picked_up', 
           picked_up_at = CURRENT_TIMESTAMP,
           updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [testDeliveryId]
    );

    const pickedUpDelivery = await db.query('SELECT * FROM deliveries WHERE id = $1', [
      testDeliveryId,
    ]);
    expect(pickedUpDelivery[0].status).toBe('picked_up');
    expect(pickedUpDelivery[0].picked_up_at).toBeDefined();

    // 3. En transit
    await db.query(
      `UPDATE deliveries 
       SET status = 'in_transit',
           updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [testDeliveryId]
    );

    // 4. Enregistrer tracking GPS
    const trackingId1 = randomUUID();
    const trackingId2 = randomUUID();
    await db.query(
      `INSERT INTO delivery_tracking (id, delivery_id, latitude, longitude)
       VALUES 
       ($1, $2, 36.7538, 3.0588),
       ($3, $2, 36.7540, 3.0590)`,
      [trackingId1, testDeliveryId, trackingId2]
    );

    const tracking = await db.query('SELECT * FROM delivery_tracking WHERE delivery_id = $1', [
      testDeliveryId,
    ]);
    expect(tracking).toHaveLength(2);

    // 5. Livré avec preuve
    await db.query(
      `UPDATE deliveries 
       SET status = 'delivered',
           delivered_at = CURRENT_TIMESTAMP,
           recipient_name = 'John Doe',
           signature_url = 'https://example.com/signature.jpg',
           photo_url = 'https://example.com/photo.jpg',
           updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [testDeliveryId]
    );

    const deliveredDelivery = await db.query('SELECT * FROM deliveries WHERE id = $1', [
      testDeliveryId,
    ]);
    expect(deliveredDelivery[0].status).toBe('delivered');
    expect(deliveredDelivery[0].delivered_at).toBeDefined();
    expect(deliveredDelivery[0].recipient_name).toBe('John Doe');
    expect(deliveredDelivery[0].signature_url).toBeDefined();
    expect(deliveredDelivery[0].photo_url).toBeDefined();

    // 6. Vérifier que la commande est aussi marquée comme livrée
    await db.query(
      `UPDATE orders 
       SET status = 'delivered',
           delivered_at = CURRENT_TIMESTAMP,
           updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [testOrderId]
    );

    const deliveredOrder = await db.query('SELECT * FROM orders WHERE id = $1', [testOrderId]);
    expect(deliveredOrder[0].status).toBe('delivered');
  });

  it('should handle failed delivery', async () => {
    // Créer nouvelle commande et livraison
    const failedOrderId = randomUUID();
    await db.query(
      `INSERT INTO orders (
        id, organization_id, customer_id, deliverer_id, order_number,
        delivery_address_street, delivery_address_city, delivery_address_state,
        subtotal, delivery_fee, total, status
      )
      VALUES ($1, $2, $3, $4, 'ORD-FAIL-001', '456 Test St', 'Algiers', 'Algiers', 50000, 20000, 70000, 'ready')`,
      [failedOrderId, testOrgId, testCustomerId, testDelivererId]
    );

    const failedDeliveryId = randomUUID();
    await db.query(
      `INSERT INTO deliveries (
        id, organization_id, order_id, deliverer_id, delivery_number, status
      )
      VALUES ($1, $2, $3, $4, 'DEL-FAIL-001', 'in_transit')`,
      [failedDeliveryId, testOrgId, failedOrderId, testDelivererId]
    );

    // Marquer comme échouée
    await db.query(
      `UPDATE deliveries 
       SET status = 'failed',
           failure_reason = 'Customer not available',
           updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [failedDeliveryId]
    );

    const failedDelivery = await db.query('SELECT * FROM deliveries WHERE id = $1', [
      failedDeliveryId,
    ]);
    expect(failedDelivery[0].status).toBe('failed');
    expect(failedDelivery[0].failure_reason).toBe('Customer not available');

    // Nettoyer
    await db.query('DELETE FROM deliveries WHERE id = $1', [failedDeliveryId]);
    await db.query('DELETE FROM orders WHERE id = $1', [failedOrderId]);
  });

  it('should track delivery duration', async () => {
    // Créer livraison avec timestamps
    const timedOrderId = randomUUID();
    await db.query(
      `INSERT INTO orders (
        id, organization_id, customer_id, deliverer_id, order_number,
        delivery_address_street, delivery_address_city, delivery_address_state,
        subtotal, delivery_fee, total, status
      )
      VALUES ($1, $2, $3, $4, 'ORD-TIME-001', '789 Test St', 'Algiers', 'Algiers', 60000, 20000, 80000, 'ready')`,
      [timedOrderId, testOrgId, testCustomerId, testDelivererId]
    );

    const timedDeliveryId = randomUUID();
    await db.query(
      `INSERT INTO deliveries (
        id, organization_id, order_id, deliverer_id, delivery_number, 
        status, estimated_duration, picked_up_at
      )
      VALUES ($1, $2, $3, $4, 'DEL-TIME-001', 'picked_up', 30, CURRENT_TIMESTAMP - INTERVAL '25 minutes')`,
      [timedDeliveryId, testOrgId, timedOrderId, testDelivererId]
    );

    // Compléter la livraison
    await db.query(
      `UPDATE deliveries 
       SET status = 'delivered',
           delivered_at = CURRENT_TIMESTAMP,
           recipient_name = 'Jane Doe',
           signature_url = 'https://example.com/sig2.jpg',
           updated_at = CURRENT_TIMESTAMP
       WHERE id = $1`,
      [timedDeliveryId]
    );

    const completedDelivery = await db.query('SELECT * FROM deliveries WHERE id = $1', [
      timedDeliveryId,
    ]);
    expect(completedDelivery[0].picked_up_at).toBeDefined();
    expect(completedDelivery[0].delivered_at).toBeDefined();
    expect(completedDelivery[0].estimated_duration).toBe(30);

    // Nettoyer
    await db.query('DELETE FROM deliveries WHERE id = $1', [timedDeliveryId]);
    await db.query('DELETE FROM orders WHERE id = $1', [timedOrderId]);
  });
});
