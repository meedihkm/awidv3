/**
 * Repository Interface: IUserRepository
 * Port pour la persistence des utilisateurs
 */
import { User, UserRole } from '../entities/User';

export interface FindUsersOptions {
  organizationId?: string;
  role?: UserRole;
  isActive?: boolean;
  search?: string;
  limit?: number;
  offset?: number;
}

export interface IUserRepository {
  findById(id: string): Promise<User | null>;
  findByEmail(email: string): Promise<User | null>;
  findByOrganization(organizationId: string): Promise<User[]>;
  findByRole(organizationId: string, role: UserRole): Promise<User[]>;
  findMany(options: FindUsersOptions): Promise<User[]>;
  count(options: FindUsersOptions): Promise<number>;
  save(user: User): Promise<void>;
  update(user: User): Promise<void>;
  delete(id: string): Promise<void>;
  exists(id: string): Promise<boolean>;
  existsByEmail(email: string): Promise<boolean>;
}
