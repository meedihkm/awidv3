/**
 * External Service: OpenStreetMap
 * Service de cartographie et routing avec OSM (gratuit, pas de quota)
 */
export interface Coordinates {
  latitude: number;
  longitude: number;
}

export interface RouteResult {
  distance: number; // en mètres
  duration: number; // en secondes
  geometry: Coordinates[];
  instructions?: string[];
}

export interface GeocodingResult {
  address: string;
  coordinates: Coordinates;
  displayName: string;
}

export class OpenStreetMapService {
  private static instance: OpenStreetMapService;
  private baseUrl = 'https://nominatim.openstreetmap.org';
  private routingUrl = 'https://router.project-osrm.org';

  private constructor() {}

  static getInstance(): OpenStreetMapService {
    if (!OpenStreetMapService.instance) {
      OpenStreetMapService.instance = new OpenStreetMapService();
    }
    return OpenStreetMapService.instance;
  }

  /**
   * Geocoding: Convertir une adresse en coordonnées
   */
  async geocode(address: string): Promise<GeocodingResult | null> {
    try {
      const url = `${this.baseUrl}/search?q=${encodeURIComponent(address)}&format=json&limit=1`;

      console.log(`[OSM] Geocoding address: ${address}`);

      // Simuler l'appel API pour le MVP
      // En production, utiliser fetch ou axios
      await new Promise((resolve) => setTimeout(resolve, 200));

      // Données simulées pour Alger
      const result: GeocodingResult = {
        address,
        coordinates: {
          latitude: 36.7538 + (Math.random() - 0.5) * 0.1,
          longitude: 3.0588 + (Math.random() - 0.5) * 0.1,
        },
        displayName: `${address}, Alger, Algérie`,
      };

      console.log(
        `[OSM] Geocoded to: ${result.coordinates.latitude}, ${result.coordinates.longitude}`
      );
      return result;

      // TODO: Implémenter l'appel réel
      // const response = await fetch(url, {
      //   headers: {
      //     'User-Agent': 'AWID-Delivery-App/1.0',
      //   },
      // });
      // const data = await response.json();
      // if (data.length === 0) return null;
      // return {
      //   address,
      //   coordinates: {
      //     latitude: parseFloat(data[0].lat),
      //     longitude: parseFloat(data[0].lon),
      //   },
      //   displayName: data[0].display_name,
      // };
    } catch (error) {
      console.error('[OSM] Geocoding error:', error);
      return null;
    }
  }

  /**
   * Reverse Geocoding: Convertir des coordonnées en adresse
   */
  async reverseGeocode(coordinates: Coordinates): Promise<string | null> {
    try {
      const url = `${this.baseUrl}/reverse?lat=${coordinates.latitude}&lon=${coordinates.longitude}&format=json`;

      console.log(`[OSM] Reverse geocoding: ${coordinates.latitude}, ${coordinates.longitude}`);

      await new Promise((resolve) => setTimeout(resolve, 200));

      // Données simulées
      const address = `Rue de la République, Alger, Algérie`;
      console.log(`[OSM] Reverse geocoded to: ${address}`);
      return address;

      // TODO: Implémenter l'appel réel
      // const response = await fetch(url, {
      //   headers: {
      //     'User-Agent': 'AWID-Delivery-App/1.0',
      //   },
      // });
      // const data = await response.json();
      // return data.display_name;
    } catch (error) {
      console.error('[OSM] Reverse geocoding error:', error);
      return null;
    }
  }

