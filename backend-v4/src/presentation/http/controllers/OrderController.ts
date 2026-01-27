import { NextFunction, Request, Response } from 'express';
import {
    AssignDelivererUseCase,
    CancelOrderUseCase,
    CreateOrderUseCase,
    GetOrderUseCase,
    ListOrdersUseCase,
    UpdateOrderStatusUseCase,
} from '../../../application/use-cases/orders';
import {
    PostgresOrderRepository,
    PostgresProductRepository,
    PostgresUserRepository,
} from '../../../infrastructure/database/repositories';

export class OrderController {
  private createOrderUseCase: CreateOrderUseCase;
  private getOrderUseCase: GetOrderUseCase;
  private listOrdersUseCase: ListOrdersUseCase;
  private updateOrderStatusUseCase: UpdateOrderStatusUseCase;
  private cancelOrderUseCase: CancelOrderUseCase;
  private assignDelivererUseCase: AssignDelivererUseCase;

  constructor() {
    const orderRepository = new PostgresOrderRepository();
    const userRepository = new PostgresUserRepository();
    const productRepository = new PostgresProductRepository();

    this.createOrderUseCase = new CreateOrderUseCase(
      orderRepository,
      userRepository,
      productRepository
    );
    this.getOrderUseCase = new GetOrderUseCase(orderRepository);
    this.listOrdersUseCase = new ListOrdersUseCase(orderRepository);
    this.updateOrderStatusUseCase = new UpdateOrderStatusUseCase(orderRepository);
    this.cancelOrderUseCase = new CancelOrderUseCase(orderRepository);
    this.assignDelivererUseCase = new AssignDelivererUseCase(orderRepository, userRepository);
  }

  async create(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.createOrderUseCase.execute({
        ...req.body,
        userId: req.user!.userId,
        userRole: req.user!.role,
        organizationId: req.user!.organizationId,
      });

      res.status(201).json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async getById(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.getOrderUseCase.execute({
        orderId: req.params.id,
        userId: req.user!.userId,
        userRole: req.user!.role,
        organizationId: req.user!.organizationId,
      });

      res.json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async list(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const { customerId, status, limit, offset } = req.query;

      const result = await this.listOrdersUseCase.execute({
        userId: req.user!.userId,
        userRole: req.user!.role,
        organizationId: req.user!.organizationId,
        customerId: customerId as string,
        status: status as string,
        limit: limit ? parseInt(limit as string) : undefined,
        offset: offset ? parseInt(offset as string) : undefined,
      });

      res.json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async updateStatus(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.updateOrderStatusUseCase.execute({
        orderId: req.params.id,
        status: req.body.status,
        userId: req.user!.userId,
        userRole: req.user!.role,
        organizationId: req.user!.organizationId,
      });

      res.json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async cancel(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.cancelOrderUseCase.execute({
        orderId: req.params.id,
        userId: req.user!.userId,
        userRole: req.user!.role,
        organizationId: req.user!.organizationId,
        reason: req.body.reason,
      });

      res.json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async assignDeliverer(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.assignDelivererUseCase.execute({
        orderId: req.params.id,
        delivererId: req.body.delivererId,
        userId: req.user!.userId,
        userRole: req.user!.role,
        organizationId: req.user!.organizationId,
      });

      res.json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }
}
