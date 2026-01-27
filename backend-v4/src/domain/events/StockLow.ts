/**
 * Domain Event: StockLow
 * Déclenché quand le stock d'un produit est bas
 */
import { DomainEvent } from './DomainEvent';

export class StockLow extends DomainEvent {
  public readonly eventType = 'stock.low';

  constructor(
    public readonly productId: string,
    public readonly organizationId: string,
    public readonly productName: string,
    public readonly currentQuantity: number,
    public readonly threshold: number,
    public readonly suggestedReorder: number
  ) {
    super();
  }

  toJSON(): Record<string, unknown> {
    return {
      eventType: this.eventType,
      occurredAt: this.occurredAt.toISOString(),
      data: {
        productId: this.productId,
        organizationId: this.organizationId,
        productName: this.productName,
        currentQuantity: this.currentQuantity,
        threshold: this.threshold,
        suggestedReorder: this.suggestedReorder,
      },
    };
  }
}
