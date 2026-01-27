import { Router } from 'express';
import { deliverySchemas } from '../../../../application/validators/delivery.schema';
import { DeliveryController } from '../../controllers/DeliveryController';
import { authenticate } from '../../middlewares/auth.middleware';
import { validateBody } from '../../middlewares/validate.middleware';

const router = Router();
const deliveryController = new DeliveryController();

router.use(authenticate);

router.post(
  '/',
  validateBody(deliverySchemas.create),
  deliveryController.create.bind(deliveryController)
);

router.patch(
  '/:id/status',
  validateBody(deliverySchemas.updateStatus),
  deliveryController.updateStatus.bind(deliveryController)
);

router.post(
  '/:id/complete',
  validateBody(deliverySchemas.complete),
  deliveryController.complete.bind(deliveryController)
);

router.post(
  '/:id/tracking',
  validateBody(deliverySchemas.recordTracking),
  deliveryController.recordTracking.bind(deliveryController)
);

router.get('/:id/tracking', deliveryController.getTracking.bind(deliveryController));

export default router;
