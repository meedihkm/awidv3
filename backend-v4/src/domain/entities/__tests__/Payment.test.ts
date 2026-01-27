import { randomUUID } from 'crypto';
import { describe, expect, it } from 'vitest';
import { Money } from '../../value-objects/Money';
import { Payment, PaymentMethod } from '../Payment';

describe('Payment', () => {
  const testOrgId = randomUUID();
  const testCustomerId = randomUUID();

  const createValidPayment = () =>
    Payment.create(
      {
        organizationId: testOrgId,
        customerId: testCustomerId,
        amount: Money.create(5000),
        paymentMethod: PaymentMethod.CASH,
      },
      randomUUID()
    );

  describe('create', () => {
    it('should create a valid payment', () => {
      const payment = createValidPayment();

      expect(payment.getId()).toBeDefined();
      expect(payment.getCustomerId()).toBe(testCustomerId);
      expect(payment.getAmount().amount).toBe(5000);
      expect(payment.getPaymentMethod()).toBe(PaymentMethod.CASH);
      expect(payment.getAllocations()).toHaveLength(0);
    });

    it('should create payment with optional fields', () => {
      const payment = Payment.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          amount: Money.create(5000),
          paymentMethod: PaymentMethod.CHECK,
          reference: 'CHK-12345',
          notes: 'Payment for January orders',
        },
        randomUUID()
      );

      expect(payment.getReference()).toBe('CHK-12345');
      expect(payment.getNotes()).toBe('Payment for January orders');
    });
  });

  describe('allocate', () => {
    it('should allocate payment to order', () => {
      const payment = createValidPayment();
      const orderId = randomUUID();

      payment.allocate(orderId, Money.create(2000));

      expect(payment.getAllocations()).toHaveLength(1);
      expect(payment.getAllocations()[0].orderId).toBe(orderId);
      expect(payment.getAllocations()[0].amount.amount).toBe(2000);
    });

    it('should allocate to multiple orders', () => {
      const payment = createValidPayment();
      const orderId1 = randomUUID();
      const orderId2 = randomUUID();

      payment.allocate(orderId1, Money.create(2000));
      payment.allocate(orderId2, Money.create(3000));

      expect(payment.getAllocations()).toHaveLength(2);
    });

    it('should throw error if allocation exceeds payment amount', () => {
      const payment = createValidPayment();
      const orderId = randomUUID();

      expect(() => payment.allocate(orderId, Money.create(6000))).toThrow(
        'Le montant alloué dépasse le montant du paiement'
      );
    });

    it('should throw error if total allocations exceed payment amount', () => {
      const payment = createValidPayment();
      const orderId1 = randomUUID();
      const orderId2 = randomUUID();

      payment.allocate(orderId1, Money.create(3000));

      expect(() => payment.allocate(orderId2, Money.create(3000))).toThrow(
        'Le montant alloué dépasse le montant du paiement'
      );
    });
  });

  describe('removeAllocation', () => {
    it('should remove allocation', () => {
      const payment = createValidPayment();
      const orderId = randomUUID();

      payment.allocate(orderId, Money.create(2000));
      expect(payment.getAllocations()).toHaveLength(1);

      payment.removeAllocation(orderId);
      expect(payment.getAllocations()).toHaveLength(0);
    });
  });

  describe('getAllocatedAmount', () => {
    it('should return total allocated amount', () => {
      const payment = createValidPayment();
      const orderId1 = randomUUID();
      const orderId2 = randomUUID();

      payment.allocate(orderId1, Money.create(2000));
      payment.allocate(orderId2, Money.create(1500));

      const allocated = payment.getAllocatedAmount();
      expect(allocated.amount).toBe(3500);
    });

    it('should return zero if no allocations', () => {
      const payment = createValidPayment();

      const allocated = payment.getAllocatedAmount();
      expect(allocated.amount).toBe(0);
    });
  });

  describe('getUnallocatedAmount', () => {
    it('should return unallocated amount', () => {
      const payment = createValidPayment();
      const orderId = randomUUID();

      payment.allocate(orderId, Money.create(2000));

      const unallocated = payment.getUnallocatedAmount();
      expect(unallocated.amount).toBe(3000);
    });

    it('should return full amount if no allocations', () => {
      const payment = createValidPayment();

      const unallocated = payment.getUnallocatedAmount();
      expect(unallocated.amount).toBe(5000);
    });
  });

  describe('isFullyAllocated', () => {
    it('should return true if fully allocated', () => {
      const payment = createValidPayment();
      const orderId = randomUUID();

      payment.allocate(orderId, Money.create(5000));

      expect(payment.isFullyAllocated()).toBe(true);
    });

    it('should return false if partially allocated', () => {
      const payment = createValidPayment();
      const orderId = randomUUID();

      payment.allocate(orderId, Money.create(2000));

      expect(payment.isFullyAllocated()).toBe(false);
    });

    it('should return false if not allocated', () => {
      const payment = createValidPayment();

      expect(payment.isFullyAllocated()).toBe(false);
    });
  });

  describe('addNote', () => {
    it('should add note to payment', () => {
      const payment = createValidPayment();

      payment.addNote('Payment verified');

      expect(payment.getNotes()).toBe('Payment verified');
    });

    it('should update existing note', () => {
      const payment = Payment.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          amount: Money.create(5000),
          paymentMethod: PaymentMethod.CASH,
          notes: 'Initial note',
        },
        randomUUID()
      );

      payment.addNote('Updated note');

      expect(payment.getNotes()).toBe('Updated note');
    });
  });

  describe('payment method checks', () => {
    it('should identify cash payment', () => {
      const payment = createValidPayment();

      expect(payment.isCash()).toBe(true);
      expect(payment.isCheck()).toBe(false);
      expect(payment.isTransfer()).toBe(false);
    });

    it('should identify check payment', () => {
      const payment = Payment.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          amount: Money.create(5000),
          paymentMethod: PaymentMethod.CHECK,
        },
        randomUUID()
      );

      expect(payment.isCash()).toBe(false);
      expect(payment.isCheck()).toBe(true);
      expect(payment.isTransfer()).toBe(false);
    });

    it('should identify transfer payment', () => {
      const payment = Payment.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          amount: Money.create(5000),
          paymentMethod: PaymentMethod.TRANSFER,
        },
        randomUUID()
      );

      expect(payment.isCash()).toBe(false);
      expect(payment.isCheck()).toBe(false);
      expect(payment.isTransfer()).toBe(true);
    });
  });

  describe('toJSON', () => {
    it('should serialize to JSON', () => {
      const payment = createValidPayment();
      const orderId = randomUUID();
      payment.allocate(orderId, Money.create(2000));

      const json = payment.toJSON();

      expect(json.customerId).toBe(testCustomerId);
      expect(json.amount).toEqual({ amount: 5000, currency: 'DZD' });
      expect(json.paymentMethod).toBe(PaymentMethod.CASH);
      expect(json.allocations).toHaveLength(1);
    });
  });
});
