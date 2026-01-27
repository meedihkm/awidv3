/**
 * Domain Event: OrderCreated
 * Déclenché quand une nouvelle commande est créée
 */
import { OrderItem } from '../entities/Order';
import { DomainEvent } from './DomainEvent';

export class OrderCreated extends DomainEvent {
  public readonly eventType = 'order.created';

  constructor(
    public readonly orderId: string,
    public readonly organizationId: string,
    public readonly customerId: string,
    public readonly total: number,
    public readonly items: OrderItem[]
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
        total: this.total,
        items: this.items,
      },
    };
  }
}
