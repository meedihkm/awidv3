/**
 * Repository Interface: IOrderRepository
 * Port pour la persistence des commandes
 */
import { Order, OrderPriority, PaymentStatus } from '../entities/Order';
import { OrderStatus } from '../value-objects/OrderStatus';

export interface FindOrdersOptions {
  organizationId: string;
  customerId?: string;
  delivererId?: string;
  status?: OrderStatus;
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
  findByOrderNumber(organizationId: string, orderNumber: string): Promise<Order | null>;
  findByOrganization(organizationId: string, limit?: number, offset?: number): Promise<Order[]>;
  findByCustomer(customerId: string, limit?: number, offset?: number): Promise<Order[]>;
  findByStatus(organizationId: string, status: OrderStatus): Promise<Order[]>;
  create(order: Order): Promise<Order>;
  update(order: Order): Promise<Order>;
  delete(id: string): Promise<void>;
  updateStatus(orderId: string, status: OrderStatus): Promise<void>;
}
