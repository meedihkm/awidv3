import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/customer/data/models/customer_order_model.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_order.dart';
import '../../helpers/mock_data.dart';

void main() {
  group('CustomerOrderModel', () {
    final testDate = DateTime(2026, 1, 27, 12, 0);
    
    final validJson = {
      'id': 'order-123',
      'orderNumber': 'ORD-001',
      'customerId': 'customer-456',
      'customerName': 'John Doe',
      'orderDate': testDate.toIso8601String(),
      'deliveryDate': testDate.add(const Duration(hours: 2)).toIso8601String(),
      'status': 'pending',
      'items': [
        {
          'id': 'item-001',
          'productId': 'product-001',
          'productName': 'Pizza Margherita',
          'productCode': 'PIZZA-001',
          'quantity': 2,
          'unitPrice': 12.50,
          'totalPrice': 25.00,
          'productImage': 'https://example.com/pizza.jpg',
          'unit': 'pcs',
          'notes': 'Extra cheese',
        },
      ],
      'subtotal': 25.00,
      'deliveryFee': 5.00,
      'packagingDeposit': 2.00,
      'totalAmount': 32.00,
      'paidAmount': 0.00,
      'remainingAmount': 32.00,
      'delivererId': 'deliverer-789',
      'delivererName': 'Jane Deliverer',
      'deliveryAddress': '123 Main St',
      'notes': 'Ring doorbell',
      'hasProofOfDelivery': false,
      'createdAt': testDate.toIso8601String(),
      'updatedAt': testDate.toIso8601String(),
    };

    test('should be a subclass of CustomerOrder entity', () {
      // Arrange
      final model = CustomerOrderModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity, isA<CustomerOrder>());
    });

    test('should deserialize from valid JSON', () {
      // Act
      final model = CustomerOrderModel.fromJson(validJson);

      // Assert
      expect(model.id, 'order-123');
      expect(model.orderNumber, 'ORD-001');
      expect(model.customerId, 'customer-456');
      expect(model.customerName, 'John Doe');
      expect(model.status, 'pending');
      expect(model.totalAmount, 32.00);
    });

    test('should parse items correctly', () {
      // Act
      final model = CustomerOrderModel.fromJson(validJson);

      // Assert
      expect(model.items.length, 1);
      expect(model.items.first.productName, 'Pizza Margherita');
      expect(model.items.first.quantity, 2);
      expect(model.items.first.unitPrice, 12.50);
    });

    test('should parse dates correctly', () {
      // Act
      final model = CustomerOrderModel.fromJson(validJson);

      // Assert
      expect(model.orderDate.year, 2026);
      expect(model.orderDate.month, 1);
      expect(model.orderDate.day, 27);
      expect(model.deliveryDate, isNotNull);
    });

    test('should handle optional fields', () {
      // Arrange
      final minimalJson = {
        'id': 'order-123',
        'orderNumber': 'ORD-001',
        'customerId': 'customer-456',
        'customerName': 'John Doe',
        'orderDate': testDate.toIso8601String(),
        'status': 'pending',
        'items': [],
        'subtotal': 0.00,
        'deliveryFee': 0.00,
        'packagingDeposit': 0.00,
        'totalAmount': 0.00,
        'paidAmount': 0.00,
        'remainingAmount': 0.00,
      };

      // Act
      final model = CustomerOrderModel.fromJson(minimalJson);

      // Assert
      expect(model.deliveryDate, isNull);
      expect(model.delivererId, isNull);
      expect(model.notes, isNull);
      expect(model.hasProofOfDelivery, false);
    });

    test('should throw when required fields are missing', () {
      // Arrange
      final invalidJson = {
        'id': 'order-123',
        // Missing required fields
      };

      // Act & Assert
      expect(
        () => CustomerOrderModel.fromJson(invalidJson),
        throwsA(anything),
      );
    });

    test('should parse all order statuses correctly', () {
      // Arrange
      final statuses = [
        'pending',
        'confirmed',
        'preparing',
        'ready',
        'in_delivery',
        'delivered',
        'cancelled',
        'failed',
      ];

      for (final status in statuses) {
        final json = {...validJson, 'status': status};

        // Act
        final model = CustomerOrderModel.fromJson(json);
        final entity = model.toEntity();

        // Assert
        expect(entity.status, isA<OrderStatus>());
      }
    });

    test('should default to pending for unknown status', () {
      // Arrange
      final json = {...validJson, 'status': 'unknown_status'};

      // Act
      final model = CustomerOrderModel.fromJson(json);
      final entity = model.toEntity();

      // Assert
      expect(entity.status, OrderStatus.pending);
    });

    test('should serialize to JSON correctly', () {
      // Arrange
      final model = CustomerOrderModel.fromJson(validJson);

      // Act
      final json = model.toJson();

      // Assert
      expect(json['id'], 'order-123');
      expect(json['orderNumber'], 'ORD-001');
      expect(json['status'], 'pending');
      expect(json['totalAmount'], 32.00);
    });

    test('should serialize items correctly', () {
      // Arrange
      final model = CustomerOrderModel.fromJson(validJson);

      // Act
      final json = model.toJson();

      // Assert
      expect(json['items'], isA<List>());
      expect(json['items'].length, 1);
      expect(json['items'][0]['productName'], 'Pizza Margherita');
    });

    test('should serialize dates correctly', () {
      // Arrange
      final model = CustomerOrderModel.fromJson(validJson);

      // Act
      final json = model.toJson();

      // Assert
      expect(json['orderDate'], isA<String>());
      expect(json['orderDate'], contains('2026-01-27'));
    });

    test('should be reversible (fromJson -> toJson)', () {
      // Arrange
      final model = CustomerOrderModel.fromJson(validJson);

      // Act
      final json = model.toJson();
      final model2 = CustomerOrderModel.fromJson(json);

      // Assert
      expect(model2.id, model.id);
      expect(model2.orderNumber, model.orderNumber);
      expect(model2.totalAmount, model.totalAmount);
      expect(model2.items.length, model.items.length);
    });

    test('should convert to entity correctly', () {
      // Arrange
      final model = CustomerOrderModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity.id, model.id);
      expect(entity.orderNumber, model.orderNumber);
      expect(entity.customerId, model.customerId);
      expect(entity.totalAmount, model.totalAmount);
      expect(entity.items.length, model.items.length);
    });

    test('should preserve all data when converting to entity', () {
      // Arrange
      final model = CustomerOrderModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity.delivererId, model.delivererId);
      expect(entity.delivererName, model.delivererName);
      expect(entity.deliveryAddress, model.deliveryAddress);
      expect(entity.notes, model.notes);
      expect(entity.hasProofOfDelivery, model.hasProofOfDelivery);
    });

    test('should convert from entity correctly', () {
      // Arrange
      final entity = CustomerOrder(
        id: 'order-123',
        orderNumber: 'ORD-001',
        customerId: 'customer-456',
        customerName: 'John Doe',
        orderDate: testDate,
        status: OrderStatus.pending,
        items: [
          CustomerOrderItem(
            id: 'item-001',
            productId: 'product-001',
            productName: 'Pizza Margherita',
            productCode: 'PIZZA-001',
            quantity: 2,
            unitPrice: 12.50,
            totalPrice: 25.00,
          ),
        ],
        subtotal: 25.00,
        deliveryFee: 5.00,
        packagingDeposit: 2.00,
        totalAmount: 32.00,
        paidAmount: 0.00,
        remainingAmount: 32.00,
      );

      // Act
      final model = entity.toModel();

      // Assert
      expect(model.id, entity.id);
      expect(model.orderNumber, entity.orderNumber);
      expect(model.totalAmount, entity.totalAmount);
    });

    test('should be reversible (entity -> model -> entity)', () {
      // Arrange
      final entity = CustomerOrder(
        id: 'order-123',
        orderNumber: 'ORD-001',
        customerId: 'customer-456',
        customerName: 'John Doe',
        orderDate: testDate,
        status: OrderStatus.pending,
        items: [],
        subtotal: 0.00,
        deliveryFee: 0.00,
        packagingDeposit: 0.00,
        totalAmount: 0.00,
        paidAmount: 0.00,
        remainingAmount: 0.00,
      );

      // Act
      final model = entity.toModel();
      final entity2 = model.toEntity();

      // Assert
      expect(entity2.id, entity.id);
      expect(entity2.orderNumber, entity.orderNumber);
      expect(entity2.status, entity.status);
    });

    test('should support copyWith', () {
      // Arrange
      final model = CustomerOrderModel.fromJson(validJson);

      // Act
      final updated = model.copyWith(
        status: 'confirmed',
        paidAmount: 32.00,
        remainingAmount: 0.00,
      );

      // Assert
      expect(updated.status, 'confirmed');
      expect(updated.paidAmount, 32.00);
      expect(updated.remainingAmount, 0.00);
      expect(updated.id, model.id);
    });

    test('should maintain immutability', () {
      // Arrange
      final model = CustomerOrderModel.fromJson(validJson);
      final originalStatus = model.status;

      // Act
      final updated = model.copyWith(status: 'confirmed');

      // Assert
      expect(model.status, originalStatus);
      expect(updated.status, 'confirmed');
    });

    test('should support equality comparison', () {
      // Arrange
      final model1 = CustomerOrderModel.fromJson(validJson);
      final model2 = CustomerOrderModel.fromJson(validJson);

      // Assert
      expect(model1, equals(model2));
    });

    test('should validate financial calculations', () {
      // Arrange
      final model = CustomerOrderModel.fromJson(validJson);

      // Assert
      expect(
        model.subtotal + model.deliveryFee + model.packagingDeposit,
        model.totalAmount,
      );
      expect(
        model.totalAmount - model.paidAmount,
        model.remainingAmount,
      );
    });
  });

  group('CustomerOrderItemModel', () {
    final validItemJson = {
      'id': 'item-001',
      'productId': 'product-001',
      'productName': 'Pizza Margherita',
      'productCode': 'PIZZA-001',
      'quantity': 2,
      'unitPrice': 12.50,
      'totalPrice': 25.00,
      'productImage': 'https://example.com/pizza.jpg',
      'unit': 'pcs',
      'notes': 'Extra cheese',
    };

    test('should deserialize from valid JSON', () {
      // Act
      final model = CustomerOrderItemModel.fromJson(validItemJson);

      // Assert
      expect(model.id, 'item-001');
      expect(model.productName, 'Pizza Margherita');
      expect(model.quantity, 2);
      expect(model.unitPrice, 12.50);
      expect(model.totalPrice, 25.00);
    });

    test('should serialize to JSON correctly', () {
      // Arrange
      final model = CustomerOrderItemModel.fromJson(validItemJson);

      // Act
      final json = model.toJson();

      // Assert
      expect(json['productName'], 'Pizza Margherita');
      expect(json['quantity'], 2);
      expect(json['totalPrice'], 25.00);
    });

    test('should convert to entity correctly', () {
      // Arrange
      final model = CustomerOrderItemModel.fromJson(validItemJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity, isA<CustomerOrderItem>());
      expect(entity.productName, model.productName);
      expect(entity.quantity, model.quantity);
    });

    test('should validate price calculation', () {
      // Arrange
      final model = CustomerOrderItemModel.fromJson(validItemJson);

      // Assert
      expect(model.quantity * model.unitPrice, model.totalPrice);
    });
  });
}
