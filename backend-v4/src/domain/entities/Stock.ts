/**
 * Entity: Stock
 * Représente le stock d'un produit
 */
export interface StockProps {
  id: string;
  organizationId: string;
  productId: string;
  quantity: number;
  unit: string;
  minThreshold: number;
  reorderQuantity: number;
  location?: string;
  lastCountAt: Date;
  createdAt: Date;
  updatedAt: Date;
}

export class Stock {
  private constructor(private props: StockProps) {}

  static create(props: Omit<StockProps, 'createdAt' | 'updatedAt'>): Stock {
    if (props.quantity < 0) {
      throw new Error('La quantité ne peut pas être négative');
    }
    if (props.minThreshold < 0) {
      throw new Error('Le seuil minimum ne peut pas être négatif');
    }
    if (props.reorderQuantity <= 0) {
      throw new Error('La quantité de réapprovisionnement doit être positive');
    }

    return new Stock({
      ...props,
      createdAt: new Date(),
      updatedAt: new Date(),
    });
  }

  static reconstitute(props: StockProps): Stock {
    return new Stock(props);
  }

  get id(): string {
    return this.props.id;
  }

  get organizationId(): string {
    return this.props.organizationId;
  }

  get productId(): string {
    return this.props.productId;
  }

  get quantity(): number {
    return this.props.quantity;
  }

  get unit(): string {
    return this.props.unit;
  }

  get minThreshold(): number {
    return this.props.minThreshold;
  }

  get reorderQuantity(): number {
    return this.props.reorderQuantity;
  }

  get location(): string | undefined {
    return this.props.location;
  }

  get lastCountAt(): Date {
    return this.props.lastCountAt;
  }

  get createdAt(): Date {
    return this.props.createdAt;
  }

  get updatedAt(): Date {
    return this.props.updatedAt;
  }

  addQuantity(amount: number): void {
    if (amount <= 0) {
      throw new Error('La quantité à ajouter doit être positive');
    }
    this.props.quantity += amount;
    this.props.updatedAt = new Date();
  }

  removeQuantity(amount: number): void {
    if (amount <= 0) {
      throw new Error('La quantité à retirer doit être positive');
    }
    if (amount > this.props.quantity) {
      throw new Error('Stock insuffisant');
    }
    this.props.quantity -= amount;
    this.props.updatedAt = new Date();
  }

  setQuantity(quantity: number): void {
    if (quantity < 0) {
      throw new Error('La quantité ne peut pas être négative');
    }
    this.props.quantity = quantity;
    this.props.lastCountAt = new Date();
    this.props.updatedAt = new Date();
  }

  updateThresholds(minThreshold: number, reorderQuantity: number): void {
    if (minThreshold < 0) {
      throw new Error('Le seuil minimum ne peut pas être négatif');
    }
    if (reorderQuantity <= 0) {
      throw new Error('La quantité de réapprovisionnement doit être positive');
    }
    this.props.minThreshold = minThreshold;
    this.props.reorderQuantity = reorderQuantity;
    this.props.updatedAt = new Date();
  }

  updateLocation(location: string): void {
    this.props.location = location;
    this.props.updatedAt = new Date();
  }

  isLow(): boolean {
    return this.props.quantity < this.props.minThreshold;
  }

  isEmpty(): boolean {
    return this.props.quantity === 0;
  }

  needsReorder(): boolean {
    return this.isLow();
  }

  getSuggestedReorderQuantity(): number {
    if (!this.needsReorder()) {
      return 0;
    }
    return this.props.reorderQuantity;
  }

  toJSON(): Record<string, unknown> {
    return {
      id: this.props.id,
      organizationId: this.props.organizationId,
      productId: this.props.productId,
      quantity: this.props.quantity,
      unit: this.props.unit,
      minThreshold: this.props.minThreshold,
      reorderQuantity: this.props.reorderQuantity,
      location: this.props.location,
      lastCountAt: this.props.lastCountAt.toISOString(),
      createdAt: this.props.createdAt.toISOString(),
      updatedAt: this.props.updatedAt.toISOString(),
    };
  }
}

/**
 * Entity: StockMovement
 * Représente un mouvement de stock (entrée, sortie, ajustement)
 */
export interface StockMovementProps {
  id: string;
  organizationId: string;
  productId: string;
  type: StockMovementType;
  quantity: number;
  reason?: string;
  reference?: string;
  userId: string;
  createdAt: Date;
}

export enum StockMovementType {
  IN = 'in',
  OUT = 'out',
  ADJUSTMENT = 'adjustment',
  TRANSFER = 'transfer',
}

export class StockMovement {
  private constructor(private props: StockMovementProps) {}

  static create(props: Omit<StockMovementProps, 'createdAt'>): StockMovement {
    if (props.quantity === 0) {
      throw new Error('La quantité ne peut pas être zéro');
    }

    return new StockMovement({
      ...props,
      createdAt: new Date(),
    });
  }

  static reconstitute(props: StockMovementProps): StockMovement {
    return new StockMovement(props);
  }

  get id(): string {
    return this.props.id;
  }

  get organizationId(): string {
    return this.props.organizationId;
  }

  get productId(): string {
    return this.props.productId;
  }

  get type(): StockMovementType {
    return this.props.type;
  }

  get quantity(): number {
    return this.props.quantity;
  }

  get reason(): string | undefined {
    return this.props.reason;
  }

  get reference(): string | undefined {
    return this.props.reference;
  }

  get userId(): string {
    return this.props.userId;
  }

  get createdAt(): Date {
    return this.props.createdAt;
  }

  isIncoming(): boolean {
    return this.props.type === StockMovementType.IN;
  }

  isOutgoing(): boolean {
    return this.props.type === StockMovementType.OUT;
  }

  isAdjustment(): boolean {
    return this.props.type === StockMovementType.ADJUSTMENT;
  }

  toJSON(): Record<string, unknown> {
    return {
      id: this.props.id,
      organizationId: this.props.organizationId,
      productId: this.props.productId,
      type: this.props.type,
      quantity: this.props.quantity,
      reason: this.props.reason,
      reference: this.props.reference,
      userId: this.props.userId,
      createdAt: this.props.createdAt.toISOString(),
    };
  }
}
