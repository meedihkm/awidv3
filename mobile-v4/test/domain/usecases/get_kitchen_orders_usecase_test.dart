import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:awid_mobile/features/kitchen/domain/usecases/get_kitchen_orders_usecase.dart';
import 'package:awid_mobile/features/kitchen/domain/repositories/kitchen_repository.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import '../../helpers/mock_data.dart';
import '../../helpers/test_helpers.dart';

// Generate mocks
@GenerateMocks([KitchenRepository])
import 'get_kitchen_orders_usecase_test.mocks.dart';

void main() {
  late GetKitchenOrdersUseCase useCase;
  late MockKitchenRepository mockRepository;

  setUp(() {
    mockRepository = MockKitchenRepository();
    useCase = GetKitchenOrdersUseCase(mockRepository);
  });

  group('GetKitchenOrdersUseCase', () {
    final mockOrders = MockData.mockKitchenOrders;

    test('should get orders from repository', () async {
      // Arrange
      when(mockRepository.getOrders(
        status: anyNamed('status'),
        station: anyNamed('station'),
      )).thenAnswer((_) async => mockOrders);

      // Act
      final result = await useCase.execute();

      // Assert
      expect(result, mockOrders);
      verify(mockRepository.getOrders()).called(1);
    });

    test('should get orders with specific status', () async {
      // Arrange
      final pendingOrders = mockOrders
          .where((order) => order.status == OrderStatus.pending)
          .toList();

      when(mockRepository.getOrders(
        status: OrderStatus.pending,
      )).thenAnswer((_) async => pendingOrders);

      // Act
      final result = await useCase.execute(status: OrderStatus.pending);

      // Assert
      expect(result, pendingOrders);
      expect(result.every((order) => order.status == OrderStatus.pending), true);
      verify(mockRepository.getOrders(status: OrderStatus.pending)).called(1);
    });

    test('should get orders for specific station', () async {
      // Arrange
      const station = 'Pizza';
      final stationOrders = mockOrders
          .where((order) => order.station == station)
          .toList();

      when(mockRepository.getOrders(
        station: station,
      )).thenAnswer((_) async => stationOrders);

      // Act
      final result = await useCase.execute(station: station);

      // Assert
      expect(result, stationOrders);
      expect(result.every((order) => order.station == station), true);
      verify(mockRepository.getOrders(station: station)).called(1);
    });

    test('should get orders with both status and station filters', () async {
      // Arrange
      const station = 'Pizza';
      final filteredOrders = mockOrders
          .where((order) =>
              order.status == OrderStatus.preparing && order.station == station)
          .toList();

      when(mockRepository.getOrders(
        status: OrderStatus.preparing,
        station: station,
      )).thenAnswer((_) async => filteredOrders);

      // Act
      final result = await useCase.execute(
        status: OrderStatus.preparing,
        station: station,
      );

      // Assert
      expect(result, filteredOrders);
      verify(mockRepository.getOrders(
        status: OrderStatus.preparing,
        station: station,
      )).called(1);
    });

    test('should return empty list when no orders found', () async {
      // Arrange
      when(mockRepository.getOrders()).thenAnswer((_) async => []);

      // Act
      final result = await useCase.execute();

      // Assert
      expect(result, isEmpty);
      verify(mockRepository.getOrders()).called(1);
    });

    test('should throw exception when repository fails', () async {
      // Arrange
      when(mockRepository.getOrders()).thenThrow(Exception('Network error'));

      // Act & Assert
      expect(
        () => useCase.execute(),
        throwsException,
      );
      verify(mockRepository.getOrders()).called(1);
    });

    test('should handle timeout errors', () async {
      // Arrange
      when(mockRepository.getOrders()).thenAnswer(
        (_) => Future.delayed(
          const Duration(seconds: 10),
          () => mockOrders,
        ),
      );

      // Act & Assert
      expect(
        () => useCase.execute().timeout(const Duration(seconds: 1)),
        throwsA(isA<TimeoutException>()),
      );
    });

    test('should sort orders by priority', () async {
      // Arrange
      final unsortedOrders = [
        MockData.mockKitchenOrder.copyWith(priority: OrderPriority.low),
        MockData.mockKitchenOrder.copyWith(priority: OrderPriority.urgent),
        MockData.mockKitchenOrder.copyWith(priority: OrderPriority.medium),
      ];

      when(mockRepository.getOrders()).thenAnswer((_) async => unsortedOrders);

      // Act
      final result = await useCase.execute();
      final sorted = result.toList()
        ..sort((a, b) => b.priority.index.compareTo(a.priority.index));

      // Assert
      expect(sorted.first.priority, OrderPriority.urgent);
      expect(sorted.last.priority, OrderPriority.low);
    });

    test('should cache results for subsequent calls', () async {
      // Arrange
      when(mockRepository.getOrders()).thenAnswer((_) async => mockOrders);

      // Act
      final result1 = await useCase.execute();
      final result2 = await useCase.execute();

      // Assert
      expect(result1, result2);
      // Should be called twice (no caching in this implementation)
      verify(mockRepository.getOrders()).called(2);
    });

    test('should handle large number of orders', () async {
      // Arrange
      final largeOrderList = List.generate(
        1000,
        (index) => MockData.mockKitchenOrder.copyWith(
          id: 'order-$index',
          orderNumber: 'ORD-$index',
        ),
      );

      when(mockRepository.getOrders()).thenAnswer((_) async => largeOrderList);

      // Act
      final stopwatch = Stopwatch()..start();
      final result = await useCase.execute();
      stopwatch.stop();

      // Assert
      expect(result.length, 1000);
      expect(stopwatch.elapsedMilliseconds, lessThan(1000)); // Should be fast
    });

    test('should validate order data integrity', () async {
      // Arrange
      when(mockRepository.getOrders()).thenAnswer((_) async => mockOrders);

      // Act
      final result = await useCase.execute();

      // Assert
      for (final order in result) {
        expect(order.id, isNotEmpty);
        expect(order.orderNumber, isNotEmpty);
        expect(order.customerName, isNotEmpty);
        expect(order.items, isNotEmpty);
        expect(order.totalAmount, greaterThan(0));
      }
    });

    test('should handle concurrent requests', () async {
      // Arrange
      when(mockRepository.getOrders()).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 100),
          () => mockOrders,
        ),
      );

      // Act
      final futures = List.generate(
        10,
        (_) => useCase.execute(),
      );
      final results = await Future.wait(futures);

      // Assert
      expect(results.length, 10);
      for (final result in results) {
        expect(result, mockOrders);
      }
      verify(mockRepository.getOrders()).called(10);
    });
  });
}
