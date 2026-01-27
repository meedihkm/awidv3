import { IPaymentRepository } from '../../../domain/repositories/IPaymentRepository';

interface GetPaymentHistoryInput {
  customerId?: string;
  userId: string;
  userRole: string;
  organizationId: string;
  limit?: number;
  offset?: number;
}

interface GetPaymentHistoryOutput {
  payments: Array<{
    id: string;
    paymentNumber: string;
    amount: number;
    paymentMethod: string;
    status: string;
    paymentDate: Date;
    allocations: Array<{
      orderId: string;
      amount: number;
    }>;
  }>;
  total: number;
}

export class GetPaymentHistoryUseCase {
  constructor(private paymentRepository: IPaymentRepository) {}

  async execute(input: GetPaymentHistoryInput): Promise<GetPaymentHistoryOutput> {
    let payments;

    if (input.userRole === 'customer') {
      payments = await this.paymentRepository.findByCustomer(
        input.userId,
        input.limit,
        input.offset
      );
    } else if (input.customerId) {
      payments = await this.paymentRepository.findByCustomer(
        input.customerId,
        input.limit,
        input.offset
      );
    } else {
      payments = await this.paymentRepository.findByOrganization(
        input.organizationId,
        input.limit,
        input.offset
      );
    }

    return {
      payments: payments.map((payment) => ({
        id: payment.getId(),
        paymentNumber: payment.getPaymentNumber(),
        amount: payment.getAmount().getAmount(),
        paymentMethod: payment.getPaymentMethod(),
        status: payment.getStatus(),
        paymentDate: payment.getPaymentDate(),
        allocations: payment.getAllocations().map((alloc) => ({
          orderId: alloc.orderId,
          amount: alloc.amount.getAmount(),
        })),
      })),
      total: payments.length,
    };
  }
}
