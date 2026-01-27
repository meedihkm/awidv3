import bcrypt from 'bcrypt';
import { User, UserRole } from '../../../domain/entities/User';
import { IOrganizationRepository } from '../../../domain/repositories/IOrganizationRepository';
import { IUserRepository } from '../../../domain/repositories/IUserRepository';
import { Address } from '../../../domain/value-objects/Address';
import { Email } from '../../../domain/value-objects/Email';
import { Money } from '../../../domain/value-objects/Money';
import { PhoneNumber } from '../../../domain/value-objects/PhoneNumber';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { ValidationError } from '../../../shared/errors/ValidationError';

interface RegisterInput {
  organizationId: string;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  password: string;
  role: UserRole;
  address?: {
    street: string;
    city: string;
    wilaya?: string;
    postalCode?: string;
    coordinates?: {
      latitude: number;
      longitude: number;
    };
  };
  creditLimit?: number;
  creditDays?: number;
  vehicleType?: string;
  vehiclePlate?: string;
}

interface RegisterOutput {
  user: {
    id: string;
    organizationId: string;
    firstName: string;
    lastName: string;
    email: string;
    phone: string;
    role: string;
    isActive: boolean;
    createdAt: Date;
  };
}

export class RegisterUseCase {
  constructor(
    private userRepository: IUserRepository,
    private organizationRepository: IOrganizationRepository
  ) {}

  async execute(input: RegisterInput): Promise<RegisterOutput> {
    const existingUser = await this.userRepository.findByEmail(input.email);
    if (existingUser) {
      throw new ValidationError('Email already exists');
    }

    const organization = await this.organizationRepository.findById(input.organizationId);
    if (!organization) {
      throw new NotFoundError('Organization not found');
    }

    if (!organization.isActive) {
      throw new ValidationError('Organization is not active');
    }

    const passwordHash = await bcrypt.hash(input.password, 12);

    const address = input.address
      ? Address.create({
          street: input.address.street,
          city: input.address.city,
          ...(input.address.wilaya && { wilaya: input.address.wilaya }),
          ...(input.address.postalCode && { postalCode: input.address.postalCode }),
          ...(input.address.coordinates && { coordinates: input.address.coordinates }),
        })
      : undefined;

    const user = User.create({
      organizationId: input.organizationId,
      firstName: input.firstName,
      lastName: input.lastName,
      email: Email.create(input.email),
      phone: PhoneNumber.create(input.phone),
      passwordHash,
      role: input.role,
      ...(address && { address }),
      ...(input.role === UserRole.CUSTOMER && {
        creditLimit: input.creditLimit
          ? Money.fromCents(input.creditLimit, 'DZD')
          : Money.fromCents(organization.settings.defaultCreditLimit, 'DZD'),
        creditDays: input.creditDays || 30,
      }),
      ...(input.role === UserRole.DELIVERER && {
        vehicleType: input.vehicleType,
        vehiclePlate: input.vehiclePlate,
      }),
    });

    await this.userRepository.save(user);

    return {
      user: {
        id: user.getId(),
        organizationId: user.getOrganizationId(),
        firstName: user.getFirstName(),
        lastName: user.getLastName(),
        email: user.getEmail().value,
        phone: user.getPhone().value,
        role: user.getRole(),
        isActive: user.isActive(),
        createdAt: user.getCreatedAt(),
      },
    };
  }
}
