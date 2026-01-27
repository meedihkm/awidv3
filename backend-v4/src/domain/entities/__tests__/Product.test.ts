import { randomUUID } from 'crypto';
import { describe, expect, it } from 'vitest';
import { Money } from '../../value-objects/Money';
import { Product } from '../Product';

describe('Product', () => {
  const testOrgId = randomUUID();

  const createValidProduct = () =>
    Product.create(
      {
        organizationId: testOrgId,
        name: 'Pizza Margherita',
        category: 'Main Course',
        basePrice: Money.create(800),
        isAvailable: true,
      },
      randomUUID()
    );

  describe('create', () => {
    it('should create a valid product', () => {
      const product = createValidProduct();

      expect(product.getId()).toBeDefined();
      expect(product.getName()).toBe('Pizza Margherita');
      expect(product.getCategory()).toBe('Main Course');
      expect(product.getBasePrice().amount).toBe(800);
      expect(product.isAvailable()).toBe(true);
    });

    it('should create product with optional fields', () => {
      const product = Product.create(
        {
          organizationId: testOrgId,
          name: 'Pizza Margherita',
          category: 'Main Course',
          basePrice: Money.create(800),
          description: 'Classic Italian pizza',
          imageUrl: 'https://example.com/pizza.jpg',
          tags: ['italian', 'vegetarian'],
          isAvailable: true,
        },
        randomUUID()
      );

      expect(product.getDescription()).toBe('Classic Italian pizza');
      expect(product.getImageUrl()).toBe('https://example.com/pizza.jpg');
      expect(product.getTags()).toEqual(['italian', 'vegetarian']);
    });
  });

  describe('updateInfo', () => {
    it('should update product information', () => {
      const product = createValidProduct();

      product.updateInfo('Pizza Napoletana', 'Authentic Neapolitan pizza', 'Pizza');

      expect(product.getName()).toBe('Pizza Napoletana');
      expect(product.getDescription()).toBe('Authentic Neapolitan pizza');
      expect(product.getCategory()).toBe('Pizza');
    });
  });

  describe('updatePrice', () => {
    it('should update product price', () => {
      const product = createValidProduct();

      product.updatePrice(Money.create(900));

      expect(product.getBasePrice().amount).toBe(900);
    });
  });

  describe('setAvailability', () => {
    it('should set product availability', () => {
      const product = createValidProduct();

      expect(product.isAvailable()).toBe(true);

      product.setAvailability(false);
      expect(product.isAvailable()).toBe(false);

      product.setAvailability(true);
      expect(product.isAvailable()).toBe(true);
    });
  });

  describe('updateImage', () => {
    it('should update product image', () => {
      const product = createValidProduct();

      product.updateImage('https://example.com/new-pizza.jpg');

      expect(product.getImageUrl()).toBe('https://example.com/new-pizza.jpg');
    });
  });

  describe('updateTags', () => {
    it('should update product tags', () => {
      const product = createValidProduct();

      product.updateTags(['italian', 'cheese', 'tomato']);

      expect(product.getTags()).toEqual(['italian', 'cheese', 'tomato']);
    });
  });

  describe('addCustomPrice', () => {
    it('should add custom price for customer', () => {
      const product = createValidProduct();
      const customerId = randomUUID();

      product.addCustomPrice(customerId, Money.create(750));

      expect(product.getCustomPrices()).toHaveProperty(customerId);
      expect(product.getCustomPrices()[customerId].amount).toBe(750);
    });
  });

  describe('removeCustomPrice', () => {
    it('should remove custom price for customer', () => {
      const product = createValidProduct();
      const customerId = randomUUID();

      product.addCustomPrice(customerId, Money.create(750));
      expect(product.getCustomPrices()).toHaveProperty(customerId);

      product.removeCustomPrice(customerId);
      expect(product.getCustomPrices()).not.toHaveProperty(customerId);
    });
  });

  describe('getPriceForCustomer', () => {
    it('should return custom price if exists', () => {
      const product = createValidProduct();
      const customerId = randomUUID();

      product.addCustomPrice(customerId, Money.create(750));

      const price = product.getPriceForCustomer(customerId);
      expect(price.amount).toBe(750);
    });

    it('should return base price if no custom price', () => {
      const product = createValidProduct();
      const customerId = randomUUID();

      const price = product.getPriceForCustomer(customerId);
      expect(price.amount).toBe(800);
    });
  });

  describe('toJSON', () => {
    it('should serialize to JSON', () => {
      const product = createValidProduct();
      const json = product.toJSON();

      expect(json.name).toBe('Pizza Margherita');
      expect(json.category).toBe('Main Course');
      expect(json.basePrice).toEqual({ amount: 800, currency: 'DZD' });
      expect(json.isAvailable).toBe(true);
    });
  });
});
