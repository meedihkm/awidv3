import { describe, expect, it } from 'vitest';
import { Coordinates } from '../Coordinates';

describe('Coordinates', () => {
  describe('create', () => {
    it('should create valid coordinates', () => {
      const coords = Coordinates.create(36.7538, 3.0588);

      expect(coords.latitude).toBe(36.7538);
      expect(coords.longitude).toBe(3.0588);
    });

    it('should throw error for invalid latitude (too high)', () => {
      expect(() => Coordinates.create(91, 3.0588)).toThrow('Latitude invalide');
    });

    it('should throw error for invalid latitude (too low)', () => {
      expect(() => Coordinates.create(-91, 3.0588)).toThrow('Latitude invalide');
    });

    it('should throw error for invalid longitude (too high)', () => {
      expect(() => Coordinates.create(36.7538, 181)).toThrow('Longitude invalide');
    });

    it('should throw error for invalid longitude (too low)', () => {
      expect(() => Coordinates.create(36.7538, -181)).toThrow('Longitude invalide');
    });
  });

  describe('distanceTo', () => {
    it('should calculate distance between two coordinates', () => {
      const algiers = Coordinates.create(36.7538, 3.0588);
      const oran = Coordinates.create(35.6969, -0.6331);

      const distance = algiers.distanceTo(oran);

      expect(distance).toBeGreaterThan(0);
      expect(distance).toBeLessThan(500); // Less than 500km
    });

    it('should return 0 for same coordinates', () => {
      const coords1 = Coordinates.create(36.7538, 3.0588);
      const coords2 = Coordinates.create(36.7538, 3.0588);

      const distance = coords1.distanceTo(coords2);

      expect(distance).toBe(0);
    });
  });

  describe('toJSON', () => {
    it('should serialize to JSON', () => {
      const coords = Coordinates.create(36.7538, 3.0588);
      const json = coords.toJSON();

      expect(json.latitude).toBe(36.7538);
      expect(json.longitude).toBe(3.0588);
    });
  });
});
