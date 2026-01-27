import { NextFunction, Request, Response } from 'express';
import { Product } from '../../../domain/entities/Product';
import { Money } from '../../../domain/value-objects/Money';
import { PostgresProductRepository } from '../../../infrastructure/database/repositories';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';

export class ProductController {
  private productRepository: PostgresProductRepository;

  constructor() {
    this.productRepository = new PostgresProductRepository();
  }

  async create(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      if (!['admin', 'kitchen'].includes(req.user!.role)) {
        throw new ForbiddenError('Only admin and kitchen can create products');
      }

      const product = Product.create({
        organizationId: req.user!.organizationId,
        name: req.body.name,
        description: req.body.description,
        sku: req.body.sku,
        category: req.body.category,
        basePrice: Money.fromCents(req.body.basePrice, 'DZD'),
        imageUrl: req.body.imageUrl,
        thumbnailUrl: req.body.thumbnailUrl,
        trackStock: req.body.trackStock ?? true,
        currentStock: req.body.currentStock ?? 0,
        minStockLevel: req.body.minStockLevel ?? 0,
        unit: req.body.unit ?? 'unit',
        isAvailable: req.body.isAvailable ?? true,
        tags: req.body.tags,
        metadata: req.body.metadata,
      });

      const createdProduct = await this.productRepository.create(product);

      res.status(201).json({
        success: true,
        data: {
          product: {
            id: createdProduct.getId(),
            name: createdProduct.getName(),
            category: createdProduct.getCategory(),
            basePrice: createdProduct.getBasePrice().getAmount(),
            isAvailable: createdProduct.isAvailable(),
            createdAt: createdProduct.getCreatedAt(),
          },
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async getById(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const product = await this.productRepository.findById(req.params.id);
      if (!product) {
        throw new NotFoundError('Product not found');
      }

      if (product.getOrganizationId() !== req.user!.organizationId) {
        throw new ForbiddenError('Access denied');
      }

      res.json({
        success: true,
        data: {
          product: {
            id: product.getId(),
            name: product.getName(),
            description: product.getDescription(),
            sku: product.getSku(),
            category: product.getCategory(),
            basePrice: product.getBasePrice().getAmount(),
            imageUrl: product.getImageUrl(),
            thumbnailUrl: product.getThumbnailUrl(),
            trackStock: product.isTrackStock(),
            currentStock: product.getCurrentStock(),
            minStockLevel: product.getMinStockLevel(),
            unit: product.getUnit(),
            isAvailable: product.isAvailable(),
            tags: product.getTags(),
            createdAt: product.getCreatedAt(),
          },
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async list(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const { category, available } = req.query;

      let products;
      if (category) {
        products = await this.productRepository.findByCategory(
          req.user!.organizationId,
          category as string
        );
      } else if (available === 'true') {
        products = await this.productRepository.findAvailable(req.user!.organizationId);
      } else {
        products = await this.productRepository.findByOrganization(req.user!.organizationId);
      }

      res.json({
        success: true,
        data: {
          products: products.map((product) => ({
            id: product.getId(),
            name: product.getName(),
            category: product.getCategory(),
            basePrice: product.getBasePrice().getAmount(),
            imageUrl: product.getImageUrl(),
            thumbnailUrl: product.getThumbnailUrl(),
            currentStock: product.getCurrentStock(),
            isAvailable: product.isAvailable(),
          })),
          total: products.length,
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async update(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      if (!['admin', 'kitchen'].includes(req.user!.role)) {
        throw new ForbiddenError('Only admin and kitchen can update products');
      }

      const product = await this.productRepository.findById(req.params.id);
      if (!product) {
        throw new NotFoundError('Product not found');
      }

      if (product.getOrganizationId() !== req.user!.organizationId) {
        throw new ForbiddenError('Access denied');
      }

      if (req.body.name) product.updateName(req.body.name);
      if (req.body.description !== undefined) product.updateDescription(req.body.description);
      if (req.body.basePrice) product.updatePrice(Money.fromCents(req.body.basePrice, 'DZD'));
      if (req.body.isAvailable !== undefined) {
        if (req.body.isAvailable) {
          product.makeAvailable();
        } else {
          product.makeUnavailable();
        }
      }

      const updatedProduct = await this.productRepository.update(product);

      res.json({
        success: true,
        data: {
          product: {
            id: updatedProduct.getId(),
            name: updatedProduct.getName(),
            basePrice: updatedProduct.getBasePrice().getAmount(),
            isAvailable: updatedProduct.isAvailable(),
            updatedAt: updatedProduct.getUpdatedAt(),
          },
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async delete(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      if (!['admin'].includes(req.user!.role)) {
        throw new ForbiddenError('Only admin can delete products');
      }

      const product = await this.productRepository.findById(req.params.id);
      if (!product) {
        throw new NotFoundError('Product not found');
      }

      if (product.getOrganizationId() !== req.user!.organizationId) {
        throw new ForbiddenError('Access denied');
      }

      await this.productRepository.delete(req.params.id);

      res.json({
        success: true,
        message: 'Product deleted successfully',
      });
    } catch (error) {
      next(error);
    }
  }
}
