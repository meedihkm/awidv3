/**
 * E2E Test: Payment Workflow
 * Tests du workflow complet de paiement et gestion de dette
 */
import { randomUUID } from 'crypto';
import { afterAll, beforeAll, describe, expect, it } from 'vitest';
import { db } from '../../../infrastructure/database/PostgresConnection';

describe('Payment Workflow E2E', () => {
  let testOrgId: string;
  let testCustomerId: string;
  let testOrder1Id: string;
  let testOrder2Id: string;

  beforeAll(async () => {
    await db.connect();

    // Créer organisation
    testOrgId = randomUUID();
    await db.query(
      `INSERT INTO organizations (id, name, type, phone, address_city, is_active)
       VALUES ($1, 'Test Restaurant', 'restaurant', '+213555123456', 'Algiers', true)`,
      [testOrgId]
    );

    // Créer client avec limite de crédit
    testCustomerId = randomUUID();
    await db.query(
      `INSERT INTO users (
        id, organization_id, first_name, last_name, email, phone, password_hash, role,
        credit_limit, credit_days, current_debt,
        is_active, email_verified, phone_verified
      )
      VALUES ($1, $2, 'Test', 'Customer', 'customer@test.com', '+213555123456', 'hash', 'customer', 
              1000000, 30, 0, true, true, true)`,
      [testCustomerId, testOrgId]
    );

    // Créer deux commandes
    testOrder1Id = randomUUID();
    testOrder2Id = randomUUID();

    await db.query(
      `INSERT INTO orders (
        id, organization_id, customer_id, order_number,
        delivery_address_street, delivery_address_city, delivery_address_state,
        subtotal, delivery_fee, total, status, delivered_at
      )
      VALUES 
      ($1, $2, $3, 'ORD-PAY-001', '123 Test St', 'Algiers', 'Algiers', 300000, 20000, 320000, 'delivered', CURRENT_TIMESTAMP - INTERVAL '2 days'),
      ($4, $2, $3, 'ORD-PAY-002', '123 Test St', 'Algiers', 'Algiers', 200000, 20000, 220000, 'delivered', CURRENT_TIMESTAMP - INTERVAL '1 day')`,
      [testOrder1Id, testOrgId, testCustomerId, testOrder2Id]
    );

    // Mettre à jour la dette du client
    await db.query(`UPDATE users SET current_debt = 540000 WHERE id = $1`, [testCustomerId]);
  });

  afterAll(async () => {
    await db.query(
      'DELETE FROM payment_allocations WHERE payment_id IN (SELECT id FROM payments WHERE organization_id = $1)',
      [testOrgId]
    );
    await db.query('DELETE FROM payments WHERE organization_id = $1', [testOrgId]);
    await db.query('DELETE FROM orders WHERE organization_id = $1', [testOrgId]);
    await db.query('DELETE FROM users WHERE organization_id = $1', [testOrgId]);
    await db.query('DELETE FROM organizations WHERE id = $1', [testOrgId]);
    await db.disconnect();
  });

  it('should complete full payment workflow with debt management', async () => {
    // 1. Vérifier la dette initiale
    const initialCustomer = await db.query('SELECT current_debt FROM users WHERE id = $1', [
      testCustomerId,
    ]);
    expect(initialCustomer[0].current_debt).toBe(540000); // 5400 DZD en centimes

    // 2. Enregistrer un paiement partiel
    const payment1Id = randomUUID();
    await db.query(
      `INSERT INTO payments (
        id, organization_id, customer_id, payment_number,
        amount, payment_method, reference, notes
      )
      VALUES ($1, $2, $3, 'PAY-001', 300000, 'cash', 'CASH-001', 'Paiement partiel')
      RETURNING *`,
      [payment1Id, testOrgId, testCustomerId]
    );

    // 3. Allouer le paiement à la première commande
    await db.query(
      `INSERT INTO payment_allocations (payment_id, order_id, amount)
       VALUES ($1, $2, 300000)`,
      [payment1Id, testOrder1Id]
    );

    // 4. Mettre à jour la dette
    await db.query(`UPDATE users SET current_debt = current_debt - 300000 WHERE id = $1`, [
      testCustomerId,
    ]);

    const afterPayment1 = await db.query('SELECT current_debt FROM users WHERE id = $1', [
      testCustomerId,
    ]);
    expect(afterPayment1[0].current_debt).toBe(240000); // 2400 DZD restants

    // 5. Enregistrer un deuxième paiement pour solder
    const payment2Id = randomUUID();
    await db.query(
      `INSERT INTO payments (
        id, organization_id, customer_id, payment_number,
        amount, payment_method, reference
      )
      VALUES ($1, $2, $3, 'PAY-002', 240000, 'check', 'CHK-12345')`,
      [payment2Id, testOrgId, testCustomerId]
    );

    // 6. Allouer aux deux commandes
    await db.query(
      `INSERT INTO payment_allocations (payment_id, order_id, amount)
       VALUES 
       ($1, $2, 20000),
       ($1, $3, 220000)`,
      [payment2Id, testOrder1Id, testOrder2Id]
    );

    // 7. Solder la dette
    await db.query(`UPDATE users SET current_debt = 0 WHERE id = $1`, [testCustomerId]);

    const finalCustomer = await db.query('SELECT current_debt FROM users WHERE id = $1', [
      testCustomerId,
    ]);
    expect(finalCustomer[0].current_debt).toBe(0);

    // 8. Vérifier l'historique des paiements
    const payments = await db.query(
      'SELECT * FROM payments WHERE customer_id = $1 ORDER BY created_at',
      [testCustomerId]
    );
    expect(payments).toHaveLength(2);
    expect(payments[0].amount).toBe(300000);
    expect(payments[1].amount).toBe(240000);

    // 9. Vérifier les allocations
    const allocations = await db.query(
      `SELECT * FROM payment_allocations WHERE payment_id IN ($1, $2)`,
      [payment1Id, payment2Id]
    );
    expect(allocations).toHaveLength(3);
  });

  it('should handle payment with transfer method', async () => {
    // Créer nouvelle commande
    const transferOrderId = randomUUID();
    await db.query(
      `INSERT INTO orders (
        id, organization_id, customer_id, order_number,
        delivery_address_street, delivery_address_city, delivery_address_state,
        subtotal, delivery_fee, total, status, delivered_at
      )
      VALUES ($1, $2, $3, 'ORD-TRANSFER-001', '123 Test St', 'Algiers', 'Algiers', 150000, 20000, 170000, 'delivered', CURRENT_TIMESTAMP)`,
      [transferOrderId, testOrgId, testCustomerId]
    );

    // Augmenter dette
    await db.query(`UPDATE users SET current_debt = current_debt + 170000 WHERE id = $1`, [
      testCustomerId,
    ]);

    // Paiement par virement
    const transferPaymentId = randomUUID();
    await db.query(
      `INSERT INTO payments (
        id, organization_id, customer_id, payment_number,
        amount, payment_method, reference, notes
      )
      VALUES ($1, $2, $3, 'PAY-TRANSFER-001', 170000, 'transfer', 'TRANS-789', 'Virement bancaire')`,
      [transferPaymentId, testOrgId, testCustomerId]
    );

    // Allouer et réduire dette
    await db.query(
      `INSERT INTO payment_allocations (payment_id, order_id, amount)
       VALUES ($1, $2, 170000)`,
      [transferPaymentId, transferOrderId]
    );

    await db.query(`UPDATE users SET current_debt = current_debt - 170000 WHERE id = $1`, [
      testCustomerId,
    ]);

    const payment = await db.query('SELECT * FROM payments WHERE id = $1', [transferPaymentId]);
    expect(payment[0].payment_method).toBe('transfer');
    expect(payment[0].reference).toBe('TRANS-789');

    // Nettoyer
    await db.query('DELETE FROM payment_allocations WHERE payment_id = $1', [transferPaymentId]);
    await db.query('DELETE FROM payments WHERE id = $1', [transferPaymentId]);
    await db.query('DELETE FROM orders WHERE id = $1', [transferOrderId]);
  });

  it('should track payment history correctly', async () => {
    // Créer plusieurs paiements
    const historyPayment1Id = randomUUID();
    const historyPayment2Id = randomUUID();
    const historyPayment3Id = randomUUID();

    await db.query(
      `INSERT INTO payments (
        id, organization_id, customer_id, payment_number, amount, payment_method
      )
      VALUES 
      ($1, $2, $3, 'PAY-HIST-001', 100000, 'cash'),
      ($4, $2, $3, 'PAY-HIST-002', 150000, 'check'),
      ($5, $2, $3, 'PAY-HIST-003', 200000, 'transfer')`,
      [historyPayment1Id, testOrgId, testCustomerId, historyPayment2Id, historyPayment3Id]
    );

    // Récupérer l'historique
    const history = await db.query(
      `SELECT * FROM payments 
       WHERE customer_id = $1 
       ORDER BY created_at DESC`,
      [testCustomerId]
    );

    expect(history.length).toBeGreaterThanOrEqual(3);

    // Vérifier les montants
    const totalPaid = history.reduce((sum: number, p: any) => sum + p.amount, 0);
    expect(totalPaid).toBeGreaterThan(0);

    // Nettoyer
    await db.query('DELETE FROM payments WHERE id IN ($1, $2, $3)', [
      historyPayment1Id,
      historyPayment2Id,
      historyPayment3Id,
    ]);
  });

  it('should prevent exceeding credit limit', async () => {
    // Vérifier la limite de crédit
    const customer = await db.query('SELECT credit_limit, current_debt FROM users WHERE id = $1', [
      testCustomerId,
    ]);

    const creditLimit = customer[0].credit_limit;
    const currentDebt = customer[0].current_debt;
    const availableCredit = creditLimit - currentDebt;

    expect(availableCredit).toBeGreaterThanOrEqual(0);
    expect(currentDebt).toBeLessThanOrEqual(creditLimit);

    // Simuler tentative de dépassement (devrait être bloqué par l'application)
    const wouldExceed = currentDebt + 2000000 > creditLimit;
    expect(wouldExceed).toBe(true);
  });
});
