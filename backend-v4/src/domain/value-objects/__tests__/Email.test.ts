import { describe, expect, it } from 'vitest';
import { Email } from '../Email';

describe('Email', () => {
  describe('create', () => {
    it('should create valid email', () => {
      const email = Email.create('test@example.com');

      expect(email.value).toBe('test@example.com');
    });

    it('should normalize email to lowercase', () => {
      const email = Email.create('Test@Example.COM');

      expect(email.value).toBe('test@example.com');
    });

    it('should trim whitespace', () => {
      const email = Email.create('  test@example.com  ');

      expect(email.value).toBe('test@example.com');
    });

    it('should throw error for invalid email format', () => {
      expect(() => Email.create('invalid')).toThrow('Adresse email invalide');
    });

    it('should throw error for email without @', () => {
      expect(() => Email.create('test.example.com')).toThrow('Adresse email invalide');
    });

    it('should throw error for email without domain', () => {
      expect(() => Email.create('test@')).toThrow('Adresse email invalide');
    });

    it('should throw error for empty email', () => {
      expect(() => Email.create('')).toThrow('Adresse email invalide');
    });
  });

  describe('getDomain', () => {
    it('should return email domain', () => {
      const email = Email.create('test@example.com');

      expect(email.getDomain()).toBe('example.com');
    });
  });

  describe('getLocalPart', () => {
    it('should return email local part', () => {
      const email = Email.create('test@example.com');

      expect(email.getLocalPart()).toBe('test');
    });
  });

  describe('toJSON', () => {
    it('should serialize to JSON', () => {
      const email = Email.create('test@example.com');

      expect(email.toJSON()).toBe('test@example.com');
    });
  });

  describe('toString', () => {
    it('should convert to string', () => {
      const email = Email.create('test@example.com');

      expect(email.toString()).toBe('test@example.com');
    });
  });
});
