import { Router } from 'express';
import { KitchenController } from '../../controllers/KitchenController';
import { authMiddleware } from '../../middlewares/auth.middleware';
import { roleMiddleware } from '../../middlewares/role.middleware';

const router = Router();
const kitchenController = new KitchenController();

// Middleware d'authentification et autorisation kitchen
router.use(authMiddleware);
router.use(roleMiddleware(['kitchen', 'admin']));

// Routes pour les commandes
router.get('/orders', kitchenController.getOrders.bind(kitchenController));
router.get('/orders/:id', kitchenController.getOrderById.bind(kitchenController));
router.post('/orders/:id/status', kitchenController.updateOrderStatus.bind(kitchenController));
router.post('/orders/:id/assign', kitchenController.assignOrderToStation.bind(kitchenController));
router.patch('/orders/:id/priority', kitchenController.updateOrderPriority.bind(kitchenController));
router.patch('/orders/:id/notes', kitchenController.updateOrderNotes.bind(kitchenController));
router.post('/orders/:orderId/items/:itemId/prepared', kitchenController.markItemPrepared.bind(kitchenController));

// Routes pour les statistiques
router.get('/stats', kitchenController.getStats.bind(kitchenController));
router.get('/stats/period', kitchenController.getPeriodStats.bind(kitchenController));
router.get('/stats/hourly', kitchenController.getHourlyStats.bind(kitchenController));

// Routes pour les stations
router.get('/stations', kitchenController.getStations.bind(kitchenController));
router.get('/stations/:id', kitchenController.getStationById.bind(kitchenController));
router.patch('/stations/:id/status', kitchenController.updateStationStatus.bind(kitchenController));
router.post('/stations/:id/assign', kitchenController.assignStaffToStation.bind(kitchenController));

// Routes pour le stock
router.get('/stock', kitchenController.getStock.bind(kitchenController));
router.get('/stock/:id', kitchenController.getStockItemById.bind(kitchenController));
router.post('/stock', kitchenController.createStockItem.bind(kitchenController));
router.patch('/stock/:id', kitchenController.updateStockItem.bind(kitchenController));
router.post('/stock/:id/adjust', kitchenController.adjustStockQuantity.bind(kitchenController));
router.get('/stock/movements', kitchenController.getStockMovements.bind(kitchenController));
router.get('/stock/alerts', kitchenController.getStockAlerts.bind(kitchenController));
router.post('/stock/alerts/:id/resolve', kitchenController.resolveStockAlert.bind(kitchenController));

// Routes pour les tâches de production
router.get('/tasks', kitchenController.getProductionTasks.bind(kitchenController));
router.get('/tasks/:id', kitchenController.getTaskById.bind(kitchenController));
router.patch('/tasks/:id/status', kitchenController.updateTaskStatus.bind(kitchenController));
router.post('/tasks/:id/assign', kitchenController.assignTask.bind(kitchenController));
router.post('/tasks/:taskId/steps/:stepId/complete', kitchenController.completeTaskStep.bind(kitchenController));

export default router;