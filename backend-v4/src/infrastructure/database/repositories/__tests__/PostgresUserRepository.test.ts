import { randomUUID } from 'crypto';
import { afterAll, beforeAll, beforeEach, describe, expect, it } from 'vitest';
import { User, UserRole } from '../../../../domain/entities/User';
import { Email } from '../../../../domain/value-objects/Email';
import { PhoneNumber } from '../../../../domain/value-objects/PhoneNumber';
import { db } from '../../PostgresConnection';
import { PostgresUserRepository } from '../PostgresUserRepository';

describe('PostgresUserRepository', () => {
  let repository: PostgresUserRepository;
  const testOrgId = '00000000-0000-0000-0000-000000000001';

  beforeAll(async () => {
    await db.connect();
    repository = new PostgresUserRepository();
  });

  afterAll(async () => {
    await db.disconnect();
  });

  beforeEach(async () => {
    await db.query('DELETE FROM users WHERE email LIKE $1', ['test%@test.com']);
  });

  describe('create', () => {
    it('should create a new user', async () => {
      const user = User.create(
        {
          organizationId: testOrgId,
          firstName: 'Test',
          lastName: 'User',
          email: Email.create('test@test.com'),
          phone: PhoneNumber.create('+213555123456'),
          passwordHash: 'hashed_password',
          role: UserRole.CUSTOMER,
        },
        randomUUID()
      );

      const created = await repository.create(user);

      expect(created.getId()).toBeDefined();
      expect(created.getFirstName()).toBe('Test');
      expect(created.getLastName()).toBe('User');
      expect(created.getEmail().value).toBe('test@test.com');
      expect(created.getRole()).toBe(UserRole.CUSTOMER);
    });
  });

  describe('findByEmail', () => {
    it('should find user by email', async () => {
      const user = User.create(
        {
          organizationId: testOrgId,
          firstName: 'Test',
          lastName: 'User 2',
          email: Email.create('test2@test.com'),
          phone: PhoneNumber.create('+213555123456'),
          passwordHash: 'hashed_password',
          role: UserRole.CUSTOMER,
        },
        randomUUID()
      );

      await repository.create(user);

      const found = await repository.findByEmail('test2@test.com');

      expect(found).toBeDefined();
      expect(found?.getEmail().value).toBe('test2@test.com');
    });

    it('should return null if user not found', async () => {
      const found = await repository.findByEmail('nonexistent@test.com');
      expect(found).toBeNull();
    });
  });

  describe('findById', () => {
    it('should find user by id', async () => {
      const userId = randomUUID();
      const user = User.create(
        {
          organizationId: testOrgId,
          firstName: 'Test',
          lastName: 'User 3',
          email: Email.create('test3@test.com'),
          phone: PhoneNumber.create('+213555123456'),
          passwordHash: 'hashed_password',
          role: UserRole.CUSTOMER,
        },
        userId
      );

      await repository.create(user);
      const found = await repository.findById(userId);

      expect(found).toBeDefined();
      expect(found?.getId()).toBe(userId);
    });
  });

  describe('update', () => {
    it('should update user', async () => {
      const user = User.create(
        {
          organizationId: testOrgId,
          firstName: 'Test',
          lastName: 'User 4',
          email: Email.create('test4@test.com'),
          phone: PhoneNumber.create('+213555123456'),
          passwordHash: 'hashed_password',
          role: UserRole.CUSTOMER,
        },
        randomUUID()
      );

      const created = await repository.create(user);
      created.updateName('Updated', 'Name');

      await repository.update(created);

      const updated = await repository.findById(created.getId());
      expect(updated?.getFirstName()).toBe('Updated');
      expect(updated?.getLastName()).toBe('Name');
    });
  });

  describe('delete', () => {
    it('should soft delete user', async () => {
      const userId = randomUUID();
      const user = User.create(
        {
          organizationId: testOrgId,
          firstName: 'Test',
          lastName: 'User 5',
          email: Email.create('test5@test.com'),
          phone: PhoneNumber.create('+213555123456'),
          passwordHash: 'hashed_password',
          role: UserRole.CUSTOMER,
        },
        userId
      );

      await repository.create(user);
      await repository.delete(userId);

      const found = await repository.findById(userId);
      expect(found).toBeNull();
    });
  });
});
