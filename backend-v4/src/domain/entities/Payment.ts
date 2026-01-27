/**
 * Entity: Payment
 * Représente un paiement effectué par un client
 */
import { Money } from '../value-objects/Money';
import { PaymentMode } from './Delivery';

export interface PaymentProps {
  id: string;
  organizationId: string;
  customerId: string;
  amount: Money;
  mode: PaymentMode;
  collectorId?: string; // ID du livreur qui a collecté
  deliveryId?: string;
  targetOrders: string[]; // IDs des commandes payées
  receiptNumber?: string;
  notes?: string;
  createdAt: Date;
  updatedAt: Date;
}

export class Payment {
  private constructor(private props: PaymentProps) {}

  static create(
    props: Omit<PaymentProps, 'targetOrders' | 'createdAt' | 'updatedAt'>
  ): Payment {
    if (props.amount.isLessThan(Money.zero()) || props.amount.isZero()) {
      throw new Error('Le montant du paiement doit être positif');
    }

    return new Payment({
      ...props,
      targetOrders: props.targetOrders || [],
      createdAt: new Date(),
      updatedAt: new Date(),
    });
  }

  static reconstitute(props: PaymentProps): Payment {
    return new Payment(props);
  }

  get id(): string {
    return this.props.id;
  }

  get organizationId(): string {
    return this.props.organizationId;
  }

  get customerId(): string {
    return this.props.customerId;
  }

  get amount(): Money {
    return this.props.amount;
  }

  get mode(): PaymentMode {
    return this.props.mode;
  }

  get collectorId(): string | undefined {
    return this.props.collectorId;
  }

  get deliveryId(): string | undefined {
    return this.props.deliveryId;
  }

  get targetOrders(): string[] {
    return [...this.props.targetOrders];
  }

  get receiptNumber(): string | undefined {
    return this.props.receiptNumber;
  }

  get notes(): string | undefined {
    return this.props.notes;
  }

  get createdAt(): Date {
    return this.props.createdAt;
  }

  get updatedAt(): Date {
    return this.props.updatedAt;
  }

  allocateToOrders(orderIds: string[]): void {
    this.props.targetOrders = [...orderIds];
    this.props.updatedAt = new Date();
  }

  addTargetOrder(orderId: string): void {
    if (!this.props.targetOrders.includes(orderId)) {
      this.props.targetOrders.push(orderId);
      this.props.updatedAt = new Date();
    }
  }

  removeTargetOrder(orderId: string): void {
    this.props.targetOrders = this.props.targetOrders.filter((id) => id !== orderId);
    this.props.updatedAt = new Date();
  }

  setReceiptNumber(receiptNumber: string): void {
    this.props.receiptNumber = receiptNumber;
    this.props.updatedAt = new Date();
  }

  addNotes(notes: string): void {
    this.props.notes = notes;
    this.props.updatedAt = new Date();
  }

  isCash(): boolean {
    return this.props.mode === PaymentMode.CASH;
  }

  isCollectedByDeliverer(): boolean {
    return this.props.collectorId !== undefined;
  }

  hasTargetOrders(): boolean {
    return this.props.targetOrders.length > 0;
  }

  toJSON(): Record<string, unknown> {
    return {
      id: this.props.id,
      organizationId: this.props.organizationId,
      customerId: this.props.customerId,
      amount: this.props.amount.toJSON(),
      mode: this.props.mode,
      collectorId: this.props.collectorId,
      deliveryId: this.props.deliveryId,
      targetOrders: this.props.targetOrders,
      receiptNumber: this.props.receiptNumber,
      notes: this.props.notes,
      createdAt: this.props.createdAt.toISOString(),
      updatedAt: this.props.updatedAt.toISOString(),
    };
  }
}
