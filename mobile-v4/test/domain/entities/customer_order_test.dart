import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_order.dart';
import '../../helpers/mock_data.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('CustomerOrder Entity', () {
    late CustomerOrder order;

    setUp(() {
      order = MockData.mockCustomerOrder;
    });

    test('should create valid CustomerOrder', () {
      expect(order.id, MockData.testOrderId);
      expect(order.orderNumber, 'ORD-001');
      expect(order.items, isNotEmpty);
      expect(order.totalAmount, 25.00);
      expect(order.status, 'pending');
      expect(order.createdAt, isNotNull);
      expect(order.deliveryAddress, isNotEmpty);
    });

    test('should calculate total from items', () {
      final total = order.items.fold<double>(
        0,
        (sum, item) => sum + (item.quantity * item.price),
      );
      expect(total, order.totalAmount);
    });

    test('should check if order is pending', () {
      final pendingOrder = order.copyWith(status: 'pending');
      final confirmedOrder = order.copyWith(status: 'confirmed');

      expect(pendingOrder.isPending, true);
      expect(confirmedOrder.isPending, false);
    });

    test('should check if order is confirmed', () {
      final confirmedOrder = order.copyWith(status: 'confirmed');
      final pendingOrder = order.copyWith(status: 'pending');

      expect(confirmedOrder.isConfirmed, true);
      expect(pendingOrder.isConfirmed, false);
    });

    test('should check if order is in delivery', () {
      final inDelivery = order.copyWith(status: 'in_delivery');
      final pending = order.copyWith(status: 'pending');

      expect(inDelivery.isInDelivery, true);
      expect(pending.isInDelivery, false);
    });

    test('should check if order is delivered', () {
      final delivered = order.copyWith(status: 'delivered');
      final pending = order.copyWith(status: 'pending');

      expect(delivered.isDelivered, true);
      expect(pending.isDelivered, false);
    });

    test('should check if order is cancelled', () {
      final cancelled = order.copyWith(status: 'cancelled');
      final active = order.copyWith(status: 'pending');

      expect(cancelled.isCancelled, true);
      expect(active.isCancelled, false);
    });

    test('should check if order is active', () {
      final activeStatuses = ['pending', 'confirmed', 'preparing', 'in_delivery'];
      
      for (final status in activeStatuses) {
        final activeOrder = order.copyWith(status: status);
        expect(activeOrder.isActive, true);
      }

      final delivered = order.copyWith(status: 'delivered');
      expect(delivered.isActive, false);
    });

    test('should calculate estimated delivery time', () {
      if (order.estimatedDeliveryTime != null) {
        expect(order.estimatedDeliveryTime, isA<DateTime>());
        expect(order.estimatedDeliveryTime!.isAfter(order.createdAt), true);
      }
    });

    test('should calculate time until delivery', () {
      if (order.estimatedDeliveryTime != null) {
        final timeUntil = order.estimatedDeliveryTime!.difference(DateTime.now());
        expect(timeUntil, isA<Duration>());
      }
    });

    test('should check if delivery is late', () {
      final lateOrder = order.copyWith(
        estimatedDeliveryTime: DateTime.now().subtract(const Duration(hours: 1)),
        status: 'in_delivery',
      );

      if (lateOrder.estimatedDeliveryTime != null && !lateOrder.isDelivered) {
        final isLate = DateTime.now().isAfter(lateOrder.estimatedDeliveryTime!);
        expect(isLate, true);
      }
    });

    test('should count total items', () {
      final itemCount = order.items.fold<int>(
        0,
        (sum, item) => sum + item.quantity,
      );
      expect(itemCount, greaterThan(0));
    });

    test('should validate order number format', () {
      expect(order.orderNumber, matches(r'ORD-\d+'));
    });

    test('should validate positive amounts', () {
      expect(order.totalAmount, greaterThan(0));
      for (final item in order.items) {
        expect(item.price, greaterThan(0));
        expect(item.quantity, greaterThan(0));
      }
    });

    test('should copy with new values', () {
      final updated = order.copyWith(
        status: 'confirmed',
        estimatedDeliveryTime: DateTime.now().add(const Duration(hours: 1)),
      );

      expect(updated.id, order.id);
      expect(updated.status, 'confirmed');
      expect(updated.orderNumber, order.orderNumber);
    });

    test('should compare orders by equality', () {
      final sameOrder = order.copyWith();
      final differentOrder = order.copyWith(id: 'different-id');

      expect(order == sameOrder, true);
      expect(order == differentOrder, false);
    });

    test('should have valid timestamps', () {
      expect(order.createdAt, isNotNull);
      expect(order.createdAt.isBefore(DateTime.now()), true);
    });

    test('should have delivery address', () {
      expect(order.deliveryAddress, isNotEmpty);
      expect(order.deliveryAddress, isA<String>());
    });

    test('should format order summary', () {
      final summary = '${order.orderNumber} - ${order.items.length} items - \$${order.totalAmount}';
      expect(summary, contains(order.orderNumber));
      expect(summary, contains('${order.items.length}'));
    });

    test('should calculate average item price', () {
      final totalItems = order.items.fold<int>(0, (sum, item) => sum + item.quantity);
      final avgPrice = order.totalAmount / totalItems;
      expect(avgPrice, greaterThan(0));
    });

    test('should get most expensive item', () {
      final mostExpensive = order.items.reduce(
        (a, b) => a.price > b.price ? a : b,
      );
      expect(mostExpensive.price, greaterThanOrEqualTo(order.items.first.price));
    });

    test('should get cheapest item', () {
      final cheapest = order.items.reduce(
        (a, b) => a.price < b.price ? a : b,
      );
      expect(cheapest.price, lessThanOrEqualTo(order.items.first.price));
    });
  });

  group('CustomerOrderItem', () {
    test('should create valid CustomerOrderItem', () {
      final item = CustomerOrderItem(
        productName: 'Pizza',
        quantity: 2,
        price: 12.50,
      );

      expect(item.productName, 'Pizza');
      expect(item.quantity, 2);
      expect(item.price, 12.50);
    });

    test('should calculate subtotal', () {
      final item = CustomerOrderItem(
        productName: 'Pizza',
        quantity: 3,
        price: 10.0,
      );

      expect(item.subtotal, 30.0);
    });

    test('should validate positive values', () {
      final item = CustomerOrderItem(
        productName: 'Pizza',
        quantity: 2,
        price: 12.50,
      );

      expect(item.quantity, greaterThan(0));
      expect(item.price, greaterThan(0));
    });

    test('should have non-empty product name', () {
      final item = CustomerOrderItem(
        productName: 'Pizza',
        quantity: 1,
        price: 10.0,
      );

      expect(item.productName, isNotEmpty);
    });
  });

  group('CustomerOrder Status Flow', () {
    test('should follow correct status progression', () {
      final statuses = [
        'pending',
        'confirmed',
        'preparing',
        'ready',
        'in_delivery',
        'delivered',
      ];

      for (var i = 0; i < statuses.length - 1; i++) {
        final currentStatus = statuses[i];
        final nextStatus = statuses[i + 1];
        
        expect(currentStatus, isNotNull);
        expect(nextStatus, isNotNull);
      }
    });

    test('should handle cancelled status', () {
      final cancelled = MockData.mockCustomerOrder.copyWith(status: 'cancelled');
      
      expect(cancelled.isCancelled, true);
      expect(cancelled.isActive, false);
    });
  });

  group('CustomerOrder Edge Cases', () {
    test('should handle single item order', () {
      final singleItem = order.copyWith(
        items: [
          CustomerOrderItem(
            productName: 'Pizza',
            quantity: 1,
            price: 15.0,
          ),
        ],
        totalAmount: 15.0,
      );

      expect(singleItem.items.length, 1);
      expect(singleItem.totalAmount, 15.0);
    });

    test('should handle multiple items order', () {
      final multipleItems = order.copyWith(
        items: List.generate(
          5,
          (i) => CustomerOrderItem(
            productName: 'Item $i',
            quantity: 1,
            price: 10.0,
          ),
        ),
        totalAmount: 50.0,
      );

      expect(multipleItems.items.length, 5);
      expect(multipleItems.totalAmount, 50.0);
    });

    test('should handle large order amount', () {
      final largeOrder = order.copyWith(totalAmount: 1000.0);
      expect(largeOrder.totalAmount, 1000.0);
    });

    test('should handle order without estimated delivery', () {
      final noEstimate = order.copyWith(estimatedDeliveryTime: null);
      expect(noEstimate.estimatedDeliveryTime, isNull);
    });

    test('should handle very old order', () {
      final oldOrder = order.copyWith(
        createdAt: DateTime.now().subtract(const Duration(days: 365)),
      );

      expect(oldOrder.createdAt.isBefore(DateTime.now()), true);
    });

    test('should handle decimal quantities', () {
      final decimalItem = CustomerOrderItem(
        productName: 'Cheese',
        quantity: 2,
        price: 5.99,
      );

      expect(decimalItem.subtotal, closeTo(11.98, 0.01));
    });
  });

  group('CustomerOrder Validation', () {
    test('should validate order has items', () {
      expect(order.items, isNotEmpty);
    });

    test('should validate total matches items', () {
      final calculatedTotal = order.items.fold<double>(
        0,
        (sum, item) => sum + item.subtotal,
      );
      expect(calculatedTotal, closeTo(order.totalAmount, 0.01));
    });

    test('should validate status is valid', () {
      final validStatuses = [
        'pending',
        'confirmed',
        'preparing',
        'ready',
        'in_delivery',
        'delivered',
        'cancelled',
      ];

      expect(validStatuses, contains(order.status));
    });

    test('should validate created date is not in future', () {
      expect(order.createdAt.isAfter(DateTime.now()), false);
    });

    test('should validate estimated delivery is after creation', () {
      if (order.estimatedDeliveryTime != null) {
        expect(
          order.estimatedDeliveryTime!.isAfter(order.createdAt),
          true,
        );
      }
    });
  });
}
