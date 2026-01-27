import { randomUUID } from 'crypto';
import { describe, expect, it } from 'vitest';
import { Product } from '../../entities/Product';
import { Money } from '../../value-objects/Money';
import { PricingService } from '../PricingService';

describe('PricingService', () => {
  const testOrgId = randomUUID();

  const createProduct = (basePrice: number) =>
    Product.create(
      {
        organizationId: testOrgId,
        name: 'Test Product',
        category: 'Food',
        basePrice: Money.create(basePrice),
        isAvailable: true,
      },
      randomUUID()
    );

  describe('calculateOrderSubtotal', () => {
    it('should calculate subtotal for single item', () => {
      const items = [
        {
          id: randomUUID(),
          productId: randomUUID(),
          productName: 'Pizza',
          quantity: 2,
          unitPrice: Money.create(800),
          subtotal: Money.create(1600),
        },
      ];

      const subtotal = PricingService.calculateOrderSubtotal(items);

      expect(subtotal.amount).toBe(1600);
    });

    it('should calculate subtotal for multiple items', () => {
      const items = [
        {
          id: randomUUID(),
          productId: randomUUID(),
          productName: 'Pizza',
          quantity: 2,
          unitPrice: Money.create(800),
          subtotal: Money.create(1600),
        },
        {
          id: randomUUID(),
          productId: randomUUID(),
          productName: 'Salad',
          quantity: 1,
          unitPrice: Money.create(300),
          subtotal: Money.create(300),
        },
      ];

      const subtotal = PricingService.calculateOrderSubtotal(items);

      expect(subtotal.amount).toBe(1900);
    });

    it('should return zero for empty items', () => {
      const subtotal = PricingService.calculateOrderSubtotal([]);

      expect(subtotal.amount).toBe(0);
    });
  });

  describe('calculateDeliveryFee', () => {
    it('should calculate delivery fee based on distance', () => {
      const fee = PricingService.calculateDeliveryFee(5);

      expect(fee.amount).toBeGreaterThan(0);
    });

    it('should have minimum delivery fee', () => {
      const fee = PricingService.calculateDeliveryFee(0.5);

      expect(fee.amount).toBeGreaterThanOrEqual(100);
    });

    it('should increase fee with distance', () => {
      const fee1 = PricingService.calculateDeliveryFee(2);
      const fee2 = PricingService.calculateDeliveryFee(10);

      expect(fee2.amount).toBeGreaterThan(fee1.amount);
    });

    it('should handle zero distance', () => {
      const fee = PricingService.calculateDeliveryFee(0);

      expect(fee.amount).toBeGreaterThanOrEqual(100);
    });
  });

  describe('calculateOrderTotal', () => {
    it('should calculate total with delivery fee', () => {
      const subtotal = Money.create(2000);
      const deliveryFee = Money.create(200);

      const total = PricingService.calculateOrderTotal(subtotal, deliveryFee);

      expect(total.amount).toBe(2200);
    });

    it('should handle zero delivery fee', () => {
      const subtotal = Money.create(2000);
      const deliveryFee = Money.create(0);

      const total = PricingService.calculateOrderTotal(subtotal, deliveryFee);

      expect(total.amount).toBe(2000);
    });

    it('should apply discount if provided', () => {
      const subtotal = Money.create(2000);
      const deliveryFee = Money.create(200);
      const discount = Money.create(300);

      const total = PricingService.calculateOrderTotal(subtotal, deliveryFee, discount);

      expect(total.amount).toBe(1900);
    });

    it('should not go below zero with large discount', () => {
      const subtotal = Money.create(1000);
      const deliveryFee = Money.create(100);
      const discount = Money.create(2000);

      const total = PricingService.calculateOrderTotal(subtotal, deliveryFee, discount);

      expect(total.amount).toBe(0);
    });
  });

  describe('getPriceForCustomer', () => {
    it('should return custom price if exists', () => {
      const product = createProduct(1000);
      const customerId = randomUUID();
      product.addCustomPrice(customerId, Money.create(800));

      const price = PricingService.getPriceForCustomer(product, customerId);

      expect(price.amount).toBe(800);
    });

    it('should return base price if no custom price', () => {
      const product = createProduct(1000);
      const customerId = randomUUID();

      const price = PricingService.getPriceForCustomer(product, customerId);

      expect(price.amount).toBe(1000);
    });
  });

  describe('calculateItemSubtotal', () => {
    it('should calculate item subtotal', () => {
      const unitPrice = Money.create(500);
      const quantity = 3;

      const subtotal = PricingService.calculateItemSubtotal(unitPrice, quantity);

      expect(subtotal.amount).toBe(1500);
    });

    it('should handle quantity of 1', () => {
      const unitPrice = Money.create(500);
      const quantity = 1;

      const subtotal = PricingService.calculateItemSubtotal(unitPrice, quantity);

      expect(subtotal.amount).toBe(500);
    });

    it('should handle quantity of 0', () => {
      const unitPrice = Money.create(500);
      const quantity = 0;

      const subtotal = PricingService.calculateItemSubtotal(unitPrice, quantity);

      expect(subtotal.amount).toBe(0);
    });
  });

  describe('applyDiscount', () => {
    it('should apply percentage discount', () => {
      const amount = Money.create(1000);
      const discountPercent = 10;

      const discounted = PricingService.applyDiscount(amount, discountPercent);

      expect(discounted.amount).toBe(900);
    });

    it('should handle 0% discount', () => {
      const amount = Money.create(1000);
      const discountPercent = 0;

      const discounted = PricingService.applyDiscount(amount, discountPercent);

      expect(discounted.amount).toBe(1000);
    });

    it('should handle 100% discount', () => {
      const amount = Money.create(1000);
      const discountPercent = 100;

      const discounted = PricingService.applyDiscount(amount, discountPercent);

      expect(discounted.amount).toBe(0);
    });

    it('should handle 50% discount', () => {
      const amount = Money.create(1000);
      const discountPercent = 50;

      const discounted = PricingService.applyDiscount(amount, discountPercent);

      expect(discounted.amount).toBe(500);
    });
  });

  describe('calculateBulkDiscount', () => {
    it('should apply discount for bulk orders', () => {
      const basePrice = Money.create(100);
      const quantity = 50;

      const discountedPrice = PricingService.calculateBulkDiscount(basePrice, quantity);

      expect(discountedPrice.amount).toBeLessThan(basePrice.amount);
    });

    it('should not apply discount for small quantities', () => {
      const basePrice = Money.create(100);
      const quantity = 5;

      const discountedPrice = PricingService.calculateBulkDiscount(basePrice, quantity);

      expect(discountedPrice.amount).toBe(basePrice.amount);
    });

    it('should increase discount with quantity', () => {
      const basePrice = Money.create(100);
      const discount1 = PricingService.calculateBulkDiscount(basePrice, 20);
      const discount2 = PricingService.calculateBulkDiscount(basePrice, 100);

      expect(discount2.amount).toBeLessThan(discount1.amount);
    });
  });
});
