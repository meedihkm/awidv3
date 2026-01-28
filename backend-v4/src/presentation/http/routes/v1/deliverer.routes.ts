import { Router } from 'express';
import { DelivererController } from '../../controllers/DelivererController';
import { authMiddleware } from '../../middlewares/auth.middleware';
import { roleMiddleware } from '../../middlewares/role.middleware';

const router = Router();
const delivererController = new DelivererController();

// Middleware d'authentification et autorisation deliverer
router.use(authMiddleware);
router.use(roleMiddleware(['deliverer', 'admin']));

// Routes pour les livraisons
router.get('/deliveries', delivererController.getDeliveries.bind(delivererController));
router.get('/deliveries/active', delivererController.getActiveDelivery.bind(delivererController));
router.get('/deliveries/:id', delivererController.getDeliveryById.bind(delivererController));

// Routes pour les actions sur les livraisons
router.patch('/deliveries/:id/status', delivererController.updateDeliveryStatus.bind(delivererController));
router.post('/deliveries/:id/start', delivererController.startDelivery.bind(delivererController));
router.post('/deliveries/:id/complete', delivererController.completeDelivery.bind(delivererController));

// Routes pour les statistiques
router.get('/stats', delivererController.getStats.bind(delivererController));

// Routes pour la localisation et navigation
router.post('/location', delivererController.updateLocation.bind(delivererController));
router.post('/route', delivererController.getRoute.bind(delivererController));

export default router;