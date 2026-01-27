import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/kitchen/data/models/stock_item_model.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';
import '../../helpers/mock_data.dart';

void main() {
  group('StockItemModel', () {
    final testDate = DateTime(2026, 1, 27, 12, 0);
    
    final validJson = {
      'id': 'stock-001',
      'productId': 'product-001',
      'productName': 'Tomato Sauce',
      'currentQuantity': 50.0,
      'minimumQuantity': 20.0,
      'maximumQuantity': 100.0,
      'unit': 'kg',
      'category': 'Sauces',
      'supplier': 'Supplier A',
      'location': 'Warehouse A',
      'imageUrl': 'https://example.com/tomato.jpg',
      'lastRestockDate': testDate.toIso8601String(),
      'expirationDate': testDate.add(const Duration(days: 30)).toIso8601String(),
      'unitCost': 5.50,
      'barcode': '1234567890',
      'isPerishable': true,
      'requiresRefrigeration': true,
    };

    test('should be a subclass of StockItem entity', () {
      // Arrange
      final model = StockItemModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity, isA<StockItem>());
    });

    test('should deserialize from valid JSON', () {
      // Act
      final model = StockItemModel.fromJson(validJson);

      // Assert
      expect(model.id, 'stock-001');
      expect(model.productId, 'product-001');
      expect(model.productName, 'Tomato Sauce');
      expect(model.currentQuantity, 50.0);
      expect(model.minimumQuantity, 20.0);
      expect(model.maximumQuantity, 100.0);
      expect(model.unit, 'kg');
    });

    test('should parse all stock units correctly', () {
      // Arrange
      final units = ['kg', 'g', 'l', 'ml', 'unit', 'box', 'pack'];

      for (final unit in units) {
        final json = {...validJson, 'unit': unit};

        // Act
        final model = StockItemModel.fromJson(json);
        final entity = model.toEntity();

        // Assert
        expect(entity.unit, isA<StockUnit>());
      }
    });

    test('should default to unit for unknown unit type', () {
      // Arrange
      final json = {...validJson, 'unit': 'unknown'};

      // Act
      final model = StockItemModel.fromJson(json);
      final entity = model.toEntity();

      // Assert
      expect(entity.unit, StockUnit.unit);
    });

    test('should parse dates correctly', () {
      // Act
      final model = StockItemModel.fromJson(validJson);
      final entity = model.toEntity();

      // Assert
      expect(entity.lastRestockDate, isNotNull);
      expect(entity.lastRestockDate!.year, 2026);
      expect(entity.expirationDate, isNotNull);
    });

    test('should handle optional fields', () {
      // Arrange
      final minimalJson = {
        'id': 'stock-001',
        'productId': 'product-001',
        'productName': 'Tomato Sauce',
        'currentQuantity': 50.0,
        'minimumQuantity': 20.0,
        'maximumQuantity': 100.0,
        'unit': 'kg',
      };

      // Act
      final model = StockItemModel.fromJson(minimalJson);

      // Assert
      expect(model.category, isNull);
      expect(model.supplier, isNull);
      expect(model.location, isNull);
      expect(model.lastRestockDate, isNull);
      expect(model.expirationDate, isNull);
      expect(model.isPerishable, false);
      expect(model.requiresRefrigeration, false);
    });

    test('should throw when required fields are missing', () {
      // Arrange
      final invalidJson = {
        'id': 'stock-001',
        // Missing required fields
      };

      // Act & Assert
      expect(
        () => StockItemModel.fromJson(invalidJson),
        throwsA(anything),
      );
    });

    test('should serialize to JSON correctly', () {
      // Arrange
      final model = StockItemModel.fromJson(validJson);

      // Act
      final json = model.toJson();

      // Assert
      expect(json['id'], 'stock-001');
      expect(json['productName'], 'Tomato Sauce');
      expect(json['currentQuantity'], 50.0);
      expect(json['unit'], 'kg');
    });

    test('should be reversible (fromJson -> toJson)', () {
      // Arrange
      final model = StockItemModel.fromJson(validJson);

      // Act
      final json = model.toJson();
      final model2 = StockItemModel.fromJson(json);

      // Assert
      expect(model2.id, model.id);
      expect(model2.productName, model.productName);
      expect(model2.currentQuantity, model.currentQuantity);
    });

    test('should convert to entity correctly', () {
      // Arrange
      final model = StockItemModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity.id, model.id);
      expect(entity.productName, model.productName);
      expect(entity.currentQuantity, model.currentQuantity);
    });

    test('should preserve all data when converting to entity', () {
      // Arrange
      final model = StockItemModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity.category, model.category);
      expect(entity.supplier, model.supplier);
      expect(entity.location, model.location);
      expect(entity.barcode, model.barcode);
      expect(entity.isPerishable, model.isPerishable);
      expect(entity.requiresRefrigeration, model.requiresRefrigeration);
    });

    test('should convert from entity correctly', () {
      // Arrange
      final entity = StockItem(
        id: 'stock-001',
        productId: 'product-001',
        productName: 'Tomato Sauce',
        currentQuantity: 50.0,
        minimumQuantity: 20.0,
        maximumQuantity: 100.0,
        unit: StockUnit.kg,
        category: 'Sauces',
        lastRestockDate: testDate,
        expirationDate: testDate.add(const Duration(days: 30)),
        isPerishable: true,
      );

      // Act
      final model = StockItemModel.fromEntity(entity);

      // Assert
      expect(model.id, entity.id);
      expect(model.productName, entity.productName);
      expect(model.currentQuantity, entity.currentQuantity);
    });

    test('should be reversible (entity -> model -> entity)', () {
      // Arrange
      final entity = StockItem(
        id: 'stock-001',
        productId: 'product-001',
        productName: 'Tomato Sauce',
        currentQuantity: 50.0,
        minimumQuantity: 20.0,
        maximumQuantity: 100.0,
        unit: StockUnit.kg,
      );

      // Act
      final model = StockItemModel.fromEntity(entity);
      final entity2 = model.toEntity();

      // Assert
      expect(entity2.id, entity.id);
      expect(entity2.productName, entity.productName);
      expect(entity2.unit, entity.unit);
    });

    test('should support copyWith', () {
      // Arrange
      final model = StockItemModel.fromJson(validJson);

      // Act
      final updated = model.copyWith(
        currentQuantity: 75.0,
        isPerishable: false,
      );

      // Assert
      expect(updated.currentQuantity, 75.0);
      expect(updated.isPerishable, false);
      expect(updated.id, model.id);
    });

    test('should maintain immutability', () {
      // Arrange
      final model = StockItemModel.fromJson(validJson);
      final originalQuantity = model.currentQuantity;

      // Act
      final updated = model.copyWith(currentQuantity: 75.0);

      // Assert
      expect(model.currentQuantity, originalQuantity);
      expect(updated.currentQuantity, 75.0);
    });

    test('should support equality comparison', () {
      // Arrange
      final model1 = StockItemModel.fromJson(validJson);
      final model2 = StockItemModel.fromJson(validJson);

      // Assert
      expect(model1, equals(model2));
    });

    test('should validate quantity constraints', () {
      // Arrange
      final model = StockItemModel.fromJson(validJson);

      // Assert
      expect(model.minimumQuantity <= model.maximumQuantity, true);
      expect(model.currentQuantity >= 0, true);
    });
  });

  group('StockMovementModel', () {
    final testDate = DateTime(2026, 1, 27, 12, 0);
    
    final validJson = {
      'id': 'movement-001',
      'stockItemId': 'stock-001',
      'productName': 'Tomato Sauce',
      'type': 'in',
      'quantity': 20.0,
      'unit': 'kg',
      'timestamp': testDate.toIso8601String(),
      'orderId': 'order-123',
      'userId': 'user-456',
      'userName': 'John Doe',
      'reason': 'Restock',
      'notes': 'New delivery',
    };

    test('should deserialize from valid JSON', () {
      // Act
      final model = StockMovementModel.fromJson(validJson);

      // Assert
      expect(model.id, 'movement-001');
      expect(model.stockItemId, 'stock-001');
      expect(model.productName, 'Tomato Sauce');
      expect(model.type, 'in');
      expect(model.quantity, 20.0);
      expect(model.unit, 'kg');
    });

    test('should parse all movement types correctly', () {
      // Arrange
      final types = ['in', 'out', 'adjustment', 'waste', 'transfer'];

      for (final type in types) {
        final json = {...validJson, 'type': type};

        // Act
        final model = StockMovementModel.fromJson(json);
        final entity = model.toEntity();

        // Assert
        expect(entity.type, isA<StockMovementType>());
      }
    });

    test('should convert to entity correctly', () {
      // Arrange
      final model = StockMovementModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity, isA<StockMovement>());
      expect(entity.id, model.id);
      expect(entity.quantity, model.quantity);
    });

    test('should convert from entity correctly', () {
      // Arrange
      final entity = StockMovement(
        id: 'movement-001',
        stockItemId: 'stock-001',
        productName: 'Tomato Sauce',
        type: StockMovementType.stockIn,
        quantity: 20.0,
        unit: StockUnit.kg,
        timestamp: testDate,
      );

      // Act
      final model = StockMovementModel.fromEntity(entity);

      // Assert
      expect(model.id, entity.id);
      expect(model.quantity, entity.quantity);
    });

    test('should serialize to JSON correctly', () {
      // Arrange
      final model = StockMovementModel.fromJson(validJson);

      // Act
      final json = model.toJson();

      // Assert
      expect(json['id'], 'movement-001');
      expect(json['type'], 'in');
      expect(json['quantity'], 20.0);
    });
  });

  group('StockAlertModel', () {
    final testDate = DateTime(2026, 1, 27, 12, 0);
    
    final validJson = {
      'id': 'alert-001',
      'stockItemId': 'stock-001',
      'productName': 'Tomato Sauce',
      'type': 'lowStock',
      'severity': 'warning',
      'createdAt': testDate.toIso8601String(),
      'message': 'Stock is running low',
      'isResolved': false,
    };

    test('should deserialize from valid JSON', () {
      // Act
      final model = StockAlertModel.fromJson(validJson);

      // Assert
      expect(model.id, 'alert-001');
      expect(model.stockItemId, 'stock-001');
      expect(model.productName, 'Tomato Sauce');
      expect(model.type, 'lowStock');
      expect(model.severity, 'warning');
    });

    test('should parse all alert types correctly', () {
      // Arrange
      final types = [
        'outOfStock',
        'lowStock',
        'criticalStock',
        'nearExpiration',
        'expired',
      ];

      for (final type in types) {
        final json = {...validJson, 'type': type};

        // Act
        final model = StockAlertModel.fromJson(json);
        final entity = model.toEntity();

        // Assert
        expect(entity.type, isA<StockAlertType>());
      }
    });

    test('should parse all severity levels correctly', () {
      // Arrange
      final severities = ['info', 'warning', 'critical', 'urgent'];

      for (final severity in severities) {
        final json = {...validJson, 'severity': severity};

        // Act
        final model = StockAlertModel.fromJson(json);
        final entity = model.toEntity();

        // Assert
        expect(entity.severity, isA<StockAlertSeverity>());
      }
    });

    test('should convert to entity correctly', () {
      // Arrange
      final model = StockAlertModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity, isA<StockAlert>());
      expect(entity.id, model.id);
      expect(entity.productName, model.productName);
    });

    test('should convert from entity correctly', () {
      // Arrange
      final entity = StockAlert(
        id: 'alert-001',
        stockItemId: 'stock-001',
        productName: 'Tomato Sauce',
        type: StockAlertType.lowStock,
        severity: StockAlertSeverity.warning,
        createdAt: testDate,
        message: 'Stock is running low',
      );

      // Act
      final model = StockAlertModel.fromEntity(entity);

      // Assert
      expect(model.id, entity.id);
      expect(model.productName, entity.productName);
    });

    test('should serialize to JSON correctly', () {
      // Arrange
      final model = StockAlertModel.fromJson(validJson);

      // Act
      final json = model.toJson();

      // Assert
      expect(json['id'], 'alert-001');
      expect(json['type'], 'lowStock');
      expect(json['severity'], 'warning');
    });

    test('should handle resolved alerts', () {
      // Arrange
      final resolvedJson = {
        ...validJson,
        'isResolved': true,
        'resolvedAt': testDate.toIso8601String(),
      };

      // Act
      final model = StockAlertModel.fromJson(resolvedJson);
      final entity = model.toEntity();

      // Assert
      expect(entity.isResolved, true);
      expect(entity.resolvedAt, isNotNull);
    });
  });
}
