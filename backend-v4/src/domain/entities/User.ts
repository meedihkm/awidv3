/**
 * Entity: User
 * Représente un utilisateur du système (admin, livreur, client, cuisine)
 */
import { Address } from '../value-objects/Address';
import { Email } from '../value-objects/Email';
import { Money } from '../value-objects/Money';
import { PhoneNumber } from '../value-objects/PhoneNumber';

export interface UserProps {
  id: string;
  organizationId: string;
  firstName: string;
  lastName: string;
  email: Email;
  phone: PhoneNumber;
  passwordHash: string;
  role: UserRole;
  address?: Address;
  creditLimit?: Money;
  creditDays?: number;
  currentDebt?: Money;
  vehicleType?: string;
  vehiclePlate?: string;
  isAvailable?: boolean;
  avatarUrl?: string;
  notes?: string;
  settings?: Record<string, any>;
  isActive: boolean;
  emailVerified: boolean;
  phoneVerified: boolean;
  lastLoginAt?: Date;
  createdAt: Date;
  updatedAt: Date;
}

export enum UserRole {
  ADMIN = 'admin',
  KITCHEN = 'kitchen',
  DELIVERER = 'deliverer',
  CUSTOMER = 'customer',
}

export class User {
  private constructor(private props: UserProps) {}

  static create(
    props: Omit<UserProps, 'id' | 'isActive' | 'emailVerified' | 'phoneVerified' | 'createdAt' | 'updatedAt' | 'lastLoginAt'>,
    id?: string
  ): User {
    return new User({
      ...props,
      id: id || crypto.randomUUID(),
      isActive: true,
      emailVerified: false,
      phoneVerified: false,
      createdAt: new Date(),
      updatedAt: new Date(),
    });
  }

  static reconstitute(props: UserProps): User {
    return new User(props);
  }

  getId(): string {
    return this.props.id;
  }

  getOrganizationId(): string {
    return this.props.organizationId;
  }

  getFirstName(): string {
    return this.props.firstName;
  }

  getLastName(): string {
    return this.props.lastName;
  }

  getFullName(): string {
    return `${this.props.firstName} ${this.props.lastName}`;
  }

  getEmail(): Email {
    return this.props.email;
  }

  getPhone(): PhoneNumber {
    return this.props.phone;
  }

  getPasswordHash(): string {
    return this.props.passwordHash;
  }

  getRole(): UserRole {
    return this.props.role;
  }

  getAddress(): Address | undefined {
    return this.props.address;
  }

  getCreditLimit(): Money | undefined {
    return this.props.creditLimit;
  }

  getCreditDays(): number | undefined {
    return this.props.creditDays;
  }

  getCurrentDebt(): Money | undefined {
    return this.props.currentDebt;
  }

  getVehicleType(): string | undefined {
    return this.props.vehicleType;
  }

  getVehiclePlate(): string | undefined {
    return this.props.vehiclePlate;
  }

  isAvailable(): boolean | undefined {
    return this.props.isAvailable;
  }

  getAvatarUrl(): string | undefined {
    return this.props.avatarUrl;
  }

  getNotes(): string | undefined {
    return this.props.notes;
  }

  getSettings(): Record<string, any> | undefined {
    return this.props.settings;
  }

  isActive(): boolean {
    return this.props.isActive;
  }

  isEmailVerified(): boolean {
    return this.props.emailVerified;
  }

  isPhoneVerified(): boolean {
    return this.props.phoneVerified;
  }

  getLastLoginAt(): Date | undefined {
    return this.props.lastLoginAt;
  }

  getCreatedAt(): Date {
    return this.props.createdAt;
  }

  getUpdatedAt(): Date {
    return this.props.updatedAt;
  }

  isAdmin(): boolean {
    return this.props.role === UserRole.ADMIN;
  }

  isKitchen(): boolean {
    return this.props.role === UserRole.KITCHEN;
  }

  isDeliverer(): boolean {
    return this.props.role === UserRole.DELIVERER;
  }

  isCustomer(): boolean {
    return this.props.role === UserRole.CUSTOMER;
  }

  updatePassword(newPasswordHash: string): void {
    this.props.passwordHash = newPasswordHash;
    this.props.updatedAt = new Date();
  }

  updateName(firstName: string, lastName: string): void {
    this.props.firstName = firstName;
    this.props.lastName = lastName;
    this.props.updatedAt = new Date();
  }

  updateProfile(phone?: PhoneNumber, address?: Address): void {
    if (phone) this.props.phone = phone;
    if (address) this.props.address = address;
    this.props.updatedAt = new Date();
  }

  updateCreditLimit(limit: Money, days: number): void {
    if (!this.isCustomer()) {
      throw new Error('Seuls les clients peuvent avoir une limite de crédit');
    }
    this.props.creditLimit = limit;
    this.props.creditDays = days;
    this.props.updatedAt = new Date();
  }

  updateDebt(debt: Money): void {
    if (!this.isCustomer()) {
      throw new Error('Seuls les clients peuvent avoir une dette');
    }
    this.props.currentDebt = debt;
    this.props.updatedAt = new Date();
  }

  updateVehicle(type: string, plate: string): void {
    if (!this.isDeliverer()) {
      throw new Error('Seuls les livreurs peuvent avoir un véhicule');
    }
    this.props.vehicleType = type;
    this.props.vehiclePlate = plate;
    this.props.updatedAt = new Date();
  }

  setAvailability(available: boolean): void {
    if (!this.isDeliverer()) {
      throw new Error('Seuls les livreurs ont une disponibilité');
    }
    this.props.isAvailable = available;
    this.props.updatedAt = new Date();
  }

  recordLogin(): void {
    this.props.lastLoginAt = new Date();
    this.props.updatedAt = new Date();
  }

  activate(): void {
    this.props.isActive = true;
    this.props.updatedAt = new Date();
  }

  deactivate(): void {
    this.props.isActive = false;
    this.props.updatedAt = new Date();
  }

  verifyEmail(): void {
    this.props.emailVerified = true;
    this.props.updatedAt = new Date();
  }

  verifyPhone(): void {
    this.props.phoneVerified = true;
    this.props.updatedAt = new Date();
  }

  toJSON(): Record<string, unknown> {
    return {
      id: this.props.id,
      organizationId: this.props.organizationId,
      firstName: this.props.firstName,
      lastName: this.props.lastName,
      email: this.props.email.toJSON(),
      phone: this.props.phone.toJSON(),
      role: this.props.role,
      address: this.props.address?.toJSON(),
      creditLimit: this.props.creditLimit?.toJSON(),
      creditDays: this.props.creditDays,
      currentDebt: this.props.currentDebt?.toJSON(),
      vehicleType: this.props.vehicleType,
      vehiclePlate: this.props.vehiclePlate,
      isAvailable: this.props.isAvailable,
      avatarUrl: this.props.avatarUrl,
      notes: this.props.notes,
      settings: this.props.settings,
      isActive: this.props.isActive,
      emailVerified: this.props.emailVerified,
      phoneVerified: this.props.phoneVerified,
      lastLoginAt: this.props.lastLoginAt?.toISOString(),
      createdAt: this.props.createdAt.toISOString(),
      updatedAt: this.props.updatedAt.toISOString(),
    };
  }
}
