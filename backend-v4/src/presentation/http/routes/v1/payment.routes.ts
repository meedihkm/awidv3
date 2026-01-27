import { Router } from 'express';
import { paymentSchemas } from '../../../../application/validators/payment.schema';
import { PaymentController } from '../../controllers/PaymentController';
import { authMiddleware } from '../../middlewares/auth.middleware';
import { validateMiddleware } from '../../middlewares/validate.middleware';

const router = Router();
const paymentController = new PaymentController();

router.use(authMiddleware);

router.post(
  '/',
  validateMiddleware(paymentSchemas.record),
  paymentController.record.bind(paymentController)
);

router.post(
  '/:id/allocate',
  validateMiddleware(paymentSchemas.allocate),
  paymentController.allocate.bind(paymentController)
);

router.get('/', paymentController.getHistory.bind(paymentController));

export default router;
