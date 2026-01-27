/**
 * Value Object: Address
 * Représente une adresse physique en Algérie
 */
import { Coordinates } from './Coordinates';

export interface AddressProps {
  street: string;
  city: string;
  wilaya?: string;
  postalCode?: string;
  coordinates?: Coordinates;
}

export class Address {
  private readonly _street: string;
  private readonly _city: string;
  private readonly _wilaya?: string;
  private readonly _postalCode?: string;
  private readonly _coordinates?: Coordinates;

  private constructor(props: AddressProps) {
    if (props.street.length < 5) {
      throw new Error('L\'adresse doit contenir au moins 5 caractères');
    }
    if (props.city.length < 2) {
      throw new Error('La ville doit contenir au moins 2 caractères');
    }
    if (props.postalCode && !/^\d{5}$/.test(props.postalCode)) {
      throw new Error('Le code postal doit contenir exactement 5 chiffres');
    }

    this._street = props.street.trim();
    this._city = props.city.trim();
    this._wilaya = props.wilaya?.trim();
    this._postalCode = props.postalCode;
    this._coordinates = props.coordinates;
  }

  static create(props: AddressProps): Address {
    return new Address(props);
  }

  get street(): string {
    return this._street;
  }

  get city(): string {
    return this._city;
  }

  get wilaya(): string | undefined {
    return this._wilaya;
  }

  get postalCode(): string | undefined {
    return this._postalCode;
  }

  get coordinates(): Coordinates | undefined {
    return this._coordinates;
  }

  getFullAddress(): string {
    const parts = [this._street, this._city];
    if (this._wilaya) parts.push(this._wilaya);
    if (this._postalCode) parts.push(this._postalCode);
    return parts.join(', ');
  }

  hasCoordinates(): boolean {
    return this._coordinates !== undefined;
  }

  toString(): string {
    return this.getFullAddress();
  }

  toJSON(): AddressProps {
    return {
      street: this._street,
      city: this._city,
      wilaya: this._wilaya,
      postalCode: this._postalCode,
      coordinates: this._coordinates?.toJSON(),
    };
  }
}
