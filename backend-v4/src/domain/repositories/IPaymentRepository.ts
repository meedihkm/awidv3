/**
 * Repository Interface: IPaymentRepository
 * Port pour la persistence des paiements
 */
import { PaymentMode } from '../entities/Delivery';
import { Payment } from '../entities/Payment';

export interface FindPaymentsOptions {
  organizationId: string;
  customerId?: string;
  collectorId?: string;
  mode?: PaymentMode;
  dateFrom?: Date;
  dateTo?: Date;
  minAmount?: number;
  maxAmount?: number;
  limit?: number;
  offset?: number;
}

export interface IPaymentRepository {
  findById(id: string): Promise<Payment | null>;
  findByCustomer(customerId: string): Promise<Payment[]>;
  findByCollector(collectorId: string): Promise<Payment[]>;
  findMany(options: FindPaymentsOptions): Promise<Payment[]>;
  count(options: FindPaymentsOptions): Promise<number>;
  getTotalByCustomer(customerId: string): Promise<number>;
  save(payment: Payment): Promise<void>;
  update(payment: Payment): Promise<void>;
  delete(id: string): Promise<void>;
  exists(id: string): Promise<boolean>;
}
