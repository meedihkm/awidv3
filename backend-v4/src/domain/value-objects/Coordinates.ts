/**
 * Value Object: Coordinates
 * Représente des coordonnées GPS (latitude, longitude)
 */
export interface CoordinatesProps {
  lat: number;
  lng: number;
}

export class Coordinates {
  private readonly _lat: number;
  private readonly _lng: number;

  private constructor(lat: number, lng: number) {
    if (lat < -90 || lat > 90) {
      throw new Error('La latitude doit être entre -90 et 90');
    }
    if (lng < -180 || lng > 180) {
      throw new Error('La longitude doit être entre -180 et 180');
    }

    this._lat = lat;
    this._lng = lng;
  }

  static create(lat: number, lng: number): Coordinates {
    return new Coordinates(lat, lng);
  }

  static fromObject(props: CoordinatesProps): Coordinates {
    return new Coordinates(props.lat, props.lng);
  }

  get lat(): number {
    return this._lat;
  }

  get lng(): number {
    return this._lng;
  }

  /**
   * Calcule la distance en kilomètres entre deux coordonnées (formule de Haversine)
   */
  distanceTo(other: Coordinates): number {
    const R = 6371; // Rayon de la Terre en km
    const dLat = this.toRadians(other._lat - this._lat);
    const dLng = this.toRadians(other._lng - this._lng);

    const a =
      Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos(this.toRadians(this._lat)) *
        Math.cos(this.toRadians(other._lat)) *
        Math.sin(dLng / 2) *
        Math.sin(dLng / 2);

    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c;
  }

  private toRadians(degrees: number): number {
    return degrees * (Math.PI / 180);
  }

  toString(): string {
    return `${this._lat}, ${this._lng}`;
  }

  toJSON(): CoordinatesProps {
    return {
      lat: this._lat,
      lng: this._lng,
    };
  }
}
