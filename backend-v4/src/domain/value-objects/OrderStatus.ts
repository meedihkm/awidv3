/**
 * Value Object: OrderStatus
 * Représente le statut d'une commande avec transitions valides
 */
export enum OrderStatusEnum {
  PENDING = 'pending',
  CONFIRMED = 'confirmed',
  PREPARING = 'preparing',
  READY = 'ready',
  ASSIGNED = 'assigned',
  IN_DELIVERY = 'in_delivery',
  DELIVERED = 'delivered',
  CANCELLED = 'cancelled',
}

export class OrderStatus {
  private readonly _value: OrderStatusEnum;

  private constructor(value: OrderStatusEnum) {
    this._value = value;
  }

  static create(value: string): OrderStatus {
    if (!Object.values(OrderStatusEnum).includes(value as OrderStatusEnum)) {
      throw new Error(`Statut de commande invalide: ${value}`);
    }
    return new OrderStatus(value as OrderStatusEnum);
  }

  static pending(): OrderStatus {
    return new OrderStatus(OrderStatusEnum.PENDING);
  }

  static confirmed(): OrderStatus {
    return new OrderStatus(OrderStatusEnum.CONFIRMED);
  }

  static preparing(): OrderStatus {
    return new OrderStatus(OrderStatusEnum.PREPARING);
  }

  static ready(): OrderStatus {
    return new OrderStatus(OrderStatusEnum.READY);
  }

  static assigned(): OrderStatus {
    return new OrderStatus(OrderStatusEnum.ASSIGNED);
  }

  static inDelivery(): OrderStatus {
    return new OrderStatus(OrderStatusEnum.IN_DELIVERY);
  }

  static delivered(): OrderStatus {
    return new OrderStatus(OrderStatusEnum.DELIVERED);
  }

  static cancelled(): OrderStatus {
    return new OrderStatus(OrderStatusEnum.CANCELLED);
  }

  get value(): OrderStatusEnum {
    return this._value;
  }

  /**
   * Vérifie si la transition vers un nouveau statut est valide
   */
  canTransitionTo(newStatus: OrderStatus): boolean {
    const validTransitions: Record<OrderStatusEnum, OrderStatusEnum[]> = {
      [OrderStatusEnum.PENDING]: [OrderStatusEnum.CONFIRMED, OrderStatusEnum.CANCELLED],
      [OrderStatusEnum.CONFIRMED]: [OrderStatusEnum.PREPARING, OrderStatusEnum.CANCELLED],
      [OrderStatusEnum.PREPARING]: [OrderStatusEnum.READY, OrderStatusEnum.CANCELLED],
      [OrderStatusEnum.READY]: [OrderStatusEnum.ASSIGNED, OrderStatusEnum.CANCELLED],
      [OrderStatusEnum.ASSIGNED]: [OrderStatusEnum.IN_DELIVERY, OrderStatusEnum.CANCELLED],
      [OrderStatusEnum.IN_DELIVERY]: [OrderStatusEnum.DELIVERED, OrderStatusEnum.CANCELLED],
      [OrderStatusEnum.DELIVERED]: [],
      [OrderStatusEnum.CANCELLED]: [],
    };

    return validTransitions[this._value]?.includes(newStatus._value) ?? false;
  }

  isPending(): boolean {
    return this._value === OrderStatusEnum.PENDING;
  }

  isConfirmed(): boolean {
    return this._value === OrderStatusEnum.CONFIRMED;
  }

  isPreparing(): boolean {
    return this._value === OrderStatusEnum.PREPARING;
  }

  isReady(): boolean {
    return this._value === OrderStatusEnum.READY;
  }

  isAssigned(): boolean {
    return this._value === OrderStatusEnum.ASSIGNED;
  }

  isInDelivery(): boolean {
    return this._value === OrderStatusEnum.IN_DELIVERY;
  }

  isDelivered(): boolean {
    return this._value === OrderStatusEnum.DELIVERED;
  }

  isCancelled(): boolean {
    return this._value === OrderStatusEnum.CANCELLED;
  }

  isFinal(): boolean {
    return this.isDelivered() || this.isCancelled();
  }

  toString(): string {
    return this._value;
  }

  toJSON(): string {
    return this._value;
  }
}
