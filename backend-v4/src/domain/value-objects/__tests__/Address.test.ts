import { describe, expect, it } from 'vitest';
import { Address } from '../Address';

describe('Address', () => {
  describe('create', () => {
    it('should create a valid address', () => {
      const address = Address.create({
        street: '123 Main Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
      });

      expect(address.street).toBe('123 Main Street');
      expect(address.city).toBe('Algiers');
      expect(address.wilaya).toBe('Algiers');
      expect(address.postalCode).toBe('16000');
    });

    it('should create address with coordinates', () => {
      const address = Address.create({
        street: '123 Main Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
        coordinates: {
          latitude: 36.7538,
          longitude: 3.0588,
        },
      });

      expect(address.hasCoordinates()).toBe(true);
      expect(address.coordinates?.latitude).toBe(36.7538);
      expect(address.coordinates?.longitude).toBe(3.0588);
    });

    it('should throw error for invalid street', () => {
      expect(() =>
        Address.create({
          street: '123',
          city: 'Algiers',
        })
      ).toThrow();
    });

    it('should throw error for invalid city', () => {
      expect(() =>
        Address.create({
          street: '123 Main Street',
          city: 'A',
        })
      ).toThrow();
    });

    it('should throw error for invalid postal code', () => {
      expect(() =>
        Address.create({
          street: '123 Main Street',
          city: 'Algiers',
          postalCode: '123',
        })
      ).toThrow();
    });
  });

  describe('getFullAddress', () => {
    it('should return full address string', () => {
      const address = Address.create({
        street: '123 Main Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
      });

      const fullAddress = address.getFullAddress();
      expect(fullAddress).toContain('123 Main Street');
      expect(fullAddress).toContain('Algiers');
      expect(fullAddress).toContain('16000');
    });
  });

  describe('toJSON', () => {
    it('should serialize to JSON', () => {
      const address = Address.create({
        street: '123 Main Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
      });

      const json = address.toJSON();
      expect(json.street).toBe('123 Main Street');
      expect(json.city).toBe('Algiers');
      expect(json.wilaya).toBe('Algiers');
      expect(json.postalCode).toBe('16000');
    });
  });
});
