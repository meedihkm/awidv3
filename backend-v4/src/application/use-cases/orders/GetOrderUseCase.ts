import { IOrderRepository } from '../../../domain/repositories/IOrderRepository';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';

interface GetOrderInput {
  orderId: string;
  userId: string;
  userRole: string;
  organizationId: string;
}

interface GetOrderOutput {
  order: {
    id: string;
    orderNumber: string;
    status: string;
    customer: {
      id: string;
    };
    items: Array<{
      id: string;
      productId: string;
      productName: string;
      quantity: number;
      unitPrice: number;
      total: number;
    }>;
    subtotal: number;
    discount: number;
    tax: number;
    total: number;
    paymentStatus: string;
    amountPaid: number;
    amountDue: number;
    deliveryAddress: {
      street: string;
      city: string;
      state: string;
      postalCode: string;
    };
    createdAt: Date;
    updatedAt: Date;
  };
}

export class GetOrderUseCase {
  constructor(private orderRepository: IOrderRepository) {}

  async execute(input: GetOrderInput): Promise<GetOrderOutput> {
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

    const deliveryAddress = order.getDeliveryAddress();

    return {
      order: {
        id: order.getId(),
        orderNumber: order.getOrderNumber(),
        status: order.getStatus().getValue(),
        customer: {
          id: order.getCustomerId(),
        },
        items: order.getItems().map((item) => ({
          id: item.id,
          productId: item.productId,
          productName: item.productName,
          quantity: item.quantity,
          unitPrice: item.unitPrice.getAmount(),
          total: item.total.getAmount(),
        })),
        subtotal: order.getSubtotal().getAmount(),
        discount: order.getDiscount().getAmount(),
        tax: order.getTax().getAmount(),
        total: order.getTotal().getAmount(),
        paymentStatus: order.getPaymentStatus(),
        amountPaid: order.getAmountPaid().getAmount(),
        amountDue: order.getAmountDue().getAmount(),
        deliveryAddress: {
          street: deliveryAddress.street,
          city: deliveryAddress.city,
          state: deliveryAddress.state,
          postalCode: deliveryAddress.postalCode,
        },
        createdAt: order.getCreatedAt(),
        updatedAt: order.getUpdatedAt(),
      },
    };
  }
}
