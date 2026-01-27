/**
 * Entity: Order
 * Représente une commande client
 */
import { Address } from '../value-objects/Address';
import { Money } from '../value-objects/Money';
import { OrderStatus } from '../value-objects/OrderStatus';

export interface OrderProps {
  id: string;
  organizationId: string;
  customerId: string;
  items: OrderItem[];
  status: OrderStatus;
  paymentStatus: PaymentStatus;
  priority: OrderPriority;
  subtotal: Money;
  taxAmount: Money;
  total: Money;
  deliveryAddress?: Address;
  deliveryDate?: Date;
  notes?: string;
  assignedDelivererId?: string;
  lockedAt?: Date;
  lockedBy?: string;
  createdAt: Date;
  updatedAt: Date;
}

export interface OrderItem {
  productId: string;
  productName: string;
  quantity: number;
  unitPrice: Money;
  total: Money;
  notes?: string;
}

export enum PaymentStatus {
  UNPAID = 'unpaid',
  PARTIAL = 'partial',
  PAID = 'paid',
}

export enum OrderPriority {
  NORMAL = 'normal',
  URGENT = 'urgent',
  SCHEDULED = 'scheduled',
}

export class Order {
  private constructor(private props: OrderProps) {}

  static create(
    props: Omit<
      OrderProps,
      'status' | 'paymentStatus' | 'subtotal' | 'taxAmount' | 'total' | 'createdAt' | 'updatedAt'
    > & { taxRate: number }
  ): Order {
    // Calculer les totaux
    const subtotal = props.items.reduce(
      (sum, item) => sum.add(item.total),
      Money.zero()
    );
    const taxAmount = subtotal.multiply(props.taxRate);
    const total = subtotal.add(taxAmount);

    return new Order({
      ...props,
      status: OrderStatus.pending(),
      paymentStatus: PaymentStatus.UNPAID,
      subtotal,
      taxAmount,
      total,
      createdAt: new Date(),
      updatedAt: new Date(),
    });
  }

  static reconstitute(props: OrderProps): Order {
    return new Order(props);
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

  get items(): OrderItem[] {
    return [...this.props.items];
  }

  get status(): OrderStatus {
    return this.props.status;
  }

  get paymentStatus(): PaymentStatus {
    return this.props.paymentStatus;
  }

  get priority(): OrderPriority {
    return this.props.priority;
  }

  get subtotal(): Money {
    return this.props.subtotal;
  }

  get taxAmount(): Money {
    return this.props.taxAmount;
  }

  get total(): Money {
    return this.props.total;
  }

  get deliveryAddress(): Address | undefined {
    return this.props.deliveryAddress;
  }

  get deliveryDate(): Date | undefined {
    return this.props.deliveryDate;
  }

  get notes(): string | undefined {
    return this.props.notes;
  }

  get assignedDelivererId(): string | undefined {
    return this.props.assignedDelivererId;
  }

  get lockedAt(): Date | undefined {
    return this.props.lockedAt;
  }

  get lockedBy(): string | undefined {
    return this.props.lockedBy;
  }

  get createdAt(): Date {
    return this.props.createdAt;
  }

  get updatedAt(): Date {
    return this.props.updatedAt;
  }

  updateStatus(newStatus: OrderStatus, userId: string): void {
    if (!this.props.status.canTransitionTo(newStatus)) {
      throw new Error(
        `Transition invalide de ${this.props.status.value} vers ${newStatus.value}`
      );
    }

    if (this.isLocked() && this.props.lockedBy !== userId) {
      throw new Error('La commande est verrouillée par un autre utilisateur');
    }

    this.props.status = newStatus;
    this.props.updatedAt = new Date();
  }

  assignDeliverer(delivererId: string): void {
    if (this.props.status.isFinal()) {
      throw new Error('Impossible d\'assigner un livreur à une commande terminée');
    }

    this.props.assignedDelivererId = delivererId;
    this.props.status = OrderStatus.assigned();
    this.props.updatedAt = new Date();
  }

  unassignDeliverer(): void {
    this.props.assignedDelivererId = undefined;
    this.props.updatedAt = new Date();
  }

  lock(userId: string): void {
    if (this.isLocked()) {
      throw new Error('La commande est déjà verrouillée');
    }
    this.props.lockedAt = new Date();
    this.props.lockedBy = userId;
    this.props.updatedAt = new Date();
  }

  unlock(): void {
    this.props.lockedAt = undefined;
    this.props.lockedBy = undefined;
    this.props.updatedAt = new Date();
  }

  isLocked(): boolean {
    return this.props.lockedAt !== undefined;
  }

  updatePaymentStatus(status: PaymentStatus): void {
    this.props.paymentStatus = status;
    this.props.updatedAt = new Date();
  }

  markAsPaid(): void {
    this.props.paymentStatus = PaymentStatus.PAID;
    this.props.updatedAt = new Date();
  }

  markAsPartiallyPaid(): void {
    this.props.paymentStatus = PaymentStatus.PARTIAL;
    this.props.updatedAt = new Date();
  }

  updatePriority(priority: OrderPriority): void {
    this.props.priority = priority;
    this.props.updatedAt = new Date();
  }

  updateDeliveryInfo(address?: Address, date?: Date): void {
    if (address) this.props.deliveryAddress = address;
    if (date) this.props.deliveryDate = date;
    this.props.updatedAt = new Date();
  }

  addNotes(notes: string): void {
    this.props.notes = notes;
    this.props.updatedAt = new Date();
  }

  cancel(): void {
    if (this.props.status.isFinal()) {
      throw new Error('Impossible d\'annuler une commande terminée');
    }
    this.props.status = OrderStatus.cancelled();
    this.props.updatedAt = new Date();
  }

  isPending(): boolean {
    return this.props.status.isPending();
  }

  isDelivered(): boolean {
    return this.props.status.isDelivered();
  }

  isCancelled(): boolean {
    return this.props.status.isCancelled();
  }

  isPaid(): boolean {
    return this.props.paymentStatus === PaymentStatus.PAID;
  }

  isUnpaid(): boolean {
    return this.props.paymentStatus === PaymentStatus.UNPAID;
  }

  hasDeliverer(): boolean {
    return this.props.assignedDelivererId !== undefined;
  }

  toJSON(): Record<string, unknown> {
    return {
      id: this.props.id,
      organizationId: this.props.organizationId,
      customerId: this.props.customerId,
      items: this.props.items.map((item) => ({
        ...item,
        unitPrice: item.unitPrice.toJSON(),
        total: item.total.toJSON(),
      })),
      status: this.props.status.toJSON(),
      paymentStatus: this.props.paymentStatus,
      priority: this.props.priority,
      subtotal: this.props.subtotal.toJSON(),
      taxAmount: this.props.taxAmount.toJSON(),
      total: this.props.total.toJSON(),
      deliveryAddress: this.props.deliveryAddress?.toJSON(),
      deliveryDate: this.props.deliveryDate?.toISOString(),
      notes: this.props.notes,
      assignedDelivererId: this.props.assignedDelivererId,
      lockedAt: this.props.lockedAt?.toISOString(),
      lockedBy: this.props.lockedBy,
      createdAt: this.props.createdAt.toISOString(),
      updatedAt: this.props.updatedAt.toISOString(),
    };
  }
}
