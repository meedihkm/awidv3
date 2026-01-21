import 'package:flutter_test/flutter_test.dart';
import 'package:awid/core/models/delivery_model.dart';
import 'package:awid/core/models/order_model.dart';

void main() {
  group('Delivery Model', () {
    test('fromJson should parse valid JSON correctly', () {
      final json = {
        'id': 'delivery-123',
        'orderId': 'order-456',
        'delivererId': 'deliverer-789',
        'status': 'assigned',
        'paymentStatus': 'unpaid',
        'amountCollected': 0.0,
        'comment': null,
        'failureReason': null,
        'attempts': 0,
        'createdAt': '2024-01-20T10:00:00Z',
        'order': {
          'id': 'order-456',
          'organizationId': 'org-1',
          'cafeteriaId': 'cafe-1',
          'date': '2024-01-20',
          'total': 50.0,
          'status': 'in_delivery',
          'paymentStatus': 'unpaid',
          'amountPaid': 0.0,
          'items': [],
        },
        'deliverer': {
          'id': 'deliverer-789',
          'name': 'John Doe',
          'phone': '+123456789',
        },
      };

      final delivery = Delivery.fromJson(json);

      expect(delivery.id, 'delivery-123');
      expect(delivery.orderId, 'order-456');
      expect(delivery.delivererId, 'deliverer-789');
      expect(delivery.status, 'assigned');
      expect(delivery.attempts, 0);
      expect(delivery.deliverer?.name, 'John Doe');
      expect(delivery.order.id, 'order-456');
    });

    test('fromJson should handle missing deliverer', () {
      final json = {
        'id': 'delivery-123',
        'orderId': 'order-456',
        'status': 'assigned',
        'paymentStatus': 'unpaid',
        'amountCollected': 0.0,
        'attempts': 0,
        'order': {
          'id': 'order-456',
          'organizationId': 'org-1',
          'cafeteriaId': 'cafe-1',
          'date': '2024-01-20',
          'total': 50.0,
          'status': 'pending',
          'paymentStatus': 'unpaid',
          'amountPaid': 0.0,
          'items': [],
        },
      };

      final delivery = Delivery.fromJson(json);

      expect(delivery.deliverer, null);
      expect(delivery.delivererId, null);
    });

    test('toJson should serialize delivery correctly', () {
      final delivery = Delivery(
        id: 'delivery-123',
        orderId: 'order-456',
        delivererId: 'deliverer-789',
        status: 'in_progress',
        paymentStatus: 'unpaid',
        amountCollected: 0.0,
        attempts: 1,
        createdAt: DateTime.parse('2024-01-20T10:00:00Z'),
        order: Order(
          id: 'order-456',
          organizationId: 'org-1',
          cafeteriaId: 'cafe-1',
          date: '2024-01-20',
          total: 50.0,
          status: 'in_delivery',
          paymentStatus: 'unpaid',
          amountPaid: 0.0,
          items: [],
        ),
        deliverer: Deliverer(
          id: 'deliverer-789',
          name: 'John Doe',
          phone: '+123456789',
        ),
      );

      final json = delivery.toJson();

      expect(json['id'], 'delivery-123');
      expect(json['status'], 'in_progress');
      expect(json['attempts'], 1);
      expect(json['deliverer']['name'], 'John Doe');
    });

    test('status getters should work correctly', () {
      final assignedDelivery = Delivery(
        id: '1',
        orderId: '1',
        status: 'assigned',
        paymentStatus: 'unpaid',
        amountCollected: 0,
        order: Order(
          id: '1',
          organizationId: '1',
          cafeteriaId: '1',
          date: '',
          total: 50,
          status: 'in_delivery',
          paymentStatus: 'unpaid',
          amountPaid: 0,
          items: [],
        ),
      );

      expect(assignedDelivery.isAssigned, true);
      expect(assignedDelivery.isInProgress, false);
      expect(assignedDelivery.isDelivered, false);
      expect(assignedDelivery.isFailed, false);
      expect(assignedDelivery.isPostponed, false);
    });

    test('failureReasonText should translate failure reasons', () {
      final delivery = Delivery(
        id: '1',
        orderId: '1',
        status: 'failed',
        paymentStatus: 'unpaid',
        amountCollected: 0,
        failureReason: 'closed',
        order: Order(
          id: '1',
          organizationId: '1',
          cafeteriaId: '1',
          date: '',
          total: 50,
          status: 'failed',
          paymentStatus: 'unpaid',
          amountPaid: 0,
          items: [],
        ),
      );

      expect(delivery.failureReasonText, 'Client fermé');

      final delivery2 = Delivery(
        id: '2',
        orderId: '2',
        status: 'failed',
        paymentStatus: 'unpaid',
        amountCollected: 0,
        failureReason: 'absent',
        order: Order(
          id: '2',
          organizationId: '1',
          cafeteriaId: '1',
          date: '',
          total: 50,
          status: 'failed',
          paymentStatus: 'unpaid',
          amountPaid: 0,
          items: [],
        ),
      );

      expect(delivery2.failureReasonText, 'Client absent');
    });

    test('isPaid should return correct value', () {
      final paidDelivery = Delivery(
        id: '1',
        orderId: '1',
        status: 'delivered',
        paymentStatus: 'paid',
        amountCollected: 50,
        order: Order(
          id: '1',
          organizationId: '1',
          cafeteriaId: '1',
          date: '',
          total: 50,
          status: 'delivered',
          paymentStatus: 'paid',
          amountPaid: 50,
          items: [],
        ),
      );

      expect(paidDelivery.isPaid, true);
    });
  });

  group('Deliverer Model', () {
    test('fromJson should parse valid JSON correctly', () {
      final json = {
        'id': 'deliverer-123',
        'name': 'John Doe',
        'phone': '+123456789',
      };

      final deliverer = Deliverer.fromJson(json);

      expect(deliverer.id, 'deliverer-123');
      expect(deliverer.name, 'John Doe');
      expect(deliverer.phone, '+123456789');
    });

    test('toJson should serialize deliverer correctly', () {
      final deliverer = Deliverer(
        id: 'deliverer-123',
        name: 'John Doe',
        phone: '+123456789',
      );

      final json = deliverer.toJson();

      expect(json['id'], 'deliverer-123');
      expect(json['name'], 'John Doe');
      expect(json['phone'], '+123456789');
    });
  });
}
