import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:awid_mobile/features/customer/domain/usecases/track_delivery_usecase.dart';
import 'package:awid_mobile/features/customer/domain/repositories/customer_repository.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_delivery.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([CustomerRepository])
import 'track_delivery_usecase_test.mocks.dart';

void main() {
  late TrackDeliveryUseCase useCase;
  late MockCustomerRepository mockRepository;

  setUp(() {
    mockRepository = MockCustomerRepository();
    useCase = TrackDeliveryUseCase(mockRepository);
  });

  group('TrackDeliveryUseCase', () {
    const deliveryId = 'delivery-001';
    const customerId = 'customer-456';

    test('should track delivery successfully', () async {
      // Arrange
      final delivery = CustomerDelivery(
        id: deliveryId,
        orderId: 'order-123',
        status: DeliveryStatus.inProgress,
        delivererName: 'John Deliverer',
        delivererPhone: '+33612345678',
        currentLatitude: 48.8566,
        currentLongitude: 2.3522,
        destinationLatitude: 48.8606,
        destinationLongitude: 2.3376,
        estimatedArrival: DateTime.now().add(const Duration(minutes: 15)),
        startedAt: DateTime.now().subtract(const Duration(minutes: 10)),
      );
      when(mockRepository.getDelivery(deliveryId))
          .thenAnswer((_) async => delivery);

      // Act
      final result = await useCase.execute(deliveryId);

      // Assert
      expect(result.isSuccess, true);
      final success = result as TrackDeliverySuccess;
      expect(success.delivery.id, deliveryId);
      expect(success.delivery.status, DeliveryStatus.inProgress);
      verify(mockRepository.getDelivery(deliveryId)).called(1);
    });

    test('should return failure when delivery not found', () async {
      // Arrange
      when(mockRepository.getDelivery(deliveryId))
          .thenAnswer((_) async => null);

      // Act
      final result = await useCase.execute(deliveryId);

      // Assert
      expect(result.isFailure, true);
      final failure = result as TrackDeliveryFailure;
      expect(failure.error, contains('non trouvée'));
      expect(failure.deliveryId, deliveryId);
    });

    test('should return not trackable when delivery is pending', () async {
      // Arrange
      final delivery = CustomerDelivery(
        id: deliveryId,
        orderId: 'order-123',
        status: DeliveryStatus.pending,
        delivererName: 'John Deliverer',
        delivererPhone: '+33612345678',
        destinationLatitude: 48.8606,
        destinationLongitude: 2.3376,
      );
      when(mockRepository.getDelivery(deliveryId))
          .thenAnswer((_) async => delivery);

      // Act
      final result = await useCase.execute(deliveryId);

      // Assert
      expect(result.isNotTrackable, true);
      final notTrackable = result as TrackDeliveryNotTrackable;
      expect(notTrackable.delivery.id, deliveryId);
      expect(notTrackable.reason, contains('pas encore en cours'));
    });

    test('should throw when delivery ID is empty', () async {
      // Act & Assert
      expect(
        () => useCase.execute(''),
        throwsArgumentError,
      );
    });

    test('should handle network errors', () async {
      // Arrange
      when(mockRepository.getDelivery(deliveryId))
          .thenThrow(Exception('Network error'));

      // Act
      final result = await useCase.execute(deliveryId);

      // Assert
      expect(result.isFailure, true);
      final failure = result as TrackDeliveryFailure;
      expect(failure.error, contains('Network error'));
    });

    test('should get active deliveries successfully', () async {
      // Arrange
      final deliveries = [
        CustomerDelivery(
          id: 'delivery-001',
          orderId: 'order-123',
          status: DeliveryStatus.inProgress,
          delivererName: 'John Deliverer',
          delivererPhone: '+33612345678',
          destinationLatitude: 48.8606,
          destinationLongitude: 2.3376,
        ),
        CustomerDelivery(
          id: 'delivery-002',
          orderId: 'order-124',
          status: DeliveryStatus.inProgress,
          delivererName: 'Jane Deliverer',
          delivererPhone: '+33612345679',
          destinationLatitude: 48.8606,
          destinationLongitude: 2.3376,
        ),
      ];
      when(mockRepository.getActiveDeliveries(customerId))
          .thenAnswer((_) async => deliveries);

      // Act
      final result = await useCase.getActiveDeliveries(customerId);

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetActiveDeliveriesSuccess;
      expect(success.deliveries.length, 2);
      expect(success.isNotEmpty, true);
      expect(success.count, 2);
    });

    test('should return empty list when no active deliveries', () async {
      // Arrange
      when(mockRepository.getActiveDeliveries(customerId))
          .thenAnswer((_) async => []);

      // Act
      final result = await useCase.getActiveDeliveries(customerId);

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetActiveDeliveriesSuccess;
      expect(success.isEmpty, true);
      expect(success.count, 0);
    });

    test('should throw when customer ID is empty for active deliveries', () async {
      // Act & Assert
      expect(
        () => useCase.getActiveDeliveries(''),
        throwsArgumentError,
      );
    });

    test('should get deliveries history successfully', () async {
      // Arrange
      final deliveries = [
        CustomerDelivery(
          id: 'delivery-001',
          orderId: 'order-123',
          status: DeliveryStatus.completed,
          delivererName: 'John Deliverer',
          delivererPhone: '+33612345678',
          destinationLatitude: 48.8606,
          destinationLongitude: 2.3376,
          completedAt: DateTime.now(),
        ),
      ];
      when(mockRepository.getDeliveriesHistory(
        customerId: customerId,
        startDate: null,
        endDate: null,
        limit: null,
      )).thenAnswer((_) async => deliveries);

      // Act
      final result = await useCase.getDeliveriesHistory(customerId);

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetDeliveriesHistorySuccess;
      expect(success.deliveries.length, 1);
      expect(success.isNotEmpty, true);
    });

    test('should filter deliveries history by date range', () async {
      // Arrange
      final startDate = DateTime(2026, 1, 1);
      final endDate = DateTime(2026, 1, 31);
      final deliveries = [
        CustomerDelivery(
          id: 'delivery-001',
          orderId: 'order-123',
          status: DeliveryStatus.completed,
          delivererName: 'John Deliverer',
          delivererPhone: '+33612345678',
          destinationLatitude: 48.8606,
          destinationLongitude: 2.3376,
          completedAt: DateTime(2026, 1, 15),
        ),
      ];
      when(mockRepository.getDeliveriesHistory(
        customerId: customerId,
        startDate: startDate,
        endDate: endDate,
        limit: null,
      )).thenAnswer((_) async => deliveries);

      // Act
      final result = await useCase.getDeliveriesHistory(
        customerId,
        startDate: startDate,
        endDate: endDate,
      );

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetDeliveriesHistorySuccess;
      expect(success.isNotEmpty, true);
    });

    test('should limit deliveries history', () async {
      // Arrange
      final deliveries = List.generate(
        10,
        (i) => CustomerDelivery(
          id: 'delivery-$i',
          orderId: 'order-$i',
          status: DeliveryStatus.completed,
          delivererName: 'John Deliverer',
          delivererPhone: '+33612345678',
          destinationLatitude: 48.8606,
          destinationLongitude: 2.3376,
          completedAt: DateTime.now(),
        ),
      );
      when(mockRepository.getDeliveriesHistory(
        customerId: customerId,
        startDate: null,
        endDate: null,
        limit: 10,
      )).thenAnswer((_) async => deliveries);

      // Act
      final result = await useCase.getDeliveriesHistory(
        customerId,
        limit: 10,
      );

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetDeliveriesHistorySuccess;
      expect(success.count, 10);
    });

    test('should calculate success rate correctly', () async {
      // Arrange
      final deliveries = [
        CustomerDelivery(
          id: 'delivery-001',
          orderId: 'order-123',
          status: DeliveryStatus.completed,
          delivererName: 'John Deliverer',
          delivererPhone: '+33612345678',
          destinationLatitude: 48.8606,
          destinationLongitude: 2.3376,
          completedAt: DateTime.now(),
        ),
        CustomerDelivery(
          id: 'delivery-002',
          orderId: 'order-124',
          status: DeliveryStatus.completed,
          delivererName: 'John Deliverer',
          delivererPhone: '+33612345678',
          destinationLatitude: 48.8606,
          destinationLongitude: 2.3376,
          completedAt: DateTime.now(),
        ),
        CustomerDelivery(
          id: 'delivery-003',
          orderId: 'order-125',
          status: DeliveryStatus.failed,
          delivererName: 'John Deliverer',
          delivererPhone: '+33612345678',
          destinationLatitude: 48.8606,
          destinationLongitude: 2.3376,
        ),
      ];
      when(mockRepository.getDeliveriesHistory(
        customerId: customerId,
        startDate: null,
        endDate: null,
        limit: null,
      )).thenAnswer((_) async => deliveries);

      // Act
      final result = await useCase.getDeliveriesHistory(customerId);

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetDeliveriesHistorySuccess;
      expect(success.successRate, closeTo(66.67, 0.1));
      expect(success.completedDeliveries.length, 2);
      expect(success.failedDeliveries.length, 1);
    });

    test('should calculate distance between two points', () {
      // Arrange
      const lat1 = 48.8566; // Paris
      const lon1 = 2.3522;
      const lat2 = 48.8606; // Near Paris
      const lon2 = 2.3376;

      // Act
      final distance = useCase.calculateDistance(
        lat1: lat1,
        lon1: lon1,
        lat2: lat2,
        lon2: lon2,
      );

      // Assert
      expect(distance, greaterThan(0));
      expect(distance, lessThan(2)); // Should be less than 2km
    });

    test('should calculate zero distance for same location', () {
      // Arrange
      const lat = 48.8566;
      const lon = 2.3522;

      // Act
      final distance = useCase.calculateDistance(
        lat1: lat,
        lon1: lon,
        lat2: lat,
        lon2: lon,
      );

      // Assert
      expect(distance, closeTo(0, 0.001));
    });

    test('should estimate arrival time correctly', () {
      // Arrange
      const distanceKm = 10.0;
      const averageSpeedKmh = 30.0;

      // Act
      final arrival = useCase.estimateArrival(
        distanceKm: distanceKm,
        averageSpeedKmh: averageSpeedKmh,
      );

      // Assert
      expect(arrival, isNotNull);
      final expectedMinutes = (distanceKm / averageSpeedKmh * 60).round();
      final actualMinutes = arrival!.difference(DateTime.now()).inMinutes;
      expect(actualMinutes, closeTo(expectedMinutes, 1));
    });

    test('should return immediate arrival for zero distance', () {
      // Act
      final arrival = useCase.estimateArrival(distanceKm: 0);

      // Assert
      expect(arrival, isNotNull);
      expect(arrival!.difference(DateTime.now()).inSeconds, lessThan(1));
    });

    test('should return immediate arrival for negative distance', () {
      // Act
      final arrival = useCase.estimateArrival(distanceKm: -5);

      // Assert
      expect(arrival, isNotNull);
      expect(arrival!.difference(DateTime.now()).inSeconds, lessThan(1));
    });

    test('should filter trackable deliveries', () async {
      // Arrange
      final deliveries = [
        CustomerDelivery(
          id: 'delivery-001',
          orderId: 'order-123',
          status: DeliveryStatus.inProgress,
          delivererName: 'John Deliverer',
          delivererPhone: '+33612345678',
          destinationLatitude: 48.8606,
          destinationLongitude: 2.3376,
        ),
        CustomerDelivery(
          id: 'delivery-002',
          orderId: 'order-124',
          status: DeliveryStatus.pending,
          delivererName: 'Jane Deliverer',
          delivererPhone: '+33612345679',
          destinationLatitude: 48.8606,
          destinationLongitude: 2.3376,
        ),
      ];
      when(mockRepository.getActiveDeliveries(customerId))
          .thenAnswer((_) async => deliveries);

      // Act
      final result = await useCase.getActiveDeliveries(customerId);

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetActiveDeliveriesSuccess;
      expect(success.trackableDeliveries.length, 1);
      expect(success.trackableDeliveries.first.status, DeliveryStatus.inProgress);
    });

    test('should handle timeout', () async {
      // Arrange
      when(mockRepository.getDelivery(deliveryId)).thenAnswer(
        (_) => Future.delayed(
          const Duration(seconds: 10),
          () => CustomerDelivery(
            id: deliveryId,
            orderId: 'order-123',
            status: DeliveryStatus.inProgress,
            delivererName: 'John Deliverer',
            delivererPhone: '+33612345678',
            destinationLatitude: 48.8606,
            destinationLongitude: 2.3376,
          ),
        ),
      );

      // Act & Assert
      expect(
        () => useCase.execute(deliveryId).timeout(
              const Duration(seconds: 1),
            ),
        throwsA(isA<TimeoutException>()),
      );
    });

    test('should check if delivery has current location', () async {
      // Arrange
      final delivery = CustomerDelivery(
        id: deliveryId,
        orderId: 'order-123',
        status: DeliveryStatus.inProgress,
        delivererName: 'John Deliverer',
        delivererPhone: '+33612345678',
        currentLatitude: 48.8566,
        currentLongitude: 2.3522,
        destinationLatitude: 48.8606,
        destinationLongitude: 2.3376,
      );
      when(mockRepository.getDelivery(deliveryId))
          .thenAnswer((_) async => delivery);

      // Act
      final result = await useCase.execute(deliveryId);

      // Assert
      expect(result.isSuccess, true);
      final success = result as TrackDeliverySuccess;
      expect(success.hasCurrentLocation, true);
    });

    test('should check if delivery has estimated arrival', () async {
      // Arrange
      final delivery = CustomerDelivery(
        id: deliveryId,
        orderId: 'order-123',
        status: DeliveryStatus.inProgress,
        delivererName: 'John Deliverer',
        delivererPhone: '+33612345678',
        destinationLatitude: 48.8606,
        destinationLongitude: 2.3376,
        estimatedArrival: DateTime.now().add(const Duration(minutes: 15)),
      );
      when(mockRepository.getDelivery(deliveryId))
          .thenAnswer((_) async => delivery);

      // Act
      final result = await useCase.execute(deliveryId);

      // Assert
      expect(result.isSuccess, true);
      final success = result as TrackDeliverySuccess;
      expect(success.hasEstimatedArrival, true);
    });

    test('should handle concurrent tracking requests', () async {
      // Arrange
      final deliveryIds = ['delivery-001', 'delivery-002', 'delivery-003'];
      for (final id in deliveryIds) {
        when(mockRepository.getDelivery(id)).thenAnswer(
          (_) async => CustomerDelivery(
            id: id,
            orderId: 'order-$id',
            status: DeliveryStatus.inProgress,
            delivererName: 'John Deliverer',
            delivererPhone: '+33612345678',
            destinationLatitude: 48.8606,
            destinationLongitude: 2.3376,
          ),
        );
      }

      // Act
      final futures = deliveryIds.map((id) => useCase.execute(id));
      final results = await Future.wait(futures);

      // Assert
      expect(results.length, 3);
      for (final result in results) {
        expect(result.isSuccess, true);
      }
    });

    test('should handle database errors', () async {
      // Arrange
      when(mockRepository.getDelivery(deliveryId))
          .thenThrow(Exception('Database error'));

      // Act
      final result = await useCase.execute(deliveryId);

      // Assert
      expect(result.isFailure, true);
      final failure = result as TrackDeliveryFailure;
      expect(failure.error, contains('Database error'));
    });
  });
}
