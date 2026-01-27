/**
 * Repository Interface: IProductRepository
 * Port pour la persistence des produits
 */
import { Product, ProductCategory } from '../entities/Product';

export interface FindProductsOptions {
  organizationId: string;
  category?: ProductCategory;
  isAvailable?: boolean;
  search?: string;
  minPrice?: number;
  maxPrice?: number;
  limit?: number;
  offset?: number;
  sortBy?: 'name' | 'price' | 'sortOrder' | 'createdAt';
  sortOrder?: 'asc' | 'desc';
}

export interface IProductRepository {
  findById(id: string): Promise<Product | null>;
  findByOrganization(organizationId: string): Promise<Product[]>;
  findByCategory(organizationId: string, category: ProductCategory): Promise<Product[]>;
  findMany(options: FindProductsOptions): Promise<Product[]>;
  count(options: FindProductsOptions): Promise<number>;
  save(product: Product): Promise<void>;
  update(product: Product): Promise<void>;
  delete(id: string): Promise<void>;
  exists(id: string): Promise<boolean>;
}
