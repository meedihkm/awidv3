import { IOrderRepository } from '../../../domain/repositories/IOrderRepository';
import { OrderStatus } from '../../../domain/value-objects/OrderStatus';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';

interface UpdateOrderStatusInput {
  orderId: string;
  status: string;
  userId: string;
  userRole: string;
  organizationId: string;
}

interface UpdateOrderStatusOutput {
  success: boolean;
  order: {
    id: string;
    status: string;
    updatedAt: Date;
  };
}

export class UpdateOrderStatusUseCase {
  constructor(private orderRepository: IOrderRepository) {}

  async execute(input: UpdateOrderStatusInput): Promise<UpdateOrderStatusOutput> {
    const order = await this.orderRepository.findById(input.orderId);
    if (!order) {
      throw new NotFoundError('Order not found');
    }

    if (order.getOrganizationId() !== input.organizationId) {
      throw new ForbiddenError('Access denied');
    }

    if (input.userRole === 'customer') {
      throw new ForbiddenError('Customers cannot update order status');
    }

    const newStatus = OrderStatus.fromString(input.status);
    order.updateStatus(newStatus);

    const updatedOrder = await this.orderRepository.update(order);

    return {
      success: true,
      order: {
        id: updatedOrder.getId(),
        status: updatedOrder.getStatus().getValue(),
        updatedAt: updatedOrder.getUpdatedAt(),
      },
    };
  }
}
