import { randomUUID } from 'crypto';
import { describe, expect, it } from 'vitest';
import { Address } from '../../value-objects/Address';
import { Email } from '../../value-objects/Email';
import { Money } from '../../value-objects/Money';
import { PhoneNumber } from '../../value-objects/PhoneNumber';
import { User, UserRole } from '../User';

describe('User', () => {
  const testOrgId = randomUUID();

  const createValidUser = (role: UserRole = UserRole.CUSTOMER) =>
    User.create(
      {
        organizationId: testOrgId,
        firstName: 'John',
        lastName: 'Doe',
        email: Email.create('john.doe@example.com'),
        phone: PhoneNumber.create('+213555123456'),
        passwordHash: 'hashed_password',
        role,
      },
      randomUUID()
    );

  describe('create', () => {
    it('should create a valid user', () => {
      const user = createValidUser();

      expect(user.getId()).toBeDefined();
      expect(user.getFirstName()).toBe('John');
      expect(user.getLastName()).toBe('Doe');
      expect(user.getFullName()).toBe('John Doe');
      expect(user.getRole()).toBe(UserRole.CUSTOMER);
      expect(user.isActive()).toBe(true);
      expect(user.isEmailVerified()).toBe(false);
      expect(user.isPhoneVerified()).toBe(false);
    });

    it('should create user with optional fields', () => {
      const address = Address.create({
        street: '123 Main Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
      });

      const user = User.create(
        {
          organizationId: testOrgId,
          firstName: 'Jane',
          lastName: 'Smith',
          email: Email.create('jane@example.com'),
          phone: PhoneNumber.create('+213555123456'),
          passwordHash: 'hashed_password',
          role: UserRole.CUSTOMER,
          address,
          creditLimit: Money.create(5000),
          creditDays: 30,
        },
        randomUUID()
      );

      expect(user.getAddress()).toBeDefined();
      expect(user.getCreditLimit()?.amount).toBe(5000);
      expect(user.getCreditDays()).toBe(30);
    });
  });

  describe('role checks', () => {
    it('should identify admin role', () => {
      const user = createValidUser(UserRole.ADMIN);
      expect(user.isAdmin()).toBe(true);
      expect(user.isCustomer()).toBe(false);
      expect(user.isDeliverer()).toBe(false);
      expect(user.isKitchen()).toBe(false);
    });

    it('should identify customer role', () => {
      const user = createValidUser(UserRole.CUSTOMER);
      expect(user.isCustomer()).toBe(true);
      expect(user.isAdmin()).toBe(false);
    });

    it('should identify deliverer role', () => {
      const user = createValidUser(UserRole.DELIVERER);
      expect(user.isDeliverer()).toBe(true);
      expect(user.isCustomer()).toBe(false);
    });

    it('should identify kitchen role', () => {
      const user = createValidUser(UserRole.KITCHEN);
      expect(user.isKitchen()).toBe(true);
      expect(user.isCustomer()).toBe(false);
    });
  });

  describe('updatePassword', () => {
    it('should update password hash', () => {
      const user = createValidUser();
      const oldHash = user.getPasswordHash();

      user.updatePassword('new_hashed_password');

      expect(user.getPasswordHash()).toBe('new_hashed_password');
      expect(user.getPasswordHash()).not.toBe(oldHash);
    });
  });

  describe('updateName', () => {
    it('should update user name', () => {
      const user = createValidUser();

      user.updateName('Jane', 'Smith');

      expect(user.getFirstName()).toBe('Jane');
      expect(user.getLastName()).toBe('Smith');
      expect(user.getFullName()).toBe('Jane Smith');
    });
  });

  describe('updateProfile', () => {
    it('should update profile information', () => {
      const user = createValidUser();
      const newPhone = PhoneNumber.create('+213770123456');
      const newAddress = Address.create({
        street: '456 New Street',
        city: 'Oran',
        wilaya: 'Oran',
        postalCode: '31000',
      });

      user.updateProfile(newPhone, newAddress);

      expect(user.getPhone().value).toBe('+213770123456');
      expect(user.getAddress()?.city).toBe('Oran');
    });
  });

  describe('updateCreditLimit', () => {
    it('should update credit limit for customer', () => {
      const user = createValidUser(UserRole.CUSTOMER);

      user.updateCreditLimit(Money.create(10000), 45);

      expect(user.getCreditLimit()?.amount).toBe(10000);
      expect(user.getCreditDays()).toBe(45);
    });

    it('should throw error for non-customer', () => {
      const user = createValidUser(UserRole.ADMIN);

      expect(() => user.updateCreditLimit(Money.create(10000), 45)).toThrow(
        'Seuls les clients peuvent avoir une limite de crédit'
      );
    });
  });

  describe('updateDebt', () => {
    it('should update debt for customer', () => {
      const user = createValidUser(UserRole.CUSTOMER);

      user.updateDebt(Money.create(2000));

      expect(user.getCurrentDebt()?.amount).toBe(2000);
    });

    it('should throw error for non-customer', () => {
      const user = createValidUser(UserRole.ADMIN);

      expect(() => user.updateDebt(Money.create(2000))).toThrow(
        'Seuls les clients peuvent avoir une dette'
      );
    });
  });

  describe('updateVehicle', () => {
    it('should update vehicle for deliverer', () => {
      const user = createValidUser(UserRole.DELIVERER);

      user.updateVehicle('motorcycle', 'ABC-123');

      expect(user.getVehicleType()).toBe('motorcycle');
      expect(user.getVehiclePlate()).toBe('ABC-123');
    });

    it('should throw error for non-deliverer', () => {
      const user = createValidUser(UserRole.CUSTOMER);

      expect(() => user.updateVehicle('motorcycle', 'ABC-123')).toThrow(
        'Seuls les livreurs peuvent avoir un véhicule'
      );
    });
  });

  describe('setAvailability', () => {
    it('should set availability for deliverer', () => {
      const user = createValidUser(UserRole.DELIVERER);

      user.setAvailability(true);
      expect(user.isAvailable()).toBe(true);

      user.setAvailability(false);
      expect(user.isAvailable()).toBe(false);
    });

    it('should throw error for non-deliverer', () => {
      const user = createValidUser(UserRole.CUSTOMER);

      expect(() => user.setAvailability(true)).toThrow('Seuls les livreurs ont une disponibilité');
    });
  });

  describe('recordLogin', () => {
    it('should record login timestamp', () => {
      const user = createValidUser();

      expect(user.getLastLoginAt()).toBeUndefined();

      user.recordLogin();

      expect(user.getLastLoginAt()).toBeDefined();
      expect(user.getLastLoginAt()).toBeInstanceOf(Date);
    });
  });

  describe('activate/deactivate', () => {
    it('should activate and deactivate user', () => {
      const user = createValidUser();

      expect(user.isActive()).toBe(true);

      user.deactivate();
      expect(user.isActive()).toBe(false);

      user.activate();
      expect(user.isActive()).toBe(true);
    });
  });

  describe('verifyEmail/verifyPhone', () => {
    it('should verify email', () => {
      const user = createValidUser();

      expect(user.isEmailVerified()).toBe(false);

      user.verifyEmail();

      expect(user.isEmailVerified()).toBe(true);
    });

    it('should verify phone', () => {
      const user = createValidUser();

      expect(user.isPhoneVerified()).toBe(false);

      user.verifyPhone();

      expect(user.isPhoneVerified()).toBe(true);
    });
  });

  describe('toJSON', () => {
    it('should serialize to JSON', () => {
      const user = createValidUser();
      const json = user.toJSON();

      expect(json.firstName).toBe('John');
      expect(json.lastName).toBe('Doe');
      expect(json.role).toBe(UserRole.CUSTOMER);
      expect(json.isActive).toBe(true);
      expect(json.emailVerified).toBe(false);
    });
  });
});
