import { randomUUID } from 'crypto';
import { describe, expect, it } from 'vitest';
import { Address } from '../../value-objects/Address';
import { PhoneNumber } from '../../value-objects/PhoneNumber';
import { Organization, OrganizationType } from '../Organization';

describe('Organization', () => {
  const createValidAddress = () =>
    Address.create({
      street: '123 Main Street',
      city: 'Algiers',
      wilaya: 'Algiers',
      postalCode: '16000',
    });

  describe('create', () => {
    it('should create a valid organization', () => {
      const org = Organization.create(
        {
          name: 'Test Restaurant',
          type: OrganizationType.RESTAURANT,
          phone: PhoneNumber.create('+213555123456'),
          address: createValidAddress(),
        },
        randomUUID()
      );

      expect(org.getId()).toBeDefined();
      expect(org.getName()).toBe('Test Restaurant');
      expect(org.getType()).toBe(OrganizationType.RESTAURANT);
      expect(org.isActive()).toBe(true);
    });

    it('should create organization with optional fields', () => {
      const org = Organization.create(
        {
          name: 'Test Restaurant',
          type: OrganizationType.RESTAURANT,
          phone: PhoneNumber.create('+213555123456'),
          address: createValidAddress(),
          description: 'A test restaurant',
          email: 'test@restaurant.com',
        },
        randomUUID()
      );

      expect(org.getDescription()).toBe('A test restaurant');
      expect(org.getEmail()).toBe('test@restaurant.com');
    });
  });

  describe('updateInfo', () => {
    it('should update organization info', () => {
      const org = Organization.create(
        {
          name: 'Test Restaurant',
          type: OrganizationType.RESTAURANT,
          phone: PhoneNumber.create('+213555123456'),
          address: createValidAddress(),
        },
        randomUUID()
      );

      org.updateInfo('Updated Restaurant', 'New description');

      expect(org.getName()).toBe('Updated Restaurant');
      expect(org.getDescription()).toBe('New description');
    });
  });

  describe('updateContact', () => {
    it('should update contact information', () => {
      const org = Organization.create(
        {
          name: 'Test Restaurant',
          type: OrganizationType.RESTAURANT,
          phone: PhoneNumber.create('+213555123456'),
          address: createValidAddress(),
        },
        randomUUID()
      );

      const newPhone = PhoneNumber.create('+213770123456');
      const newAddress = Address.create({
        street: '456 New Street',
        city: 'Oran',
        wilaya: 'Oran',
        postalCode: '31000',
      });

      org.updateContact(newPhone, 'new@restaurant.com', newAddress);

      expect(org.getPhone().value).toBe('+213770123456');
      expect(org.getEmail()).toBe('new@restaurant.com');
      expect(org.getAddress()?.city).toBe('Oran');
    });
  });

  describe('activate/deactivate', () => {
    it('should activate organization', () => {
      const org = Organization.create(
        {
          name: 'Test Restaurant',
          type: OrganizationType.RESTAURANT,
          phone: PhoneNumber.create('+213555123456'),
          address: createValidAddress(),
        },
        randomUUID()
      );

      org.deactivate();
      expect(org.isActive()).toBe(false);

      org.activate();
      expect(org.isActive()).toBe(true);
    });
  });

  describe('isRestaurant/isCafeteria', () => {
    it('should identify restaurant type', () => {
      const org = Organization.create(
        {
          name: 'Test Restaurant',
          type: OrganizationType.RESTAURANT,
          phone: PhoneNumber.create('+213555123456'),
          address: createValidAddress(),
        },
        randomUUID()
      );

      expect(org.isRestaurant()).toBe(true);
      expect(org.isCafeteria()).toBe(false);
    });

    it('should identify cafeteria type', () => {
      const org = Organization.create(
        {
          name: 'Test Cafeteria',
          type: OrganizationType.CAFETERIA,
          phone: PhoneNumber.create('+213555123456'),
          address: createValidAddress(),
        },
        randomUUID()
      );

      expect(org.isRestaurant()).toBe(false);
      expect(org.isCafeteria()).toBe(true);
    });
  });

  describe('toJSON', () => {
    it('should serialize to JSON', () => {
      const org = Organization.create(
        {
          name: 'Test Restaurant',
          type: OrganizationType.RESTAURANT,
          phone: PhoneNumber.create('+213555123456'),
          address: createValidAddress(),
          description: 'Test description',
        },
        randomUUID()
      );

      const json = org.toJSON();

      expect(json.name).toBe('Test Restaurant');
      expect(json.type).toBe(OrganizationType.RESTAURANT);
      expect(json.description).toBe('Test description');
      expect(json.isActive).toBe(true);
    });
  });
});
