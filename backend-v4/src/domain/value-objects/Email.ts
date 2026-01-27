/**
 * Value Object: Email
 * Représente une adresse email valide
 */
export class Email {
  private readonly _value: string;

  private constructor(value: string) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!emailRegex.test(value)) {
      throw new Error('Adresse email invalide');
    }

    // Normaliser en minuscules
    this._value = value.toLowerCase().trim();
  }

  static create(value: string): Email {
    return new Email(value);
  }

  get value(): string {
    return this._value;
  }

  getDomain(): string {
    return this._value.split('@')[1] || '';
  }

  getLocalPart(): string {
    return this._value.split('@')[0] || '';
  }

  toString(): string {
    return this._value;
  }

  toJSON(): string {
    return this._value;
  }
}
