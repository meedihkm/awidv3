import { randomUUID } from 'crypto';
import { describe, expect, it } from 'vitest';
import { Coordinates } from '../../value-objects/Coordinates';
import { Delivery, DeliveryStatus } from '../Delivery';

describe('Delivery', () => {
  const testOrgId = randomUUID();
  const testOrderId = randomUUID();
  const testDelivererId = randomUUID();

  const createValidDelivery = () =>
    Delivery.create(
      {
        organizationId: testOrgId,
        orderId: testOrderId,
        delivererId: testDelivererId,
        status: DeliveryStatus.PENDING,
      },
      randomUUID()
    );

  describe('create', () => {
    it('should create a valid delivery', () => {
      const delivery = createValidDelivery();

      expect(delivery.getId()).toBeDefined();
      expect(delivery.getOrderId()).toBe(testOrderId);
      expect(delivery.getDelivererId()).toBe(testDelivererId);
      expect(delivery.getStatus()).toBe(DeliveryStatus.PENDING);
    });

    it('should create delivery with optional fields', () => {
      const delivery = Delivery.create(
        {
          organizationId: testOrgId,
          orderId: testOrderId,
          delivererId: testDelivererId,
          status: DeliveryStatus.PENDING,
          notes: 'Handle with care',
          estimatedDuration: 30,
        },
        randomUUID()
      );

      expect(delivery.getNotes()).toBe('Handle with care');
      expect(delivery.getEstimatedDuration()).toBe(30);
    });
  });

  describe('updateStatus', () => {
    it('should update delivery status', () => {
      const delivery = createValidDelivery();

      delivery.updateStatus(DeliveryStatus.PICKED_UP);

      expect(delivery.getStatus()).toBe(DeliveryStatus.PICKED_UP);
    });

    it('should set picked up timestamp', () => {
      const delivery = createValidDelivery();

      delivery.updateStatus(DeliveryStatus.PICKED_UP);

      expect(delivery.getPickedUpAt()).toBeInstanceOf(Date);
    });

    it('should set delivered timestamp', () => {
      const delivery = createValidDelivery();

      delivery.updateStatus(DeliveryStatus.PICKED_UP);
      delivery.updateStatus(DeliveryStatus.IN_TRANSIT);
      delivery.updateStatus(DeliveryStatus.DELIVERED);

      expect(delivery.getDeliveredAt()).toBeInstanceOf(Date);
    });
  });

  describe('recordTracking', () => {
    it('should record GPS tracking point', () => {
      const delivery = createValidDelivery();
      const coords = Coordinates.create(36.7538, 3.0588);

      delivery.recordTracking(coords);

      const tracking = delivery.getTracking();
      expect(tracking).toHaveLength(1);
      expect(tracking[0].coordinates.latitude).toBe(36.7538);
      expect(tracking[0].coordinates.longitude).toBe(3.0588);
    });

    it('should record multiple tracking points', () => {
      const delivery = createValidDelivery();

      delivery.recordTracking(Coordinates.create(36.7538, 3.0588));
      delivery.recordTracking(Coordinates.create(36.754, 3.059));
      delivery.recordTracking(Coordinates.create(36.7542, 3.0592));

      expect(delivery.getTracking()).toHaveLength(3);
    });
  });

  describe('recordProofOfDelivery', () => {
    it('should record proof of delivery', () => {
      const delivery = createValidDelivery();

      delivery.recordProofOfDelivery('John Doe', 'https://example.com/signature.jpg');

      expect(delivery.getProofOfDelivery()).toBeDefined();
      expect(delivery.getProofOfDelivery()?.recipientName).toBe('John Doe');
      expect(delivery.getProofOfDelivery()?.signatureUrl).toBe('https://example.com/signature.jpg');
    });

    it('should record proof with photo', () => {
      const delivery = createValidDelivery();

      delivery.recordProofOfDelivery(
        'Jane Smith',
        'https://example.com/signature.jpg',
        'https://example.com/photo.jpg'
      );

      expect(delivery.getProofOfDelivery()?.photoUrl).toBe('https://example.com/photo.jpg');
    });
  });

  describe('complete', () => {
    it('should complete delivery', () => {
      const delivery = createValidDelivery();

      delivery.complete('John Doe', 'https://example.com/signature.jpg');

      expect(delivery.getStatus()).toBe(DeliveryStatus.DELIVERED);
      expect(delivery.getDeliveredAt()).toBeInstanceOf(Date);
      expect(delivery.getProofOfDelivery()).toBeDefined();
    });
  });

  describe('fail', () => {
    it('should mark delivery as failed', () => {
      const delivery = createValidDelivery();

      delivery.fail('Customer not available');

      expect(delivery.getStatus()).toBe(DeliveryStatus.FAILED);
      expect(delivery.getFailureReason()).toBe('Customer not available');
    });
  });

  describe('status checks', () => {
    it('should check if pending', () => {
      const delivery = createValidDelivery();
      expect(delivery.isPending()).toBe(true);
      expect(delivery.isInTransit()).toBe(false);
      expect(delivery.isDelivered()).toBe(false);
    });

    it('should check if in transit', () => {
      const delivery = createValidDelivery();
      delivery.updateStatus(DeliveryStatus.PICKED_UP);
      delivery.updateStatus(DeliveryStatus.IN_TRANSIT);

      expect(delivery.isPending()).toBe(false);
      expect(delivery.isInTransit()).toBe(true);
      expect(delivery.isDelivered()).toBe(false);
    });

    it('should check if delivered', () => {
      const delivery = createValidDelivery();
      delivery.complete('John Doe', 'https://example.com/signature.jpg');

      expect(delivery.isPending()).toBe(false);
      expect(delivery.isInTransit()).toBe(false);
      expect(delivery.isDelivered()).toBe(true);
    });
  });

  describe('getActualDuration', () => {
    it('should calculate actual duration', () => {
      const delivery = createValidDelivery();

      delivery.updateStatus(DeliveryStatus.PICKED_UP);

      // Wait a bit
      setTimeout(() => {
        delivery.complete('John Doe', 'https://example.com/signature.jpg');

        const duration = delivery.getActualDuration();
        expect(duration).toBeGreaterThan(0);
      }, 10);
    });

    it('should return undefined if not completed', () => {
      const delivery = createValidDelivery();

      expect(delivery.getActualDuration()).toBeUndefined();
    });
  });

  describe('toJSON', () => {
    it('should serialize to JSON', () => {
      const delivery = createValidDelivery();
      const json = delivery.toJSON();

      expect(json.orderId).toBe(testOrderId);
      expect(json.delivererId).toBe(testDelivererId);
      expect(json.status).toBe(DeliveryStatus.PENDING);
    });
  });
});
