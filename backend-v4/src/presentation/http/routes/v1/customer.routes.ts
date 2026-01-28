import { Router } from 'express';
import { CustomerController } from '../../controllers/CustomerController';
import { authMiddleware } from '../../middlewares/auth.middleware';

const router = Router();
const customerController = new CustomerController();

// Middleware d'authentification
router.use(authMiddleware);

// Routes pour les commandes
router.get('/orders', customerController.getOrders.bind(customerController));
router.get('/orders/search', customerController.searchOrders.bind(customerController));
router.get('/orders/:id', customerController.getOrder.bind(customerController));

// Routes pour les livraisons
router.get('/deliveries/active', customerController.getActiveDeliveries.bind(customerController));
router.get('/deliveries/history', customerController.getDeliveriesHistory.bind(customerController));
router.get('/deliveries/:id', customerController.getDelivery.bind(customerController));

// Routes pour le compte
router.get('/account/:id', customerController.getAccountInfo.bind(customerController));
router.get('/account/:id/credit', customerController.getCreditInfo.bind(customerController));
router.get('/account/:id/packaging', customerController.getPackagingInfo.bind(customerController));
router.put('/account/:id/settings', customerController.updateSettings.bind(customerController));

// Routes pour les contacts
router.post('/account/:id/contacts', customerController.addContact.bind(customerController));
router.put('/account/:id/contacts/:contactId', customerController.updateContact.bind(customerController));
router.delete('/account/:id/contacts/:contactId', customerController.deleteContact.bind(customerController));

// Routes pour les notifications
router.get('/notifications', customerController.getNotifications.bind(customerController));
router.get('/notifications/unread/count', customerController.getUnreadNotificationsCount.bind(customerController));
router.put('/notifications/:id/read', customerController.markNotificationAsRead.bind(customerController));
router.put('/notifications/read-all', customerController.markAllNotificationsAsRead.bind(customerController));
router.delete('/notifications/:id', customerController.deleteNotification.bind(customerController));
router.delete('/notifications/read', customerController.deleteReadNotifications.bind(customerController));

export default router;