import { Router } from 'express';
import { authSchemas } from '../../../../application/validators/auth.schema';
import { AuthController } from '../../controllers/AuthController';
import { validateBody } from '../../middlewares/validate.middleware';

const router = Router();
const authController = new AuthController();

router.post(
  '/login',
  validateBody(authSchemas.login),
  authController.login.bind(authController)
);

router.post(
  '/register',
  validateBody(authSchemas.register),
  authController.register.bind(authController)
);

router.post(
  '/refresh',
  validateBody(authSchemas.refreshToken),
  authController.refreshToken.bind(authController)
);

router.post('/logout', authController.logout.bind(authController));

router.post(
  '/change-password',
  validateBody(authSchemas.changePassword),
  authController.changePassword.bind(authController)
);

export default router;
