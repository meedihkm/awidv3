import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import '../../helpers/mock_data.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('KitchenOrder Entity', () {
    late KitchenOrder order;

    setUp(() {
      order = MockData.mockKitchenOrder;
    });

    test('should create a valid KitchenOrder', () {
      expect(order.id, MockData.testOrderId);
      expect(order.orderNumber, 'ORD-001');
      expect(order.customerName, 'John Doe');
      expect(order.status, OrderStatus.pending);
      expect(order.items.length, 1);
      expect(order.totalAmount, 25.00);
    });

    test('should calculate total amount correctly', () {
      final orderWithMultipleItems = order.copyWith(
        items: [
          OrderItem(
            productId: 'p1',
            productName: 'Item 1',
            quantity: 2,
            price: 10.0,
          ),
          OrderItem(
            productId: 'p2',
            productName: 'Item 2',
            quantity: 3,
            price: 5.0,
          ),
        ],
      );

      expect(orderWithMultipleItems.calculateTotal(), 35.0);
    });

    test('should check if order is urgent', () {
      final urgentOrder = order.copyWith(priority: OrderPriority.urgent);
      final normalOrder = order.copyWith(priority: OrderPriority.medium);

      expect(urgentOrder.isUrgent, true);
      expect(normalOrder.isUrgent, false);
    });

    test('should check if order is late', () {
      final lateOrder = order.copyWith(
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        estimatedTime: 30,
      );

      expect(lateOrder.isLate, true);
    });

    test('should get remaining time', () {
      final recentOrder = order.copyWith(
        createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
        estimatedTime: 30,
      );

      final remaining = recentOrder.remainingTime;
      expect(remaining, greaterThan(0));
      expect(remaining, lessThanOrEqualTo(30));
    });

    test('should copy with new values', () {
      final updatedOrder = order.copyWith(
        status: OrderStatus.preparing,
        priority: OrderPriority.high,
      );

      expect(updatedOrder.id, order.id);
      expect(updatedOrder.status, OrderStatus.preparing);
      expect(updatedOrder.priority, OrderPriority.high);
      expect(updatedOrder.customerName, order.customerName);
    });

    test('should compare orders by equality', () {
      final sameOrder = order.copyWith();
      final differentOrder = order.copyWith(id: 'different-id');

      expect(order == sameOrder, true);
      expect(order == differentOrder, false);
    });

    test('should have correct status progression', () {
      expect(OrderStatus.pending.index, lessThan(OrderStatus.preparing.index));
      expect(OrderStatus.preparing.index, lessThan(OrderStatus.ready.index));
      expect(OrderStatus.ready.index, lessThan(OrderStatus.delivering.index));
    });

    test('should validate order items', () {
      expect(order.items.isNotEmpty, true);
      expect(order.items.first.quantity, greaterThan(0));
      expect(order.items.first.price, greaterThan(0));
    });

    test('should handle empty notes', () {
      final itemWithoutNotes = OrderItem(
        productId: 'p1',
        productName: 'Item',
        quantity: 1,
        price: 10.0,
      );

      expect(itemWithoutNotes.notes, isNull);
    });

    test('should format order number correctly', () {
      expect(order.orderNumber, matches(r'ORD-\d+'));
    });

    test('should have valid timestamps', () {
      expect(order.createdAt, isNotNull);
      expect(order.createdAt.isBefore(DateTime.now()), true);
    });

    test('should calculate item subtotal', () {
      final item = order.items.first;
      final subtotal = item.quantity * item.price;
      expect(subtotal, 25.0);
    });

    test('should handle priority levels', () {
      final priorities = [
        OrderPriority.low,
        OrderPriority.medium,
        OrderPriority.high,
        OrderPriority.urgent,
      ];

      for (final priority in priorities) {
        final orderWithPriority = order.copyWith(priority: priority);
        expect(orderWithPriority.priority, priority);
      }
    });

    test('should validate phone number format', () {
      expect(order.customerPhone, startsWith('+'));
      expect(order.customerPhone.length, greaterThan(10));
    });

    test('should have delivery address', () {
      expect(order.deliveryAddress, isNotEmpty);
      expect(order.deliveryAddress, isA<String>());
    });
  });

  group('OrderItem', () {
    test('should create valid OrderItem', () {
      final item = OrderItem(
        productId: 'p1',
        productName: 'Pizza',
        quantity: 2,
        price: 12.50,
        notes: 'Extra cheese',
      );

      expect(item.productId, 'p1');
      expect(item.productName, 'Pizza');
      expect(item.quantity, 2);
      expect(item.price, 12.50);
      expect(item.notes, 'Extra cheese');
    });

    test('should calculate subtotal', () {
      final item = OrderItem(
        productId: 'p1',
        productName: 'Pizza',
        quantity: 3,
        price: 10.0,
      );

      expect(item.subtotal, 30.0);
    });
  });

  group('OrderStatus', () {
    test('should have all required statuses', () {
      expect(OrderStatus.values.length, greaterThanOrEqualTo(5));
      expect(OrderStatus.values, contains(OrderStatus.pending));
      expect(OrderStatus.values, contains(OrderStatus.preparing));
      expect(OrderStatus.values, contains(OrderStatus.ready));
      expect(OrderStatus.values, contains(OrderStatus.delivering));
      expect(OrderStatus.values, contains(OrderStatus.delivered));
    });

    test('should convert to string', () {
      expect(OrderStatus.pending.toString(), contains('pending'));
      expect(OrderStatus.preparing.toString(), contains('preparing'));
    });
  });

  group('OrderPriority', () {
    test('should have all priority levels', () {
      expect(OrderPriority.values.length, 4);
      expect(OrderPriority.values, contains(OrderPriority.low));
      expect(OrderPriority.values, contains(OrderPriority.medium));
      expect(OrderPriority.values, contains(OrderPriority.high));
      expect(OrderPriority.values, contains(OrderPriority.urgent));
    });

    test('should have correct order', () {
      expect(OrderPriority.low.index, lessThan(OrderPriority.medium.index));
      expect(OrderPriority.medium.index, lessThan(OrderPriority.high.index));
      expect(OrderPriority.high.index, lessThan(OrderPriority.urgent.index));
    });
  });
}
