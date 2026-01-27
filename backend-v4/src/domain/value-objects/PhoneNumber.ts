/**
 * Value Object: PhoneNumber
 * Représente un numéro de téléphone algérien
 */
export class PhoneNumber {
  private readonly _value: string;

  private constructor(value: string) {
    const cleaned = value.replace(/\s+/g, '');

    // Format algérien: +213XXXXXXXXX ou 0XXXXXXXXX
    const algerianPhoneRegex = /^(\+213|0)(5|6|7)[0-9]{8}$/;

    if (!algerianPhoneRegex.test(cleaned)) {
      throw new Error(
        'Numéro de téléphone algérien invalide. Format attendu: +213XXXXXXXXX ou 0XXXXXXXXX'
      );
    }

    // Normaliser au format international
    this._value = cleaned.startsWith('+213')
      ? cleaned
      : '+213' + cleaned.substring(1);
  }

  static create(value: string): PhoneNumber {
    return new PhoneNumber(value);
  }

  get value(): string {
    return this._value;
  }

  /**
   * Retourne le numéro au format local (0XXXXXXXXX)
   */
  toLocalFormat(): string {
    return '0' + this._value.substring(4);
  }

  /**
   * Retourne le numéro au format international (+213XXXXXXXXX)
   */
  toInternationalFormat(): string {
    return this._value;
  }

  /**
   * Retourne le numéro formaté pour l'affichage (0XXX XX XX XX)
   */
  toDisplayFormat(): string {
    const local = this.toLocalFormat();
    return `${local.substring(0, 4)} ${local.substring(4, 6)} ${local.substring(6, 8)} ${local.substring(8)}`;
  }

  toString(): string {
    return this._value;
  }

  toJSON(): string {
    return this._value;
  }
}
