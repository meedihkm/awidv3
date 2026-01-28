/**
 * Repository Interface: IDeliveryRepository
 * Port pour la persistence des livraisons
 */
import { Delivery, DeliveryStatus } from '../entities/Delivery';
import { Coordinates } from '../value-objects/Coordinates';

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
  findByDeliveryNumber(organizationId: string, deliveryNumber: string): Promise<Delivery | null>;
  findByOrder(orderId: string): Promise<Delivery | null>;
  findByDeliverer(delivererId: string, limit?: number, offset?: number): Promise<Delivery[]>;
  findActive(organizationId: string): Promise<Delivery[]>;
  findByStatus(organizationId: string, status: string): Promise<Delivery[]>;
  create(delivery: Delivery): Promise<Delivery>;
  update(delivery: Delivery): Promise<Delivery>;
  delete(id: string): Promise<void>;
  updateStatus(deliveryId: string, status: string): Promise<void>;
  assignDeliverer(deliveryId: string, delivererId: string): Promise<void>;
  recordTracking(deliveryId: string, delivererId: string, location: Coordinates): Promise<void>;
  getTrackingHistory(deliveryId: string): Promise<Array<{ location: Coordinates; timestamp: Date }>>;
  getLatestLocation(deliveryId: string): Promise<Coordinates | null>;
}
