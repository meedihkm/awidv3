import 'package:flutter_test/flutter_test.dart';
import 'package:awid/core/models/order_model.dart';

void main() {
  group('Order Model', () {
    test('fromJson should parse valid JSON correctly', () {
      final json = {
        'id': 'order-123',
        'organizationId': 'org-456',
        'cafeteriaId': 'cafe-789',
        'date': '2024-01-20',
        'total': 150.5,
        'status': 'pending',
        'paymentStatus': 'unpaid',
        'amountPaid': 0.0,
        'createdAt': '2024-01-20T10:00:00Z',
        'items': [
          {
            'id': 'item-1',
            'orderId': 'order-123',
            'productId': 'prod-1',
            'productName': 'Burger',
            'unitPrice': 10.5,
            'quantity': 2,
          }
        ],
        'cafeteria': {
          'id': 'cafe-789',
          'name': 'Test Cafeteria',
          'phone': '+123456789',
        },
      };

      final order = Order.fromJson(json);

      expect(order.id, 'order-123');
      expect(order.organizationId, 'org-456');
      expect(order.total, 150.5);
      expect(order.status, 'pending');
      expect(order.items.length, 1);
      expect(order.items.first.productName, 'Burger');
      expect(order.cafeteria?.name, 'Test Cafeteria');
    });

    test('parseDouble helper should handle various types', () {
      expect(parseDouble(null), 0.0);
      expect(parseDouble(10), 10.0);
      expect(parseDouble(10.5), 10.5);
      expect(parseDouble('15.5'), 15.5);
      expect(parseDouble('invalid'), 0.0);
    });

    test('parseInt helper should handle various types', () {
      expect(parseInt(null), 0);
      expect(parseInt(10), 10);
      expect(parseInt('15'), 15);
      expect(parseInt('invalid'), 0);
    });

    test('toJson should serialize order correctly', () {
      final order = Order(
        id: 'order-123',
        organizationId: 'org-456',
        cafeteriaId: 'cafe-789',
        date: '2024-01-20',
        total: 150.5,
        status: 'delivered',
        paymentStatus: 'paid',
        amountPaid: 150.5,
        createdAt: DateTime.parse('2024-01-20T10:00:00Z'),
        items: [
          OrderItem(
            id: 'item-1',
            orderId: 'order-123',
            productId: 'prod-1',
            productName: 'Burger',
            unitPrice: 10.5,
            quantity: 2,
          ),
        ],
        cafeteria: Cafeteria(
          id: 'cafe-789',
          name: 'Test Cafeteria',
        ),
      );

      final json = order.toJson();

      expect(json['id'], 'order-123');
      expect(json['total'], 150.5);
      expect(json['status'], 'delivered');
      expect(json['items'].length, 1);
    });

    test('status getters should work correctly', () {
      final pendingOrder = Order(
        id: '1',
        organizationId: '1',
        cafeteriaId: '1',
        date: '',
        total: 100,
        status: 'pending',
        paymentStatus: 'unpaid',
        amountPaid: 0,
        items: [],
      );

      expect(pendingOrder.isPending, true);
      expect(pendingOrder.isLocked, false);
      expect(pendingOrder.isInDelivery, false);
      expect(pendingOrder.isDelivered, false);
    });

    test('remainingAmount should calculate correctly', () {
      final order = Order(
        id: '1',
        organizationId: '1',
        cafeteriaId: '1',
        date: '',
        total: 100,
        status: 'pending',
        paymentStatus: 'partial',
        amountPaid: 40,
        items: [],
      );

      expect(order.remainingAmount, 60.0);
    });
  });

  group('OrderItem Model', () {
    test('fromJson should parse valid JSON correctly', () {
      final json = {
        'id': 'item-1',
        'orderId': 'order-123',
        'productId': 'prod-1',
        'productName': 'Burger',
        'unitPrice': 10.5,
        'quantity': 2,
      };

      final item = OrderItem.fromJson(json);

      expect(item.id, 'item-1');
      expect(item.productName, 'Burger');
      expect(item.unitPrice, 10.5);
      expect(item.quantity, 2);
    });

    test('totalPrice should calculate correctly', () {
      final item = OrderItem(
        id: 'item-1',
        orderId: 'order-123',
        productId: 'prod-1',
        productName: 'Burger',
        unitPrice: 10.5,
        quantity: 3,
      );

      expect(item.totalPrice, 31.5);
    });
  });

  group('Cafeteria Model', () {
    test('fromJson should parse with coordinates', () {
      final json = {
        'id': 'cafe-1',
        'name': 'Test Cafe',
        'phone': '+123456',
        'address': '123 Main St',
        'latitude': 36.7538,
        'longitude': 3.0588,
      };

      final cafe = Cafeteria.fromJson(json);

      expect(cafe.id, 'cafe-1');
      expect(cafe.name, 'Test Cafe');
      expect(cafe.hasLocation, true);
      expect(cafe.latitude, 36.7538);
    });

    test('hasLocation should return false when coordinates missing', () {
      final cafe = Cafeteria(
        id: 'cafe-1',
        name: 'Test Cafe',
      );

      expect(cafe.hasLocation, false);
    });
  });
}
