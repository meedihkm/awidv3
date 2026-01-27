import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:awid_mobile/features/kitchen/presentation/providers/kitchen_orders_provider.dart';
import 'package:awid_mobile/features/kitchen/domain/usecases/get_kitchen_orders_usecase.dart';
import 'package:awid_mobile/features/kitchen/domain/usecases/update_order_status_usecase.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([GetKitchenOrdersUseCase, UpdateOrderStatusUseCase])
import 'kitchen_orders_provider_test.mocks.dart';

void main() {
  late KitchenOrdersNotifier notifier;
  late MockGetKitchenOrdersUseCase mockGetOrdersUseCase;
  late MockUpdateOrderStatusUseCase mockUpdateStatusUseCase;

  setUp(() {
    mockGetOrdersUseCase = MockGetKitchenOrdersUseCase();
    mockUpdateStatusUseCase = MockUpdateOrderStatusUseCase();
    notifier = KitchenOrdersNotifier(
      mockGetOrdersUseCase,
      mockUpdateStatusUseCase,
    );
  });

  group('KitchenOrdersState', () {
    test('initial state should be empty', () {
      // Arrange & Act
      final state = KitchenOrdersState();

      // Assert
      expect(state.orders, isEmpty);
      expect(state.isLoading, false);
      expect(state.error, isNull);
      expect(state.filterStatus, isNull);
      expect(state.filterPriority, isNull);
    });

    test('copyWith should update specified fields', () {
      // Arrange
      final state = KitchenOrdersState();

      // Act
      final newState = state.copyWith(
        orders: [MockData.mockKitchenOrder],
        isLoading: true,
        error: 'Test error',
      );

      // Assert
      expect(newState.orders.length, 1);
      expect(newState.isLoading, true);
      expect(newState.error, 'Test error');
    });

    test('copyWith with clearError should clear error', () {
      // Arrange
      final state = KitchenOrdersState(error: 'Test error');

      // Act
      final newState = state.copyWith(clearError: true);

      // Assert
      expect(newState.error, isNull);
    });

    test('filteredOrders should filter by status', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(status: KitchenOrderStatus.pending),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          status: KitchenOrderStatus.preparing,
        ),
      ];
      final state = KitchenOrdersState(
        orders: orders,
        filterStatus: KitchenOrderStatus.pending,
      );

      // Act
      final filtered = state.filteredOrders;

      // Assert
      expect(filtered.length, 1);
      expect(filtered.first.status, KitchenOrderStatus.pending);
    });

    test('filteredOrders should filter by priority', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(priority: OrderPriority.high),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          priority: OrderPriority.low,
        ),
      ];
      final state = KitchenOrdersState(
        orders: orders,
        filterPriority: OrderPriority.high,
      );

      // Act
      final filtered = state.filteredOrders;

      // Assert
      expect(filtered.length, 1);
      expect(filtered.first.priority, OrderPriority.high);
    });

    test('ordersByStatus should return orders with specific status', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(status: KitchenOrderStatus.pending),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          status: KitchenOrderStatus.pending,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-3',
          status: KitchenOrderStatus.preparing,
        ),
      ];
      final state = KitchenOrdersState(orders: orders);

      // Act
      final pending = state.ordersByStatus(KitchenOrderStatus.pending);

      // Assert
      expect(pending.length, 2);
      expect(pending.every((o) => o.status == KitchenOrderStatus.pending), true);
    });

    test('pendingOrders should return pending orders', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(status: KitchenOrderStatus.pending),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          status: KitchenOrderStatus.preparing,
        ),
      ];
      final state = KitchenOrdersState(orders: orders);

      // Act
      final pending = state.pendingOrders;

      // Assert
      expect(pending.length, 1);
      expect(pending.first.status, KitchenOrderStatus.pending);
    });

    test('preparingOrders should return preparing orders', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(status: KitchenOrderStatus.preparing),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          status: KitchenOrderStatus.ready,
        ),
      ];
      final state = KitchenOrdersState(orders: orders);

      // Act
      final preparing = state.preparingOrders;

      // Assert
      expect(preparing.length, 1);
      expect(preparing.first.status, KitchenOrderStatus.preparing);
    });

    test('readyOrders should return ready orders', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(status: KitchenOrderStatus.ready),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          status: KitchenOrderStatus.completed,
        ),
      ];
      final state = KitchenOrdersState(orders: orders);

      // Act
      final ready = state.readyOrders;

      // Assert
      expect(ready.length, 1);
      expect(ready.first.status, KitchenOrderStatus.ready);
    });

    test('urgentOrders should return urgent orders', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(priority: OrderPriority.urgent),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          priority: OrderPriority.low,
        ),
      ];
      final state = KitchenOrdersState(orders: orders);

      // Act
      final urgent = state.urgentOrders;

      // Assert
      expect(urgent.length, 1);
      expect(urgent.first.priority, OrderPriority.urgent);
    });
  });

  group('KitchenOrdersNotifier - Load Orders', () {
    test('loadOrders should set loading state', () async {
      // Arrange
      when(mockGetOrdersUseCase.execute(
        status: anyNamed('status'),
        priority: anyNamed('priority'),
        forceRefresh: anyNamed('forceRefresh'),
      )).thenAnswer((_) async => Result.success([]));

      // Act
      final future = notifier.loadOrders();
      
      // Assert - Check loading state immediately
      expect(notifier.state.isLoading, true);
      expect(notifier.state.error, isNull);
      
      await future;
    });

    test('loadOrders should update state on success', () async {
      // Arrange
      final orders = [MockData.mockKitchenOrder];
      when(mockGetOrdersUseCase.execute(
        status: anyNamed('status'),
        priority: anyNamed('priority'),
        forceRefresh: anyNamed('forceRefresh'),
      )).thenAnswer((_) async => Result.success(orders));

      // Act
      await notifier.loadOrders();

      // Assert
      expect(notifier.state.orders, orders);
      expect(notifier.state.isLoading, false);
      expect(notifier.state.error, isNull);
      verify(mockGetOrdersUseCase.execute(
        status: null,
        priority: null,
        forceRefresh: false,
      )).called(1);
    });

    test('loadOrders should set error on failure', () async {
      // Arrange
      const errorMessage = 'Failed to load orders';
      when(mockGetOrdersUseCase.execute(
        status: anyNamed('status'),
        priority: anyNamed('priority'),
        forceRefresh: anyNamed('forceRefresh'),
      )).thenAnswer((_) async => Result.failure(errorMessage));

      // Act
      await notifier.loadOrders();

      // Assert
      expect(notifier.state.orders, isEmpty);
      expect(notifier.state.isLoading, false);
      expect(notifier.state.error, errorMessage);
    });

    test('loadOrders with forceRefresh should pass parameter', () async {
      // Arrange
      when(mockGetOrdersUseCase.execute(
        status: anyNamed('status'),
        priority: anyNamed('priority'),
        forceRefresh: anyNamed('forceRefresh'),
      )).thenAnswer((_) async => Result.success([]));

      // Act
      await notifier.loadOrders(forceRefresh: true);

      // Assert
      verify(mockGetOrdersUseCase.execute(
        status: null,
        priority: null,
        forceRefresh: true,
      )).called(1);
    });

    test('refresh should call loadOrders with forceRefresh', () async {
      // Arrange
      when(mockGetOrdersUseCase.execute(
        status: anyNamed('status'),
        priority: anyNamed('priority'),
        forceRefresh: anyNamed('forceRefresh'),
      )).thenAnswer((_) async => Result.success([]));

      // Act
      await notifier.refresh();

      // Assert
      verify(mockGetOrdersUseCase.execute(
        status: null,
        priority: null,
        forceRefresh: true,
      )).called(1);
    });
  });

  group('KitchenOrdersNotifier - Filters', () {
    test('filterByStatus should update filter and reload', () async {
      // Arrange
      when(mockGetOrdersUseCase.execute(
        status: anyNamed('status'),
        priority: anyNamed('priority'),
        forceRefresh: anyNamed('forceRefresh'),
      )).thenAnswer((_) async => Result.success([]));

      // Act
      notifier.filterByStatus(KitchenOrderStatus.pending);
      await pumpEventQueue();

      // Assert
      expect(notifier.state.filterStatus, KitchenOrderStatus.pending);
      verify(mockGetOrdersUseCase.execute(
        status: KitchenOrderStatus.pending,
        priority: null,
        forceRefresh: false,
      )).called(1);
    });

    test('filterByPriority should update filter and reload', () async {
      // Arrange
      when(mockGetOrdersUseCase.execute(
        status: anyNamed('status'),
        priority: anyNamed('priority'),
        forceRefresh: anyNamed('forceRefresh'),
      )).thenAnswer((_) async => Result.success([]));

      // Act
      notifier.filterByPriority(OrderPriority.high);
      await pumpEventQueue();

      // Assert
      expect(notifier.state.filterPriority, OrderPriority.high);
      verify(mockGetOrdersUseCase.execute(
        status: null,
        priority: OrderPriority.high,
        forceRefresh: false,
      )).called(1);
    });

    test('clearFilters should reset filters and reload', () async {
      // Arrange
      notifier.state = notifier.state.copyWith(
        filterStatus: KitchenOrderStatus.pending,
        filterPriority: OrderPriority.high,
      );
      when(mockGetOrdersUseCase.execute(
        status: anyNamed('status'),
        priority: anyNamed('priority'),
        forceRefresh: anyNamed('forceRefresh'),
      )).thenAnswer((_) async => Result.success([]));

      // Act
      notifier.clearFilters();
      await pumpEventQueue();

      // Assert
      expect(notifier.state.filterStatus, isNull);
      expect(notifier.state.filterPriority, isNull);
      verify(mockGetOrdersUseCase.execute(
        status: null,
        priority: null,
        forceRefresh: false,
      )).called(1);
    });
  });

  group('KitchenOrdersNotifier - Update Status', () {
    test('startPreparation should update order on success', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.preparing,
      );
      notifier.state = notifier.state.copyWith(
        orders: [MockData.mockKitchenOrder],
      );
      when(mockUpdateStatusUseCase.startPreparation(
        orderId: anyNamed('orderId'),
        stationId: anyNamed('stationId'),
        staffId: anyNamed('staffId'),
      )).thenAnswer((_) async => Result.success(updatedOrder));

      // Act
      await notifier.startPreparation(
        MockData.testOrderId,
        stationId: 'station-001',
        staffId: 'staff-001',
      );

      // Assert
      expect(notifier.state.orders.first.status, KitchenOrderStatus.preparing);
      verify(mockUpdateStatusUseCase.startPreparation(
        orderId: MockData.testOrderId,
        stationId: 'station-001',
        staffId: 'staff-001',
      )).called(1);
    });

    test('markAsReady should update order on success', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.ready,
      );
      notifier.state = notifier.state.copyWith(
        orders: [MockData.mockKitchenOrder],
      );
      when(mockUpdateStatusUseCase.markAsReady(
        orderId: anyNamed('orderId'),
        notes: anyNamed('notes'),
      )).thenAnswer((_) async => Result.success(updatedOrder));

      // Act
      await notifier.markAsReady(MockData.testOrderId, notes: 'Ready for pickup');

      // Assert
      expect(notifier.state.orders.first.status, KitchenOrderStatus.ready);
      verify(mockUpdateStatusUseCase.markAsReady(
        orderId: MockData.testOrderId,
        notes: 'Ready for pickup',
      )).called(1);
    });

    test('complete should update order on success', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.completed,
      );
      notifier.state = notifier.state.copyWith(
        orders: [MockData.mockKitchenOrder],
      );
      when(mockUpdateStatusUseCase.complete(
        orderId: anyNamed('orderId'),
        notes: anyNamed('notes'),
      )).thenAnswer((_) async => Result.success(updatedOrder));

      // Act
      await notifier.complete(MockData.testOrderId);

      // Assert
      expect(notifier.state.orders.first.status, KitchenOrderStatus.completed);
    });

    test('cancel should update order on success', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.cancelled,
      );
      notifier.state = notifier.state.copyWith(
        orders: [MockData.mockKitchenOrder],
      );
      when(mockUpdateStatusUseCase.cancel(
        orderId: anyNamed('orderId'),
        reason: anyNamed('reason'),
      )).thenAnswer((_) async => Result.success(updatedOrder));

      // Act
      await notifier.cancel(MockData.testOrderId, 'Out of stock');

      // Assert
      expect(notifier.state.orders.first.status, KitchenOrderStatus.cancelled);
      verify(mockUpdateStatusUseCase.cancel(
        orderId: MockData.testOrderId,
        reason: 'Out of stock',
      )).called(1);
    });

    test('changePriority should update order on success', () async {
      // Arrange
      final updatedOrder = MockData.mockKitchenOrder.copyWith(
        priority: OrderPriority.urgent,
      );
      notifier.state = notifier.state.copyWith(
        orders: [MockData.mockKitchenOrder],
      );
      when(mockUpdateStatusUseCase.changePriority(
        orderId: anyNamed('orderId'),
        priority: anyNamed('priority'),
      )).thenAnswer((_) async => Result.success(updatedOrder));

      // Act
      await notifier.changePriority(MockData.testOrderId, OrderPriority.urgent);

      // Assert
      expect(notifier.state.orders.first.priority, OrderPriority.urgent);
      verify(mockUpdateStatusUseCase.changePriority(
        orderId: MockData.testOrderId,
        priority: OrderPriority.urgent,
      )).called(1);
    });

    test('_updateOrderInState should update correct order', () async {
      // Arrange
      final order1 = MockData.mockKitchenOrder;
      final order2 = MockData.mockKitchenOrder.copyWith(id: 'order-2');
      final updatedOrder2 = order2.copyWith(status: KitchenOrderStatus.ready);
      
      notifier.state = notifier.state.copyWith(orders: [order1, order2]);
      when(mockUpdateStatusUseCase.markAsReady(
        orderId: anyNamed('orderId'),
        notes: anyNamed('notes'),
      )).thenAnswer((_) async => Result.success(updatedOrder2));

      // Act
      await notifier.markAsReady('order-2');

      // Assert
      expect(notifier.state.orders.length, 2);
      expect(notifier.state.orders[0].id, 'order-123'); // Unchanged
      expect(notifier.state.orders[1].id, 'order-2');
      expect(notifier.state.orders[1].status, KitchenOrderStatus.ready); // Updated
    });
  });
}
