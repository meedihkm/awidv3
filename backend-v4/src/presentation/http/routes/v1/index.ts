import { Router } from 'express';
import authRoutes from './auth.routes';
import deliveryRoutes from './delivery.routes';
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
  router.use('/orders', orderRoutes);
  router.use('/deliveries', deliveryRoutes);
  router.use('/payments', paymentRoutes);
  router.use('/users', userRoutes);
  router.use('/products', productRoutes);
  router.use('/organizations', organizationRoutes);

  return router;
}
