import { randomUUID } from 'crypto';
import { afterAll, beforeAll, beforeEach, describe, expect, it } from 'vitest';
import { Organization, OrganizationType } from '../../../../domain/entities/Organization';
import { Address } from '../../../../domain/value-objects/Address';
import { PhoneNumber } from '../../../../domain/value-objects/PhoneNumber';
import { db } from '../../PostgresConnection';
import { PostgresOrganizationRepository } from '../PostgresOrganizationRepository';

describe('PostgresOrganizationRepository', () => {
  let repository: PostgresOrganizationRepository;

  beforeAll(async () => {
    await db.connect();
    repository = new PostgresOrganizationRepository();
  });

  afterAll(async () => {
    await db.disconnect();
  });

  beforeEach(async () => {
    await db.query('DELETE FROM organizations WHERE name LIKE $1', ['Test Org%']);
  });

  describe('create', () => {
    it('should create a new organization', async () => {
      const address = Address.create({
        street: '123 Test Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
      });

      const org = Organization.create(
        {
          name: 'Test Org 1',
          type: OrganizationType.RESTAURANT,
          phone: PhoneNumber.create('+213555123456'),
          address,
        },
        randomUUID()
      );

      const created = await repository.create(org);

      expect(created.getId()).toBeDefined();
      expect(created.getName()).toBe('Test Org 1');
      expect(created.getType()).toBe(OrganizationType.RESTAURANT);
    });
  });

  describe('findById', () => {
    it('should find organization by id', async () => {
      const orgId = randomUUID();
      const address = Address.create({
        street: '123 Test Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
      });

      const org = Organization.create(
        {
          name: 'Test Org 2',
          type: OrganizationType.RESTAURANT,
          phone: PhoneNumber.create('+213555123456'),
          address,
        },
        orgId
      );

      await repository.create(org);
      const found = await repository.findById(orgId);

      expect(found).toBeDefined();
      expect(found?.getId()).toBe(orgId);
      expect(found?.getName()).toBe('Test Org 2');
    });

    it('should return null if organization not found', async () => {
      const found = await repository.findById(randomUUID());
      expect(found).toBeNull();
    });
  });

  describe('update', () => {
    it('should update organization', async () => {
      const address = Address.create({
        street: '123 Test Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
      });

      const org = Organization.create(
        {
          name: 'Test Org 3',
          type: OrganizationType.RESTAURANT,
          phone: PhoneNumber.create('+213555123456'),
          address,
        },
        randomUUID()
      );

      const created = await repository.create(org);
      created.updateInfo('Updated Org Name', 'Updated description');

      await repository.update(created);

      const updated = await repository.findById(created.getId());
      expect(updated?.getName()).toBe('Updated Org Name');
      expect(updated?.getDescription()).toBe('Updated description');
    });
  });

  describe('delete', () => {
    it('should soft delete organization', async () => {
      const orgId = randomUUID();
      const address = Address.create({
        street: '123 Test Street',
        city: 'Algiers',
        wilaya: 'Algiers',
        postalCode: '16000',
      });

      const org = Organization.create(
        {
          name: 'Test Org 4',
          type: OrganizationType.RESTAURANT,
          phone: PhoneNumber.create('+213555123456'),
          address,
        },
        orgId
      );

      await repository.create(org);
      await repository.delete(orgId);

      const found = await repository.findById(orgId);
      expect(found).toBeNull();
    });
  });
});
