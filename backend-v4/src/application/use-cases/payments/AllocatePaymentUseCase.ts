import { IOrderRepository } from '../../../domain/repositories/IOrderRepository';
import { IPaymentRepository } from '../../../domain/repositories/IPaymentRepository';
import { Money } from '../../../domain/value-objects/Money';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { ValidationError } from '../../../shared/errors/ValidationError';

interface AllocatePaymentInput {
  paymentId: string;
  allocations: Array<{
    orderId: string;
    amount: number;
  }>;
  userId: string;
  userRole: string;
  organizationId: string;
}

interface AllocatePaymentOutput {
  success: boolean;
  payment: {
    id: string;
    allocations: Array<{
      orderId: string;
      amount: number;
    }>;
  };
}

export class AllocatePaymentUseCase {
  constructor(
    private paymentRepository: IPaymentRepository,
    private orderRepository: IOrderRepository
  ) {}

  async execute(input: AllocatePaymentInput): Promise<AllocatePaymentOutput> {
    if (!['admin', 'deliverer'].includes(input.userRole)) {
      throw new ForbiddenError('Only admin and deliverers can allocate payments');
    }

    const payment = await this.paymentRepository.findById(input.paymentId);
    if (!payment) {
      throw new NotFoundError('Payment not found');
    }

    if (payment.getOrganizationId() !== input.organizationId) {
      throw new ForbiddenError('Access denied');
    }

    let totalAllocated = 0;
    for (const allocation of input.allocations) {
      totalAllocated += allocation.amount;
    }

    if (totalAllocated > payment.getAmount().getAmount()) {
      throw new ValidationError('Total allocated amount exceeds payment amount');
    }

    for (const allocation of input.allocations) {
      const order = await this.orderRepository.findById(allocation.orderId);
      if (!order) {
        throw new NotFoundError(`Order ${allocation.orderId} not found`);
      }

      if (order.getCustomerId() !== payment.getCustomerId()) {
        throw new ValidationError(`Order ${allocation.orderId} does not belong to this customer`);
      }

      await this.paymentRepository.allocateToOrder(
        input.paymentId,
        allocation.orderId,
        Money.fromCents(allocation.amount, 'DZD')
      );
    }

    await this.paymentRepository.confirm(input.paymentId);

    const updatedPayment = await this.paymentRepository.findById(input.paymentId);

    return {
      success: true,
      payment: {
        id: updatedPayment!.getId(),
        allocations: updatedPayment!.getAllocations().map((alloc) => ({
          orderId: alloc.orderId,
          amount: alloc.amount.getAmount(),
        })),
      },
    };
  }
}
