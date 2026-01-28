import { Router } from 'express';
import { AdminController } from '../../controllers/AdminController';
import { authMiddleware } from '../../middlewares/auth.middleware';
import { roleMiddleware } from '../../middlewares/role.middleware';

const router = Router();
const adminController = new AdminController();

// Middleware d'authentification et autorisation admin
router.use(authMiddleware);
router.use(roleMiddleware(['admin']));

// Dashboard statistics
router.get('/stats', adminController.getStats.bind(adminController));

// Recent orders
router.get('/orders/recent', adminController.getRecentOrders.bind(adminController));

// Deliverers locations
router.get('/deliverers/locations', adminController.getDeliverersLocations.bind(adminController));

// Users management
router.get('/users', adminController.getUsers.bind(adminController));
router.put('/users/:id/status', adminController.updateUserStatus.bind(adminController));

// Organizations management
router.get('/organizations', adminController.getOrganizations.bind(adminController));

export default router;