/**
 * Entity: Organization
 * Représente une organisation (pizzeria, boulangerie, etc.)
 */
import { Address } from '../value-objects/Address';
import { Email } from '../value-objects/Email';
import { PhoneNumber } from '../value-objects/PhoneNumber';

export interface OrganizationProps {
  id: string;
  name: string;
  type: OrganizationType;
  email: Email;
  phone: PhoneNumber;
  address: Address;
  settings: OrganizationSettings;
  isActive: boolean;
  createdAt: Date;
  updatedAt: Date;
}

export enum OrganizationType {
  PIZZERIA = 'pizzeria',
  BAKERY = 'bakery',
  DAIRY = 'dairy',
  RESTAURANT = 'restaurant',
  OTHER = 'other',
}

export interface OrganizationSettings {
  currency: string;
  timezone: string;
  workingHours: {
    start: string;
    end: string;
  };
  deliveryRadius: number; // en km
  minOrderAmount: number;
  taxRate: number;
  enableCreditLimit: boolean;
  defaultCreditLimit: number;
  enableRecurringOrders: boolean;
  enablePackaging: boolean;
  notificationChannels: {
    email: boolean;
    sms: boolean;
    push: boolean;
  };
}

export class Organization {
  private constructor(private props: OrganizationProps) {}

  static create(props: Omit<OrganizationProps, 'createdAt' | 'updatedAt'>): Organization {
    return new Organization({
      ...props,
      createdAt: new Date(),
      updatedAt: new Date(),
    });
  }

  static reconstitute(props: OrganizationProps): Organization {
    return new Organization(props);
  }

  get id(): string {
    return this.props.id;
  }

  get name(): string {
    return this.props.name;
  }

  get type(): OrganizationType {
    return this.props.type;
  }

  get email(): Email {
    return this.props.email;
  }

  get phone(): PhoneNumber {
    return this.props.phone;
  }

  get address(): Address {
    return this.props.address;
  }

  get settings(): OrganizationSettings {
    return this.props.settings;
  }

  get isActive(): boolean {
    return this.props.isActive;
  }

  get createdAt(): Date {
    return this.props.createdAt;
  }

  get updatedAt(): Date {
    return this.props.updatedAt;
  }

  updateSettings(settings: Partial<OrganizationSettings>): void {
    this.props.settings = {
      ...this.props.settings,
      ...settings,
    };
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

  updateContactInfo(email?: Email, phone?: PhoneNumber, address?: Address): void {
    if (email) this.props.email = email;
    if (phone) this.props.phone = phone;
    if (address) this.props.address = address;
    this.props.updatedAt = new Date();
  }

  toJSON(): Record<string, unknown> {
    return {
      id: this.props.id,
      name: this.props.name,
      type: this.props.type,
      email: this.props.email.toJSON(),
      phone: this.props.phone.toJSON(),
      address: this.props.address.toJSON(),
      settings: this.props.settings,
      isActive: this.props.isActive,
      createdAt: this.props.createdAt.toISOString(),
      updatedAt: this.props.updatedAt.toISOString(),
    };
  }
}
