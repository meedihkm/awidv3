import { NextFunction, Request, Response } from 'express';
import {
    CompleteDeliveryUseCase,
    CreateDeliveryUseCase,
    GetDeliveryTrackingUseCase,
    RecordTrackingUseCase,
    UpdateDeliveryStatusUseCase,
} from '../../../application/use-cases/deliveries';
import {
    PostgresDeliveryRepository,
    PostgresOrderRepository,
} from '../../../infrastructure/database/repositories';

export class DeliveryController {
  private createDeliveryUseCase: CreateDeliveryUseCase;
  private updateDeliveryStatusUseCase: UpdateDeliveryStatusUseCase;
  private completeDeliveryUseCase: CompleteDeliveryUseCase;
  private recordTrackingUseCase: RecordTrackingUseCase;
  private getDeliveryTrackingUseCase: GetDeliveryTrackingUseCase;

  constructor() {
    const deliveryRepository = new PostgresDeliveryRepository();
    const orderRepository = new PostgresOrderRepository();

    this.createDeliveryUseCase = new CreateDeliveryUseCase(deliveryRepository, orderRepository);
    this.updateDeliveryStatusUseCase = new UpdateDeliveryStatusUseCase(deliveryRepository);
    this.completeDeliveryUseCase = new CompleteDeliveryUseCase(deliveryRepository);
    this.recordTrackingUseCase = new RecordTrackingUseCase(deliveryRepository);
    this.getDeliveryTrackingUseCase = new GetDeliveryTrackingUseCase(deliveryRepository);
  }

  async create(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.createDeliveryUseCase.execute({
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

  async updateStatus(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.updateDeliveryStatusUseCase.execute({
        deliveryId: req.params.id,
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

  async complete(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.completeDeliveryUseCase.execute({
        deliveryId: req.params.id,
        userId: req.user!.userId,
        userRole: req.user!.role,
        organizationId: req.user!.organizationId,
        proofOfDelivery: req.body.proofOfDelivery,
      });

      res.json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async recordTracking(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.recordTrackingUseCase.execute({
        deliveryId: req.params.id,
        userId: req.user!.userId,
        userRole: req.user!.role,
        latitude: req.body.latitude,
        longitude: req.body.longitude,
      });

      res.json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async getTracking(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.getDeliveryTrackingUseCase.execute({
        deliveryId: req.params.id,
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
