import { IDeliveryRepository } from '../../../domain/repositories/IDeliveryRepository';
import { Coordinates } from '../../../domain/value-objects/Coordinates';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';

interface RecordTrackingInput {
  deliveryId: string;
  userId: string;
  userRole: string;
  latitude: number;
  longitude: number;
}

interface RecordTrackingOutput {
  success: boolean;
}

export class RecordTrackingUseCase {
  constructor(private deliveryRepository: IDeliveryRepository) {}

  async execute(input: RecordTrackingInput): Promise<RecordTrackingOutput> {
    if (input.userRole !== 'deliverer') {
      throw new ForbiddenError('Only deliverers can record tracking');
    }

    const delivery = await this.deliveryRepository.findById(input.deliveryId);
    if (!delivery) {
      throw new NotFoundError('Delivery not found');
    }

    if (delivery.getDelivererId() !== input.userId) {
      throw new ForbiddenError('Access denied');
    }

    const location = Coordinates.create(input.latitude, input.longitude);

    await this.deliveryRepository.recordTracking(
      input.deliveryId,
      input.userId,
      location
    );

    return {
      success: true,
    };
  }
}
