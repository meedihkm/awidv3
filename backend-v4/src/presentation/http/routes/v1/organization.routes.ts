import { Router } from 'express';
import { OrganizationController } from '../../controllers/OrganizationController';
import { authMiddleware } from '../../middlewares/auth.middleware';

const router = Router();
const organizationController = new OrganizationController();

router.use(authMiddleware);

router.get('/:id', organizationController.getById.bind(organizationController));

router.patch('/:id', organizationController.update.bind(organizationController));

export default router;
