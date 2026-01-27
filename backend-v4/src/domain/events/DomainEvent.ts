/**
 * Base class for all Domain Events
 */
export abstract class DomainEvent {
  public readonly occurredAt: Date;
  public abstract readonly eventType: string;

  constructor() {
    this.occurredAt = new Date();
  }

  abstract toJSON(): Record<string, unknown>;
}
