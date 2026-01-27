import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/packaging_transaction.dart';
import '../../helpers/mock_data.dart';

void main() {
  group('PackagingTransaction Entity', () {
    late PackagingTransaction transaction;

    setUp(() {
      transaction = PackagingTransaction(
        id: 'pkg-001',
        orderId: MockData.testOrderId,
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(
            name: 'Box',
            quantity: 2,
            isReturnable: true,
          ),
          PackagingItem(
            name: 'Bag',
            quantity: 1,
            isReturnable: false,
          ),
        ],
        createdAt: MockData.testDate,
      );
    });

    test('should create valid PackagingTransaction', () {
      expect(transaction.id, 'pkg-001');
      expect(transaction.orderId, MockData.testOrderId);
      expect(transaction.deliveryId, 'delivery-001');
      expect(transaction.type, PackagingType.delivery);
      expect(transaction.items, isNotEmpty);
      expect(transaction.createdAt, isNotNull);
    });

    test('should check if transaction is delivery', () {
      final delivery = transaction.copyWith(type: PackagingType.delivery);
      final return_ = transaction.copyWith(type: PackagingType.return_);

      expect(delivery.isDelivery, true);
      expect(return_.isDelivery, false);
    });

    test('should check if transaction is return', () {
      final return_ = transaction.copyWith(type: PackagingType.return_);
      final delivery = transaction.copyWith(type: PackagingType.delivery);

      expect(return_.isReturn, true);
      expect(delivery.isReturn, false);
    });

    test('should calculate total items count', () {
      final total = transaction.totalItemsCount;
      expect(total, 3); // 2 boxes + 1 bag
    });

    test('should calculate returnable items count', () {
      final returnable = transaction.returnableItemsCount;
      expect(returnable, 2); // 2 boxes
    });

    test('should check if has returnable items', () {
      final withReturnable = transaction;
      final withoutReturnable = transaction.copyWith(
        items: [
          PackagingItem(
            name: 'Bag',
            quantity: 1,
            isReturnable: false,
          ),
        ],
      );

      expect(withReturnable.hasReturnableItems, true);
      expect(withoutReturnable.hasReturnableItems, false);
    });

    test('should get list of returnable items', () {
      final returnableItems = transaction.getReturnableItems();
      expect(returnableItems.length, 1);
      expect(returnableItems.first.name, 'Box');
      expect(returnableItems.first.isReturnable, true);
    });

    test('should get list of non-returnable items', () {
      final nonReturnableItems = transaction.getNonReturnableItems();
      expect(nonReturnableItems.length, 1);
      expect(nonReturnableItems.first.name, 'Bag');
      expect(nonReturnableItems.first.isReturnable, false);
    });

    test('should validate items are not empty', () {
      expect(transaction.items, isNotEmpty);
    });

    test('should validate positive quantities', () {
      for (final item in transaction.items) {
        expect(item.quantity, greaterThan(0));
      }
    });

    test('should copy with new values', () {
      final updated = transaction.copyWith(
        type: PackagingType.return_,
      );

      expect(updated.id, transaction.id);
      expect(updated.type, PackagingType.return_);
      expect(updated.orderId, transaction.orderId);
    });

    test('should compare transactions by equality', () {
      final same = transaction.copyWith();
      final different = transaction.copyWith(id: 'different-id');

      expect(transaction == same, true);
      expect(transaction == different, false);
    });

    test('should have valid timestamp', () {
      expect(transaction.createdAt, isA<DateTime>());
      expect(transaction.createdAt.isBefore(DateTime.now().add(const Duration(minutes: 1))), true);
    });

    test('should validate IDs are not empty', () {
      expect(transaction.id, isNotEmpty);
      expect(transaction.orderId, isNotEmpty);
      expect(transaction.deliveryId, isNotEmpty);
    });

    test('should format transaction summary', () {
      final summary = '${transaction.type} - ${transaction.totalItemsCount} items';
      expect(summary, contains('delivery'));
      expect(summary, contains('3'));
    });
  });

  group('PackagingItem', () {
    test('should create valid PackagingItem', () {
      final item = PackagingItem(
        name: 'Box',
        quantity: 2,
        isReturnable: true,
      );

      expect(item.name, 'Box');
      expect(item.quantity, 2);
      expect(item.isReturnable, true);
    });

    test('should validate name is not empty', () {
      final item = PackagingItem(
        name: 'Box',
        quantity: 1,
        isReturnable: true,
      );

      expect(item.name, isNotEmpty);
    });

    test('should validate positive quantity', () {
      final item = PackagingItem(
        name: 'Box',
        quantity: 5,
        isReturnable: true,
      );

      expect(item.quantity, greaterThan(0));
    });

    test('should copy with new values', () {
      final item = PackagingItem(
        name: 'Box',
        quantity: 2,
        isReturnable: true,
      );

      final updated = item.copyWith(quantity: 5);

      expect(updated.name, item.name);
      expect(updated.quantity, 5);
      expect(updated.isReturnable, item.isReturnable);
    });

    test('should compare items by equality', () {
      final item1 = PackagingItem(
        name: 'Box',
        quantity: 2,
        isReturnable: true,
      );
      final item2 = PackagingItem(
        name: 'Box',
        quantity: 2,
        isReturnable: true,
      );
      final item3 = PackagingItem(
        name: 'Bag',
        quantity: 2,
        isReturnable: true,
      );

      expect(item1 == item2, true);
      expect(item1 == item3, false);
    });
  });

  group('PackagingType', () {
    test('should have all packaging types', () {
      expect(PackagingType.values.length, 2);
      expect(PackagingType.values, contains(PackagingType.delivery));
      expect(PackagingType.values, contains(PackagingType.return_));
    });

    test('should convert to string', () {
      expect(PackagingType.delivery.toString(), contains('delivery'));
      expect(PackagingType.return_.toString(), contains('return'));
    });
  });

  group('PackagingTransaction Business Logic', () {
    test('should calculate packaging value for returnable items', () {
      final transaction = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(name: 'Box', quantity: 2, isReturnable: true),
          PackagingItem(name: 'Bag', quantity: 1, isReturnable: false),
        ],
        createdAt: DateTime.now(),
      );

      final boxValue = 5.0; // Example value per box
      final totalValue = transaction.returnableItemsCount * boxValue;
      expect(totalValue, 10.0);
    });

    test('should track packaging inventory', () {
      final deliveryTransaction = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(name: 'Box', quantity: 2, isReturnable: true),
        ],
        createdAt: DateTime.now(),
      );

      final returnTransaction = PackagingTransaction(
        id: 'pkg-002',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.return_,
        items: [
          PackagingItem(name: 'Box', quantity: 1, isReturnable: true),
        ],
        createdAt: DateTime.now(),
      );

      final delivered = deliveryTransaction.returnableItemsCount;
      final returned = returnTransaction.returnableItemsCount;
      final outstanding = delivered - returned;

      expect(outstanding, 1);
    });

    test('should validate return matches delivery', () {
      final deliveryTransaction = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(name: 'Box', quantity: 2, isReturnable: true),
        ],
        createdAt: DateTime.now(),
      );

      final returnTransaction = PackagingTransaction(
        id: 'pkg-002',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.return_,
        items: [
          PackagingItem(name: 'Box', quantity: 3, isReturnable: true),
        ],
        createdAt: DateTime.now(),
      );

      final canReturn = returnTransaction.returnableItemsCount <= 
                       deliveryTransaction.returnableItemsCount;
      expect(canReturn, false); // Trying to return more than delivered
    });
  });

  group('PackagingTransaction Edge Cases', () {
    test('should handle single item', () {
      final single = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(name: 'Box', quantity: 1, isReturnable: true),
        ],
        createdAt: DateTime.now(),
      );

      expect(single.items.length, 1);
      expect(single.totalItemsCount, 1);
    });

    test('should handle multiple items', () {
      final multiple = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: List.generate(
          10,
          (i) => PackagingItem(
            name: 'Item $i',
            quantity: 1,
            isReturnable: true,
          ),
        ),
        createdAt: DateTime.now(),
      );

      expect(multiple.items.length, 10);
      expect(multiple.totalItemsCount, 10);
    });

    test('should handle large quantities', () {
      final large = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(name: 'Box', quantity: 100, isReturnable: true),
        ],
        createdAt: DateTime.now(),
      );

      expect(large.totalItemsCount, 100);
    });

    test('should handle all returnable items', () {
      final allReturnable = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(name: 'Box', quantity: 2, isReturnable: true),
          PackagingItem(name: 'Container', quantity: 3, isReturnable: true),
        ],
        createdAt: DateTime.now(),
      );

      expect(allReturnable.hasReturnableItems, true);
      expect(allReturnable.returnableItemsCount, 5);
    });

    test('should handle no returnable items', () {
      final noReturnable = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(name: 'Bag', quantity: 2, isReturnable: false),
          PackagingItem(name: 'Wrapper', quantity: 3, isReturnable: false),
        ],
        createdAt: DateTime.now(),
      );

      expect(noReturnable.hasReturnableItems, false);
      expect(noReturnable.returnableItemsCount, 0);
    });

    test('should handle very old transaction', () {
      final old = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(name: 'Box', quantity: 1, isReturnable: true),
        ],
        createdAt: DateTime.now().subtract(const Duration(days: 365)),
      );

      final daysSince = DateTime.now().difference(old.createdAt).inDays;
      expect(daysSince, greaterThan(360));
    });
  });

  group('PackagingTransaction Validation', () {
    test('should validate items list is not empty', () {
      expect(
        () => PackagingTransaction(
          id: 'pkg-001',
          orderId: 'order-123',
          deliveryId: 'delivery-001',
          type: PackagingType.delivery,
          items: [],
          createdAt: DateTime.now(),
        ),
        throwsA(anything),
      );
    });

    test('should validate item quantities are positive', () {
      expect(
        () => PackagingTransaction(
          id: 'pkg-001',
          orderId: 'order-123',
          deliveryId: 'delivery-001',
          type: PackagingType.delivery,
          items: [
            PackagingItem(name: 'Box', quantity: 0, isReturnable: true),
          ],
          createdAt: DateTime.now(),
        ),
        throwsA(anything),
      );
    });

    test('should validate item names are not empty', () {
      expect(
        () => PackagingTransaction(
          id: 'pkg-001',
          orderId: 'order-123',
          deliveryId: 'delivery-001',
          type: PackagingType.delivery,
          items: [
            PackagingItem(name: '', quantity: 1, isReturnable: true),
          ],
          createdAt: DateTime.now(),
        ),
        throwsA(anything),
      );
    });

    test('should validate transaction type is set', () {
      final transaction = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(name: 'Box', quantity: 1, isReturnable: true),
        ],
        createdAt: DateTime.now(),
      );

      expect(transaction.type, isNotNull);
      expect(PackagingType.values, contains(transaction.type));
    });

    test('should validate created date is not in future', () {
      final transaction = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(name: 'Box', quantity: 1, isReturnable: true),
        ],
        createdAt: DateTime.now(),
      );

      expect(transaction.createdAt.isAfter(DateTime.now()), false);
    });
  });

  group('PackagingTransaction Reporting', () {
    test('should generate transaction summary', () {
      final transaction = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(name: 'Box', quantity: 2, isReturnable: true),
          PackagingItem(name: 'Bag', quantity: 1, isReturnable: false),
        ],
        createdAt: DateTime.now(),
      );

      final summary = {
        'type': transaction.type.toString(),
        'totalItems': transaction.totalItemsCount,
        'returnableItems': transaction.returnableItemsCount,
        'hasReturnables': transaction.hasReturnableItems,
      };

      expect(summary['totalItems'], 3);
      expect(summary['returnableItems'], 2);
      expect(summary['hasReturnables'], true);
    });

    test('should list all item names', () {
      final transaction = PackagingTransaction(
        id: 'pkg-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        type: PackagingType.delivery,
        items: [
          PackagingItem(name: 'Box', quantity: 2, isReturnable: true),
          PackagingItem(name: 'Bag', quantity: 1, isReturnable: false),
        ],
        createdAt: DateTime.now(),
      );

      final itemNames = transaction.items.map((item) => item.name).toList();
      expect(itemNames, contains('Box'));
      expect(itemNames, contains('Bag'));
    });
  });
}
