/**
 * Domain Service: CreditService
 * Gère la logique métier liée au crédit client
 */
import { Order } from '../entities/Order';
import { User } from '../entities/User';
import { Money } from '../value-objects/Money';

export interface DebtInfo {
  totalDebt: Money;
  unpaidOrders: Order[];
  creditLimit: Money;
  creditAvailable: Money;
  isOverLimit: boolean;
  exceededBy: Money;
}

export class CreditService {
  /**
   * Calcule la dette totale d'un client
   */
  calculateTotalDebt(orders: Order[]): Money {
    return orders
      .filter((order) => !order.isPaid() && !order.isCancelled())
      .reduce((total, order) => total.add(order.total), Money.zero());
  }

  /**
   * Vérifie si un client peut passer une nouvelle commande
   */
  canPlaceOrder(customer: User, currentDebt: Money, newOrderAmount: Money): boolean {
    if (!customer.creditLimitEnabled || !customer.creditLimit) {
      return true; // Pas de limite de crédit
    }

    const totalDebt = currentDebt.add(newOrderAmount);
    return totalDebt.isLessThan(customer.creditLimit) || 
           totalDebt.isEqual(customer.creditLimit);
  }

  /**
   * Calcule le crédit disponible pour un client
   */
  calculateAvailableCredit(customer: User, currentDebt: Money): Money {
    if (!customer.creditLimitEnabled || !customer.creditLimit) {
      return Money.create(Number.MAX_SAFE_INTEGER); // Crédit illimité
    }

    const available = customer.creditLimit.subtract(currentDebt);
    return available.isPositive() ? available : Money.zero();
  }

  /**
   * Obtient les informations complètes de dette d'un client
   */
  getDebtInfo(customer: User, unpaidOrders: Order[]): DebtInfo {
    const totalDebt = this.calculateTotalDebt(unpaidOrders);
    const creditLimit = customer.creditLimit || Money.zero();
    const creditAvailable = this.calculateAvailableCredit(customer, totalDebt);
    const isOverLimit = customer.creditLimitEnabled && totalDebt.isGreaterThan(creditLimit);
    const exceededBy = isOverLimit ? totalDebt.subtract(creditLimit) : Money.zero();

    return {
      totalDebt,
      unpaidOrders,
      creditLimit,
      creditAvailable,
      isOverLimit,
      exceededBy,
    };
  }

  /**
   * Calcule le vieillissement de la dette (aging)
   */
  calculateDebtAging(orders: Order[]): {
    current: Money; // 0-7 jours
    days8to15: Money;
    days16to30: Money;
    over30: Money;
  } {
    const now = new Date();
    const unpaidOrders = orders.filter((order) => !order.isPaid() && !order.isCancelled());

    const aging = {
      current: Money.zero(),
      days8to15: Money.zero(),
      days16to30: Money.zero(),
      over30: Money.zero(),
    };

    unpaidOrders.forEach((order) => {
      const daysSinceCreation = Math.floor(
        (now.getTime() - order.createdAt.getTime()) / (1000 * 60 * 60 * 24)
      );

      if (daysSinceCreation <= 7) {
        aging.current = aging.current.add(order.total);
      } else if (daysSinceCreation <= 15) {
        aging.days8to15 = aging.days8to15.add(order.total);
      } else if (daysSinceCreation <= 30) {
        aging.days16to30 = aging.days16to30.add(order.total);
      } else {
        aging.over30 = aging.over30.add(order.total);
      }
    });

    return aging;
  }

  /**
   * Détermine le niveau de risque d'un client
   */
  assessCreditRisk(customer: User, debtInfo: DebtInfo, aging: ReturnType<typeof this.calculateDebtAging>): 'low' | 'medium' | 'high' | 'critical' {
    // Risque critique si dépassement de limite
    if (debtInfo.isOverLimit) {
      return 'critical';
    }

    // Risque élevé si dette > 30 jours
    if (aging.over30.isGreaterThan(Money.zero())) {
      return 'high';
    }

    // Risque moyen si utilisation > 80% de la limite
    if (customer.creditLimitEnabled && customer.creditLimit) {
      const utilizationRate = debtInfo.totalDebt.amount / customer.creditLimit.amount;
      if (utilizationRate > 0.8) {
        return 'medium';
      }
    }

    return 'low';
  }
}
