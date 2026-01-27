import { NextFunction, Request, Response } from 'express';
import {
    AllocatePaymentUseCase,
    GetPaymentHistoryUseCase,
    RecordPaymentUseCase,
} from '../../../application/use-cases/payments';
import {
    PostgresOrderRepository,
    PostgresPaymentRepository,
    PostgresUserRepository,
} from '../../../infrastructure/database/repositories';

export class PaymentController {
  private recordPaymentUseCase: RecordPaymentUseCase;
  private allocatePaymentUseCase: AllocatePaymentUseCase;
  private getPaymentHistoryUseCase: GetPaymentHistoryUseCase;

  constructor() {
    const paymentRepository = new PostgresPaymentRepository();
    const userRepository = new PostgresUserRepository();
    const orderRepository = new PostgresOrderRepository();

    this.recordPaymentUseCase = new RecordPaymentUseCase(paymentRepository, userRepository);
    this.allocatePaymentUseCase = new AllocatePaymentUseCase(paymentRepository, orderRepository);
    this.getPaymentHistoryUseCase = new GetPaymentHistoryUseCase(paymentRepository);
  }

  async record(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.recordPaymentUseCase.execute({
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

  async allocate(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.allocatePaymentUseCase.execute({
        paymentId: req.params.id,
        allocations: req.body.allocations,
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

  async getHistory(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const { customerId, limit, offset } = req.query;

      const result = await this.getPaymentHistoryUseCase.execute({
        customerId: customerId as string,
        userId: req.user!.userId,
        userRole: req.user!.role,
        organizationId: req.user!.organizationId,
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
}
