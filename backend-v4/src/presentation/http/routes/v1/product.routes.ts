import { Router } from 'express';
import { productSchemas } from '../../../../application/validators/product.schema';
import { ProductController } from '../../controllers/ProductController';
import { authMiddleware } from '../../middlewares/auth.middleware';
import { validateMiddleware } from '../../middlewares/validate.middleware';

const router = Router();
const productController = new ProductController();

router.use(authMiddleware);

router.post(
  '/',
  validateMiddleware(productSchemas.create),
  productController.create.bind(productController)
);

router.get('/', productController.list.bind(productController));

router.get('/:id', productController.getById.bind(productController));

router.patch(
  '/:id',
  validateMiddleware(productSchemas.update),
  productController.update.bind(productController)
);

router.delete('/:id', productController.delete.bind(productController));

export default router;
