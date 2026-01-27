import { randomUUID } from 'crypto';
import { describe, expect, it } from 'vitest';
import { User, UserRole } from '../../entities/User';
import { Email } from '../../value-objects/Email';
import { Money } from '../../value-objects/Money';
import { PhoneNumber } from '../../value-objects/PhoneNumber';
import { CreditService } from '../CreditService';

describe('CreditService', () => {
  const testOrgId = randomUUID();

  const createCustomer = (creditLimit: number, currentDebt: number) =>
    User.create(
      {
        organizationId: testOrgId,
        firstName: 'John',
        lastName: 'Doe',
        email: Email.create('john@example.com'),
        phone: PhoneNumber.create('+213555123456'),
        passwordHash: 'hashed',
        role: UserRole.CUSTOMER,
        creditLimit: Money.create(creditLimit),
        creditDays: 30,
        currentDebt: Money.create(currentDebt),
      },
      randomUUID()
    );

  describe('canOrderOnCredit', () => {
    it('should allow order if within credit limit', () => {
      const customer = createCustomer(10000, 5000);
      const orderAmount = Money.create(3000);

      const result = CreditService.canOrderOnCredit(customer, orderAmount);

      expect(result.allowed).toBe(true);
      expect(result.reason).toBeUndefined();
    });

    it('should deny order if exceeds credit limit', () => {
      const customer = createCustomer(10000, 8000);
      const orderAmount = Money.create(3000);

      const result = CreditService.canOrderOnCredit(customer, orderAmount);

      expect(result.allowed).toBe(false);
      expect(result.reason).toContain('limite de crédit');
    });

    it('should deny order if no credit limit set', () => {
      const customer = User.create(
        {
          organizationId: testOrgId,
          firstName: 'Jane',
          lastName: 'Smith',
          email: Email.create('jane@example.com'),
          phone: PhoneNumber.create('+213555123456'),
          passwordHash: 'hashed',
          role: UserRole.CUSTOMER,
        },
        randomUUID()
      );
      const orderAmount = Money.create(1000);

      const result = CreditService.canOrderOnCredit(customer, orderAmount);

      expect(result.allowed).toBe(false);
      expect(result.reason).toContain('crédit non configuré');
    });

    it('should allow order with zero debt', () => {
      const customer = createCustomer(10000, 0);
      const orderAmount = Money.create(5000);

      const result = CreditService.canOrderOnCredit(customer, orderAmount);

      expect(result.allowed).toBe(true);
    });

    it('should deny order if exactly at limit', () => {
      const customer = createCustomer(10000, 10000);
      const orderAmount = Money.create(1);

      const result = CreditService.canOrderOnCredit(customer, orderAmount);

      expect(result.allowed).toBe(false);
    });
  });

  describe('getAvailableCredit', () => {
    it('should calculate available credit', () => {
      const customer = createCustomer(10000, 3000);

      const available = CreditService.getAvailableCredit(customer);

      expect(available.amount).toBe(7000);
    });

    it('should return zero if no credit limit', () => {
      const customer = User.create(
        {
          organizationId: testOrgId,
          firstName: 'Jane',
          lastName: 'Smith',
          email: Email.create('jane@example.com'),
          phone: PhoneNumber.create('+213555123456'),
          passwordHash: 'hashed',
          role: UserRole.CUSTOMER,
        },
        randomUUID()
      );

      const available = CreditService.getAvailableCredit(customer);

      expect(available.amount).toBe(0);
    });

    it('should return zero if debt equals limit', () => {
      const customer = createCustomer(10000, 10000);

      const available = CreditService.getAvailableCredit(customer);

      expect(available.amount).toBe(0);
    });

    it('should return full limit if no debt', () => {
      const customer = createCustomer(10000, 0);

      const available = CreditService.getAvailableCredit(customer);

      expect(available.amount).toBe(10000);
    });
  });

  describe('getCreditUtilization', () => {
    it('should calculate credit utilization percentage', () => {
      const customer = createCustomer(10000, 3000);

      const utilization = CreditService.getCreditUtilization(customer);

      expect(utilization).toBe(30);
    });

    it('should return 0 if no credit limit', () => {
      const customer = User.create(
        {
          organizationId: testOrgId,
          firstName: 'Jane',
          lastName: 'Smith',
          email: Email.create('jane@example.com'),
          phone: PhoneNumber.create('+213555123456'),
          passwordHash: 'hashed',
          role: UserRole.CUSTOMER,
        },
        randomUUID()
      );

      const utilization = CreditService.getCreditUtilization(customer);

      expect(utilization).toBe(0);
    });

    it('should return 100 if debt equals limit', () => {
      const customer = createCustomer(10000, 10000);

      const utilization = CreditService.getCreditUtilization(customer);

      expect(utilization).toBe(100);
    });

    it('should return 0 if no debt', () => {
      const customer = createCustomer(10000, 0);

      const utilization = CreditService.getCreditUtilization(customer);

      expect(utilization).toBe(0);
    });
  });

  describe('isNearCreditLimit', () => {
    it('should return true if near limit (>80%)', () => {
      const customer = createCustomer(10000, 8500);

      const isNear = CreditService.isNearCreditLimit(customer);

      expect(isNear).toBe(true);
    });

    it('should return false if not near limit', () => {
      const customer = createCustomer(10000, 5000);

      const isNear = CreditService.isNearCreditLimit(customer);

      expect(isNear).toBe(false);
    });

    it('should use custom threshold', () => {
      const customer = createCustomer(10000, 7000);

      const isNear = CreditService.isNearCreditLimit(customer, 70);

      expect(isNear).toBe(true);
    });

    it('should return false if no credit limit', () => {
      const customer = User.create(
        {
          organizationId: testOrgId,
          firstName: 'Jane',
          lastName: 'Smith',
          email: Email.create('jane@example.com'),
          phone: PhoneNumber.create('+213555123456'),
          passwordHash: 'hashed',
          role: UserRole.CUSTOMER,
        },
        randomUUID()
      );

      const isNear = CreditService.isNearCreditLimit(customer);

      expect(isNear).toBe(false);
    });
  });

  describe('calculateNewDebt', () => {
    it('should add order amount to current debt', () => {
      const customer = createCustomer(10000, 3000);
      const orderAmount = Money.create(2000);

      const newDebt = CreditService.calculateNewDebt(customer, orderAmount);

      expect(newDebt.amount).toBe(5000);
    });

    it('should handle zero current debt', () => {
      const customer = createCustomer(10000, 0);
      const orderAmount = Money.create(2000);

      const newDebt = CreditService.calculateNewDebt(customer, orderAmount);

      expect(newDebt.amount).toBe(2000);
    });
  });

  describe('calculateDebtAfterPayment', () => {
    it('should subtract payment from debt', () => {
      const customer = createCustomer(10000, 5000);
      const paymentAmount = Money.create(2000);

      const newDebt = CreditService.calculateDebtAfterPayment(customer, paymentAmount);

      expect(newDebt.amount).toBe(3000);
    });

    it('should return zero if payment exceeds debt', () => {
      const customer = createCustomer(10000, 2000);
      const paymentAmount = Money.create(3000);

      const newDebt = CreditService.calculateDebtAfterPayment(customer, paymentAmount);

      expect(newDebt.amount).toBe(0);
    });

    it('should handle zero debt', () => {
      const customer = createCustomer(10000, 0);
      const paymentAmount = Money.create(1000);

      const newDebt = CreditService.calculateDebtAfterPayment(customer, paymentAmount);

      expect(newDebt.amount).toBe(0);
    });
  });
});
