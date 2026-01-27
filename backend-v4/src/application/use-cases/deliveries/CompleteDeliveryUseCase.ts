import { IDeliveryRepository } from '../../../domain/repositories/IDeliveryRepository';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { ValidationError } from '../../../shared/errors/ValidationError';

interface CompleteDeliveryInput {
  deliveryId: string;
  userId: string;
  userRole: string;
  organizationId: string;
  proofOfDelivery?: {
    type: string;
    signatureUrl?: string;
    photoUrl?: string;
    recipientName?: string;
    notes?: string;
  };
}

interface CompleteDeliveryOutput {
  success: boolean;
  delivery: {
    id: string;
    status: string;
    deliveredAt: Date;
  };
}

export class CompleteDeliveryUseCase {
  constructor(private deliveryRepository: IDeliveryRepository) {}

  async execute(input: CompleteDeliveryInput): Promise<CompleteDeliveryOutput> {
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
      throw new ForbiddenError('Customers cannot complete deliveries');
    }

    if (delivery.getStatus() === 'delivered') {
      throw new ValidationError('Delivery is already completed');
    }

    if (input.proofOfDelivery) {
      delivery.recordProofOfDelivery(input.proofOfDelivery);
    }

    delivery.complete();

    const updatedDelivery = await this.deliveryRepository.update(delivery);

    return {
      success: true,
      delivery: {
        id: updatedDelivery.getId(),
        status: updatedDelivery.getStatus(),
        deliveredAt: updatedDelivery.getDeliveredAt()!,
      },
    };
  }
}
