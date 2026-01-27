/**
 * Repository Interface: IDeliveryRepository
 * Port pour la persistence des livraisons
 */
import { Delivery, DeliveryStatus } from '../entities/Delivery';

export interface FindDeliveriesOptions {
  organizationId: string;
  delivererId?: string;
  status?: DeliveryStatus;
  dateFrom?: Date;
  dateTo?: Date;
  limit?: number;
  offset?: number;
  sortBy?: 'createdAt' | 'priority' | 'status';
  sortOrder?: 'asc' | 'desc';
}

export interface IDeliveryRepository {
  findById(id: string): Promise<Delivery | null>;
  findByOrder(orderId: string): Promise<Delivery | null>;
  findByDeliverer(delivererId: string): Promise<Delivery[]>;
  findActiveByDeliverer(delivererId: string): Promise<Delivery[]>;
  findMany(options: FindDeliveriesOptions): Promise<Delivery[]>;
  count(options: FindDeliveriesOptions): Promise<number>;
  save(delivery: Delivery): Promise<void>;
  update(delivery: Delivery): Promise<void>;
  delete(id: string): Promise<void>;
  exists(id: string): Promise<boolean>;
}
