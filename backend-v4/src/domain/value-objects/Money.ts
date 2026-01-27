/**
 * Value Object: Money
 * Représente un montant monétaire en DZD (Dinar Algérien)
 */
export class Money {
  private readonly _amount: number;
  private readonly _currency: string = 'DZD';

  private constructor(amount: number) {
    if (amount < 0) {
      throw new Error('Le montant ne peut pas être négatif');
    }
    if (!Number.isFinite(amount)) {
      throw new Error('Le montant doit être un nombre fini');
    }
    // Arrondir à 2 décimales
    this._amount = Math.round(amount * 100) / 100;
  }

  static create(amount: number): Money {
    return new Money(amount);
  }

  static fromCents(cents: number, currency: string = 'DZD'): Money {
    return new Money(cents / 100);
  }

  static zero(): Money {
    return new Money(0);
  }

  get amount(): number {
    return this._amount;
  }

  get currency(): string {
    return this._currency;
  }

  add(other: Money): Money {
    return new Money(this._amount + other._amount);
  }

  subtract(other: Money): Money {
    return new Money(this._amount - other._amount);
  }

  multiply(factor: number): Money {
    return new Money(this._amount * factor);
  }

  divide(divisor: number): Money {
    if (divisor === 0) {
      throw new Error('Division par zéro impossible');
    }
    return new Money(this._amount / divisor);
  }

  isGreaterThan(other: Money): boolean {
    return this._amount > other._amount;
  }

  isLessThan(other: Money): boolean {
    return this._amount < other._amount;
  }

  isEqual(other: Money): boolean {
    return this._amount === other._amount;
  }

  isZero(): boolean {
    return this._amount === 0;
  }

  isPositive(): boolean {
    return this._amount > 0;
  }

  toString(): string {
    return `${this._amount.toFixed(2)} ${this._currency}`;
  }

  toJSON(): { amount: number; currency: string } {
    return {
      amount: this._amount,
      currency: this._currency,
    };
  }
}
