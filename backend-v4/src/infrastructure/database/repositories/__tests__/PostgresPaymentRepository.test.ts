import { randomUUID } from 'crypto';
import { afterAll, beforeAll, beforeEach, describe, expect, it } from 'vitest';
import { Payment, PaymentMethod } from '../../../../domain/entities/Payment';
import { Money } from '../../../../domain/value-objects/Money';
import { db } from '../../PostgresConnection';
import { PostgresPaymentRepository } from '../PostgresPaymentRepository';

describe('PostgresPaymentRepository', () => {
  let repository: PostgresPaymentRepository;
  const testOrgId = '00000000-0000-0000-0000-000000000001';
  const testCustomerId = '00000000-0000-0000-0000-000000000002';

  beforeAll(async () => {
    await db.connect();
    repository = new PostgresPaymentRepository();
  });

  afterAll(async () => {
    await db.disconnect();
  });

  beforeEach(async () => {
    await db.query('DELETE FROM payments WHERE organization_id = $1', [testOrgId]);
  });

  describe('create', () => {
    it('should create a new payment', async () => {
      const payment = Payment.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          amount: Money.create(1000),
          paymentMethod: PaymentMethod.CASH,
        },
        randomUUID()
      );

      const created = await repository.create(payment);

      expect(created.getId()).toBeDefined();
      expect(created.getCustomerId()).toBe(testCustomerId);
      expect(created.getAmount().amount).toBe(1000);
      expect(created.getPaymentMethod()).toBe(PaymentMethod.CASH);
    });
  });

  describe('findById', () => {
    it('should find payment by id', async () => {
      const paymentId = randomUUID();
      const payment = Payment.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          amount: Money.create(500),
          paymentMethod: PaymentMethod.CASH,
        },
        paymentId
      );

      await repository.create(payment);
      const found = await repository.findById(paymentId);

      expect(found).toBeDefined();
      expect(found?.getId()).toBe(paymentId);
    });

    it('should return null if payment not found', async () => {
      const found = await repository.findById(randomUUID());
      expect(found).toBeNull();
    });
  });

  describe('findByCustomer', () => {
    it('should find all payments for a customer', async () => {
      const payment1 = Payment.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          amount: Money.create(300),
          paymentMethod: PaymentMethod.CASH,
        },
        randomUUID()
      );

      const payment2 = Payment.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          amount: Money.create(400),
          paymentMethod: PaymentMethod.CHECK,
        },
        randomUUID()
      );

      await repository.create(payment1);
      await repository.create(payment2);

      const payments = await repository.findByCustomer(testCustomerId);

      expect(payments.length).toBeGreaterThanOrEqual(2);
    });
  });

  describe('update', () => {
    it('should update payment', async () => {
      const payment = Payment.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          amount: Money.create(600),
          paymentMethod: PaymentMethod.CASH,
        },
        randomUUID()
      );

      const created = await repository.create(payment);
      created.addNote('Payment received in full');

      await repository.update(created);

      const updated = await repository.findById(created.getId());
      expect(updated?.getNotes()).toBe('Payment received in full');
    });
  });
});
