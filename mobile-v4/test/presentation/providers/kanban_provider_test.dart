import 'package:flutter_test/flutter_test.dart';

import 'package:awid_mobile/features/kitchen/presentation/providers/kanban_provider.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/mock_data.dart';

void main() {
  late KanbanNotifier notifier;

  setUp(() {
    notifier = KanbanNotifier();
  });

  group('KanbanState', () {
    test('initial state should have empty columns', () {
      // Arrange & Act
      final state = KanbanState();

      // Assert
      expect(state.columns, isNotEmpty);
      expect(state.columns[KitchenOrderStatus.pending], isEmpty);
      expect(state.columns[KitchenOrderStatus.preparing], isEmpty);
      expect(state.columns[KitchenOrderStatus.ready], isEmpty);
      expect(state.columns[KitchenOrderStatus.completed], isEmpty);
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });

    test('copyWith should update specified fields', () {
      // Arrange
      final state = KanbanState();
      final newColumns = {
        KitchenOrderStatus.pending: [MockData.mockKitchenOrder],
        KitchenOrderStatus.preparing: <KitchenOrder>[],
        KitchenOrderStatus.ready: <KitchenOrder>[],
        KitchenOrderStatus.completed: <KitchenOrder>[],
      };

      // Act
      final newState = state.copyWith(
        columns: newColumns,
        isLoading: true,
        error: 'Test error',
      );

      // Assert
      expect(newState.columns[KitchenOrderStatus.pending]!.length, 1);
      expect(newState.isLoading, true);
      expect(newState.error, 'Test error');
    });

    test('copyWith with clearError should clear error', () {
      // Arrange
      final state = KanbanState(error: 'Test error');

      // Act
      final newState = state.copyWith(clearError: true);

      // Assert
      expect(newState.error, isNull);
    });

    test('totalOrders should count all orders', () {
      // Arrange
      final columns = {
        KitchenOrderStatus.pending: [
          MockData.mockKitchenOrder,
          MockData.mockKitchenOrder.copyWith(id: 'order-2'),
        ],
        KitchenOrderStatus.preparing: [
          MockData.mockKitchenOrder.copyWith(id: 'order-3'),
        ],
        KitchenOrderStatus.ready: <KitchenOrder>[],
        KitchenOrderStatus.completed: [
          MockData.mockKitchenOrder.copyWith(id: 'order-4'),
        ],
      };
      final state = KanbanState(columns: columns);

      // Act
      final total = state.totalOrders;

      // Assert
      expect(total, 4);
    });

    test('ordersInColumn should return orders for status', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder,
        MockData.mockKitchenOrder.copyWith(id: 'order-2'),
      ];
      final columns = {
        KitchenOrderStatus.pending: orders,
        KitchenOrderStatus.preparing: <KitchenOrder>[],
        KitchenOrderStatus.ready: <KitchenOrder>[],
        KitchenOrderStatus.completed: <KitchenOrder>[],
      };
      final state = KanbanState(columns: columns);

      // Act
      final pendingOrders = state.ordersInColumn(KitchenOrderStatus.pending);

      // Assert
      expect(pendingOrders, orders);
      expect(pendingOrders.length, 2);
    });

    test('ordersInColumn should return empty list for non-existent status', () {
      // Arrange
      final state = KanbanState();

      // Act
      final orders = state.ordersInColumn(KitchenOrderStatus.cancelled);

      // Assert
      expect(orders, isEmpty);
    });
  });

  group('KanbanNotifier - Load Orders', () {
    test('initial state should have empty columns', () {
      // Assert
      expect(notifier.state.columns[KitchenOrderStatus.pending], isEmpty);
      expect(notifier.state.columns[KitchenOrderStatus.preparing], isEmpty);
      expect(notifier.state.columns[KitchenOrderStatus.ready], isEmpty);
      expect(notifier.state.columns[KitchenOrderStatus.completed], isEmpty);
    });

    test('loadOrders should distribute orders by status', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(
          id: 'order-1',
          status: KitchenOrderStatus.pending,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          status: KitchenOrderStatus.preparing,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-3',
          status: KitchenOrderStatus.ready,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-4',
          status: KitchenOrderStatus.completed,
        ),
      ];

      // Act
      notifier.loadOrders(orders);

      // Assert
      expect(notifier.state.columns[KitchenOrderStatus.pending]!.length, 1);
      expect(notifier.state.columns[KitchenOrderStatus.preparing]!.length, 1);
      expect(notifier.state.columns[KitchenOrderStatus.ready]!.length, 1);
      expect(notifier.state.columns[KitchenOrderStatus.completed]!.length, 1);
    });

    test('loadOrders should sort by priority', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(
          id: 'order-1',
          status: KitchenOrderStatus.pending,
          priority: OrderPriority.low,
          orderTime: MockData.testDate,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          status: KitchenOrderStatus.pending,
          priority: OrderPriority.urgent,
          orderTime: MockData.testDate,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-3',
          status: KitchenOrderStatus.pending,
          priority: OrderPriority.high,
          orderTime: MockData.testDate,
        ),
      ];

      // Act
      notifier.loadOrders(orders);

      // Assert
      final pendingOrders = notifier.state.columns[KitchenOrderStatus.pending]!;
      expect(pendingOrders[0].priority, OrderPriority.urgent);
      expect(pendingOrders[1].priority, OrderPriority.high);
      expect(pendingOrders[2].priority, OrderPriority.low);
    });

    test('loadOrders should sort by time when priority is same', () {
      // Arrange
      final time1 = MockData.testDate;
      final time2 = MockData.testDate.add(const Duration(minutes: 10));
      final time3 = MockData.testDate.add(const Duration(minutes: 20));
      
      final orders = [
        MockData.mockKitchenOrder.copyWith(
          id: 'order-1',
          status: KitchenOrderStatus.pending,
          priority: OrderPriority.normal,
          orderTime: time3,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          status: KitchenOrderStatus.pending,
          priority: OrderPriority.normal,
          orderTime: time1,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-3',
          status: KitchenOrderStatus.pending,
          priority: OrderPriority.normal,
          orderTime: time2,
        ),
      ];

      // Act
      notifier.loadOrders(orders);

      // Assert
      final pendingOrders = notifier.state.columns[KitchenOrderStatus.pending]!;
      expect(pendingOrders[0].orderTime, time1);
      expect(pendingOrders[1].orderTime, time2);
      expect(pendingOrders[2].orderTime, time3);
    });

    test('loadOrders should ignore orders with unknown status', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(
          id: 'order-1',
          status: KitchenOrderStatus.pending,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          status: KitchenOrderStatus.cancelled,
        ),
      ];

      // Act
      notifier.loadOrders(orders);

      // Assert
      expect(notifier.state.totalOrders, 1);
      expect(notifier.state.columns[KitchenOrderStatus.pending]!.length, 1);
    });

    test('loadOrders with empty list should clear columns', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(status: KitchenOrderStatus.pending),
      ];
      notifier.loadOrders(orders);

      // Act
      notifier.loadOrders([]);

      // Assert
      expect(notifier.state.totalOrders, 0);
      expect(notifier.state.columns[KitchenOrderStatus.pending], isEmpty);
    });
  });

  group('KanbanNotifier - Move Order', () {
    test('moveOrder should move order between columns', () {
      // Arrange
      final order = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.pending,
      );
      notifier.loadOrders([order]);

      // Act
      notifier.moveOrder(
        order,
        KitchenOrderStatus.pending,
        KitchenOrderStatus.preparing,
      );

      // Assert
      expect(notifier.state.columns[KitchenOrderStatus.pending], isEmpty);
      expect(notifier.state.columns[KitchenOrderStatus.preparing]!.length, 1);
      expect(
        notifier.state.columns[KitchenOrderStatus.preparing]!.first.status,
        KitchenOrderStatus.preparing,
      );
    });

    test('moveOrder should update order status', () {
      // Arrange
      final order = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.preparing,
      );
      notifier.loadOrders([order]);

      // Act
      notifier.moveOrder(
        order,
        KitchenOrderStatus.preparing,
        KitchenOrderStatus.ready,
      );

      // Assert
      final movedOrder = notifier.state.columns[KitchenOrderStatus.ready]!.first;
      expect(movedOrder.id, order.id);
      expect(movedOrder.status, KitchenOrderStatus.ready);
    });

    test('moveOrder should preserve other orders in columns', () {
      // Arrange
      final order1 = MockData.mockKitchenOrder.copyWith(
        id: 'order-1',
        status: KitchenOrderStatus.pending,
      );
      final order2 = MockData.mockKitchenOrder.copyWith(
        id: 'order-2',
        status: KitchenOrderStatus.pending,
      );
      notifier.loadOrders([order1, order2]);

      // Act
      notifier.moveOrder(
        order1,
        KitchenOrderStatus.pending,
        KitchenOrderStatus.preparing,
      );

      // Assert
      expect(notifier.state.columns[KitchenOrderStatus.pending]!.length, 1);
      expect(notifier.state.columns[KitchenOrderStatus.pending]!.first.id, 'order-2');
      expect(notifier.state.columns[KitchenOrderStatus.preparing]!.length, 1);
      expect(notifier.state.columns[KitchenOrderStatus.preparing]!.first.id, 'order-1');
    });

    test('moveOrder multiple times should work correctly', () {
      // Arrange
      final order = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.pending,
      );
      notifier.loadOrders([order]);

      // Act
      notifier.moveOrder(order, KitchenOrderStatus.pending, KitchenOrderStatus.preparing);
      final preparingOrder = notifier.state.columns[KitchenOrderStatus.preparing]!.first;
      
      notifier.moveOrder(preparingOrder, KitchenOrderStatus.preparing, KitchenOrderStatus.ready);
      final readyOrder = notifier.state.columns[KitchenOrderStatus.ready]!.first;
      
      notifier.moveOrder(readyOrder, KitchenOrderStatus.ready, KitchenOrderStatus.completed);

      // Assert
      expect(notifier.state.columns[KitchenOrderStatus.pending], isEmpty);
      expect(notifier.state.columns[KitchenOrderStatus.preparing], isEmpty);
      expect(notifier.state.columns[KitchenOrderStatus.ready], isEmpty);
      expect(notifier.state.columns[KitchenOrderStatus.completed]!.length, 1);
      expect(
        notifier.state.columns[KitchenOrderStatus.completed]!.first.status,
        KitchenOrderStatus.completed,
      );
    });
  });

  group('KanbanNotifier - Update Order', () {
    test('updateOrder should update order in correct column', () {
      // Arrange
      final order = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.pending,
        priority: OrderPriority.normal,
      );
      notifier.loadOrders([order]);

      // Act
      final updatedOrder = order.copyWith(priority: OrderPriority.urgent);
      notifier.updateOrder(updatedOrder);

      // Assert
      final orders = notifier.state.columns[KitchenOrderStatus.pending]!;
      expect(orders.first.priority, OrderPriority.urgent);
    });

    test('updateOrder should preserve other orders', () {
      // Arrange
      final order1 = MockData.mockKitchenOrder.copyWith(
        id: 'order-1',
        status: KitchenOrderStatus.pending,
      );
      final order2 = MockData.mockKitchenOrder.copyWith(
        id: 'order-2',
        status: KitchenOrderStatus.pending,
      );
      notifier.loadOrders([order1, order2]);

      // Act
      final updatedOrder1 = order1.copyWith(priority: OrderPriority.urgent);
      notifier.updateOrder(updatedOrder1);

      // Assert
      final orders = notifier.state.columns[KitchenOrderStatus.pending]!;
      expect(orders.length, 2);
      expect(orders.firstWhere((o) => o.id == 'order-1').priority, OrderPriority.urgent);
      expect(orders.firstWhere((o) => o.id == 'order-2').priority, OrderPriority.normal);
    });

    test('updateOrder should work across all columns', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(
          id: 'order-1',
          status: KitchenOrderStatus.pending,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          status: KitchenOrderStatus.preparing,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-3',
          status: KitchenOrderStatus.ready,
        ),
      ];
      notifier.loadOrders(orders);

      // Act
      final updatedOrder = orders[1].copyWith(priority: OrderPriority.urgent);
      notifier.updateOrder(updatedOrder);

      // Assert
      final preparingOrders = notifier.state.columns[KitchenOrderStatus.preparing]!;
      expect(preparingOrders.first.priority, OrderPriority.urgent);
    });

    test('updateOrder with non-existent order should not crash', () {
      // Arrange
      final order = MockData.mockKitchenOrder.copyWith(
        status: KitchenOrderStatus.pending,
      );
      notifier.loadOrders([order]);

      // Act
      final nonExistentOrder = MockData.mockKitchenOrder.copyWith(
        id: 'non-existent',
        status: KitchenOrderStatus.pending,
      );
      notifier.updateOrder(nonExistentOrder);

      // Assert - Should not crash
      expect(notifier.state.columns[KitchenOrderStatus.pending]!.length, 1);
    });
  });

  group('KanbanNotifier - Complex Scenarios', () {
    test('should handle multiple orders in multiple columns', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(
          id: 'order-1',
          status: KitchenOrderStatus.pending,
          priority: OrderPriority.urgent,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          status: KitchenOrderStatus.pending,
          priority: OrderPriority.low,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-3',
          status: KitchenOrderStatus.preparing,
        ),
        MockData.mockKitchenOrder.copyWith(
          id: 'order-4',
          status: KitchenOrderStatus.ready,
        ),
      ];

      // Act
      notifier.loadOrders(orders);

      // Assert
      expect(notifier.state.totalOrders, 4);
      expect(notifier.state.columns[KitchenOrderStatus.pending]!.length, 2);
      expect(notifier.state.columns[KitchenOrderStatus.preparing]!.length, 1);
      expect(notifier.state.columns[KitchenOrderStatus.ready]!.length, 1);
      
      // Check sorting
      final pendingOrders = notifier.state.columns[KitchenOrderStatus.pending]!;
      expect(pendingOrders[0].priority, OrderPriority.urgent);
      expect(pendingOrders[1].priority, OrderPriority.low);
    });

    test('should handle reload after move', () {
      // Arrange
      final orders = [
        MockData.mockKitchenOrder.copyWith(
          id: 'order-1',
          status: KitchenOrderStatus.pending,
        ),
      ];
      notifier.loadOrders(orders);
      notifier.moveOrder(
        orders[0],
        KitchenOrderStatus.pending,
        KitchenOrderStatus.preparing,
      );

      // Act - Reload with new data
      final newOrders = [
        MockData.mockKitchenOrder.copyWith(
          id: 'order-2',
          status: KitchenOrderStatus.pending,
        ),
      ];
      notifier.loadOrders(newOrders);

      // Assert
      expect(notifier.state.columns[KitchenOrderStatus.pending]!.length, 1);
      expect(notifier.state.columns[KitchenOrderStatus.preparing], isEmpty);
      expect(notifier.state.columns[KitchenOrderStatus.pending]!.first.id, 'order-2');
    });
  });
}
