/**
 * Domain Event: OrderDelivered
 * Déclenché quand une commande est livrée
 */
import { DomainEvent } from './DomainEvent';

export class OrderDelivered extends DomainEvent {
  public readonly eventType = 'order.delivered';

  constructor(
    public readonly orderId: string,
    public readonly organizationId: string,
    public readonly customerId: string,
    public readonly delivererId: string,
    public readonly deliveryId: string
  ) {
    super();
  }

  toJSON(): Record<string, unknown> {
    return {
      eventType: this.eventType,
      occurredAt: this.occurredAt.toISOString(),
      data: {
        orderId: this.orderId,
        organizationId: this.organizationId,
        customerId: this.customerId,
        delivererId: this.delivererId,
        deliveryId: this.deliveryId,
      },
    };
  }
}
