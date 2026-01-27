import { randomUUID } from 'crypto';
import { afterAll, beforeAll, beforeEach, describe, expect, it } from 'vitest';
import { Order } from '../../../../domain/entities/Order';
import { Address } from '../../../../domain/value-objects/Address';
import { Money } from '../../../../domain/value-objects/Money';
import { OrderStatus } from '../../../../domain/value-objects/OrderStatus';
import { db } from '../../PostgresConnection';
import { PostgresOrderRepository } from '../PostgresOrderRepository';

describe('PostgresOrderRepository', () => {
  let repository: PostgresOrderRepository;
  const testOrgId = '00000000-0000-0000-0000-000000000001';
  const testCustomerId = '00000000-0000-0000-0000-000000000002';

  beforeAll(async () => {
    await db.connect();
    repository = new PostgresOrderRepository();
  });

  afterAll(async () => {
    await db.disconnect();
  });

  beforeEach(async () => {
    await db.query('DELETE FROM orders WHERE organization_id = $1', [testOrgId]);
  });

  describe('create', () => {
    it('should create a new order', async () => {
      const deliveryAddress = Address.create({
        street: '123 Delivery Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
      });

      const order = Order.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          deliveryAddress,
          items: [
            {
              id: randomUUID(),
              productId: randomUUID(),
              productName: 'Test Product',
              quantity: 2,
              unitPrice: Money.create(500),
              subtotal: Money.create(1000),
            },
          ],
          subtotal: Money.create(1000),
          deliveryFee: Money.create(100),
          total: Money.create(1100),
          status: OrderStatus.PENDING,
        },
        randomUUID()
      );

      const created = await repository.create(order);

      expect(created.getId()).toBeDefined();
      expect(created.getCustomerId()).toBe(testCustomerId);
      expect(created.getStatus().getValue()).toBe('pending');
      expect(created.getTotal().amount).toBe(1100);
    });
  });

  describe('findById', () => {
    it('should find order by id', async () => {
      const orderId = randomUUID();
      const deliveryAddress = Address.create({
        street: '123 Delivery Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
      });

      const order = Order.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          deliveryAddress,
          items: [
            {
              id: randomUUID(),
              productId: randomUUID(),
              productName: 'Test Product',
              quantity: 1,
              unitPrice: Money.create(300),
              subtotal: Money.create(300),
            },
          ],
          subtotal: Money.create(300),
          deliveryFee: Money.create(50),
          total: Money.create(350),
          status: OrderStatus.PENDING,
        },
        orderId
      );

      await repository.create(order);
      const found = await repository.findById(orderId);

      expect(found).toBeDefined();
      expect(found?.getId()).toBe(orderId);
    });

    it('should return null if order not found', async () => {
      const found = await repository.findById(randomUUID());
      expect(found).toBeNull();
    });
  });

  describe('findByOrganization', () => {
    it('should find all orders for an organization', async () => {
      const deliveryAddress = Address.create({
        street: '123 Delivery Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
      });

      const order1 = Order.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          deliveryAddress,
          items: [],
          subtotal: Money.create(500),
          deliveryFee: Money.create(50),
          total: Money.create(550),
          status: OrderStatus.PENDING,
        },
        randomUUID()
      );

      const order2 = Order.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          deliveryAddress,
          items: [],
          subtotal: Money.create(600),
          deliveryFee: Money.create(50),
          total: Money.create(650),
          status: OrderStatus.PENDING,
        },
        randomUUID()
      );

      await repository.create(order1);
      await repository.create(order2);

      const orders = await repository.findByOrganization(testOrgId);

      expect(orders.length).toBeGreaterThanOrEqual(2);
    });
  });

  describe('update', () => {
    it('should update order', async () => {
      const deliveryAddress = Address.create({
        street: '123 Delivery Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
      });

      const order = Order.create(
        {
          organizationId: testOrgId,
          customerId: testCustomerId,
          deliveryAddress,
          items: [],
          subtotal: Money.create(400),
          deliveryFee: Money.create(50),
          total: Money.create(450),
          status: OrderStatus.PENDING,
        },
        randomUUID()
      );

      const created = await repository.create(order);
      created.updateStatus(OrderStatus.CONFIRMED);

      await repository.update(created);

      const updated = await repository.findById(created.getId());
      expect(updated?.getStatus().getValue()).toBe('confirmed');
    });
  });
});
