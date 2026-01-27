import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/deliverer/data/models/payment_collection_model.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/payment_collection.dart';
import '../../helpers/mock_data.dart';

void main() {
  group('PaymentCollectionModel', () {
    final testDate = DateTime(2026, 1, 27, 12, 0);
    
    final validJson = {
      'id': 'payment-001',
      'deliverer_id': 'deliverer-789',
      'customer_id': 'customer-456',
      'customer_name': 'John Doe',
      'amount': 1000.0,
      'mode': 'cash',
      'collected_at': testDate.toIso8601String(),
      'allocations': [
        {
          'order_id': 'order-123',
          'order_number': 'ORD-001',
          'allocated_amount': 500.0,
          'order_date': testDate.toIso8601String(),
          'is_fully_paid': true,
        },
        {
          'order_id': 'order-124',
          'order_number': 'ORD-002',
          'allocated_amount': 500.0,
          'order_date': testDate.toIso8601String(),
          'is_fully_paid': false,
        },
      ],
      'reference': 'REF-123',
      'notes': 'Payment collected',
      'is_uploaded': false,
      'created_at': testDate.toIso8601String(),
    };

    test('should be a subclass of PaymentCollection entity', () {
      // Arrange
      final model = PaymentCollectionModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity, isA<PaymentCollection>());
    });

    test('should deserialize from valid JSON', () {
      // Act
      final model = PaymentCollectionModel.fromJson(validJson);

      // Assert
      expect(model.id, 'payment-001');
      expect(model.delivererId, 'deliverer-789');
      expect(model.customerId, 'customer-456');
      expect(model.customerName, 'John Doe');
      expect(model.amount, 1000.0);
      expect(model.mode, PaymentMode.cash);
    });

    test('should parse allocations correctly', () {
      // Act
      final model = PaymentCollectionModel.fromJson(validJson);

      // Assert
      expect(model.allocations.length, 2);
      expect(model.allocations.first.orderId, 'order-123');
      expect(model.allocations.first.allocatedAmount, 500.0);
      expect(model.allocations.last.orderId, 'order-124');
    });

    test('should parse payment mode correctly', () {
      // Arrange
      final modes = ['cash', 'check', 'transfer', 'card'];

      for (final mode in modes) {
        final json = {...validJson, 'mode': mode};

        // Act
        final model = PaymentCollectionModel.fromJson(json);

        // Assert
        expect(model.mode, isA<PaymentMode>());
      }
    });

    test('should parse collected date correctly', () {
      // Act
      final model = PaymentCollectionModel.fromJson(validJson);

      // Assert
      expect(model.collectedAt.year, 2026);
      expect(model.collectedAt.month, 1);
      expect(model.collectedAt.day, 27);
    });

    test('should handle optional fields', () {
      // Arrange
      final minimalJson = {
        'id': 'payment-001',
        'deliverer_id': 'deliverer-789',
        'customer_id': 'customer-456',
        'customer_name': 'John Doe',
        'amount': 1000.0,
        'mode': 'cash',
        'collected_at': testDate.toIso8601String(),
        'allocations': [],
      };

      // Act
      final model = PaymentCollectionModel.fromJson(minimalJson);

      // Assert
      expect(model.reference, isNull);
      expect(model.notes, isNull);
      expect(model.receiptImagePath, isNull);
      expect(model.uploadedAt, isNull);
      expect(model.isUploaded, false);
    });

    test('should throw when required fields are missing', () {
      // Arrange
      final invalidJson = {
        'id': 'payment-001',
        // Missing required fields
      };

      // Act & Assert
      expect(
        () => PaymentCollectionModel.fromJson(invalidJson),
        throwsA(anything),
      );
    });

    test('should serialize to JSON correctly', () {
      // Arrange
      final model = PaymentCollectionModel.fromJson(validJson);

      // Act
      final json = model.toJson();

      // Assert
      expect(json['id'], 'payment-001');
      expect(json['customer_name'], 'John Doe');
      expect(json['amount'], 1000.0);
      expect(json['mode'], isA<String>());
    });

    test('should serialize allocations correctly', () {
      // Arrange
      final model = PaymentCollectionModel.fromJson(validJson);

      // Act
      final json = model.toJson();

      // Assert
      expect(json['allocations'], isA<List>());
      expect(json['allocations'].length, 2);
    });

    test('should be reversible (fromJson -> toJson)', () {
      // Arrange
      final model = PaymentCollectionModel.fromJson(validJson);

      // Act
      final json = model.toJson();
      final model2 = PaymentCollectionModel.fromJson(json);

      // Assert
      expect(model2.id, model.id);
      expect(model2.amount, model.amount);
      expect(model2.allocations.length, model.allocations.length);
    });

    test('should convert to entity correctly', () {
      // Arrange
      final model = PaymentCollectionModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity.id, model.id);
      expect(entity.amount, model.amount);
      expect(entity.customerName, model.customerName);
      expect(entity.allocations.length, model.allocations.length);
    });

    test('should preserve all data when converting to entity', () {
      // Arrange
      final model = PaymentCollectionModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity.reference, model.reference);
      expect(entity.notes, model.notes);
      expect(entity.isUploaded, model.isUploaded);
    });

    test('should convert from entity correctly', () {
      // Arrange
      final entity = PaymentCollection(
        id: 'payment-001',
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.cash,
        collectedAt: testDate,
        allocations: [
          PaymentAllocation(
            orderId: 'order-123',
            orderNumber: 'ORD-001',
            allocatedAmount: 500.0,
            orderDate: testDate,
            isFullyPaid: true,
          ),
        ],
        isUploaded: false,
        createdAt: testDate,
      );

      // Act
      final model = PaymentCollectionModel.fromEntity(entity);

      // Assert
      expect(model.id, entity.id);
      expect(model.amount, entity.amount);
      expect(model.allocations.length, entity.allocations.length);
    });

    test('should be reversible (entity -> model -> entity)', () {
      // Arrange
      final entity = PaymentCollection(
        id: 'payment-001',
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.cash,
        collectedAt: testDate,
        allocations: [],
        isUploaded: false,
        createdAt: testDate,
      );

      // Act
      final model = PaymentCollectionModel.fromEntity(entity);
      final entity2 = model.toEntity();

      // Assert
      expect(entity2.id, entity.id);
      expect(entity2.amount, entity.amount);
      expect(entity2.mode, entity.mode);
    });

    test('should create upload JSON correctly', () {
      // Arrange
      final model = PaymentCollectionModel.fromJson(validJson);

      // Act
      final uploadJson = model.toUploadJson();

      // Assert
      expect(uploadJson['deliverer_id'], 'deliverer-789');
      expect(uploadJson['customer_id'], 'customer-456');
      expect(uploadJson['amount'], 1000.0);
      expect(uploadJson['mode'], 'cash');
      expect(uploadJson['allocations'], isA<List>());
    });

    test('should exclude empty optional fields from upload JSON', () {
      // Arrange
      final minimalJson = {
        'id': 'payment-001',
        'deliverer_id': 'deliverer-789',
        'customer_id': 'customer-456',
        'customer_name': 'John Doe',
        'amount': 1000.0,
        'mode': 'cash',
        'collected_at': testDate.toIso8601String(),
        'allocations': [],
      };
      final model = PaymentCollectionModel.fromJson(minimalJson);

      // Act
      final uploadJson = model.toUploadJson();

      // Assert
      expect(uploadJson.containsKey('reference'), false);
      expect(uploadJson.containsKey('notes'), false);
      expect(uploadJson.containsKey('receipt_image_path'), false);
    });

    test('should parse from API response correctly', () {
      // Arrange
      final apiJson = {
        'id': 'payment-001',
        'deliverer_id': 'deliverer-789',
        'customer_id': 'customer-456',
        'customer_name': 'John Doe',
        'amount': 1000.0,
        'mode': 'cash',
        'collected_at': testDate.toIso8601String(),
        'allocations': [],
        'is_uploaded': true,
        'uploaded_at': testDate.toIso8601String(),
      };

      // Act
      final model = PaymentCollectionModel.fromApiResponse(apiJson);

      // Assert
      expect(model.id, 'payment-001');
      expect(model.isUploaded, true);
      expect(model.uploadedAt, isNotNull);
    });

    test('should support copyWith', () {
      // Arrange
      final model = PaymentCollectionModel.fromJson(validJson);

      // Act
      final updated = model.copyWith(
        isUploaded: true,
        uploadedAt: testDate,
      );

      // Assert
      expect(updated.isUploaded, true);
      expect(updated.uploadedAt, testDate);
      expect(updated.id, model.id);
    });

    test('should maintain immutability', () {
      // Arrange
      final model = PaymentCollectionModel.fromJson(validJson);
      final originalUploaded = model.isUploaded;

      // Act
      final updated = model.copyWith(isUploaded: true);

      // Assert
      expect(model.isUploaded, originalUploaded);
      expect(updated.isUploaded, true);
    });

    test('should support equality comparison', () {
      // Arrange
      final model1 = PaymentCollectionModel.fromJson(validJson);
      final model2 = PaymentCollectionModel.fromJson(validJson);

      // Assert
      expect(model1, equals(model2));
    });

    test('should validate amount is positive', () {
      // Arrange
      final model = PaymentCollectionModel.fromJson(validJson);

      // Assert
      expect(model.amount > 0, true);
    });

    test('should validate allocations sum', () {
      // Arrange
      final model = PaymentCollectionModel.fromJson(validJson);

      // Act
      final totalAllocated = model.allocations.fold(
        0.0,
        (sum, allocation) => sum + allocation.allocatedAmount,
      );

      // Assert
      expect(totalAllocated, model.amount);
    });
  });

  group('PaymentAllocationModel', () {
    final testDate = DateTime(2026, 1, 27, 12, 0);

    final validJson = {
      'order_id': 'order-123',
      'order_number': 'ORD-001',
      'allocated_amount': 500.0,
      'order_date': testDate.toIso8601String(),
      'is_fully_paid': true,
    };

    test('should deserialize from valid JSON', () {
      // Act
      final model = PaymentAllocationModel.fromJson(validJson);

      // Assert
      expect(model.orderId, 'order-123');
      expect(model.orderNumber, 'ORD-001');
      expect(model.allocatedAmount, 500.0);
      expect(model.isFullyPaid, true);
    });

    test('should serialize to JSON correctly', () {
      // Arrange
      final model = PaymentAllocationModel.fromJson(validJson);

      // Act
      final json = model.toJson();

      // Assert
      expect(json['order_id'], 'order-123');
      expect(json['allocated_amount'], 500.0);
    });

    test('should convert to entity correctly', () {
      // Arrange
      final model = PaymentAllocationModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity, isA<PaymentAllocation>());
      expect(entity.orderId, model.orderId);
      expect(entity.allocatedAmount, model.allocatedAmount);
    });

    test('should create upload JSON correctly', () {
      // Arrange
      final model = PaymentAllocationModel.fromJson(validJson);

      // Act
      final uploadJson = model.toUploadJson();

      // Assert
      expect(uploadJson['order_id'], 'order-123');
      expect(uploadJson['allocated_amount'], 500.0);
      expect(uploadJson['is_fully_paid'], true);
    });

    test('should parse from API response correctly', () {
      // Act
      final model = PaymentAllocationModel.fromApiResponse(validJson);

      // Assert
      expect(model.orderId, 'order-123');
      expect(model.allocatedAmount, 500.0);
    });
  });

  group('UploadPaymentResponse', () {
    final testDate = DateTime(2026, 1, 27, 12, 0);

    test('should detect success status', () {
      // Arrange
      final response = UploadPaymentResponse(
        id: 'payment-001',
        status: 'success',
        message: 'Uploaded successfully',
        uploadedAt: testDate,
        updatedOrders: ['order-123', 'order-124'],
      );

      // Assert
      expect(response.isSuccess, true);
      expect(response.isFailure, false);
    });

    test('should detect failure status', () {
      // Arrange
      final response = UploadPaymentResponse(
        id: 'payment-001',
        status: 'error',
        message: 'Upload failed',
        uploadedAt: testDate,
      );

      // Assert
      expect(response.isFailure, true);
      expect(response.isSuccess, false);
    });

    test('should count updated orders correctly', () {
      // Arrange
      final response = UploadPaymentResponse(
        id: 'payment-001',
        status: 'success',
        message: 'Uploaded successfully',
        uploadedAt: testDate,
        updatedOrders: ['order-1', 'order-2', 'order-3'],
      );

      // Assert
      expect(response.updatedOrdersCount, 3);
    });
  });

  group('UnpaidOrderModel', () {
    final testDate = DateTime(2026, 1, 27, 12, 0);

    final validJson = {
      'id': 'order-123',
      'order_number': 'ORD-001',
      'order_date': testDate.toIso8601String(),
      'total_amount': 1000.0,
      'paid_amount': 300.0,
      'remaining_amount': 700.0,
      'days_since_order': 5,
    };

    test('should deserialize from valid JSON', () {
      // Act
      final model = UnpaidOrderModel.fromJson(validJson);

      // Assert
      expect(model.id, 'order-123');
      expect(model.orderNumber, 'ORD-001');
      expect(model.totalAmount, 1000.0);
      expect(model.paidAmount, 300.0);
      expect(model.remainingAmount, 700.0);
      expect(model.daysSinceOrder, 5);
    });

    test('should convert to UnpaidOrder correctly', () {
      // Arrange
      final model = UnpaidOrderModel.fromJson(validJson);

      // Act
      final unpaidOrder = model.toUnpaidOrder();

      // Assert
      expect(unpaidOrder.id, model.id);
      expect(unpaidOrder.remainingAmount, model.remainingAmount);
    });

    test('should parse from API response correctly', () {
      // Act
      final model = UnpaidOrderModel.fromApiResponse(validJson);

      // Assert
      expect(model.id, 'order-123');
      expect(model.remainingAmount, 700.0);
    });

    test('should validate financial calculations', () {
      // Arrange
      final model = UnpaidOrderModel.fromJson(validJson);

      // Assert
      expect(
        model.totalAmount - model.paidAmount,
        model.remainingAmount,
      );
    });
  });
}
