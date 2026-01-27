import { IOrderRepository } from '../../../domain/repositories/IOrderRepository';

interface ListOrdersInput {
  userId: string;
  userRole: string;
  organizationId: string;
  customerId?: string;
  status?: string;
  limit?: number;
  offset?: number;
}

interface ListOrdersOutput {
  orders: Array<{
    id: string;
    orderNumber: string;
    status: string;
    customerId: string;
    total: number;
    paymentStatus: string;
    createdAt: Date;
  }>;
  total: number;
}

export class ListOrdersUseCase {
  constructor(private orderRepository: IOrderRepository) {}

  async execute(input: ListOrdersInput): Promise<ListOrdersOutput> {
    let orders;

    if (input.userRole === 'customer') {
      orders = await this.orderRepository.findByCustomer(
        input.userId,
        input.limit,
        input.offset
      );
    } else if (input.customerId) {
      orders = await this.orderRepository.findByCustomer(
        input.customerId,
        input.limit,
        input.offset
      );
    } else if (input.status) {
      const { OrderStatus } = await import('../../../domain/value-objects/OrderStatus');
      const statusValue = OrderStatus.fromString(input.status);
      orders = await this.orderRepository.findByStatus(input.organizationId, statusValue);
    } else {
      orders = await this.orderRepository.findByOrganization(
        input.organizationId,
        input.limit,
        input.offset
      );
    }

    return {
      orders: orders.map((order) => ({
        id: order.getId(),
        orderNumber: order.getOrderNumber(),
        status: order.getStatus().getValue(),
        customerId: order.getCustomerId(),
        total: order.getTotal().getAmount(),
        paymentStatus: order.getPaymentStatus(),
        createdAt: order.getCreatedAt(),
      })),
      total: orders.length,
    };
  }
}
