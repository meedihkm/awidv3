import { Router } from 'express';
import { deliverySchemas } from '../../../../application/validators/delivery.schema';
import { DeliveryController } from '../../controllers/DeliveryController';
import { authMiddleware } from '../../middlewares/auth.middleware';
import { validateMiddleware } from '../../middlewares/validate.middleware';

const router = Router();
const deliveryController = new DeliveryController();

router.use(authMiddleware);

router.post(
  '/',
  validateMiddleware(deliverySchemas.create),
  deliveryController.create.bind(deliveryController)
);

router.patch(
  '/:id/status',
  validateMiddleware(deliverySchemas.updateStatus),
  deliveryController.updateStatus.bind(deliveryController)
);

router.post(
  '/:id/complete',
  validateMiddleware(deliverySchemas.complete),
  deliveryController.complete.bind(deliveryController)
);

router.post(
  '/:id/tracking',
  validateMiddleware(deliverySchemas.recordTracking),
  deliveryController.recordTracking.bind(deliveryController)
);

router.get('/:id/tracking', deliveryController.getTracking.bind(deliveryController));

export default router;
