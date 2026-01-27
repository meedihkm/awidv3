/**
 * Entity: Product
 * Représente un produit vendable (pain, pizza, etc.)
 */
import { Money } from '../value-objects/Money';

export interface ProductProps {
  id: string;
  organizationId: string;
  name: string;
  description?: string;
  category: ProductCategory;
  price: Money;
  unit: ProductUnit;
  minQuantity: number;
  maxQuantity?: number;
  sku?: string;
  barcode?: string;
  imageUrl?: string;
  isAvailable: boolean;
  tags: string[];
  sortOrder: number;
  createdAt: Date;
  updatedAt: Date;
}

export enum ProductCategory {
  BAKERY = 'bakery',
  PASTRY = 'pastry',
  BEVERAGE = 'beverage',
  DAIRY = 'dairy',
  MEAT = 'meat',
  VEGETABLE = 'vegetable',
  OTHER = 'other',
}

export enum ProductUnit {
  PIECE = 'piece',
  KG = 'kg',
  G = 'g',
  L = 'l',
  ML = 'ml',
  BOX = 'box',
  PACK = 'pack',
}

export class Product {
  private constructor(private props: ProductProps) {}

  static create(
    props: Omit<ProductProps, 'isAvailable' | 'tags' | 'sortOrder' | 'createdAt' | 'updatedAt'>
  ): Product {
    return new Product({
      ...props,
      isAvailable: true,
      tags: props.tags || [],
      sortOrder: props.sortOrder || 0,
      createdAt: new Date(),
      updatedAt: new Date(),
    });
  }

  static reconstitute(props: ProductProps): Product {
    return new Product(props);
  }

  get id(): string {
    return this.props.id;
  }

  get organizationId(): string {
    return this.props.organizationId;
  }

  get name(): string {
    return this.props.name;
  }

  get description(): string | undefined {
    return this.props.description;
  }

  get category(): ProductCategory {
    return this.props.category;
  }

  get price(): Money {
    return this.props.price;
  }

  get unit(): ProductUnit {
    return this.props.unit;
  }

  get minQuantity(): number {
    return this.props.minQuantity;
  }

  get maxQuantity(): number | undefined {
    return this.props.maxQuantity;
  }

  get sku(): string | undefined {
    return this.props.sku;
  }

  get barcode(): string | undefined {
    return this.props.barcode;
  }

  get imageUrl(): string | undefined {
    return this.props.imageUrl;
  }

  get isAvailable(): boolean {
    return this.props.isAvailable;
  }

  get tags(): string[] {
    return [...this.props.tags];
  }

  get sortOrder(): number {
    return this.props.sortOrder;
  }

  get createdAt(): Date {
    return this.props.createdAt;
  }

  get updatedAt(): Date {
    return this.props.updatedAt;
  }

  updatePrice(newPrice: Money): void {
    if (newPrice.isLessThan(Money.zero())) {
      throw new Error('Le prix ne peut pas être négatif');
    }
    this.props.price = newPrice;
    this.props.updatedAt = new Date();
  }

  updateDetails(
    name?: string,
    description?: string,
    category?: ProductCategory,
    unit?: ProductUnit
  ): void {
    if (name) this.props.name = name;
    if (description !== undefined) this.props.description = description;
    if (category) this.props.category = category;
    if (unit) this.props.unit = unit;
    this.props.updatedAt = new Date();
  }

  updateQuantityLimits(min?: number, max?: number): void {
    if (min !== undefined && min < 1) {
      throw new Error('La quantité minimale doit être au moins 1');
    }
    if (max !== undefined && min !== undefined && max < min) {
      throw new Error('La quantité maximale doit être supérieure à la minimale');
    }
    if (min !== undefined) this.props.minQuantity = min;
    if (max !== undefined) this.props.maxQuantity = max;
    this.props.updatedAt = new Date();
  }

  setImage(imageUrl: string): void {
    this.props.imageUrl = imageUrl;
    this.props.updatedAt = new Date();
  }

  addTag(tag: string): void {
    if (!this.props.tags.includes(tag)) {
      this.props.tags.push(tag);
      this.props.updatedAt = new Date();
    }
  }

  removeTag(tag: string): void {
    this.props.tags = this.props.tags.filter((t) => t !== tag);
    this.props.updatedAt = new Date();
  }

  makeAvailable(): void {
    this.props.isAvailable = true;
    this.props.updatedAt = new Date();
  }

  makeUnavailable(): void {
    this.props.isAvailable = false;
    this.props.updatedAt = new Date();
  }

  updateSortOrder(order: number): void {
    this.props.sortOrder = order;
    this.props.updatedAt = new Date();
  }

  calculateTotalPrice(quantity: number): Money {
    if (quantity < this.props.minQuantity) {
      throw new Error(`La quantité minimale est ${this.props.minQuantity}`);
    }
    if (this.props.maxQuantity && quantity > this.props.maxQuantity) {
      throw new Error(`La quantité maximale est ${this.props.maxQuantity}`);
    }
    return this.props.price.multiply(quantity);
  }

  toJSON(): Record<string, unknown> {
    return {
      id: this.props.id,
      organizationId: this.props.organizationId,
      name: this.props.name,
      description: this.props.description,
      category: this.props.category,
      price: this.props.price.toJSON(),
      unit: this.props.unit,
      minQuantity: this.props.minQuantity,
      maxQuantity: this.props.maxQuantity,
      sku: this.props.sku,
      barcode: this.props.barcode,
      imageUrl: this.props.imageUrl,
      isAvailable: this.props.isAvailable,
      tags: this.props.tags,
      sortOrder: this.props.sortOrder,
      createdAt: this.props.createdAt.toISOString(),
      updatedAt: this.props.updatedAt.toISOString(),
    };
  }
}
