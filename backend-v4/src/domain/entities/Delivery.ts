/**
 * Entity: Delivery
 * Représente une livraison assignée à un livreur
 */
import { Coordinates } from '../value-objects/Coordinates';
import { Money } from '../value-objects/Money';

export interface DeliveryProps {
  id: string;
  organizationId: string;
  orderId: string;
  delivererId: string;
  status: DeliveryStatus;
  priority: number;
  estimatedDistance?: number; // km
  estimatedDuration?: number; // minutes
  actualDistance?: number;
  actualDuration?: number;
  startedAt?: Date;
  completedAt?: Date;
  failureReason?: string;
  amountCollected?: Money;
  paymentMode?: PaymentMode;
  proofOfDelivery?: ProofOfDelivery;
  notes?: string;
  createdAt: Date;
  updatedAt: Date;
}

export enum DeliveryStatus {
  PENDING = 'pending',
  ASSIGNED = 'assigned',
  PICKED_UP = 'picked_up',
  IN_TRANSIT = 'in_transit',
  DELIVERED = 'delivered',
  FAILED = 'failed',
  RETURNED = 'returned',
}

export enum PaymentMode {
  CASH = 'cash',
  BANK = 'bank',
  CHECK = 'check',
  MOBILE = 'mobile',
  NONE = 'none',
}

export interface ProofOfDelivery {
  signature?: string; // Base64 SVG
  signedBy?: string;
  photos: string[]; // URLs
  location: Coordinates;
  timestamp: Date;
}

export class Delivery {
  private constructor(private props: DeliveryProps) {}

  static create(
    props: Omit<DeliveryProps, 'status' | 'priority' | 'createdAt' | 'updatedAt'>
  ): Delivery {
    return new Delivery({
      ...props,
      status: DeliveryStatus.PENDING,
      priority: props.priority || 50,
      createdAt: new Date(),
      updatedAt: new Date(),
    });
  }

  static reconstitute(props: DeliveryProps): Delivery {
    return new Delivery(props);
  }

  get id(): string {
    return this.props.id;
  }

  get organizationId(): string {
    return this.props.organizationId;
  }

  get orderId(): string {
    return this.props.orderId;
  }

  get delivererId(): string {
    return this.props.delivererId;
  }

  get status(): DeliveryStatus {
    return this.props.status;
  }

  get priority(): number {
    return this.props.priority;
  }

  get estimatedDistance(): number | undefined {
    return this.props.estimatedDistance;
  }

  get estimatedDuration(): number | undefined {
    return this.props.estimatedDuration;
  }

  get actualDistance(): number | undefined {
    return this.props.actualDistance;
  }

  get actualDuration(): number | undefined {
    return this.props.actualDuration;
  }

  get startedAt(): Date | undefined {
    return this.props.startedAt;
  }

  get completedAt(): Date | undefined {
    return this.props.completedAt;
  }

  get failureReason(): string | undefined {
    return this.props.failureReason;
  }

  get amountCollected(): Money | undefined {
    return this.props.amountCollected;
  }

  get paymentMode(): PaymentMode | undefined {
    return this.props.paymentMode;
  }

