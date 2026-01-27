/**
 * Repository Interface: IOrganizationRepository
 * Port pour la persistence des organisations
 */
import { Organization } from '../entities/Organization';

export interface IOrganizationRepository {
  findById(id: string): Promise<Organization | null>;
  findByEmail(email: string): Promise<Organization | null>;
  findAll(): Promise<Organization[]>;
  save(organization: Organization): Promise<void>;
  update(organization: Organization): Promise<void>;
  delete(id: string): Promise<void>;
  exists(id: string): Promise<boolean>;
}
