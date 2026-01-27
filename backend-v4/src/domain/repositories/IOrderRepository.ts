/**
 * Repository Interface: IOrderRepository
 * Port pour la persistence des commandes
 */
import { Order, OrderPriority, PaymentStatus } from '../entities/Order';
import { OrderStatusEnum } from '../value-objects/OrderStatus';

export interface FindOrdersOptions {
  organizationId: string;
  customerId?: string;
  delivererId?: string;
  status?: OrderStatusEnum;
  paymentStatus?: PaymentStatus;
  priority?: OrderPriority;
  dateFrom?: Date;
  dateTo?: Date;
  search?: string;
  limit?: number;
  offset?: number;
  sortBy?: 'createdAt' | 'deliveryDate' | 'total' | 'status';
  sortOrder?: 'asc' | 'desc';
}

export interface IOrderRepository {
  findById(id: string): Promise<Order | null>;
  findByCustomer(customerId: string): Promise<Order[]>;
  findByDeliverer(delivererId: string): Promise<Order[]>;
  findByStatus(organizationId: string, status: OrderStatusEnum): Promise<Order[]>;
  findMany(options: FindOrdersOptions): Promise<Order[]>;
  count(options: FindOrdersOptions): Promise<number>;
  save(order: Order): Promise<void>;
  update(order: Order): Promise<void>;
  delete(id: string): Promise<void>;
  exists(id: string): Promise<boolean>;
}
