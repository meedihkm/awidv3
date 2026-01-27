import { Router } from 'express';
import { userSchemas } from '../../../../application/validators/user.schema';
import { UserController } from '../../controllers/UserController';
import { authMiddleware } from '../../middlewares/auth.middleware';
import { validateMiddleware } from '../../middlewares/validate.middleware';

const router = Router();
const userController = new UserController();

router.use(authMiddleware);

router.post(
  '/',
  validateMiddleware(userSchemas.create),
  userController.create.bind(userController)
);

router.get('/', userController.list.bind(userController));

router.get('/:id', userController.getById.bind(userController));

router.patch(
  '/:id',
  validateMiddleware(userSchemas.update),
  userController.update.bind(userController)
);

router.delete('/:id', userController.delete.bind(userController));

export default router;
