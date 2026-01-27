/**
 * Domain Event: PaymentReceived
 * Déclenché quand un paiement est reçu
 */
import { DomainEvent } from './DomainEvent';

export class PaymentReceived extends DomainEvent {
  public readonly eventType = 'payment.received';

  constructor(
    public readonly paymentId: string,
    public readonly organizationId: string,
    public readonly customerId: string,
    public readonly amount: number,
    public readonly mode: string,
    public readonly targetOrders: string[]
  ) {
    super();
  }

  toJSON(): Record<string, unknown> {
    return {
      eventType: this.eventType,
      occurredAt: this.occurredAt.toISOString(),
      data: {
        paymentId: this.paymentId,
        organizationId: this.organizationId,
        customerId: this.customerId,
        amount: this.amount,
        mode: this.mode,
        targetOrders: this.targetOrders,
      },
    };
  }
}
