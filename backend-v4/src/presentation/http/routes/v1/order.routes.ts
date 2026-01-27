import { Router } from 'express';
import { orderSchemas } from '../../../../application/validators/order.schema';
import { OrderController } from '../../controllers/OrderController';
import { authMiddleware } from '../../middlewares/auth.middleware';
import { validateMiddleware } from '../../middlewares/validate.middleware';

const router = Router();
const orderController = new OrderController();

router.use(authMiddleware);

router.post(
  '/',
  validateMiddleware(orderSchemas.create),
  orderController.create.bind(orderController)
);

router.get('/', orderController.list.bind(orderController));

router.get('/:id', orderController.getById.bind(orderController));

router.patch(
  '/:id/status',
  validateMiddleware(orderSchemas.updateStatus),
  orderController.updateStatus.bind(orderController)
);

router.post('/:id/cancel', orderController.cancel.bind(orderController));

router.post(
  '/:id/assign-deliverer',
  validateMiddleware(orderSchemas.assignDeliverer),
  orderController.assignDeliverer.bind(orderController)
);

export default router;
