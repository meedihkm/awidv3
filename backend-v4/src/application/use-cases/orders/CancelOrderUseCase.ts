import { IOrderRepository } from '../../../domain/repositories/IOrderRepository';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { ValidationError } from '../../../shared/errors/ValidationError';

interface CancelOrderInput {
  orderId: string;
  userId: string;
  userRole: string;
  organizationId: string;
  reason?: string;
}

interface CancelOrderOutput {
  success: boolean;
  order: {
    id: string;
    status: string;
    cancelledAt: Date;
  };
}

export class CancelOrderUseCase {
  constructor(private orderRepository: IOrderRepository) {}

  async execute(input: CancelOrderInput): Promise<CancelOrderOutput> {
    const order = await this.orderRepository.findById(input.orderId);
    if (!order) {
      throw new NotFoundError('Order not found');
    }

    if (order.getOrganizationId() !== input.organizationId) {
      throw new ForbiddenError('Access denied');
    }

    if (input.userRole === 'customer' && order.getCustomerId() !== input.userId) {
      throw new ForbiddenError('Access denied');
    }

    const currentStatus = order.getStatus().getValue();
    if (['delivered', 'cancelled'].includes(currentStatus)) {
      throw new ValidationError(`Cannot cancel order with status: ${currentStatus}`);
    }

    order.cancel();

    const updatedOrder = await this.orderRepository.update(order);

    return {
      success: true,
      order: {
        id: updatedOrder.getId(),
        status: updatedOrder.getStatus().getValue(),
        cancelledAt: updatedOrder.getCancelledAt()!,
      },
    };
  }
}
