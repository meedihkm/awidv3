import { randomUUID } from 'crypto';
import { afterAll, beforeAll, beforeEach, describe, expect, it } from 'vitest';
import { Delivery, DeliveryStatus } from '../../../../domain/entities/Delivery';
import { db } from '../../PostgresConnection';
import { PostgresDeliveryRepository } from '../PostgresDeliveryRepository';

describe('PostgresDeliveryRepository', () => {
  let repository: PostgresDeliveryRepository;
  const testOrgId = '00000000-0000-0000-0000-000000000001';
  const testOrderId = '00000000-0000-0000-0000-000000000002';
  const testDelivererId = '00000000-0000-0000-0000-000000000003';

  beforeAll(async () => {
    await db.connect();
    repository = new PostgresDeliveryRepository();
  });

  afterAll(async () => {
    await db.disconnect();
  });

  beforeEach(async () => {
    await db.query('DELETE FROM deliveries WHERE organization_id = $1', [testOrgId]);
  });

  describe('create', () => {
    it('should create a new delivery', async () => {
      const delivery = Delivery.create(
        {
          organizationId: testOrgId,
          orderId: testOrderId,
          delivererId: testDelivererId,
          status: DeliveryStatus.PENDING,
        },
        randomUUID()
      );

      const created = await repository.create(delivery);

      expect(created.getId()).toBeDefined();
      expect(created.getOrderId()).toBe(testOrderId);
      expect(created.getDelivererId()).toBe(testDelivererId);
      expect(created.getStatus()).toBe(DeliveryStatus.PENDING);
    });
  });

  describe('findById', () => {
    it('should find delivery by id', async () => {
      const deliveryId = randomUUID();
      const delivery = Delivery.create(
        {
          organizationId: testOrgId,
          orderId: testOrderId,
          delivererId: testDelivererId,
          status: DeliveryStatus.PENDING,
        },
        deliveryId
      );

      await repository.create(delivery);
      const found = await repository.findById(deliveryId);

      expect(found).toBeDefined();
      expect(found?.getId()).toBe(deliveryId);
    });

    it('should return null if delivery not found', async () => {
      const found = await repository.findById(randomUUID());
      expect(found).toBeNull();
    });
  });

  describe('findByOrder', () => {
    it('should find delivery by order id', async () => {
      const delivery = Delivery.create(
        {
          organizationId: testOrgId,
          orderId: testOrderId,
          delivererId: testDelivererId,
          status: DeliveryStatus.PENDING,
        },
        randomUUID()
      );

      await repository.create(delivery);
      const found = await repository.findByOrder(testOrderId);

      expect(found).toBeDefined();
      expect(found?.getOrderId()).toBe(testOrderId);
    });
  });

  describe('update', () => {
    it('should update delivery', async () => {
      const delivery = Delivery.create(
        {
          organizationId: testOrgId,
          orderId: testOrderId,
          delivererId: testDelivererId,
          status: DeliveryStatus.PENDING,
        },
        randomUUID()
      );

      const created = await repository.create(delivery);
      created.updateStatus(DeliveryStatus.IN_TRANSIT);

      await repository.update(created);

      const updated = await repository.findById(created.getId());
      expect(updated?.getStatus()).toBe(DeliveryStatus.IN_TRANSIT);
    });
  });
});
