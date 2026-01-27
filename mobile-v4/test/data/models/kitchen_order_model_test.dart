import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/kitchen/data/models/kitchen_order_model.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import '../../helpers/mock_data.dart';

void main() {
  group('KitchenOrderModel', () {
    final mockJson = MockData.mockKitchenOrderJson;
    final mockEntity = MockData.mockKitchenOrder;

    test('should be a subclass of KitchenOrder entity', () {
      final model = KitchenOrderModel.fromJson(mockJson);
      expect(model, isA<KitchenOrder>());
    });

    group('fromJson', () {
      test('should return a valid model from JSON', () {
        // Act
        final result = KitchenOrderModel.fromJson(mockJson);

        // Assert
        expect(result.id, mockJson['id']);
        expect(result.orderNumber, mockJson['orderNumber']);
        expect(result.customerName, mockJson['customerName']);
        expect(result.customerPhone, mockJson['customerPhone']);
        expect(result.totalAmount, mockJson['totalAmount']);
        expect(result.status.toString(), contains(mockJson['status']));
        expect(result.priority.toString(), contains(mockJson['priority']));
        expect(result.station, mockJson['station']);
        expect(result.estimatedTime, mockJson['estimatedTime']);
        expect(result.deliveryAddress, mockJson['deliveryAddress']);
      });

      test('should parse items correctly', () {
        // Act
        final result = KitchenOrderModel.fromJson(mockJson);

        // Assert
        expect(result.items.length, 1);
        expect(result.items.first.productId, 'product-001');
        expect(result.items.first.productName, 'Pizza Margherita');
        expect(result.items.first.quantity, 2);
        expect(result.items.first.price, 12.50);
        expect(result.items.first.notes, 'Extra cheese');
      });

      test('should parse date correctly', () {
        // Act
        final result = KitchenOrderModel.fromJson(mockJson);

        // Assert
        expect(result.createdAt, isA<DateTime>());
        expect(result.createdAt.year, 2026);
        expect(result.createdAt.month, 1);
        expect(result.createdAt.day, 27);
      });

      test('should handle missing optional fields', () {
        // Arrange
        final jsonWithoutOptionals = {
          ...mockJson,
        };
        jsonWithoutOptionals.remove('notes');
        jsonWithoutOptionals.remove('deliveryAddress');

        // Act
        final result = KitchenOrderModel.fromJson(jsonWithoutOptionals);

        // Assert
        expect(result.id, isNotNull);
        expect(result.orderNumber, isNotNull);
      });

      test('should throw when required fields are missing', () {
        // Arrange
        final invalidJson = {...mockJson};
        invalidJson.remove('id');

        // Act & Assert
        expect(
          () => KitchenOrderModel.fromJson(invalidJson),
          throwsA(isA<TypeError>()),
        );
      });

      test('should handle invalid status gracefully', () {
        // Arrange
        final jsonWithInvalidStatus = {
          ...mockJson,
          'status': 'invalid_status',
        };

        // Act & Assert
        expect(
          () => KitchenOrderModel.fromJson(jsonWithInvalidStatus),
          throwsA(anything),
        );
      });

      test('should handle invalid date format', () {
        // Arrange
        final jsonWithInvalidDate = {
          ...mockJson,
          'createdAt': 'invalid-date',
        };

        // Act & Assert
        expect(
          () => KitchenOrderModel.fromJson(jsonWithInvalidDate),
          throwsA(isA<FormatException>()),
        );
      });
    });

    group('toJson', () {
      test('should return a valid JSON map', () {
        // Arrange
        final model = KitchenOrderModel.fromJson(mockJson);

        // Act
        final result = model.toJson();

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result['id'], model.id);
        expect(result['orderNumber'], model.orderNumber);
        expect(result['customerName'], model.customerName);
        expect(result['totalAmount'], model.totalAmount);
      });

      test('should serialize items correctly', () {
        // Arrange
        final model = KitchenOrderModel.fromJson(mockJson);

        // Act
        final result = model.toJson();

        // Assert
        expect(result['items'], isA<List>());
        expect(result['items'].length, 1);
        expect(result['items'][0]['productId'], 'product-001');
        expect(result['items'][0]['productName'], 'Pizza Margherita');
      });

      test('should serialize date to ISO8601 string', () {
        // Arrange
        final model = KitchenOrderModel.fromJson(mockJson);

        // Act
        final result = model.toJson();

        // Assert
        expect(result['createdAt'], isA<String>());
        expect(result['createdAt'], contains('2026'));
        expect(result['createdAt'], contains('T'));
      });

      test('should be reversible (fromJson -> toJson -> fromJson)', () {
        // Arrange
        final originalModel = KitchenOrderModel.fromJson(mockJson);

        // Act
        final json = originalModel.toJson();
        final reconstructedModel = KitchenOrderModel.fromJson(json);

        // Assert
        expect(reconstructedModel.id, originalModel.id);
        expect(reconstructedModel.orderNumber, originalModel.orderNumber);
        expect(reconstructedModel.customerName, originalModel.customerName);
        expect(reconstructedModel.totalAmount, originalModel.totalAmount);
        expect(reconstructedModel.items.length, originalModel.items.length);
      });
    });

    group('toEntity', () {
      test('should convert model to entity', () {
        // Arrange
        final model = KitchenOrderModel.fromJson(mockJson);

        // Act
        final entity = model.toEntity();

        // Assert
        expect(entity, isA<KitchenOrder>());
        expect(entity.id, model.id);
        expect(entity.orderNumber, model.orderNumber);
        expect(entity.customerName, model.customerName);
        expect(entity.totalAmount, model.totalAmount);
      });

      test('should preserve all data in conversion', () {
        // Arrange
        final model = KitchenOrderModel.fromJson(mockJson);

        // Act
        final entity = model.toEntity();

        // Assert
        expect(entity.id, model.id);
        expect(entity.orderNumber, model.orderNumber);
        expect(entity.customerName, model.customerName);
        expect(entity.customerPhone, model.customerPhone);
        expect(entity.items.length, model.items.length);
        expect(entity.totalAmount, model.totalAmount);
        expect(entity.status, model.status);
        expect(entity.priority, model.priority);
        expect(entity.station, model.station);
        expect(entity.estimatedTime, model.estimatedTime);
        expect(entity.deliveryAddress, model.deliveryAddress);
      });
    });

    group('fromEntity', () {
      test('should convert entity to model', () {
        // Arrange
        final entity = mockEntity;

        // Act
        final model = KitchenOrderModel.fromEntity(entity);

        // Assert
        expect(model, isA<KitchenOrderModel>());
        expect(model.id, entity.id);
        expect(model.orderNumber, entity.orderNumber);
        expect(model.customerName, entity.customerName);
      });

      test('should be reversible (entity -> model -> entity)', () {
        // Arrange
        final originalEntity = mockEntity;

        // Act
        final model = KitchenOrderModel.fromEntity(originalEntity);
        final reconstructedEntity = model.toEntity();

        // Assert
        expect(reconstructedEntity.id, originalEntity.id);
        expect(reconstructedEntity.orderNumber, originalEntity.orderNumber);
        expect(reconstructedEntity.customerName, originalEntity.customerName);
        expect(reconstructedEntity.totalAmount, originalEntity.totalAmount);
      });
    });

    group('copyWith', () {
      test('should create a copy with updated values', () {
        // Arrange
        final model = KitchenOrderModel.fromJson(mockJson);

        // Act
        final updated = model.copyWith(
          status: OrderStatus.preparing,
          priority: OrderPriority.high,
        );

        // Assert
        expect(updated.id, model.id);
        expect(updated.status, OrderStatus.preparing);
        expect(updated.priority, OrderPriority.high);
        expect(updated.customerName, model.customerName);
      });

      test('should not modify original model', () {
        // Arrange
        final original = KitchenOrderModel.fromJson(mockJson);
        final originalStatus = original.status;

        // Act
        final updated = original.copyWith(status: OrderStatus.preparing);

        // Assert
        expect(original.status, originalStatus);
        expect(updated.status, OrderStatus.preparing);
      });
    });

    group('equality', () {
      test('should be equal when all fields are equal', () {
        // Arrange
        final model1 = KitchenOrderModel.fromJson(mockJson);
        final model2 = KitchenOrderModel.fromJson(mockJson);

        // Assert
        expect(model1 == model2, true);
        expect(model1.hashCode, model2.hashCode);
      });

      test('should not be equal when ids differ', () {
        // Arrange
        final model1 = KitchenOrderModel.fromJson(mockJson);
        final json2 = {...mockJson, 'id': 'different-id'};
        final model2 = KitchenOrderModel.fromJson(json2);

        // Assert
        expect(model1 == model2, false);
      });
    });

    group('validation', () {
      test('should validate positive amounts', () {
        // Arrange
        final model = KitchenOrderModel.fromJson(mockJson);

        // Assert
        expect(model.totalAmount, greaterThan(0));
        for (final item in model.items) {
          expect(item.price, greaterThan(0));
          expect(item.quantity, greaterThan(0));
        }
      });

      test('should validate non-empty strings', () {
        // Arrange
        final model = KitchenOrderModel.fromJson(mockJson);

        // Assert
        expect(model.id, isNotEmpty);
        expect(model.orderNumber, isNotEmpty);
        expect(model.customerName, isNotEmpty);
      });

      test('should validate phone number format', () {
        // Arrange
        final model = KitchenOrderModel.fromJson(mockJson);

        // Assert
        expect(model.customerPhone, matches(r'^\+\d+'));
      });
    });
  });
}
