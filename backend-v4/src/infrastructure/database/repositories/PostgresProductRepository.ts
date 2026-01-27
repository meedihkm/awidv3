import { PoolClient } from 'pg';
import { Product } from '../../../domain/entities/Product';
import { IProductRepository } from '../../../domain/repositories/IProductRepository';
import { Money } from '../../../domain/value-objects/Money';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { db } from '../PostgresConnection';

export class PostgresProductRepository implements IProductRepository {
  async findById(id: string): Promise<Product | null> {
    const rows = await db.query<any>(
      `
      SELECT * FROM products
      WHERE id = $1 AND deleted_at IS NULL
      LIMIT 1
      `,
      [id]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToProduct(rows[0]);
  }

  async findByOrganization(organizationId: string): Promise<Product[]> {
    const rows = await db.query<any>(
      `
      SELECT * FROM products
      WHERE organization_id = $1 AND deleted_at IS NULL
      ORDER BY name ASC
      `,
      [organizationId]
    );

    return rows.map((row) => this.mapRowToProduct(row));
  }

  async findAvailable(organizationId: string): Promise<Product[]> {
    const rows = await db.query<any>(
      `
      SELECT * FROM products
      WHERE organization_id = $1
        AND is_available = true
        AND deleted_at IS NULL
      ORDER BY name ASC
      `,
      [organizationId]
    );

    return rows.map((row) => this.mapRowToProduct(row));
  }

  async findByCategory(organizationId: string, category: string): Promise<Product[]> {
    const rows = await db.query<any>(
      `
      SELECT * FROM products
      WHERE organization_id = $1
        AND category = $2
        AND deleted_at IS NULL
      ORDER BY name ASC
      `,
      [organizationId, category]
    );

    return rows.map((row) => this.mapRowToProduct(row));
  }

  async findBySku(organizationId: string, sku: string): Promise<Product | null> {
    const rows = await db.query<any>(
      `
      SELECT * FROM products
      WHERE organization_id = $1
        AND sku = $2
        AND deleted_at IS NULL
      LIMIT 1
      `,
      [organizationId, sku]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToProduct(rows[0]);
  }

  async create(product: Product): Promise<Product> {
    const rows = await db.query<any>(
      `
      INSERT INTO products (
        id, organization_id, name, description, sku, category,
        base_price, image_url, thumbnail_url,
        track_stock, current_stock, min_stock_level, unit,
        is_available, tags, metadata
      )
      VALUES (
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16
      )
      RETURNING *
      `,
      [
        product.getId(),
        product.getOrganizationId(),
        product.getName(),
        product.getDescription() || null,
        product.getSku() || null,
        product.getCategory(),
        product.getBasePrice().getAmount(),
        product.getImageUrl() || null,
        product.getThumbnailUrl() || null,
        product.isTrackStock(),
        product.getCurrentStock(),
        product.getMinStockLevel(),
        product.getUnit(),
        product.isAvailable(),
        product.getTags() || [],
        JSON.stringify(product.getMetadata() || {}),
      ]
    );

    return this.mapRowToProduct(rows[0]);
  }

  async update(product: Product): Promise<Product> {
    const rows = await db.query<any>(
      `
      UPDATE products SET
        name = $2,
        description = $3,
        sku = $4,
        category = $5,
        base_price = $6,
        image_url = $7,
        thumbnail_url = $8,
        track_stock = $9,
        current_stock = $10,
        min_stock_level = $11,
        unit = $12,
        is_available = $13,
        tags = $14,
        metadata = $15,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      RETURNING *
      `,
      [
        product.getId(),
        product.getName(),
        product.getDescription() || null,
        product.getSku() || null,
        product.getCategory(),
        product.getBasePrice().getAmount(),
        product.getImageUrl() || null,
        product.getThumbnailUrl() || null,
        product.isTrackStock(),
        product.getCurrentStock(),
        product.getMinStockLevel(),
        product.getUnit(),
        product.isAvailable(),
        product.getTags() || [],
        JSON.stringify(product.getMetadata() || {}),
      ]
    );

    if (rows.length === 0) {
      throw new NotFoundError('Product not found');
    }

    return this.mapRowToProduct(rows[0]);
  }

  async delete(id: string): Promise<void> {
    const result = await db.query(
      `
      UPDATE products SET
        deleted_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [id]
    );

    if (result.length === 0) {
      throw new NotFoundError('Product not found');
    }
  }

  async updateStock(productId: string, quantity: number): Promise<void> {
    await db.query(
      `
      UPDATE products SET
        current_stock = $2,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [productId, quantity]
    );
  }

  async adjustStock(productId: string, delta: number): Promise<void> {
    await db.query(
      `
      UPDATE products SET
        current_stock = current_stock + $2,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [productId, delta]
    );
  }

  async getCustomPrice(productId: string, customerId: string): Promise<Money | null> {
    const rows = await db.query<any>(
      `
      SELECT pcp.custom_price, p.organization_id
      FROM product_custom_prices pcp
      JOIN products p ON p.id = pcp.product_id
      WHERE pcp.product_id = $1 AND pcp.customer_id = $2
      LIMIT 1
      `,
      [productId, customerId]
    );

    if (rows.length === 0) {
      return null;
    }

    const product = await this.findById(productId);
    if (!product) {
      return null;
    }

    return Money.fromCents(rows[0].custom_price, 'DZD');
  }

  async setCustomPrice(productId: string, customerId: string, price: Money): Promise<void> {
    await db.query(
      `
      INSERT INTO product_custom_prices (product_id, customer_id, custom_price)
      VALUES ($1, $2, $3)
      ON CONFLICT (product_id, customer_id)
      DO UPDATE SET
        custom_price = $3,
        updated_at = CURRENT_TIMESTAMP
      `,
      [productId, customerId, price.getAmount()]
    );
  }

  async removeCustomPrice(productId: string, customerId: string): Promise<void> {
    await db.query(
      `
      DELETE FROM product_custom_prices
      WHERE product_id = $1 AND customer_id = $2
      `,
      [productId, customerId]
    );
  }

  async transaction<T>(callback: (client: PoolClient) => Promise<T>): Promise<T> {
    return db.transaction(callback);
  }

  private mapRowToProduct(row: any): Product {
    return Product.create(
      {
        organizationId: row.organization_id,
        name: row.name,
        description: row.description || undefined,
        sku: row.sku || undefined,
        category: row.category,
        basePrice: Money.fromCents(row.base_price, 'DZD'),
        imageUrl: row.image_url || undefined,
        thumbnailUrl: row.thumbnail_url || undefined,
        trackStock: row.track_stock,
        currentStock: row.current_stock,
        minStockLevel: row.min_stock_level,
        unit: row.unit,
        isAvailable: row.is_available,
        tags: row.tags || [],
        metadata: row.metadata || {},
        createdAt: new Date(row.created_at),
        updatedAt: new Date(row.updated_at),
      },
      row.id
    );
  }
}
