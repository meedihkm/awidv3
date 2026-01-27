import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:awid_mobile/features/kitchen/domain/usecases/update_order_status_usecase.dart';
import 'package:awid_mobile/features/kitchen/domain/usecases/get_kitchen_orders_usecase.dart';
import 'package:awid_mobile/features/kitchen/domain/repositories/kitchen_repository.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([KitchenRepository])
import 'update_order_status_usecase_test.mocks.dart';

void main() {
  late UpdateOrderStatusUseCase useCase;
  late MockKitchenRepository mockRepository;

  setUp(() {
    mockRepository = MockKitchenRepository();
    useCase = UpdateOrderStatusUseCase(mockRepository);
  });

  group('UpdateOrderStatusUseCase - execute', () {
    const orderId = 'order-123';
    const newStatus = KitchenOrderStatus.preparing;

    test('should update order status successfully', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        id: orderId,
        status: newStatus,
      );
      when(mockRepository.updateOrderStatus(
        orderId: orderId,
        status: newStatus,
      )).thenAnswer((_) async => updatedOrder);

      // Act
      final result = await useCase.execute(
        orderId: orderId,
        newStatus: newStatus,
      );

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, isNotNull);
      expect(result.data!.id, orderId);
      expect(result.data!.status, newStatus);
      verify(mockRepository.updateOrderStatus(
        orderId: orderId,
        status: newStatus,
      )).called(1);
    });

    test('should update from pending to preparing', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.preparing,
      );
      when(mockRepository.updateOrderStatus(
        orderId: anyNamed('orderId'),
        status: KitchenOrderStatus.preparing,
      )).thenAnswer((_) async => updatedOrder);

      // Act
      final result = await useCase.execute(
        orderId: orderId,
        newStatus: KitchenOrderStatus.preparing,
      );

      // Assert
      expect(result.isSuccess, true);
      expect(result.data!.status, KitchenOrderStatus.preparing);
    });

    test('should update from preparing to ready', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.ready,
      );
      when(mockRepository.updateOrderStatus(
        orderId: anyNamed('orderId'),
        status: KitchenOrderStatus.ready,
      )).thenAnswer((_) async => updatedOrder);

      // Act
      final result = await useCase.execute(
        orderId: orderId,
        newStatus: KitchenOrderStatus.ready,
      );

      // Assert
      expect(result.isSuccess, true);
      expect(result.data!.status, KitchenOrderStatus.ready);
    });

    test('should update from ready to completed', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.completed,
      );
      when(mockRepository.updateOrderStatus(
        orderId: anyNamed('orderId'),
        status: KitchenOrderStatus.completed,
      )).thenAnswer((_) async => updatedOrder);

      // Act
      final result = await useCase.execute(
        orderId: orderId,
        newStatus: KitchenOrderStatus.completed,
      );

      // Assert
      expect(result.isSuccess, true);
      expect(result.data!.status, KitchenOrderStatus.completed);
    });

    test('should return failure when order not found', () async {
      // Arrange
      when(mockRepository.updateOrderStatus(
        orderId: anyNamed('orderId'),
        status: anyNamed('status'),
      )).thenThrow(Exception('Order not found'));

      // Act
      final result = await useCase.execute(
        orderId: orderId,
        newStatus: newStatus,
      );

      // Assert
      expect(result.isFailure, true);
      expect(result.error, contains('Order not found'));
    });

    test('should return failure when invalid status transition', () async {
      // Arrange
      when(mockRepository.updateOrderStatus(
        orderId: anyNamed('orderId'),
        status: anyNamed('status'),
      )).thenThrow(Exception('Invalid status transition'));

      // Act
      final result = await useCase.execute(
        orderId: orderId,
        newStatus: newStatus,
      );

      // Assert
      expect(result.isFailure, true);
    });

    test('should handle network errors', () async {
      // Arrange
      when(mockRepository.updateOrderStatus(
        orderId: anyNamed('orderId'),
        status: anyNamed('status'),
      )).thenThrow(Exception('Network error'));

      // Act
      final result = await useCase.execute(
        orderId: orderId,
        newStatus: newStatus,
      );

      // Assert
      expect(result.isFailure, true);
      expect(result.error, contains('Network error'));
    });

    test('should update multiple orders sequentially', () async {
      // Arrange
      final orderIds = ['order-1', 'order-2', 'order-3'];
      for (final id in orderIds) {
        when(mockRepository.updateOrderStatus(
          orderId: id,
          status: newStatus,
        )).thenAnswer((_) async => MockData.mockKitchenOrder.copyWith(
              id: id,
              status: newStatus,
            ));
      }

      // Act
      final results = <Result<KitchenOrder>>[];
      for (final id in orderIds) {
        final result = await useCase.execute(
          orderId: id,
          newStatus: newStatus,
        );
        results.add(result);
      }

      // Assert
      expect(results.length, 3);
      for (var i = 0; i < results.length; i++) {
        expect(results[i].isSuccess, true);
        expect(results[i].data!.id, orderIds[i]);
        expect(results[i].data!.status, newStatus);
      }
    });

    test('should handle concurrent status updates', () async {
      // Arrange
      final orderIds = ['order-1', 'order-2', 'order-3'];
      for (final id in orderIds) {
        when(mockRepository.updateOrderStatus(
          orderId: id,
          status: newStatus,
        )).thenAnswer((_) async => MockData.mockKitchenOrder.copyWith(
              id: id,
              status: newStatus,
            ));
      }

      // Act
      final futures = orderIds.map((id) => useCase.execute(
            orderId: id,
            newStatus: newStatus,
          ));
      final results = await Future.wait(futures);

      // Assert
      expect(results.length, 3);
      for (final result in results) {
        expect(result.isSuccess, true);
        expect(result.data!.status, newStatus);
      }
    });

    test('should preserve other order properties', () async {
      // Arrange
      final originalOrder = MockData.mockKitchenOrder;
      final updatedOrder = originalOrder.copyWith(status: newStatus);
      when(mockRepository.updateOrderStatus(
        orderId: anyNamed('orderId'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => updatedOrder);

      // Act
      final result = await useCase.execute(
        orderId: orderId,
        newStatus: newStatus,
      );

      // Assert
      expect(result.isSuccess, true);
      expect(result.data!.orderNumber, originalOrder.orderNumber);
      expect(result.data!.customerName, originalOrder.customerName);
      expect(result.data!.items.length, originalOrder.items.length);
    });

    test('should handle rapid status changes', () async {
      // Arrange
      final statuses = [
        KitchenOrderStatus.pending,
        KitchenOrderStatus.preparing,
        KitchenOrderStatus.ready,
      ];

      for (final status in statuses) {
        when(mockRepository.updateOrderStatus(
          orderId: orderId,
          status: status,
        )).thenAnswer((_) async => MockData.mockKitchenOrder.copyWith(
              status: status,
            ));
      }

      // Act
      final results = <Result<KitchenOrder>>[];
      for (final status in statuses) {
        final result = await useCase.execute(
          orderId: orderId,
          newStatus: status,
        );
        results.add(result);
      }

      // Assert
      expect(results.length, 3);
      expect(results[0].data!.status, KitchenOrderStatus.pending);
      expect(results[1].data!.status, KitchenOrderStatus.preparing);
      expect(results[2].data!.status, KitchenOrderStatus.ready);
    });

    test('should validate status progression', () async {
      // Arrange
      final validProgressions = [
        [KitchenOrderStatus.pending, KitchenOrderStatus.preparing],
        [KitchenOrderStatus.preparing, KitchenOrderStatus.ready],
        [KitchenOrderStatus.ready, KitchenOrderStatus.completed],
      ];

      for (final progression in validProgressions) {
        when(mockRepository.updateOrderStatus(
          orderId: anyNamed('orderId'),
          status: progression[1],
        )).thenAnswer((_) async => MockData.mockKitchenOrder.copyWith(
              status: progression[1],
            ));

        // Act
        final result = await useCase.execute(
          orderId: orderId,
          newStatus: progression[1],
        );

        // Assert
        expect(result.isSuccess, true);
        expect(result.data!.status, progression[1]);
      }
    });

    test('should handle database errors', () async {
      // Arrange
      when(mockRepository.updateOrderStatus(
        orderId: anyNamed('orderId'),
        status: anyNamed('status'),
      )).thenThrow(Exception('Database error'));

      // Act
      final result = await useCase.execute(
        orderId: orderId,
        newStatus: newStatus,
      );

      // Assert
      expect(result.isFailure, true);
      expect(result.error, contains('Database error'));
    });
  });

  group('UpdateOrderStatusUseCase - startPreparation', () {
    const orderId = 'order-123';

    test('should start preparation successfully', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.preparing,
      );
      when(mockRepository.updateOrderStatus(
        orderId: orderId,
        status: KitchenOrderStatus.preparing,
      )).thenAnswer((_) async => updatedOrder);

      // Act
      final result = await useCase.startPreparation(orderId: orderId);

      // Assert
      expect(result.isSuccess, true);
      expect(result.data!.status, KitchenOrderStatus.preparing);
    });
  });

  group('UpdateOrderStatusUseCase - markAsReady', () {
    const orderId = 'order-123';

    test('should mark as ready successfully', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.ready,
      );
      when(mockRepository.updateOrderStatus(
        orderId: orderId,
        status: KitchenOrderStatus.ready,
      )).thenAnswer((_) async => updatedOrder);

      // Act
      final result = await useCase.markAsReady(orderId: orderId);

      // Assert
      expect(result.isSuccess, true);
      expect(result.data!.status, KitchenOrderStatus.ready);
    });
  });

  group('UpdateOrderStatusUseCase - complete', () {
    const orderId = 'order-123';

    test('should complete order successfully', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.completed,
      );
      when(mockRepository.updateOrderStatus(
        orderId: orderId,
        status: KitchenOrderStatus.completed,
      )).thenAnswer((_) async => updatedOrder);

      // Act
      final result = await useCase.complete(orderId: orderId);

      // Assert
      expect(result.isSuccess, true);
      expect(result.data!.status, KitchenOrderStatus.completed);
    });
  });

  group('UpdateOrderStatusUseCase - cancel', () {
    const orderId = 'order-123';
    const reason = 'Customer requested cancellation';

    test('should cancel order successfully', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.cancelled,
      );
      when(mockRepository.updateOrderStatus(
        orderId: orderId,
        status: KitchenOrderStatus.cancelled,
        notes: reason,
      )).thenAnswer((_) async => updatedOrder);

      // Act
      final result = await useCase.cancel(
        orderId: orderId,
        reason: reason,
      );

      // Assert
      expect(result.isSuccess, true);
      expect(result.data!.status, KitchenOrderStatus.cancelled);
    });
  });

  group('UpdateOrderStatusUseCase - changePriority', () {
    const orderId = 'order-123';
    const priority = OrderPriority.high;

    test('should change priority successfully', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        priority: priority,
      );
      when(mockRepository.updateOrderPriority(
        orderId: orderId,
        priority: priority,
      )).thenAnswer((_) async => updatedOrder);

      // Act
      final result = await useCase.changePriority(
        orderId: orderId,
        priority: priority,
      );

      // Assert
      expect(result.isSuccess, true);
      expect(result.data!.priority, priority);
    });
  });
}
