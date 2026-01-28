import { Router } from 'express';
import { ProductController } from '../../controllers/ProductController';
import { authMiddleware } from '../../middlewares/auth.middleware';

const router = Router();
const productController = new ProductController();

router.use(authMiddleware);

// Get all products
router.get('/', productController.getProducts.bind(productController));

// Get categories
router.get('/categories', productController.getCategories.bind(productController));

// Get product by ID
router.get('/:id', productController.getProductById.bind(productController));

// Create product
router.post('/', productController.createProduct.bind(productController));

// Update product
router.put('/:id', productController.updateProduct.bind(productController));

// Delete product
router.delete('/:id', productController.deleteProduct.bind(productController));

// Update stock
router.patch('/:id/stock', productController.updateStock.bind(productController));

// Toggle availability
router.patch('/:id/availability', productController.toggleAvailability.bind(productController));

export default router;
