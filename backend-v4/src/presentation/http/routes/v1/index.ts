import { Router } from 'express';
import adminRoutes from './admin.routes';
import authRoutes from './auth.routes';
import customerRoutes from './customer.routes';
import delivererRoutes from './deliverer.routes';
import deliveryRoutes from './delivery.routes';
import kitchenRoutes from './kitchen.routes';
import orderRoutes from './order.routes';
import organizationRoutes from './organization.routes';
import paymentRoutes from './payment.routes';
import productRoutes from './product.routes';
import userRoutes from './user.routes';

export function createV1Routes(): Router {
  const router = Router();

  router.get('/health', (req, res) => {
    res.json({
      success: true,
      message: 'API v1 is running',
      timestamp: new Date().toISOString(),
    });
  });

  router.use('/auth', authRoutes);
  router.use('/admin', adminRoutes);
  router.use('/customer', customerRoutes);
  router.use('/deliverer', delivererRoutes);
  router.use('/kitchen', kitchenRoutes);
  router.use('/orders', orderRoutes);
  router.use('/deliveries', deliveryRoutes);
  router.use('/payments', paymentRoutes);
  router.use('/users', userRoutes);
  router.use('/products', productRoutes);
  router.use('/organizations', organizationRoutes);

  return router;
}
