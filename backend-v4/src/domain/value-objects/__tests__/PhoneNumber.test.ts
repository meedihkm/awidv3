import { describe, expect, it } from 'vitest';
import { PhoneNumber } from '../PhoneNumber';

describe('PhoneNumber', () => {
  describe('create', () => {
    it('should create valid Algerian phone number with +213', () => {
      const phone = PhoneNumber.create('+213555123456');

      expect(phone.value).toBe('+213555123456');
    });

    it('should create valid Algerian phone number starting with 0', () => {
      const phone = PhoneNumber.create('0555123456');

      expect(phone.value).toBe('+213555123456');
    });

    it('should throw error for invalid phone number', () => {
      expect(() => PhoneNumber.create('123')).toThrow();
    });

    it('should throw error for non-Algerian phone number', () => {
      expect(() => PhoneNumber.create('+33612345678')).toThrow();
    });

    it('should throw error for empty phone number', () => {
      expect(() => PhoneNumber.create('')).toThrow();
    });
  });

  describe('getOperator', () => {
    it('should identify Mobilis operator', () => {
      const phone = PhoneNumber.create('+213555123456');
      expect(phone.getOperator()).toBe('Mobilis');
    });

    it('should identify Djezzy operator', () => {
      const phone = PhoneNumber.create('+213770123456');
      expect(phone.getOperator()).toBe('Djezzy');
    });

    it('should identify Ooredoo operator', () => {
      const phone = PhoneNumber.create('+213540123456');
      expect(phone.getOperator()).toBe('Ooredoo');
    });

    it('should return Unknown for unrecognized prefix', () => {
      const phone = PhoneNumber.create('+213999123456');
      expect(phone.getOperator()).toBe('Unknown');
    });
  });

  describe('toJSON', () => {
    it('should serialize to JSON', () => {
      const phone = PhoneNumber.create('+213555123456');
      expect(phone.toJSON()).toBe('+213555123456');
    });
  });

  describe('toString', () => {
    it('should convert to string', () => {
      const phone = PhoneNumber.create('+213555123456');
      expect(phone.toString()).toBe('+213555123456');
    });
  });
});
