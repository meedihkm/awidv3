import { IOrderRepository } from '../../../domain/repositories/IOrderRepository';
import { IUserRepository } from '../../../domain/repositories/IUserRepository';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { ValidationError } from '../../../shared/errors/ValidationError';

interface AssignDelivererInput {
  orderId: string;
  delivererId: string;
  userId: string;
  userRole: string;
  organizationId: string;
}

interface AssignDelivererOutput {
  success: boolean;
  order: {
    id: string;
    delivererId: string;
  };
}

export class AssignDelivererUseCase {
  constructor(
    private orderRepository: IOrderRepository,
    private userRepository: IUserRepository
  ) {}

  async execute(input: AssignDelivererInput): Promise<AssignDelivererOutput> {
    if (!['admin', 'kitchen'].includes(input.userRole)) {
      throw new ForbiddenError('Only admin and kitchen can assign deliverers');
    }

    const order = await this.orderRepository.findById(input.orderId);
    if (!order) {
      throw new NotFoundError('Order not found');
    }

    if (order.getOrganizationId() !== input.organizationId) {
      throw new ForbiddenError('Access denied');
    }

    const deliverer = await this.userRepository.findById(input.delivererId);
    if (!deliverer) {
      throw new NotFoundError('Deliverer not found');
    }

    if (deliverer.getRole() !== 'deliverer') {
      throw new ValidationError('User is not a deliverer');
    }

    if (deliverer.getOrganizationId() !== input.organizationId) {
      throw new ForbiddenError('Deliverer belongs to different organization');
    }

    if (!deliverer.isAvailable()) {
      throw new ValidationError('Deliverer is not available');
    }

    const updatedOrder = await this.orderRepository.update(order);

    return {
      success: true,
      order: {
        id: updatedOrder.getId(),
        delivererId: input.delivererId,
      },
    };
  }
}
