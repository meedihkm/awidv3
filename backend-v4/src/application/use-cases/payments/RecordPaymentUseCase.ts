import { Payment } from '../../../domain/entities/Payment';
import { IPaymentRepository } from '../../../domain/repositories/IPaymentRepository';
import { IUserRepository } from '../../../domain/repositories/IUserRepository';
import { Money } from '../../../domain/value-objects/Money';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';

interface RecordPaymentInput {
  customerId: string;
  amount: number;
  paymentMethod: string;
  deliveryId?: string;
  checkNumber?: string;
  checkBank?: string;
  checkDate?: Date;
  transferReference?: string;
  notes?: string;
  userId: string;
  userRole: string;
  organizationId: string;
}

interface RecordPaymentOutput {
  payment: {
    id: string;
    paymentNumber: string;
    amount: number;
    paymentMethod: string;
    status: string;
    createdAt: Date;
  };
}

export class RecordPaymentUseCase {
  constructor(
    private paymentRepository: IPaymentRepository,
    private userRepository: IUserRepository
  ) {}

  async execute(input: RecordPaymentInput): Promise<RecordPaymentOutput> {
    if (!['admin', 'deliverer'].includes(input.userRole)) {
      throw new ForbiddenError('Only admin and deliverers can record payments');
    }

    const customer = await this.userRepository.findById(input.customerId);
    if (!customer) {
      throw new NotFoundError('Customer not found');
    }

    if (customer.getOrganizationId() !== input.organizationId) {
      throw new ForbiddenError('Access denied');
    }

    if (customer.getRole() !== 'customer') {
      throw new ForbiddenError('User is not a customer');
    }

    const payment = Payment.create({
      organizationId: input.organizationId,
      customerId: input.customerId,
      deliveryId: input.deliveryId,
      amount: Money.fromCents(input.amount, 'DZD'),
      paymentMethod: input.paymentMethod,
      checkNumber: input.checkNumber,
      checkBank: input.checkBank,
      checkDate: input.checkDate,
      transferReference: input.transferReference,
      status: 'pending',
      paymentDate: new Date(),
      allocations: [],
      notes: input.notes,
    });

    const createdPayment = await this.paymentRepository.create(payment);

    return {
      payment: {
        id: createdPayment.getId(),
        paymentNumber: createdPayment.getPaymentNumber(),
        amount: createdPayment.getAmount().getAmount(),
        paymentMethod: createdPayment.getPaymentMethod(),
        status: createdPayment.getStatus(),
        createdAt: createdPayment.getCreatedAt(),
      },
    };
  }
}
