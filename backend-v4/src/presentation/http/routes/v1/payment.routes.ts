import { Router } from 'express';
import { paymentSchemas } from '../../../../application/validators/payment.schema';
import { PaymentController } from '../../controllers/PaymentController';
import { authenticate } from '../../middlewares/auth.middleware';
import { validateBody } from '../../middlewares/validate.middleware';

const router = Router();
const paymentController = new PaymentController();

router.use(authenticate);

router.post(
  '/',
  validateBody(paymentSchemas.record),
  paymentController.record.bind(paymentController)
);

router.post(
  '/:id/allocate',
  validateBody(paymentSchemas.allocate),
  paymentController.allocate.bind(paymentController)
);

router.get('/', paymentController.getHistory.bind(paymentController));

export default router;
