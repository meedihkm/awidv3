import { PoolClient } from 'pg';
import { Organization } from '../../../domain/entities/Organization';
import { IOrganizationRepository } from '../../../domain/repositories/IOrganizationRepository';
import { Address } from '../../../domain/value-objects/Address';
import { Email } from '../../../domain/value-objects/Email';
import { Money } from '../../../domain/value-objects/Money';
import { PhoneNumber } from '../../../domain/value-objects/PhoneNumber';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { db } from '../PostgresConnection';

export class PostgresOrganizationRepository implements IOrganizationRepository {
  async findById(id: string): Promise<Organization | null> {
    const rows = await db.query<any>(
      `
      SELECT * FROM organizations
      WHERE id = $1 AND deleted_at IS NULL
      LIMIT 1
      `,
      [id]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToOrganization(rows[0]);
  }

  async findByEmail(email: string): Promise<Organization | null> {
    const rows = await db.query<any>(
      `
      SELECT * FROM organizations
      WHERE email = $1 AND deleted_at IS NULL
      LIMIT 1
      `,
      [email]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToOrganization(rows[0]);
  }

  async findAll(): Promise<Organization[]> {
    const rows = await db.query<any>(
      `
      SELECT * FROM organizations
      WHERE deleted_at IS NULL
      ORDER BY created_at DESC
      `
    );

    return rows.map((row) => this.mapRowToOrganization(row));
  }

  async findActive(): Promise<Organization[]> {
    const rows = await db.query<any>(
      `
      SELECT * FROM organizations
      WHERE is_active = true AND deleted_at IS NULL
      ORDER BY created_at DESC
      `
    );

    return rows.map((row) => this.mapRowToOrganization(row));
  }

  async create(organization: Organization): Promise<Organization> {
    const address = organization.getAddress();

    const rows = await db.query<any>(
      `
      INSERT INTO organizations (
        id, name, type, description, email, phone,
        address_street, address_city, address_state, address_postal_code, address_country,
        latitude, longitude,
        default_credit_limit, default_credit_days, currency,
        settings, is_active
      )
      VALUES (
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18
      )
      RETURNING *
      `,
      [
        organization.getId(),
        organization.getName(),
        organization.getType(),
        organization.getDescription() || null,
        organization.getEmail().getValue(),
        organization.getPhone().getValue(),
        address.street,
        address.city,
        address.state,
        address.postalCode,
        address.country,
        address.coordinates?.latitude || null,
        address.coordinates?.longitude || null,
        organization.getDefaultCreditLimit().getAmount(),
        organization.getDefaultCreditDays(),
        organization.getCurrency(),
        JSON.stringify(organization.getSettings() || {}),
        organization.isActive(),
      ]
    );

    return this.mapRowToOrganization(rows[0]);
  }

  async update(organization: Organization): Promise<Organization> {
    const address = organization.getAddress();

    const rows = await db.query<any>(
      `
      UPDATE organizations SET
        name = $2,
        type = $3,
        description = $4,
        email = $5,
        phone = $6,
        address_street = $7,
        address_city = $8,
        address_state = $9,
        address_postal_code = $10,
        address_country = $11,
        latitude = $12,
        longitude = $13,
        default_credit_limit = $14,
        default_credit_days = $15,
        currency = $16,
        settings = $17,
        is_active = $18,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      RETURNING *
      `,
      [
        organization.getId(),
        organization.getName(),
        organization.getType(),
        organization.getDescription() || null,
        organization.getEmail().getValue(),
        organization.getPhone().getValue(),
        address.street,
        address.city,
        address.state,
        address.postalCode,
        address.country,
        address.coordinates?.latitude || null,
        address.coordinates?.longitude || null,
        organization.getDefaultCreditLimit().getAmount(),
        organization.getDefaultCreditDays(),
        organization.getCurrency(),
        JSON.stringify(organization.getSettings() || {}),
        organization.isActive(),
      ]
    );

    if (rows.length === 0) {
      throw new NotFoundError('Organization not found');
    }

    return this.mapRowToOrganization(rows[0]);
  }

  async delete(id: string): Promise<void> {
    const result = await db.query(
      `
      UPDATE organizations SET
        deleted_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [id]
    );

    if (result.length === 0) {
      throw new NotFoundError('Organization not found');
    }
  }

  async transaction<T>(callback: (client: PoolClient) => Promise<T>): Promise<T> {
    return db.transaction(callback);
  }

  private mapRowToOrganization(row: any): Organization {
    const address = Address.create({
      street: row.address_street,
      city: row.address_city,
      state: row.address_state,
      postalCode: row.address_postal_code,
      country: row.address_country,
      coordinates:
        row.latitude && row.longitude
          ? {
              latitude: parseFloat(row.latitude),
              longitude: parseFloat(row.longitude),
            }
          : undefined,
    });

    return Organization.create(
      {
        name: row.name,
        type: row.type,
        description: row.description || undefined,
        email: Email.create(row.email),
        phone: PhoneNumber.create(row.phone),
        address,
        defaultCreditLimit: Money.fromCents(row.default_credit_limit, row.currency),
        defaultCreditDays: row.default_credit_days,
        currency: row.currency,
        settings: row.settings || {},
        isActive: row.is_active,
        createdAt: new Date(row.created_at),
        updatedAt: new Date(row.updated_at),
      },
      row.id
    );
  }
}
