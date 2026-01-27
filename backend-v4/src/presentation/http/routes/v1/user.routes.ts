import { Router } from 'express';
import { userSchemas } from '../../../../application/validators/user.schema';
import { UserController } from '../../controllers/UserController';
import { authMiddleware } from '../../middlewares/auth.middleware';
import { validateBody } from '../../middlewares/validate.middleware';

const router = Router();
const userController = new UserController();

router.use(authMiddleware);

router.post(
  '/',
  validateBody(userSchemas.create),
  userController.create.bind(userController)
);

router.get('/', userController.list.bind(userController));

router.get('/:id', userController.getById.bind(userController));

router.patch(
  '/:id',
  validateBody(userSchemas.update),
  userController.update.bind(userController)
);

router.delete('/:id', userController.delete.bind(userController));

export default router;
