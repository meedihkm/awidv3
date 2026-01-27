import { IDeliveryRepository } from '../../../domain/repositories/IDeliveryRepository';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';

interface UpdateDeliveryStatusInput {
  deliveryId: string;
  status: string;
  userId: string;
  userRole: string;
  organizationId: string;
}

interface UpdateDeliveryStatusOutput {
  success: boolean;
  delivery: {
    id: string;
    status: string;
    updatedAt: Date;
  };
}

export class UpdateDeliveryStatusUseCase {
  constructor(private deliveryRepository: IDeliveryRepository) {}

  async execute(input: UpdateDeliveryStatusInput): Promise<UpdateDeliveryStatusOutput> {
    const delivery = await this.deliveryRepository.findById(input.deliveryId);
    if (!delivery) {
      throw new NotFoundError('Delivery not found');
    }

    if (delivery.getOrganizationId() !== input.organizationId) {
      throw new ForbiddenError('Access denied');
    }

    if (input.userRole === 'deliverer' && delivery.getDelivererId() !== input.userId) {
      throw new ForbiddenError('Access denied');
    }

    if (input.userRole === 'customer') {
      throw new ForbiddenError('Customers cannot update delivery status');
    }

    await this.deliveryRepository.updateStatus(input.deliveryId, input.status);

    const updatedDelivery = await this.deliveryRepository.findById(input.deliveryId);

    return {
      success: true,
      delivery: {
        id: updatedDelivery!.getId(),
        status: updatedDelivery!.getStatus(),
        updatedAt: updatedDelivery!.getUpdatedAt(),
      },
    };
  }
}
