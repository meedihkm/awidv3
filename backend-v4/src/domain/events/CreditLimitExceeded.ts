/**
 * Domain Event: CreditLimitExceeded
 * Déclenché quand un client dépasse sa limite de crédit
 */
import { DomainEvent } from './DomainEvent';

export class CreditLimitExceeded extends DomainEvent {
  public readonly eventType = 'credit.limit_exceeded';

  constructor(
    public readonly customerId: string,
    public readonly organizationId: string,
    public readonly currentDebt: number,
    public readonly creditLimit: number,
    public readonly exceededBy: number
  ) {
    super();
  }

  toJSON(): Record<string, unknown> {
    return {
      eventType: this.eventType,
      occurredAt: this.occurredAt.toISOString(),
      data: {
        customerId: this.customerId,
        organizationId: this.organizationId,
        currentDebt: this.currentDebt,
        creditLimit: this.creditLimit,
        exceededBy: this.exceededBy,
      },
    };
  }
}
