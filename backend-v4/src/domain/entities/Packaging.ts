/**
 * Entity: Packaging (Consigne)
 * Représente un type de consigne (bouteille, caisse, etc.)
 */
import { Money } from '../value-objects/Money';

export interface PackagingProps {
  id: string;
  organizationId: string;
  name: string;
  description?: string;
  depositAmount: Money;
  unit: string;
  isActive: boolean;
  createdAt: Date;
  updatedAt: Date;
}

export class Packaging {
  private constructor(private props: PackagingProps) {}

  static create(props: Omit<PackagingProps, 'isActive' | 'createdAt' | 'updatedAt'>): Packaging {
    if (props.depositAmount.isLessThan(Money.zero())) {
      throw new Error('Le montant de la consigne ne peut pas être négatif');
    }

    return new Packaging({
      ...props,
      isActive: true,
      createdAt: new Date(),
      updatedAt: new Date(),
    });
  }

  static reconstitute(props: PackagingProps): Packaging {
    return new Packaging(props);
  }

  get id(): string {
    return this.props.id;
  }

  get organizationId(): string {
    return this.props.organizationId;
  }

  get name(): string {
    return this.props.name;
  }

  get description(): string | undefined {
    return this.props.description;
  }

  get depositAmount(): Money {
    return this.props.depositAmount;
  }

  get unit(): string {
    return this.props.unit;
  }

  get isActive(): boolean {
    return this.props.isActive;
  }

  get createdAt(): Date {
    return this.props.createdAt;
  }

  get updatedAt(): Date {
    return this.props.updatedAt;
  }

  updateDetails(name?: string, description?: string, unit?: string): void {
    if (name) this.props.name = name;
    if (description !== undefined) this.props.description = description;
    if (unit) this.props.unit = unit;
    this.props.updatedAt = new Date();
  }

  updateDepositAmount(amount: Money): void {
    if (amount.isLessThan(Money.zero())) {
      throw new Error('Le montant de la consigne ne peut pas être négatif');
    }
    this.props.depositAmount = amount;
    this.props.updatedAt = new Date();
  }

  activate(): void {
    this.props.isActive = true;
    this.props.updatedAt = new Date();
  }

  deactivate(): void {
    this.props.isActive = false;
    this.props.updatedAt = new Date();
  }

  calculateTotalDeposit(quantity: number): Money {
    if (quantity < 0) {
      throw new Error('La quantité ne peut pas être négative');
    }
    return this.props.depositAmount.multiply(quantity);
  }

  toJSON(): Record<string, unknown> {
    return {
      id: this.props.id,
      organizationId: this.props.organizationId,
      name: this.props.name,
      description: this.props.description,
      depositAmount: this.props.depositAmount.toJSON(),
      unit: this.props.unit,
      isActive: this.props.isActive,
      createdAt: this.props.createdAt.toISOString(),
      updatedAt: this.props.updatedAt.toISOString(),
    };
  }
}

/**
 * Entity: PackagingTransaction
 * Représente une transaction de consigne (dépôt ou retour)
 */
export interface PackagingTransactionProps {
  id: string;
  organizationId: string;
  customerId: string;
  packagingId: string;
  type: PackagingTransactionType;
  quantity: number;
  amount: Money;
  deliveryId?: string;
  notes?: string;
  createdAt: Date;
}

export enum PackagingTransactionType {
  DEPOSIT = 'deposit',
  RETURN = 'return',
}

export class PackagingTransaction {
  private constructor(private props: PackagingTransactionProps) {}

  static create(
    props: Omit<PackagingTransactionProps, 'createdAt'>
  ): PackagingTransaction {
    if (props.quantity <= 0) {
      throw new Error('La quantité doit être positive');
    }

    return new PackagingTransaction({
      ...props,
      createdAt: new Date(),
    });
  }

  static reconstitute(props: PackagingTransactionProps): PackagingTransaction {
    return new PackagingTransaction(props);
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

  get packagingId(): string {
    return this.props.packagingId;
  }

  get type(): PackagingTransactionType {
    return this.props.type;
  }

  get quantity(): number {
    return this.props.quantity;
  }

  get amount(): Money {
    return this.props.amount;
  }

  get deliveryId(): string | undefined {
    return this.props.deliveryId;
  }

  get notes(): string | undefined {
    return this.props.notes;
  }

  get createdAt(): Date {
    return this.props.createdAt;
  }

  isDeposit(): boolean {
    return this.props.type === PackagingTransactionType.DEPOSIT;
  }

  isReturn(): boolean {
    return this.props.type === PackagingTransactionType.RETURN;
  }

  toJSON(): Record<string, unknown> {
    return {
      id: this.props.id,
      organizationId: this.props.organizationId,
      customerId: this.props.customerId,
      packagingId: this.props.packagingId,
      type: this.props.type,
      quantity: this.props.quantity,
      amount: this.props.amount.toJSON(),
      deliveryId: this.props.deliveryId,
      notes: this.props.notes,
      createdAt: this.props.createdAt.toISOString(),
    };
  }
}
