/**
 * Use Case: CreateOrder
 * Crée une nouvelle commande
 */
import { Order, OrderItem, OrderPriority } from '@/domain/entities/Order';
import { IOrderRepository } from '@/domain/repositories/IOrderRepository';
import { IProductRepository } from '@/domain/repositories/IProductRepository';
import { IUserRepository } from '@/domain/repositories/IUserRepository';
import { CreditService } from '@/domain/services/CreditService';
import { Address } from '@/domain/value-objects/Address';
import { Money } from '@/domain/value-objects/Money';
import { NotFoundError } from '@/shared/errors/NotFoundError';
import { ValidationError } from '@/shared/errors/ValidationError';
import { v4 as uuidv4 } from 'uuid';

export interface CreateOrderInput {
  customerId: string;
  items: Array<{
    productId: string;
    quantity: number;
    price?: number;
    notes?: string;
  }>;
  deliveryDate?: Date;
  deliveryAddress?: {
    street: string;
    city: string;
    wilaya?: string;
    postalCode?: string;
    coordinates?: { lat: number; lng: number };
  };
  priority?: 'normal' | 'urgent' | 'scheduled';
  notes?: string;
}

export class CreateOrderUseCase {
  constructor(
    private orderRepository: IOrderRepository,
    private productRepository: IProductRepository,
    private userRepository: IUserRepository,
    private creditService: CreditService
  ) {}

  async execute(input: CreateOrderInput, userId: string): Promise<Order> {
    // Vérifier que le client existe
    const customer = await this.userRepository.findById(input.customerId);
    if (!customer) {
      throw new NotFoundError('Client', input.customerId);
    }

    if (!customer.isCustomer()) {
      throw new ValidationError('L\'utilisateur doit être un client');
    }

    // Préparer les items de commande
    const orderItems: OrderItem[] = [];
    let subtotal = Money.zero();

    for (const item of input.items) {
      const product = await this.productRepository.findById(item.productId);
      if (!product) {
        throw new NotFoundError('Produit', item.productId);
      }

      if (!product.isAvailable) {
        throw new ValidationError(`Le produit ${product.name} n'est pas disponible`);
      }

      // Utiliser le prix fourni ou le prix du produit
      const unitPrice = item.price ? Money.create(item.price) : product.price;
      const itemTotal = unitPrice.multiply(item.quantity);

      orderItems.push({
        productId: product.id,
        productName: product.name,
        quantity: item.quantity,
        unitPrice,
        total: itemTotal,
        notes: item.notes,
      });

      subtotal = subtotal.add(itemTotal);
    }

    // Calculer les taxes (récupérer le taux de l'organisation)
    const taxRate = 0.19; // 19% TVA (à récupérer de l'organisation)
    const taxAmount = subtotal.multiply(taxRate);
    const total = subtotal.add(taxAmount);

    // Vérifier la limite de crédit
    const unpaidOrders = await this.orderRepository.findByCustomer(customer.id);
    const currentDebt = this.creditService.calculateTotalDebt(unpaidOrders);

    if (!this.creditService.canPlaceOrder(customer, currentDebt, total)) {
      throw new ValidationError(
        'Limite de crédit dépassée. Veuillez effectuer un paiement avant de passer une nouvelle commande.'
      );
    }

    // Créer l'adresse de livraison si fournie
    let deliveryAddress: Address | undefined;
    if (input.deliveryAddress) {
      deliveryAddress = Address.create({
        street: input.deliveryAddress.street,
        city: input.deliveryAddress.city,
        wilaya: input.deliveryAddress.wilaya,
        postalCode: input.deliveryAddress.postalCode,
        coordinates: input.deliveryAddress.coordinates
          ? {
              lat: input.deliveryAddress.coordinates.lat,
              lng: input.deliveryAddress.coordinates.lng,
              toJSON: () => input.deliveryAddress!.coordinates!,
            }
          : undefined,
      });
    }

    // Créer la commande
    const order = Order.create({
      id: uuidv4(),
      organizationId: customer.organizationId,
      customerId: customer.id,
      items: orderItems,
      priority: (input.priority as OrderPriority) || OrderPriority.NORMAL,
      deliveryAddress,
      deliveryDate: input.deliveryDate,
      notes: input.notes,
      taxRate,
    });

    // Sauvegarder
    await this.orderRepository.save(order);

    // TODO: Publier l'événement OrderCreated

    return order;
  }
}
