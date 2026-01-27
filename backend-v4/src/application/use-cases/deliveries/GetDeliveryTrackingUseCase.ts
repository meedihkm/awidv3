import { IDeliveryRepository } from '../../../domain/repositories/IDeliveryRepository';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';

interface GetDeliveryTrackingInput {
  deliveryId: string;
  userId: string;
  userRole: string;
  organizationId: string;
}

interface GetDeliveryTrackingOutput {
  delivery: {
    id: string;
    status: string;
    deliveryAddress: {
      street: string;
      city: string;
      coordinates?: {
        latitude: number;
        longitude: number;
      };
    };
  };
  currentLocation?: {
    latitude: number;
    longitude: number;
  };
  trackingHistory: Array<{
    latitude: number;
    longitude: number;
    timestamp: Date;
  }>;
}

export class GetDeliveryTrackingUseCase {
  constructor(private deliveryRepository: IDeliveryRepository) {}

  async execute(input: GetDeliveryTrackingInput): Promise<GetDeliveryTrackingOutput> {
    const delivery = await this.deliveryRepository.findById(input.deliveryId);
    if (!delivery) {
      throw new NotFoundError('Delivery not found');
    }

    if (delivery.getOrganizationId() !== input.organizationId) {
      throw new ForbiddenError('Access denied');
    }

    const currentLocation = await this.deliveryRepository.getLatestLocation(input.deliveryId);
    const trackingHistory = await this.deliveryRepository.getTrackingHistory(input.deliveryId);

    const deliveryAddress = delivery.getDeliveryAddress();

    return {
      delivery: {
        id: delivery.getId(),
        status: delivery.getStatus(),
        deliveryAddress: {
          street: deliveryAddress.street,
          city: deliveryAddress.city,
          coordinates: deliveryAddress.coordinates
            ? {
                latitude: deliveryAddress.coordinates.latitude,
                longitude: deliveryAddress.coordinates.longitude,
              }
            : undefined,
        },
      },
      currentLocation: currentLocation
        ? {
            latitude: currentLocation.latitude,
            longitude: currentLocation.longitude,
          }
        : undefined,
      trackingHistory: trackingHistory.map((track) => ({
        latitude: track.location.latitude,
        longitude: track.location.longitude,
        timestamp: track.timestamp,
      })),
    };
  }
}
