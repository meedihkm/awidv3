/**
 * Money Value Object Tests
 */
import { describe, expect, it } from 'vitest';
import { Money } from '../Money';

describe('Money Value Object', () => {
  describe('create', () => {
    it('should create a valid money instance', () => {
      const money = Money.create(100.50);
      expect(money.amount).toBe(100.50);
      expect(money.currency).toBe('DZD');
    });

    it('should round to 2 decimals', () => {
      const money = Money.create(100.556);
      expect(money.amount).toBe(100.56);
    });

    it('should throw error for negative amount', () => {
      expect(() => Money.create(-10)).toThrow('Le montant ne peut pas être négatif');
    });

    it('should throw error for infinite amount', () => {
      expect(() => Money.create(Infinity)).toThrow('Le montant doit être un nombre fini');
    });
  });

  describe('zero', () => {
    it('should create zero money', () => {
      const money = Money.zero();
      expect(money.amount).toBe(0);
      expect(money.isZero()).toBe(true);
    });
  });

  describe('arithmetic operations', () => {
    it('should add two money amounts', () => {
      const money1 = Money.create(100);
      const money2 = Money.create(50);
      const result = money1.add(money2);
      expect(result.amount).toBe(150);
    });

    it('should subtract two money amounts', () => {
      const money1 = Money.create(100);
      const money2 = Money.create(30);
      const result = money1.subtract(money2);
      expect(result.amount).toBe(70);
    });

    it('should multiply money by factor', () => {
      const money = Money.create(50);
      const result = money.multiply(3);
      expect(result.amount).toBe(150);
    });

    it('should divide money by divisor', () => {
      const money = Money.create(100);
      const result = money.divide(4);
      expect(result.amount).toBe(25);
    });

    it('should throw error when dividing by zero', () => {
      const money = Money.create(100);
      expect(() => money.divide(0)).toThrow('Division par zéro impossible');
    });
  });

  describe('comparison operations', () => {
    it('should compare if greater than', () => {
      const money1 = Money.create(100);
      const money2 = Money.create(50);
      expect(money1.isGreaterThan(money2)).toBe(true);
      expect(money2.isGreaterThan(money1)).toBe(false);
    });

    it('should compare if less than', () => {
      const money1 = Money.create(50);
      const money2 = Money.create(100);
      expect(money1.isLessThan(money2)).toBe(true);
      expect(money2.isLessThan(money1)).toBe(false);
    });

    it('should compare if equal', () => {
      const money1 = Money.create(100);
      const money2 = Money.create(100);
      expect(money1.isEqual(money2)).toBe(true);
    });

    it('should check if positive', () => {
      const money = Money.create(100);
      expect(money.isPositive()).toBe(true);
      expect(Money.zero().isPositive()).toBe(false);
    });
  });

  describe('toString and toJSON', () => {
    it('should convert to string', () => {
      const money = Money.create(1234.56);
      expect(money.toString()).toBe('1234.56 DZD');
    });

    it('should convert to JSON', () => {
      const money = Money.create(100);
      expect(money.toJSON()).toEqual({
        amount: 100,
        currency: 'DZD',
      });
    });
  });
});
