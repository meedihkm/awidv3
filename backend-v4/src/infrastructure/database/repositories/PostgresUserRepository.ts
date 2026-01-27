import { PoolClient } from 'pg';
import { User, UserProps, UserRole } from '../../../domain/entities/User';
import { FindUsersOptions, IUserRepository } from '../../../domain/repositories/IUserRepository';
import { Address } from '../../../domain/value-objects/Address';
import { Email } from '../../../domain/value-objects/Email';
import { Money } from '../../../domain/value-objects/Money';
import { PhoneNumber } from '../../../domain/value-objects/PhoneNumber';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { db } from '../PostgresConnection';

/**
 * PostgreSQL implementation of IUserRepository
 */
export class PostgresUserRepository implements IUserRepository {
  findByRole(organizationId: string, role: UserRole): Promise<User[]> {
    throw new Error('Method not implemented.');
  }
  findMany(options: FindUsersOptions): Promise<User[]> {
    throw new Error('Method not implemented.');
  }
  count(options: FindUsersOptions): Promise<number> {
    throw new Error('Method not implemented.');
  }
  save(user: User): Promise<void> {
    throw new Error('Method not implemented.');
  }
  exists(id: string): Promise<boolean> {
    throw new Error('Method not implemented.');
  }
  existsByEmail(email: string): Promise<boolean> {
    throw new Error('Method not implemented.');
  }
  /**
   * Trouve un utilisateur par email
   */
  async findByEmail(email: string): Promise<User | null> {
    const rows = await db.query<any>(
      `
      SELECT * FROM users
      WHERE email = $1 AND deleted_at IS NULL
      LIMIT 1
      `,
      [email]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToUser(rows[0]);
  }

  /**
   * Trouve un utilisateur par ID
   */
  async findById(id: string): Promise<User | null> {
    const rows = await db.query<any>(
      `
      SELECT * FROM users
      WHERE id = $1 AND deleted_at IS NULL
      LIMIT 1
      `,
      [id]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToUser(rows[0]);
  }

  /**
   * Trouve tous les utilisateurs d'une organisation
   */
  async findByOrganization(organizationId: string, role?: string): Promise<User[]> {
    const query = role
      ? `SELECT * FROM users WHERE organization_id = $1 AND role = $2 AND deleted_at IS NULL ORDER BY created_at DESC`
      : `SELECT * FROM users WHERE organization_id = $1 AND deleted_at IS NULL ORDER BY created_at DESC`;

    const params = role ? [organizationId, role] : [organizationId];
    const rows = await db.query<any>(query, params);

    return rows.map((row) => this.mapRowToUser(row));
  }

  /**
   * Trouve les livreurs disponibles
   */
  async findAvailableDeliverers(organizationId: string): Promise<User[]> {
    const rows = await db.query<any>(
      `
      SELECT * FROM users
      WHERE organization_id = $1
        AND role = 'deliverer'
        AND is_available = true
        AND is_active = true
        AND deleted_at IS NULL
      ORDER BY created_at DESC
      `,
      [organizationId]
    );

    return rows.map((row) => this.mapRowToUser(row));
  }

  /**
   * Crée un nouvel utilisateur
   */
  async create(user: User): Promise<User> {
    const address = user.getAddress();

    const rows = await db.query<any>(
      `
      INSERT INTO users (
        id, organization_id, first_name, last_name, email, phone,
        password_hash, role,
        address_street, address_city, address_state, address_postal_code, address_country,
        latitude, longitude,
        credit_limit, credit_days, current_debt,
        vehicle_type, vehicle_plate, is_available,
        avatar_url, notes, settings,
        is_active, email_verified, phone_verified
      )
      VALUES (
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15,
        $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27
      )
      RETURNING *
      `,
      [
        user.getId(),
        user.getOrganizationId(),
        user.getFirstName(),
        user.getLastName(),
        user.getEmail().value,
        user.getPhone().value,
        user.getPasswordHash(),
        user.getRole(),
        address?.street || null,
        address?.city || null,
        address?.wilaya || null,
        address?.postalCode || null,
        'DZ',
        address?.coordinates?.latitude || null,
        address?.coordinates?.longitude || null,
        user.getCreditLimit()?.amount || 0,
        user.getCreditDays() || 0,
        user.getCurrentDebt()?.amount || 0,
        user.getVehicleType() || null,
        user.getVehiclePlate() || null,
        user.isAvailable() ?? null,
        user.getAvatarUrl() || null,
        user.getNotes() || null,
        JSON.stringify(user.getSettings() || {}),
        user.isActive(),
        user.isEmailVerified(),
        user.isPhoneVerified(),
      ]
    );

    return this.mapRowToUser(rows[0]);
  }

  /**
   * Met à jour un utilisateur
   */
  async update(user: User): Promise<void> {
    const address = user.getAddress();

    const rows = await db.query<any>(
      `
      UPDATE users SET
        first_name = $2,
        last_name = $3,
        email = $4,
        phone = $5,
        password_hash = $6,
        role = $7,
        address_street = $8,
        address_city = $9,
        address_state = $10,
        address_postal_code = $11,
        address_country = $12,
        latitude = $13,
        longitude = $14,
        credit_limit = $15,
        credit_days = $16,
        current_debt = $17,
        vehicle_type = $18,
        vehicle_plate = $19,
        is_available = $20,
        avatar_url = $21,
        notes = $22,
        settings = $23,
        is_active = $24,
        email_verified = $25,
        phone_verified = $26,
        last_login_at = $27,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      RETURNING *
      `,
      [
        user.getId(),
        user.getFirstName(),
        user.getLastName(),
        user.getEmail().value,
        user.getPhone().value,
        user.getPasswordHash(),
        user.getRole(),
        address?.street || null,
        address?.city || null,
        address?.wilaya || null,
        address?.postalCode || null,
        'DZ',
        address?.coordinates?.latitude || null,
        address?.coordinates?.longitude || null,
        user.getCreditLimit()?.amount || 0,
        user.getCreditDays() || 0,
        user.getCurrentDebt()?.amount || 0,
        user.getVehicleType() || null,
        user.getVehiclePlate() || null,
        user.isAvailable() ?? null,
        user.getAvatarUrl() || null,
        user.getNotes() || null,
        JSON.stringify(user.getSettings() || {}),
        user.isActive(),
        user.isEmailVerified(),
        user.isPhoneVerified(),
        user.getLastLoginAt() || null,
      ]
    );

    if (rows.length === 0) {
      throw new NotFoundError('User not found');
    }
  }

  /**
   * Supprime un utilisateur (soft delete)
   */
  async delete(id: string): Promise<void> {
    const result = await db.query(
      `
      UPDATE users SET
        deleted_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [id]
    );

    if (result.length === 0) {
      throw new NotFoundError('User not found');
    }
  }

  /**
   * Met à jour la dette d'un client
   */
  async updateDebt(userId: string, newDebt: Money): Promise<void> {
    await db.query(
      `
      UPDATE users SET
        current_debt = $2,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND role = 'customer' AND deleted_at IS NULL
      `,
      [userId, newDebt.amount]
    );
  }

  /**
   * Met à jour la disponibilité d'un livreur
   */
  async updateAvailability(delivererId: string, isAvailable: boolean): Promise<void> {
    await db.query(
      `
      UPDATE users SET
        is_available = $2,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND role = 'deliverer' AND deleted_at IS NULL
      `,
      [delivererId, isAvailable]
    );
  }

  /**
   * Exécute une opération dans une transaction
   */
  async transaction<T>(callback: (client: PoolClient) => Promise<T>): Promise<T> {
    return db.transaction(callback);
  }

  /**
   * Mappe une ligne de base de données vers une entité User
   */
  private mapRowToUser(row: any): User {
    let address: Address | undefined = undefined;
    
    if (row.address_street) {
      address = Address.create({
        street: row.address_street,
        city: row.address_city,
        wilaya: row.address_state,
        postalCode: row.address_postal_code,
        coordinates:
          row.latitude && row.longitude
            ? {
                latitude: parseFloat(row.latitude),
                longitude: parseFloat(row.longitude),
              }
            : undefined,
      });
    }

    const props: UserProps = {
      id: row.id,
      organizationId: row.organization_id,
      firstName: row.first_name,
      lastName: row.last_name,
      email: Email.create(row.email),
      phone: PhoneNumber.create(row.phone),
      passwordHash: row.password_hash,
      role: row.role,
      isActive: row.is_active,
      emailVerified: row.email_verified,
      phoneVerified: row.phone_verified,
      createdAt: new Date(row.created_at),
      updatedAt: new Date(row.updated_at),
    };

    if (address) props.address = address;
    if (row.credit_limit) props.creditLimit = Money.fromCents(row.credit_limit, 'DZD');
    if (row.credit_days) props.creditDays = row.credit_days;
    if (row.current_debt) props.currentDebt = Money.fromCents(row.current_debt, 'DZD');
    if (row.vehicle_type) props.vehicleType = row.vehicle_type;
    if (row.vehicle_plate) props.vehiclePlate = row.vehicle_plate;
    if (row.is_available !== null) props.isAvailable = row.is_available;
    if (row.avatar_url) props.avatarUrl = row.avatar_url;
    if (row.notes) props.notes = row.notes;
    if (row.settings) props.settings = row.settings;
    if (row.last_login_at) props.lastLoginAt = new Date(row.last_login_at);

    return User.reconstitute(props);
  }
}
