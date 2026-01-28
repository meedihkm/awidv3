import { Request, Response } from 'express';
import { db } from '../../../infrastructure/database/PostgresConnection';

export class ProductController {
  constructor() { }

  /**
   * Get all products
   * GET /products
   */
  async getProducts(req: Request, res: Response): Promise<void> {
    try {
      const page = parseInt(req.query.page as string) || 1;
      const limit = parseInt(req.query.limit as string) || 20;
      const category = req.query.category as string;
      const isAvailable = req.query.is_available as string;
      const search = req.query.search as string;
      const organizationId = req.user!.organizationId;
      const offset = (page - 1) * limit;

      let whereClause = 'WHERE p.organization_id = $1';
      const params: any[] = [organizationId, limit, offset];
      let paramIndex = 4;

      if (category) {
        whereClause += ` AND p.category = $${paramIndex}`;
        params.push(category);
        paramIndex++;
      }

      if (isAvailable === 'true') {
        whereClause += ` AND p.is_available = true`;
      } else if (isAvailable === 'false') {
        whereClause += ` AND p.is_available = false`;
      }

      if (search) {
        whereClause += ` AND (p.name ILIKE $${paramIndex} OR p.description ILIKE $${paramIndex})`;
        params.push(`%${search}%`);
        paramIndex++;
      }

      const query = `
        SELECT 
          p.id,
          p.name,
          p.description,
          p.sku,
          p.category,
          p.price,
          p.image_url,
          p.thumbnail_url,
          p.current_stock,
          p.min_stock_level,
          p.unit,
          p.is_available,
          p.tags,
          p.created_at,
          p.updated_at
        FROM products p
        ${whereClause}
        ORDER BY p.name ASC
        LIMIT $2 OFFSET $3
      `;

      const result = await db.query(query, params);

      const products = result.map((row: any) => ({
        id: row.id,
        name: row.name,
        description: row.description,
        sku: row.sku,
        category: row.category,
        price: parseFloat(row.price) / 100, // Convert from centimes
        imageUrl: row.image_url,
        thumbnailUrl: row.thumbnail_url,
        currentStock: parseInt(row.current_stock) || 0,
        minStockLevel: parseInt(row.min_stock_level) || 0,
        unit: row.unit,
        isAvailable: row.is_available,
        tags: row.tags || [],
        createdAt: row.created_at,
        updatedAt: row.updated_at,
      }));

      res.json({
        success: true,
        data: products,
        pagination: {
          page,
          limit,
          total: products.length,
        },
      });
    } catch (error) {
      console.error('Error getting products:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la récupération des produits',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Get product by ID
   * GET /products/:id
   */
  async getProductById(req: Request, res: Response): Promise<void> {
    try {
      const productId = req.params.id;
      const organizationId = req.user!.organizationId;

      const result = await db.query(`
        SELECT 
          p.id,
          p.name,
          p.description,
          p.sku,
          p.category,
          p.price,
          p.image_url,
          p.thumbnail_url,
          p.current_stock,
          p.min_stock_level,
          p.unit,
          p.is_available,
          p.tags,
          p.metadata,
          p.created_at,
          p.updated_at
        FROM products p
        WHERE p.id = $1 AND p.organization_id = $2
      `, [productId, organizationId]);

      if (result.length === 0) {
        res.status(404).json({
          success: false,
          error: 'Produit non trouvé',
          code: 'NOT_FOUND',
        });
        return;
      }

      const row = result[0];
      const product = {
        id: row.id,
        name: row.name,
        description: row.description,
        sku: row.sku,
        category: row.category,
        price: parseFloat(row.price) / 100,
        imageUrl: row.image_url,
        thumbnailUrl: row.thumbnail_url,
        currentStock: parseInt(row.current_stock) || 0,
        minStockLevel: parseInt(row.min_stock_level) || 0,
        unit: row.unit,
        isAvailable: row.is_available,
        tags: row.tags || [],
        metadata: row.metadata || {},
        createdAt: row.created_at,
        updatedAt: row.updated_at,
      };

      res.json({
        success: true,
        data: product,
      });
    } catch (error) {
      console.error('Error getting product by ID:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la récupération du produit',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Create product
   * POST /products
   */
  async createProduct(req: Request, res: Response): Promise<void> {
    try {
      if (!['admin', 'kitchen'].includes(req.user!.role)) {
        res.status(403).json({
          success: false,
          error: 'Seuls les admins et la cuisine peuvent créer des produits',
          code: 'FORBIDDEN',
        });
        return;
      }

      const {
        name,
        description,
        sku,
        category,
        price,
        imageUrl,
        thumbnailUrl,
        currentStock,
        minStockLevel,
        unit,
        isAvailable,
        tags,
        metadata
      } = req.body;

      const result = await db.query(`
        INSERT INTO products (
          organization_id, name, description, sku, category, price,
          image_url, thumbnail_url, current_stock, min_stock_level,
          unit, is_available, tags, metadata
        )
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
        RETURNING *
      `, [
        req.user!.organizationId,
        name,
        description || null,
        sku || null,
        category,
        Math.round((price || 0) * 100), // Convert to centimes
        imageUrl || null,
        thumbnailUrl || null,
        currentStock || 0,
        minStockLevel || 0,
        unit || 'unit',
        isAvailable !== false,
        JSON.stringify(tags || []),
        JSON.stringify(metadata || {})
      ]);

      const row = result[0];
      const product = {
        id: row.id,
        name: row.name,
        category: row.category,
        price: parseFloat(row.price) / 100,
        isAvailable: row.is_available,
        createdAt: row.created_at,
      };

      res.status(201).json({
        success: true,
        data: product,
      });
    } catch (error) {
      console.error('Error creating product:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la création du produit',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Update product
   * PUT /products/:id
   */
  async updateProduct(req: Request, res: Response): Promise<void> {
    try {
      if (!['admin', 'kitchen'].includes(req.user!.role)) {
        res.status(403).json({
          success: false,
          error: 'Seuls les admins et la cuisine peuvent modifier des produits',
          code: 'FORBIDDEN',
        });
        return;
      }

      const productId = req.params.id;
      const organizationId = req.user!.organizationId;
      const {
        name,
        description,
        sku,
        category,
        price,
        imageUrl,
        thumbnailUrl,
        currentStock,
        minStockLevel,
        unit,
        isAvailable,
        tags,
        metadata
      } = req.body;

      // Check if product exists and belongs to organization
      const existingProduct = await db.query(
        'SELECT id FROM products WHERE id = $1 AND organization_id = $2',
        [productId, organizationId]
      );

      if (existingProduct.length === 0) {
        res.status(404).json({
          success: false,
          error: 'Produit non trouvé',
          code: 'NOT_FOUND',
        });
        return;
      }

      const result = await db.query(`
        UPDATE products SET
          name = COALESCE($2, name),
          description = COALESCE($3, description),
          sku = COALESCE($4, sku),
          category = COALESCE($5, category),
          price = COALESCE($6, price),
          image_url = COALESCE($7, image_url),
          thumbnail_url = COALESCE($8, thumbnail_url),
          current_stock = COALESCE($9, current_stock),
          min_stock_level = COALESCE($10, min_stock_level),
          unit = COALESCE($11, unit),
          is_available = COALESCE($12, is_available),
          tags = COALESCE($13, tags),
          metadata = COALESCE($14, metadata),
          updated_at = NOW()
        WHERE id = $1
        RETURNING *
      `, [
        productId,
        name,
        description,
        sku,
        category,
        price ? Math.round(price * 100) : null,
        imageUrl,
        thumbnailUrl,
        currentStock,
        minStockLevel,
        unit,
        isAvailable,
        tags ? JSON.stringify(tags) : null,
        metadata ? JSON.stringify(metadata) : null
      ]);

      const row = result[0];
      const product = {
        id: row.id,
        name: row.name,
        price: parseFloat(row.price) / 100,
        isAvailable: row.is_available,
        updatedAt: row.updated_at,
      };

      res.json({
        success: true,
        data: product,
      });
    } catch (error) {
      console.error('Error updating product:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la mise à jour du produit',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Delete product
   * DELETE /products/:id
   */
  async deleteProduct(req: Request, res: Response): Promise<void> {
    try {
      if (!['admin'].includes(req.user!.role)) {
        res.status(403).json({
          success: false,
          error: 'Seuls les admins peuvent supprimer des produits',
          code: 'FORBIDDEN',
        });
        return;
      }

      const productId = req.params.id;
      const organizationId = req.user!.organizationId;

      const result = await db.query(
        'DELETE FROM products WHERE id = $1 AND organization_id = $2 RETURNING id',
        [productId, organizationId]
      );

      if (result.length === 0) {
        res.status(404).json({
          success: false,
          error: 'Produit non trouvé',
          code: 'NOT_FOUND',
        });
        return;
      }

      res.json({
        success: true,
        message: 'Produit supprimé avec succès',
      });
    } catch (error) {
      console.error('Error deleting product:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la suppression du produit',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Get categories
   * GET /products/categories
   */
  async getCategories(req: Request, res: Response): Promise<void> {
    try {
      const organizationId = req.user!.organizationId;

      const result = await db.query(`
        SELECT DISTINCT category
        FROM products
        WHERE organization_id = $1 AND category IS NOT NULL
        ORDER BY category
      `, [organizationId]);

      const categories = result.map((row: any) => row.category);

      res.json({
        success: true,
        data: categories,
      });
    } catch (error) {
      console.error('Error getting categories:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la récupération des catégories',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Update stock
   * PATCH /products/:id/stock
   */
  async updateStock(req: Request, res: Response): Promise<void> {
    try {
      if (!['admin', 'kitchen'].includes(req.user!.role)) {
        res.status(403).json({
          success: false,
          error: 'Seuls les admins et la cuisine peuvent modifier le stock',
          code: 'FORBIDDEN',
        });
        return;
      }

      const productId = req.params.id;
      const { quantity } = req.body;
      const organizationId = req.user!.organizationId;

      if (typeof quantity !== 'number') {
        res.status(400).json({
          success: false,
          error: 'La quantité doit être un nombre',
          code: 'VALIDATION_ERROR',
        });
        return;
      }

      const result = await db.query(`
        UPDATE products 
        SET current_stock = $2, updated_at = NOW()
        WHERE id = $1 AND organization_id = $3
        RETURNING *
      `, [productId, quantity, organizationId]);

      if (result.length === 0) {
        res.status(404).json({
          success: false,
          error: 'Produit non trouvé',
          code: 'NOT_FOUND',
        });
        return;
      }

      const row = result[0];
      const product = {
        id: row.id,
        name: row.name,
        currentStock: parseInt(row.current_stock),
        updatedAt: row.updated_at,
      };

      res.json({
        success: true,
        data: product,
      });
    } catch (error) {
      console.error('Error updating stock:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la mise à jour du stock',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Toggle availability
   * PATCH /products/:id/availability
   */
  async toggleAvailability(req: Request, res: Response): Promise<void> {
    try {
      if (!['admin', 'kitchen'].includes(req.user!.role)) {
        res.status(403).json({
          success: false,
          error: 'Seuls les admins et la cuisine peuvent modifier la disponibilité',
          code: 'FORBIDDEN',
        });
        return;
      }

      const productId = req.params.id;
      const organizationId = req.user!.organizationId;

      const result = await db.query(`
        UPDATE products 
        SET is_available = NOT is_available, updated_at = NOW()
        WHERE id = $1 AND organization_id = $2
        RETURNING *
      `, [productId, organizationId]);

      if (result.length === 0) {
        res.status(404).json({
          success: false,
          error: 'Produit non trouvé',
          code: 'NOT_FOUND',
        });
        return;
      }

      const row = result[0];
      const product = {
        id: row.id,
        name: row.name,
        isAvailable: row.is_available,
        updatedAt: row.updated_at,
      };

      res.json({
        success: true,
        data: product,
      });
    } catch (error) {
      console.error('Error toggling availability:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la modification de la disponibilité',
        code: 'INTERNAL_ERROR',
      });
    }
  }
}