import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';
import '../../helpers/mock_data.dart';

void main() {
  group('StockItem Entity', () {
    late StockItem item;

    setUp(() {
      item = MockData.mockStockItem;
    });

    test('should create valid StockItem', () {
      expect(item.id, MockData.testProductId);
      expect(item.productName, 'Tomato Sauce');
      expect(item.currentQuantity, 50.0);
      expect(item.minQuantity, 20.0);
      expect(item.maxQuantity, 100.0);
      expect(item.unit, 'kg');
      expect(item.lastRestocked, isNotNull);
      expect(item.expiryDate, isNotNull);
    });

    test('should calculate stock level percentage', () {
      final percentage = item.stockLevelPercentage;
      expect(percentage, (item.currentQuantity / item.maxQuantity) * 100);
      expect(percentage, 50.0);
    });

    test('should check if stock is low', () {
      final lowStock = item.copyWith(currentQuantity: 15.0);
      final normalStock = item.copyWith(currentQuantity: 50.0);

      expect(lowStock.isLow, true);
      expect(normalStock.isLow, false);
    });

    test('should check if stock is critical', () {
      final criticalStock = item.copyWith(currentQuantity: 5.0);
      final normalStock = item.copyWith(currentQuantity: 50.0);

      expect(criticalStock.isCritical, true);
      expect(normalStock.isCritical, false);
    });

    test('should check if stock is out', () {
      final outOfStock = item.copyWith(currentQuantity: 0.0);
      final inStock = item.copyWith(currentQuantity: 50.0);

      expect(outOfStock.isOut, true);
      expect(inStock.isOut, false);
    });

    test('should check if stock is full', () {
      final fullStock = item.copyWith(currentQuantity: 100.0);
      final partialStock = item.copyWith(currentQuantity: 50.0);

      expect(fullStock.isFull, true);
      expect(partialStock.isFull, false);
    });

    test('should check if item is expired', () {
      final expiredItem = item.copyWith(
        expiryDate: DateTime.now().subtract(const Duration(days: 1)),
      );
      final validItem = item.copyWith(
        expiryDate: DateTime.now().add(const Duration(days: 30)),
      );

      expect(expiredItem.isExpired, true);
      expect(validItem.isExpired, false);
    });

    test('should check if item is expiring soon', () {
      final expiringSoon = item.copyWith(
        expiryDate: DateTime.now().add(const Duration(days: 5)),
      );
      final notExpiringSoon = item.copyWith(
        expiryDate: DateTime.now().add(const Duration(days: 30)),
      );

      expect(expiringSoon.isExpiringSoon, true);
      expect(notExpiringSoon.isExpiringSoon, false);
    });

    test('should calculate days until expiry', () {
      final futureExpiry = item.copyWith(
        expiryDate: DateTime.now().add(const Duration(days: 10)),
      );

      expect(futureExpiry.daysUntilExpiry, greaterThanOrEqualTo(9));
      expect(futureExpiry.daysUntilExpiry, lessThanOrEqualTo(10));
    });

    test('should calculate quantity needed to restock', () {
      final lowStock = item.copyWith(currentQuantity: 30.0);
      final quantityNeeded = lowStock.quantityNeededToRestock;

      expect(quantityNeeded, lowStock.maxQuantity - lowStock.currentQuantity);
      expect(quantityNeeded, 70.0);
    });

    test('should calculate days since last restock', () {
      final recentRestock = item.copyWith(
        lastRestocked: DateTime.now().subtract(const Duration(days: 5)),
      );

      expect(recentRestock.daysSinceRestock, greaterThanOrEqualTo(4));
      expect(recentRestock.daysSinceRestock, lessThanOrEqualTo(5));
    });

    test('should validate quantity constraints', () {
      expect(item.currentQuantity, greaterThanOrEqualTo(0));
      expect(item.minQuantity, greaterThanOrEqualTo(0));
      expect(item.maxQuantity, greaterThan(item.minQuantity));
      expect(item.currentQuantity, lessThanOrEqualTo(item.maxQuantity));
    });

    test('should copy with new values', () {
      final updated = item.copyWith(
        currentQuantity: 75.0,
        lastRestocked: DateTime.now(),
      );

      expect(updated.id, item.id);
      expect(updated.currentQuantity, 75.0);
      expect(updated.productName, item.productName);
    });

    test('should compare items by equality', () {
      final sameItem = item.copyWith();
      final differentItem = item.copyWith(id: 'different-id');

      expect(item == sameItem, true);
      expect(item == differentItem, false);
    });

    test('should have valid unit', () {
      expect(item.unit, isNotEmpty);
      expect(item.unit, isA<String>());
    });

    test('should format quantity with unit', () {
      final formatted = '${item.currentQuantity} ${item.unit}';
      expect(formatted, '50.0 kg');
    });

    test('should calculate stock status', () {
      final status = item.getStockStatus();
      
      if (item.isOut) {
        expect(status, 'out');
      } else if (item.isCritical) {
        expect(status, 'critical');
      } else if (item.isLow) {
        expect(status, 'low');
      } else if (item.isFull) {
        expect(status, 'full');
      } else {
        expect(status, 'normal');
      }
    });

    test('should handle item without expiry date', () {
      final noExpiry = item.copyWith(expiryDate: null);
      
      expect(noExpiry.isExpired, false);
      expect(noExpiry.isExpiringSoon, false);
      expect(noExpiry.daysUntilExpiry, isNull);
    });

    test('should calculate restock urgency', () {
      final urgentRestock = item.copyWith(currentQuantity: 5.0);
      final normalRestock = item.copyWith(currentQuantity: 50.0);

      expect(urgentRestock.restockUrgency, greaterThan(normalRestock.restockUrgency));
    });

    test('should validate product name', () {
      expect(item.productName, isNotEmpty);
      expect(item.productName, isA<String>());
    });

    test('should handle decimal quantities', () {
      final decimalItem = item.copyWith(currentQuantity: 25.5);
      expect(decimalItem.currentQuantity, 25.5);
      expect(decimalItem.currentQuantity, isA<double>());
    });

    test('should calculate consumption rate', () {
      final daysSinceRestock = item.daysSinceRestock;
      final consumed = item.maxQuantity - item.currentQuantity;
      final consumptionRate = consumed / daysSinceRestock;

      expect(consumptionRate, greaterThanOrEqualTo(0));
    });

    test('should estimate days until out of stock', () {
      final daysSinceRestock = item.daysSinceRestock;
      final consumed = item.maxQuantity - item.currentQuantity;
      final consumptionRate = consumed / daysSinceRestock;
      
      if (consumptionRate > 0) {
        final daysUntilOut = item.currentQuantity / consumptionRate;
        expect(daysUntilOut, greaterThanOrEqualTo(0));
      }
    });
  });

  group('StockItem Alerts', () {
    test('should generate low stock alert', () {
      final lowStock = MockData.mockStockItem.copyWith(currentQuantity: 15.0);
      
      if (lowStock.isLow) {
        final alert = 'Low stock: ${lowStock.productName} (${lowStock.currentQuantity} ${lowStock.unit})';
        expect(alert, contains('Low stock'));
        expect(alert, contains(lowStock.productName));
      }
    });

    test('should generate critical stock alert', () {
      final criticalStock = MockData.mockStockItem.copyWith(currentQuantity: 5.0);
      
      if (criticalStock.isCritical) {
        final alert = 'CRITICAL: ${criticalStock.productName} (${criticalStock.currentQuantity} ${criticalStock.unit})';
        expect(alert, contains('CRITICAL'));
      }
    });

    test('should generate expiry alert', () {
      final expiringSoon = MockData.mockStockItem.copyWith(
        expiryDate: DateTime.now().add(const Duration(days: 3)),
      );
      
      if (expiringSoon.isExpiringSoon) {
        final alert = 'Expiring soon: ${expiringSoon.productName} (${expiringSoon.daysUntilExpiry} days)';
        expect(alert, contains('Expiring soon'));
      }
    });
  });

  group('StockItem Edge Cases', () {
    test('should handle zero quantity', () {
      final zeroStock = MockData.mockStockItem.copyWith(currentQuantity: 0.0);
      
      expect(zeroStock.isOut, true);
      expect(zeroStock.stockLevelPercentage, 0.0);
    });

    test('should handle max quantity', () {
      final maxStock = MockData.mockStockItem.copyWith(currentQuantity: 100.0);
      
      expect(maxStock.isFull, true);
      expect(maxStock.stockLevelPercentage, 100.0);
      expect(maxStock.quantityNeededToRestock, 0.0);
    });

    test('should handle very old restock date', () {
      final oldRestock = MockData.mockStockItem.copyWith(
        lastRestocked: DateTime.now().subtract(const Duration(days: 365)),
      );
      
      expect(oldRestock.daysSinceRestock, greaterThan(360));
    });

    test('should handle expired item', () {
      final expired = MockData.mockStockItem.copyWith(
        expiryDate: DateTime.now().subtract(const Duration(days: 10)),
      );
      
      expect(expired.isExpired, true);
      expect(expired.daysUntilExpiry, lessThan(0));
    });

    test('should handle different units', () {
      final units = ['kg', 'L', 'units', 'boxes', 'g', 'ml'];
      
      for (final unit in units) {
        final itemWithUnit = MockData.mockStockItem.copyWith(unit: unit);
        expect(itemWithUnit.unit, unit);
      }
    });
  });
}
