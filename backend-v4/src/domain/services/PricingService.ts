/**
 * Domain Service: PricingService
 * Gère la logique métier liée aux prix et tarification
 */
import { Product } from '../entities/Product';
import { User } from '../entities/User';
import { Money } from '../value-objects/Money';

export interface PricingRule {
  id: string;
  type: 'customer' | 'zone' | 'volume' | 'time';
  conditions: Record<string, unknown>;
  discount: {
    type: 'percentage' | 'fixed';
    value: number;
  };
  validFrom?: Date;
  validUntil?: Date;
}

export class PricingService {
  /**
   * Calcule le prix d'un produit pour un client spécifique
   */
  calculatePrice(
    product: Product,
    quantity: number,
    customer?: User,
    rules: PricingRule[] = []
  ): Money {
    let basePrice = product.calculateTotalPrice(quantity);

    // Appliquer les règles de tarification
    const applicableRules = this.getApplicableRules(rules, customer);
    
    for (const rule of applicableRules) {
      basePrice = this.applyDiscount(basePrice, rule.discount);
    }

    return basePrice;
  }

  /**
   * Applique une remise sur un prix
   */
  private applyDiscount(
    price: Money,
    discount: { type: 'percentage' | 'fixed'; value: number }
  ): Money {
    if (discount.type === 'percentage') {
      const discountAmount = price.multiply(discount.value / 100);
      return price.subtract(discountAmount);
    } else {
      return price.subtract(Money.create(discount.value));
    }
  }

  /**
   * Filtre les règles applicables
   */
  private getApplicableRules(rules: PricingRule[], customer?: User): PricingRule[] {
    const now = new Date();

    return rules.filter((rule) => {
      // Vérifier validité temporelle
      if (rule.validFrom && now < rule.validFrom) return false;
      if (rule.validUntil && now > rule.validUntil) return false;

      // Vérifier type de règle
      if (rule.type === 'customer' && customer) {
        return rule.conditions.customerId === customer.id;
      }

      return true;
    });
  }

  /**
   * Calcule une remise volume
   */
  calculateVolumeDiscount(totalAmount: Money, thresholds: Array<{ min: number; discount: number }>): Money {
    const amount = totalAmount.amount;
    
    // Trouver le seuil applicable
    const applicableThreshold = thresholds
      .filter((t) => amount >= t.min)
      .sort((a, b) => b.min - a.min)[0];

    if (!applicableThreshold) {
      return Money.zero();
    }

    return totalAmount.multiply(applicableThreshold.discount / 100);
  }

  /**
   * Calcule le sous-total d'une commande
   */
  calculateSubtotal(items: Array<{ price: Money; quantity: number }>): Money {
    return items.reduce((total, item) => {
      return total.add(item.price.multiply(item.quantity));
    }, Money.zero());
  }

  /**
   * Calcule les taxes
   */
  calculateTax(subtotal: Money, taxRate: number): Money {
    return subtotal.multiply(taxRate);
  }

  /**
   * Calcule le total d'une commande
   */
  calculateTotal(subtotal: Money, taxAmount: Money, deliveryFee?: Money): Money {
    let total = subtotal.add(taxAmount);
    if (deliveryFee) {
      total = total.add(deliveryFee);
    }
    return total;
  }
}
