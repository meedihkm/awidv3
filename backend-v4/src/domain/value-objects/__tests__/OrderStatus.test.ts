import { describe, expect, it } from 'vitest';
import { OrderStatus } from '../OrderStatus';

describe('OrderStatus', () => {
  describe('create', () => {
    it('should create PENDING status', () => {
      const status = OrderStatus.PENDING;
      expect(status.getValue()).toBe('pending');
    });

    it('should create CONFIRMED status', () => {
      const status = OrderStatus.CONFIRMED;
      expect(status.getValue()).toBe('confirmed');
    });

    it('should create PREPARING status', () => {
      const status = OrderStatus.PREPARING;
      expect(status.getValue()).toBe('preparing');
    });

    it('should create READY status', () => {
      const status = OrderStatus.READY;
      expect(status.getValue()).toBe('ready');
    });

    it('should create IN_DELIVERY status', () => {
      const status = OrderStatus.IN_DELIVERY;
      expect(status.getValue()).toBe('in_delivery');
    });

    it('should create DELIVERED status', () => {
      const status = OrderStatus.DELIVERED;
      expect(status.getValue()).toBe('delivered');
    });

    it('should create CANCELLED status', () => {
      const status = OrderStatus.CANCELLED;
      expect(status.getValue()).toBe('cancelled');
    });
  });

  describe('isPending', () => {
    it('should return true for PENDING status', () => {
      expect(OrderStatus.PENDING.isPending()).toBe(true);
    });

    it('should return false for other statuses', () => {
      expect(OrderStatus.CONFIRMED.isPending()).toBe(false);
      expect(OrderStatus.DELIVERED.isPending()).toBe(false);
    });
  });

  describe('isConfirmed', () => {
    it('should return true for CONFIRMED status', () => {
      expect(OrderStatus.CONFIRMED.isConfirmed()).toBe(true);
    });

    it('should return false for other statuses', () => {
      expect(OrderStatus.PENDING.isConfirmed()).toBe(false);
    });
  });

  describe('isDelivered', () => {
    it('should return true for DELIVERED status', () => {
      expect(OrderStatus.DELIVERED.isDelivered()).toBe(true);
    });

    it('should return false for other statuses', () => {
      expect(OrderStatus.PENDING.isDelivered()).toBe(false);
    });
  });

  describe('isCancelled', () => {
    it('should return true for CANCELLED status', () => {
      expect(OrderStatus.CANCELLED.isCancelled()).toBe(true);
    });

    it('should return false for other statuses', () => {
      expect(OrderStatus.PENDING.isCancelled()).toBe(false);
    });
  });

  describe('canTransitionTo', () => {
    it('should allow PENDING to CONFIRMED', () => {
      expect(OrderStatus.PENDING.canTransitionTo(OrderStatus.CONFIRMED)).toBe(true);
    });

    it('should allow CONFIRMED to PREPARING', () => {
      expect(OrderStatus.CONFIRMED.canTransitionTo(OrderStatus.PREPARING)).toBe(true);
    });

    it('should allow PREPARING to READY', () => {
      expect(OrderStatus.PREPARING.canTransitionTo(OrderStatus.READY)).toBe(true);
    });

    it('should allow READY to IN_DELIVERY', () => {
      expect(OrderStatus.READY.canTransitionTo(OrderStatus.IN_DELIVERY)).toBe(true);
    });

    it('should allow IN_DELIVERY to DELIVERED', () => {
      expect(OrderStatus.IN_DELIVERY.canTransitionTo(OrderStatus.DELIVERED)).toBe(true);
    });

    it('should not allow DELIVERED to any other status', () => {
      expect(OrderStatus.DELIVERED.canTransitionTo(OrderStatus.PENDING)).toBe(false);
      expect(OrderStatus.DELIVERED.canTransitionTo(OrderStatus.CONFIRMED)).toBe(false);
    });

    it('should not allow CANCELLED to any other status', () => {
      expect(OrderStatus.CANCELLED.canTransitionTo(OrderStatus.PENDING)).toBe(false);
      expect(OrderStatus.CANCELLED.canTransitionTo(OrderStatus.CONFIRMED)).toBe(false);
    });

    it('should allow any non-final status to CANCELLED', () => {
      expect(OrderStatus.PENDING.canTransitionTo(OrderStatus.CANCELLED)).toBe(true);
      expect(OrderStatus.CONFIRMED.canTransitionTo(OrderStatus.CANCELLED)).toBe(true);
      expect(OrderStatus.PREPARING.canTransitionTo(OrderStatus.CANCELLED)).toBe(true);
    });
  });

  describe('toJSON', () => {
    it('should serialize to JSON', () => {
      expect(OrderStatus.PENDING.toJSON()).toBe('pending');
      expect(OrderStatus.CONFIRMED.toJSON()).toBe('confirmed');
      expect(OrderStatus.DELIVERED.toJSON()).toBe('delivered');
    });
  });
});
