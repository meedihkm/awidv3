import { randomUUID } from 'crypto';
import { describe, expect, it } from 'vitest';
import { Address } from '../../value-objects/Address';
import { Money } from '../../value-objects/Money';
import { OrderStatus } from '../../value-objects/OrderStatus';
import { Order } from '../Order';

describe('Order', () => {
  const testOrgId = randomUUID();
  const testCustomerId = randomUUID();

  const createValidAddress = () =>
    Address.create({
      street: '123 Delivery Street',
      city: 'Algiers',
      wilaya: 'Algiers',
      postalCode: '16000',
    });

  const createValidOrder = () =>
    Order.create(
      {
        organizationId: testOrgId,
        customerId: testCustomerId,
        deliveryAddress: createValidAddress(),
        items: [
          {
            id: randomUUID(),
            productId: randomUUID(),
            productName: 'Pizza',
            quantity: 2,
            unitPrice: Money.create(800),
            subtotal: Money.create(1600),
          },
        ],
        subtotal: Money.create(1600),
        deliveryFee: Money.create(200),
        total: Money.create(1800),
        status: OrderStatus.PENDING,
      },
      randomUUID()
    );

  describe('create', () => {
    it('should create a valid order', () => {
      const order = createValidOrder();

      expect(order.getId()).toBeDefined();
      expect(order.getCustomerId()).toBe(testCustomerId);
      expect(order.getStatus().getValue()).toBe('pending');
      expect(order.getTotal().amount).toBe(1800);
      expect(order.getItems()).toHaveLength(1);
    });

    it('should create order with optional fields', () => {
      const order = Order.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          deliveryAddress: createValidAddress(),
          items: [],
          subtotal: Money.create(1000),
          deliveryFee: Money.create(100),
          total: Money.create(1100),
          status: OrderStatus.PENDING,
          notes: 'Please ring the bell',
          scheduledFor: new Date('2026-01-27T12:00:00Z'),
        },
        randomUUID()
      );

      expect(order.getNotes()).toBe('Please ring the bell');
      expect(order.getScheduledFor()).toBeInstanceOf(Date);
    });
  });

  describe('updateStatus', () => {
    it('should update order status', () => {
      const order = createValidOrder();

      order.updateStatus(OrderStatus.CONFIRMED);

      expect(order.getStatus().getValue()).toBe('confirmed');
    });

    it('should throw error for invalid transition', () => {
      const order = createValidOrder();
      order.updateStatus(OrderStatus.DELIVERED);

      expect(() => order.updateStatus(OrderStatus.PENDING)).toThrow();
    });
  });

  describe('assignDeliverer', () => {
    it('should assign deliverer to order', () => {
      const order = createValidOrder();
      const delivererId = randomUUID();

      order.assignDeliverer(delivererId);

      expect(order.getDelivererId()).toBe(delivererId);
    });
  });

  describe('cancel', () => {
    it('should cancel order', () => {
      const order = createValidOrder();

      order.cancel('Customer requested cancellation');

      expect(order.getStatus().getValue()).toBe('cancelled');
      expect(order.getCancelReason()).toBe('Customer requested cancellation');
      expect(order.getCancelledAt()).toBeInstanceOf(Date);
    });

    it('should throw error if already delivered', () => {
      const order = createValidOrder();
      order.updateStatus(OrderStatus.CONFIRMED);
      order.updateStatus(OrderStatus.PREPARING);
      order.updateStatus(OrderStatus.READY);
      order.updateStatus(OrderStatus.IN_DELIVERY);
      order.updateStatus(OrderStatus.DELIVERED);

      expect(() => order.cancel('Too late')).toThrow("Impossible d'annuler une commande livrée");
    });
  });

  describe('addItem', () => {
    it('should add item to order', () => {
      const order = createValidOrder();
      const initialItemCount = order.getItems().length;

      order.addItem({
        id: randomUUID(),
        productId: randomUUID(),
        productName: 'Salad',
        quantity: 1,
        unitPrice: Money.create(300),
        subtotal: Money.create(300),
      });

      expect(order.getItems()).toHaveLength(initialItemCount + 1);
    });
  });

  describe('removeItem', () => {
    it('should remove item from order', () => {
      const order = createValidOrder();
      const itemId = order.getItems()[0].id;

      order.removeItem(itemId);

      expect(order.getItems()).toHaveLength(0);
    });
  });

  describe('updateItemQuantity', () => {
    it('should update item quantity', () => {
      const order = createValidOrder();
      const itemId = order.getItems()[0].id;

      order.updateItemQuantity(itemId, 3);

      const item = order.getItems().find((i) => i.id === itemId);
      expect(item?.quantity).toBe(3);
    });
  });

  describe('calculateTotals', () => {
    it('should recalculate order totals', () => {
      const order = createValidOrder();

      order.calculateTotals();

      expect(order.getSubtotal().amount).toBe(1600);
      expect(order.getTotal().amount).toBe(1800);
    });
  });

  describe('isPending/isConfirmed/isDelivered/isCancelled', () => {
    it('should check order status', () => {
      const order = createValidOrder();

      expect(order.isPending()).toBe(true);
      expect(order.isConfirmed()).toBe(false);
      expect(order.isDelivered()).toBe(false);
      expect(order.isCancelled()).toBe(false);

      order.updateStatus(OrderStatus.CONFIRMED);
      expect(order.isPending()).toBe(false);
      expect(order.isConfirmed()).toBe(true);
    });
  });

  describe('canBeModified', () => {
    it('should allow modification for pending/confirmed orders', () => {
      const order = createValidOrder();

      expect(order.canBeModified()).toBe(true);

      order.updateStatus(OrderStatus.CONFIRMED);
      expect(order.canBeModified()).toBe(true);

      order.updateStatus(OrderStatus.PREPARING);
      expect(order.canBeModified()).toBe(false);
    });
  });

  describe('toJSON', () => {
    it('should serialize to JSON', () => {
      const order = createValidOrder();
      const json = order.toJSON();

      expect(json.customerId).toBe(testCustomerId);
      expect(json.status).toBe('pending');
      expect(json.total).toEqual({ amount: 1800, currency: 'DZD' });
      expect(json.items).toHaveLength(1);
    });
  });
});
