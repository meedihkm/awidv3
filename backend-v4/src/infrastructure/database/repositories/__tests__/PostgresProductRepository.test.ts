import { randomUUID } from 'crypto';
import { afterAll, beforeAll, beforeEach, describe, expect, it } from 'vitest';
import { Product } from '../../../../domain/entities/Product';
import { Money } from '../../../../domain/value-objects/Money';
import { db } from '../../PostgresConnection';
import { PostgresProductRepository } from '../PostgresProductRepository';

describe('PostgresProductRepository', () => {
  let repository: PostgresProductRepository;
  const testOrgId = '00000000-0000-0000-0000-000000000001';

  beforeAll(async () => {
    await db.connect();
    repository = new PostgresProductRepository();
  });

  afterAll(async () => {
    await db.disconnect();
  });

  beforeEach(async () => {
    await db.query('DELETE FROM products WHERE name LIKE $1', ['Test Product%']);
  });

  describe('create', () => {
    it('should create a new product', async () => {
      const product = Product.create(
        {
          organizationId: testOrgId,
          name: 'Test Product 1',
          category: 'Main Course',
          basePrice: Money.create(500),
          isAvailable: true,
        },
        randomUUID()
      );

      const created = await repository.create(product);

      expect(created.getId()).toBeDefined();
      expect(created.getName()).toBe('Test Product 1');
      expect(created.getCategory()).toBe('Main Course');
      expect(created.getBasePrice().amount).toBe(500);
    });
  });

  describe('findById', () => {
    it('should find product by id', async () => {
      const productId = randomUUID();
      const product = Product.create(
        {
          organizationId: testOrgId,
          name: 'Test Product 2',
          category: 'Dessert',
          basePrice: Money.create(200),
          isAvailable: true,
        },
        productId
      );

      await repository.create(product);
      const found = await repository.findById(productId);

      expect(found).toBeDefined();
      expect(found?.getId()).toBe(productId);
      expect(found?.getName()).toBe('Test Product 2');
    });

    it('should return null if product not found', async () => {
      const found = await repository.findById(randomUUID());
      expect(found).toBeNull();
    });
  });

  describe('findByOrganization', () => {
    it('should find all products for an organization', async () => {
      const product1 = Product.create(
        {
          organizationId: testOrgId,
          name: 'Test Product 3',
          category: 'Beverage',
          basePrice: Money.create(100),
          isAvailable: true,
        },
        randomUUID()
      );

      const product2 = Product.create(
        {
          organizationId: testOrgId,
          name: 'Test Product 4',
          category: 'Beverage',
          basePrice: Money.create(150),
          isAvailable: true,
        },
        randomUUID()
      );

      await repository.create(product1);
      await repository.create(product2);

      const products = await repository.findByOrganization(testOrgId);

      expect(products.length).toBeGreaterThanOrEqual(2);
      expect(products.some((p) => p.getName() === 'Test Product 3')).toBe(true);
      expect(products.some((p) => p.getName() === 'Test Product 4')).toBe(true);
    });
  });

  describe('update', () => {
    it('should update product', async () => {
      const product = Product.create(
        {
          organizationId: testOrgId,
          name: 'Test Product 5',
          category: 'Appetizer',
          basePrice: Money.create(300),
          isAvailable: true,
        },
        randomUUID()
      );

      const created = await repository.create(product);
      created.updateInfo('Updated Product', 'Updated description', 'Updated Category');
      created.updatePrice(Money.create(350));

      await repository.update(created);

      const updated = await repository.findById(created.getId());
      expect(updated?.getName()).toBe('Updated Product');
      expect(updated?.getDescription()).toBe('Updated description');
      expect(updated?.getBasePrice().amount).toBe(350);
    });
  });

  describe('delete', () => {
    it('should soft delete product', async () => {
      const productId = randomUUID();
      const product = Product.create(
        {
          organizationId: testOrgId,
          name: 'Test Product 6',
          category: 'Side Dish',
          basePrice: Money.create(250),
          isAvailable: true,
        },
        productId
      );

      await repository.create(product);
      await repository.delete(productId);

      const found = await repository.findById(productId);
      expect(found).toBeNull();
    });
  });
});
