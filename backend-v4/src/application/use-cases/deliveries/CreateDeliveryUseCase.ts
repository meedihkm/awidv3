import { Delivery } from '../../../domain/entities/Delivery';
import { IDeliveryRepository } from '../../../domain/repositories/IDeliveryRepository';
import { IOrderRepository } from '../../../domain/repositories/IOrderRepository';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { ValidationError } from '../../../shared/errors/ValidationError';

interface CreateDeliveryInput {
  orderId: string;
  delivererId?: string;
  userId: string;
  userRole: string;
  organizationId: string;
}

interface CreateDeliveryOutput {
  delivery: {
    id: string;
    deliveryNumber: string;
    orderId: string;
    status: string;
    createdAt: Date;
  };
}

export class CreateDeliveryUseCase {
  constructor(
    private deliveryRepository: IDeliveryRepository,
    private orderRepository: IOrderRepository
  ) {}

  async execute(input: CreateDeliveryInput): Promise<CreateDeliveryOutput> {
    if (!['admin', 'kitchen'].includes(input.userRole)) {
      throw new ForbiddenError('Only admin and kitchen can create deliveries');
    }

    const order = await this.orderRepository.findById(input.orderId);
    if (!order) {
      throw new NotFoundError('Order not found');
    }

    if (order.getOrganizationId() !== input.organizationId) {
      throw new ForbiddenError('Access denied');
    }

    const existingDelivery = await this.deliveryRepository.findByOrder(input.orderId);
    if (existingDelivery) {
      throw new ValidationError('Delivery already exists for this order');
    }

    const delivery = Delivery.create({
      organizationId: input.organizationId,
      orderId: input.orderId,
      delivererId: input.delivererId,
      status: input.delivererId ? 'assigned' : 'pending',
      deliveryAddress: order.getDeliveryAddress(),
    });

    const createdDelivery = await this.deliveryRepository.create(delivery);

    return {
      delivery: {
        id: createdDelivery.getId(),
        deliveryNumber: createdDelivery.getDeliveryNumber(),
        orderId: createdDelivery.getOrderId(),
        status: createdDelivery.getStatus(),
        createdAt: createdDelivery.getCreatedAt(),
      },
    };
  }
}
