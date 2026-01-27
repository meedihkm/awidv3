import { Router } from 'express';
import { OrganizationController } from '../../controllers/OrganizationController';
import { authenticate } from '../../middlewares/auth.middleware';

const router = Router();
const organizationController = new OrganizationController();

router.use(authenticate);

router.get('/:id', organizationController.getById.bind(organizationController));

router.patch('/:id', organizationController.update.bind(organizationController));

export default router;