  /**
   * Calculer un itinéraire entre deux points
   */
  async calculateRoute(from: Coordinates, to: Coordinates): Promise<RouteResult | null> {
    try {
      const url = `${this.routingUrl}/route/v1/driving/${from.longitude},${from.latitude};${to.longitude},${to.latitude}?overview=full&geometries=geojson`;

      console.log(
        `[OSM] Calculating route from ${from.latitude},${from.longitude} to ${to.latitude},${to.longitude}`
      );

      await new Promise((resolve) => setTimeout(resolve, 300));

      // Calculer distance approximative (formule haversine simplifiée)
      const R = 6371000; // Rayon de la Terre en mètres
      const dLat = ((to.latitude - from.latitude) * Math.PI) / 180;
      const dLon = ((to.longitude - from.longitude) * Math.PI) / 180;
      const a =
        Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos((from.latitude * Math.PI) / 180) *
          Math.cos((to.latitude * Math.PI) / 180) *
          Math.sin(dLon / 2) *
          Math.sin(dLon / 2);
      const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
      const distance = R * c;

      // Estimer durée (vitesse moyenne 30 km/h en ville)
      const duration = (distance / 1000) * (3600 / 30);

      const result: RouteResult = {
        distance: Math.round(distance),
        duration: Math.round(duration),
        geometry: [from, to], // Simplifié pour le MVP
        instructions: ['Départ', `Continuer sur ${Math.round(distance / 1000)} km`, 'Arrivée'],
      };

      console.log(`[OSM] Route calculated: ${result.distance}m, ${result.duration}s`);
      return result;

      // TODO: Implémenter l'appel réel
      // const response = await fetch(url);
      // const data = await response.json();
      // if (data.code !== 'Ok') return null;
      // const route = data.routes[0];
      // return {
      //   distance: route.distance,
      //   duration: route.duration,
      //   geometry: route.geometry.coordinates.map(([lon, lat]: [number, number]) => ({
      //     latitude: lat,
      //     longitude: lon,
      //   })),
      // };
    } catch (error) {
      console.error('[OSM] Route calculation error:', error);
      return null;
    }
  }

  /**
   * Optimiser un itinéraire multi-points (TSP - Travelling Salesman Problem)
   */
  async optimizeRoute(waypoints: Coordinates[]): Promise<{
    order: number[];
    totalDistance: number;
    totalDuration: number;
  } | null> {
    try {
      console.log(`[OSM] Optimizing route for ${waypoints.length} waypoints`);

      await new Promise((resolve) => setTimeout(resolve, 500));

      // Algorithme simple nearest neighbor pour le MVP
      // En production, utiliser OSRM trip service ou algorithme plus sophistiqué
      const order: number[] = [0]; // Commencer au premier point
      const remaining = Array.from({ length: waypoints.length - 1 }, (_, i) => i + 1);

      let currentIndex = 0;
      let totalDistance = 0;
      let totalDuration = 0;

      while (remaining.length > 0) {
        let nearestIndex = 0;
        let nearestDistance = Infinity;

        for (let i = 0; i < remaining.length; i++) {
          const route = await this.calculateRoute(waypoints[currentIndex], waypoints[remaining[i]]);
          if (route && route.distance < nearestDistance) {
            nearestDistance = route.distance;
            nearestIndex = i;
          }
        }

        const nextIndex = remaining[nearestIndex];
        order.push(nextIndex);
        remaining.splice(nearestIndex, 1);

        const route = await this.calculateRoute(waypoints[currentIndex], waypoints[nextIndex]);
        if (route) {
          totalDistance += route.distance;
          totalDuration += route.duration;
        }

        currentIndex = nextIndex;
      }

      console.log(
        `[OSM] Route optimized: ${order.join(' -> ')}, ${totalDistance}m, ${totalDuration}s`
      );

      return {
        order,
        totalDistance,
        totalDuration,
      };
    } catch (error) {
      console.error('[OSM] Route optimization error:', error);
      return null;
    }
  }

  /**
   * Calculer l'ETA (Estimated Time of Arrival)
   */
  calculateETA(distanceMeters: number, currentSpeed?: number): Date {
    // Vitesse par défaut: 30 km/h en ville
    const speedKmh = currentSpeed || 30;
    const durationSeconds = (distanceMeters / 1000) * (3600 / speedKmh);

    const eta = new Date();
    eta.setSeconds(eta.getSeconds() + durationSeconds);

    return eta;
  }

  /**
   * Vérifier si un point est dans un rayon donné
   */
  isWithinRadius(center: Coordinates, point: Coordinates, radiusMeters: number): boolean {
    const R = 6371000; // Rayon de la Terre en mètres
    const dLat = ((point.latitude - center.latitude) * Math.PI) / 180;
    const dLon = ((point.longitude - center.longitude) * Math.PI) / 180;
    const a =
      Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos((center.latitude * Math.PI) / 180) *
        Math.cos((point.latitude * Math.PI) / 180) *
        Math.sin(dLon / 2) *
        Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    const distance = R * c;

    return distance <= radiusMeters;
  }
}