  get proofOfDelivery(): ProofOfDelivery | undefined {
    return this.props.proofOfDelivery;
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

  assign(delivererId: string): void {
    if (this.props.status !== DeliveryStatus.PENDING) {
      throw new Error('Seules les livraisons en attente peuvent être assignées');
    }
    this.props.delivererId = delivererId;
    this.props.status = DeliveryStatus.ASSIGNED;
    this.props.updatedAt = new Date();
  }

  pickUp(): void {
    if (this.props.status !== DeliveryStatus.ASSIGNED) {
      throw new Error('La livraison doit être assignée avant d\'être récupérée');
    }
    this.props.status = DeliveryStatus.PICKED_UP;
    this.props.startedAt = new Date();
    this.props.updatedAt = new Date();
  }

  startTransit(): void {
    if (this.props.status !== DeliveryStatus.PICKED_UP) {
      throw new Error('La livraison doit être récupérée avant de démarrer');
    }
    this.props.status = DeliveryStatus.IN_TRANSIT;
    this.props.updatedAt = new Date();
  }

  complete(
    amountCollected?: Money,
    paymentMode?: PaymentMode,
    proof?: ProofOfDelivery
  ): void {
    if (this.props.status !== DeliveryStatus.IN_TRANSIT) {
      throw new Error('La livraison doit être en transit pour être complétée');
    }

    this.props.status = DeliveryStatus.DELIVERED;
    this.props.completedAt = new Date();
    this.props.amountCollected = amountCollected;
    this.props.paymentMode = paymentMode;
    this.props.proofOfDelivery = proof;

    // Calculer durée réelle
    if (this.props.startedAt) {
      this.props.actualDuration = Math.floor(
        (this.props.completedAt.getTime() - this.props.startedAt.getTime()) / 60000
      );
    }

    this.props.updatedAt = new Date();
  }

  fail(reason: string): void {
    if (this.isFinal()) {
      throw new Error('Impossible de marquer comme échouée une livraison terminée');
    }

    this.props.status = DeliveryStatus.FAILED;
    this.props.failureReason = reason;
    this.props.completedAt = new Date();
    this.props.updatedAt = new Date();
  }

  markAsReturned(): void {
    if (this.props.status !== DeliveryStatus.FAILED) {
      throw new Error('Seules les livraisons échouées peuvent être retournées');
    }
    this.props.status = DeliveryStatus.RETURNED;
    this.props.updatedAt = new Date();
  }

  updateEstimates(distance: number, duration: number): void {
    this.props.estimatedDistance = distance;
    this.props.estimatedDuration = duration;
    this.props.updatedAt = new Date();
  }

  updatePriority(priority: number): void {
    if (priority < 1 || priority > 100) {
      throw new Error('La priorité doit être entre 1 et 100');
    }
    this.props.priority = priority;
    this.props.updatedAt = new Date();
  }

  addNotes(notes: string): void {
    this.props.notes = notes;
    this.props.updatedAt = new Date();
  }

  isPending(): boolean {
    return this.props.status === DeliveryStatus.PENDING;
  }

  isInProgress(): boolean {
    return [
      DeliveryStatus.ASSIGNED,
      DeliveryStatus.PICKED_UP,
      DeliveryStatus.IN_TRANSIT,
    ].includes(this.props.status);
  }

  isCompleted(): boolean {
    return this.props.status === DeliveryStatus.DELIVERED;
  }

  isFailed(): boolean {
    return this.props.status === DeliveryStatus.FAILED;
  }

  isFinal(): boolean {
    return [
      DeliveryStatus.DELIVERED,
      DeliveryStatus.FAILED,
      DeliveryStatus.RETURNED,
    ].includes(this.props.status);
  }

  hasProof(): boolean {
    return this.props.proofOfDelivery !== undefined;
  }

  toJSON(): Record<string, unknown> {
    return {
      id: this.props.id,
      organizationId: this.props.organizationId,
      orderId: this.props.orderId,
      delivererId: this.props.delivererId,
      status: this.props.status,
      priority: this.props.priority,
      estimatedDistance: this.props.estimatedDistance,
      estimatedDuration: this.props.estimatedDuration,
      actualDistance: this.props.actualDistance,
      actualDuration: this.props.actualDuration,
      startedAt: this.props.startedAt?.toISOString(),
      completedAt: this.props.completedAt?.toISOString(),
      failureReason: this.props.failureReason,
      amountCollected: this.props.amountCollected?.toJSON(),
      paymentMode: this.props.paymentMode,
      proofOfDelivery: this.props.proofOfDelivery,
      notes: this.props.notes,
      createdAt: this.props.createdAt.toISOString(),
      updatedAt: this.props.updatedAt.toISOString(),
    };
  }
}
