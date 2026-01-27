import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:awid_mobile/features/kitchen/data/repositories/kitchen_repository_impl.dart';
import 'package:awid_mobile/features/kitchen/data/datasources/kitchen_remote_datasource.dart';
import 'package:awid_mobile/features/kitchen/data/datasources/kitchen_local_datasource.dart';
import 'package:awid_mobile/features/kitchen/data/models/kitchen_order_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/stock_item_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/kitchen_stats_model.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([KitchenRemoteDatasource, KitchenLocalDatasource])
import 'kitchen_repository_impl_test.mocks.dart';

void main() {
  late KitchenRepositoryImpl repository;
  late MockKitchenRemoteDatasource mockRemoteDatasource;
  late MockKitchenLocalDatasource mockLocalDatasource;

  setUp(() {
    mockRemoteDatasource = MockKitchenRemoteDatasource();
    mockLocalDatasource = MockKitchenLocalDatasource();
    repository = KitchenRepositoryImpl(
      mockRemoteDatasource,
      mockLocalDatasource,
    );
  });

  group('KitchenRepositoryImpl - Orders', () {
    final testDate = DateTime(2026, 1, 27);
    final mockModel = KitchenOrderModel(
      id: 'order-123',
      orderNumber: 'ORD-001',
      customerName: 'John Doe',
      customerPhone: '+33612345678',
      items: [],
      totalAmount: 25.0,
      status: 'pending',
      priority: 'medium',
      createdAt: testDate.toIso8601String(),
    );

    test('should get orders from remote when cache is empty', () async {
      // Arrange
      when(mockLocalDatasource.getCachedOrders())
          .thenAnswer((_) async => null);
      when(mockRemoteDatasource.getOrders(
        status: null,
        priority: null,
        stationId: null,
        date: null,
      )).thenAnswer((_) async => [mockModel]);
      when(mockLocalDatasource.cacheOrders(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.getOrders();

      // Assert
      expect(result.length, 1);
      expect(result.first, isA<KitchenOrder>());
      verify(mockRemoteDatasource.getOrders(
        status: null,
        priority: null,
        stationId: null,
        date: null,
      )).called(1);
      verify(mockLocalDatasource.cacheOrders(any)).called(1);
    });

    test('should get orders from cache when available', () async {
      // Arrange
      when(mockLocalDatasource.getCachedOrders())
          .thenAnswer((_) async => [mockModel]);

      // Act
      final result = await repository.getOrders();

      // Assert
      expect(result.length, 1);
      verifyNever(mockRemoteDatasource.getOrders(
        status: any,
        priority: any,
        stationId: any,
        date: any,
      ));
    });

    test('should force refresh when forceRefresh is true', () async {
      // Arrange
      when(mockRemoteDatasource.getOrders(
        status: null,
        priority: null,
        stationId: null,
        date: null,
      )).thenAnswer((_) async => [mockModel]);
      when(mockLocalDatasource.cacheOrders(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.getOrders(forceRefresh: true);

      // Assert
      expect(result.length, 1);
      verify(mockRemoteDatasource.getOrders(
        status: null,
        priority: null,
        stationId: null,
        date: null,
      )).called(1);
      verifyNever(mockLocalDatasource.getCachedOrders());
    });

    test('should filter orders by status', () async {
      // Arrange
      when(mockLocalDatasource.getCachedOrders())
          .thenAnswer((_) async => [mockModel]);

      // Act
      final result = await repository.getOrders(
        status: KitchenOrderStatus.pending,
      );

      // Assert
      expect(result.isNotEmpty, true);
    });

    test('should fallback to cache on remote error', () async {
      // Arrange
      when(mockLocalDatasource.getCachedOrders())
          .thenAnswer((_) async => null);
      when(mockRemoteDatasource.getOrders(
        status: null,
        priority: null,
        stationId: null,
        date: null,
      )).thenThrow(Exception('Network error'));
      when(mockLocalDatasource.getCachedOrders())
          .thenAnswer((_) async => [mockModel]);

      // Act
      final result = await repository.getOrders();

      // Assert
      expect(result.length, 1);
    });

    test('should get order by ID from cache first', () async {
      // Arrange
      when(mockLocalDatasource.getCachedOrder('order-123'))
          .thenAnswer((_) async => mockModel);

      // Act
      final result = await repository.getOrderById('order-123');

      // Assert
      expect(result, isA<KitchenOrder>());
      expect(result.id, 'order-123');
      verifyNever(mockRemoteDatasource.getOrderById(any));
    });

    test('should get order by ID from remote when not cached', () async {
      // Arrange
      when(mockLocalDatasource.getCachedOrder('order-123'))
          .thenAnswer((_) async => null);
      when(mockRemoteDatasource.getOrderById('order-123'))
          .thenAnswer((_) async => mockModel);
      when(mockLocalDatasource.cacheOrder(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.getOrderById('order-123');

      // Assert
      expect(result.id, 'order-123');
      verify(mockRemoteDatasource.getOrderById('order-123')).called(1);
      verify(mockLocalDatasource.cacheOrder(any)).called(1);
    });

    test('should update order status', () async {
      // Arrange
      final updatedModel = mockModel.copyWith(status: 'preparing');
      when(mockRemoteDatasource.updateOrderStatus(
        orderId: 'order-123',
        status: KitchenOrderStatus.preparing,
        stationId: null,
        staffId: null,
        notes: null,
      )).thenAnswer((_) async => updatedModel);
      when(mockLocalDatasource.cacheOrder(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.updateOrderStatus(
        orderId: 'order-123',
        status: KitchenOrderStatus.preparing,
      );

      // Assert
      expect(result.status, KitchenOrderStatus.preparing);
      verify(mockLocalDatasource.cacheOrder(any)).called(1);
    });

    test('should assign order to station', () async {
      // Arrange
      when(mockRemoteDatasource.assignOrderToStation(
        orderId: 'order-123',
        stationId: 'station-001',
        staffId: null,
      )).thenAnswer((_) async => mockModel);
      when(mockLocalDatasource.cacheOrder(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.assignOrderToStation(
        orderId: 'order-123',
        stationId: 'station-001',
      );

      // Assert
      expect(result, isA<KitchenOrder>());
      verify(mockLocalDatasource.cacheOrder(any)).called(1);
    });

    test('should update order priority', () async {
      // Arrange
      when(mockRemoteDatasource.updateOrderPriority(
        orderId: 'order-123',
        priority: OrderPriority.high,
      )).thenAnswer((_) async => mockModel);
      when(mockLocalDatasource.cacheOrder(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.updateOrderPriority(
        orderId: 'order-123',
        priority: OrderPriority.high,
      );

      // Assert
      expect(result, isA<KitchenOrder>());
      verify(mockLocalDatasource.cacheOrder(any)).called(1);
    });
  });

  group('KitchenRepositoryImpl - Stock', () {
    final mockStockModel = StockItemModel(
      id: 'stock-001',
      productId: 'product-001',
      productName: 'Tomato Sauce',
      currentQuantity: 50.0,
      minimumQuantity: 20.0,
      maximumQuantity: 100.0,
      unit: 'kg',
    );

    test('should get stock items from remote when cache is empty', () async {
      // Arrange
      when(mockLocalDatasource.getCachedStockItems())
          .thenAnswer((_) async => null);
      when(mockRemoteDatasource.getStockItems(
        category: null,
        level: null,
      )).thenAnswer((_) async => [mockStockModel]);
      when(mockLocalDatasource.cacheStockItems(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.getStockItems();

      // Assert
      expect(result.length, 1);
      expect(result.first, isA<StockItem>());
      verify(mockRemoteDatasource.getStockItems(
        category: null,
        level: null,
      )).called(1);
    });

    test('should get stock items from cache when available', () async {
      // Arrange
      when(mockLocalDatasource.getCachedStockItems())
          .thenAnswer((_) async => [mockStockModel]);

      // Act
      final result = await repository.getStockItems();

      // Assert
      expect(result.length, 1);
      verifyNever(mockRemoteDatasource.getStockItems(
        category: any,
        level: any,
      ));
    });

    test('should get stock item by ID', () async {
      // Arrange
      when(mockLocalDatasource.getCachedStockItem('stock-001'))
          .thenAnswer((_) async => mockStockModel);

      // Act
      final result = await repository.getStockItemById('stock-001');

      // Assert
      expect(result.id, 'stock-001');
      verifyNever(mockRemoteDatasource.getStockItemById(any));
    });

    test('should adjust stock quantity', () async {
      // Arrange
      final updatedModel = mockStockModel.copyWith(currentQuantity: 60.0);
      when(mockRemoteDatasource.adjustStockQuantity(
        itemId: 'stock-001',
        quantity: 10.0,
        type: StockMovementType.stockIn,
        reason: 'Restock',
        orderId: null,
      )).thenAnswer((_) async => updatedModel);
      when(mockLocalDatasource.cacheStockItem(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.adjustStockQuantity(
        itemId: 'stock-001',
        quantity: 10.0,
        type: StockMovementType.stockIn,
        reason: 'Restock',
      );

      // Assert
      expect(result.currentQuantity, 60.0);
      verify(mockLocalDatasource.cacheStockItem(any)).called(1);
    });

    test('should create stock item', () async {
      // Arrange
      when(mockRemoteDatasource.createStockItem(any))
          .thenAnswer((_) async => mockStockModel);
      when(mockLocalDatasource.cacheStockItem(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.createStockItem(
        productId: 'product-001',
        productName: 'Tomato Sauce',
        currentQuantity: 50.0,
        minimumQuantity: 20.0,
        maximumQuantity: 100.0,
        unit: StockUnit.kg,
      );

      // Assert
      expect(result, isA<StockItem>());
      verify(mockRemoteDatasource.createStockItem(any)).called(1);
    });

    test('should update stock item', () async {
      // Arrange
      when(mockRemoteDatasource.updateStockItem(
        itemId: 'stock-001',
        data: any,
      )).thenAnswer((_) async => mockStockModel);
      when(mockLocalDatasource.cacheStockItem(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.updateStockItem(
        itemId: 'stock-001',
        minimumQuantity: 25.0,
      );

      // Assert
      expect(result, isA<StockItem>());
      verify(mockLocalDatasource.cacheStockItem(any)).called(1);
    });
  });

  group('KitchenRepositoryImpl - Stats', () {
    final testDate = DateTime(2026, 1, 27);
    final mockStatsModel = KitchenStatsModel(
      totalOrders: 150,
      pendingOrders: 12,
      preparingOrders: 8,
      readyOrders: 5,
      completedToday: 125,
      averagePreparationTime: 25.5,
      onTimePercentage: 92.5,
      date: testDate.toIso8601String(),
    );

    test('should get stats from remote when cache is empty', () async {
      // Arrange
      when(mockLocalDatasource.getCachedStats(any))
          .thenAnswer((_) async => null);
      when(mockRemoteDatasource.getStats(date: any))
          .thenAnswer((_) async => mockStatsModel);
      when(mockLocalDatasource.cacheStats(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.getStats();

      // Assert
      expect(result.totalOrders, 150);
      verify(mockRemoteDatasource.getStats(date: any)).called(1);
      verify(mockLocalDatasource.cacheStats(any)).called(1);
    });

    test('should get stats from cache when available', () async {
      // Arrange
      when(mockLocalDatasource.getCachedStats(any))
          .thenAnswer((_) async => mockStatsModel);

      // Act
      final result = await repository.getStats();

      // Assert
      expect(result.totalOrders, 150);
      verifyNever(mockRemoteDatasource.getStats(date: any));
    });

    test('should force refresh stats', () async {
      // Arrange
      when(mockRemoteDatasource.getStats(date: any))
          .thenAnswer((_) async => mockStatsModel);
      when(mockLocalDatasource.cacheStats(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.getStats(forceRefresh: true);

      // Assert
      expect(result.totalOrders, 150);
      verify(mockRemoteDatasource.getStats(date: any)).called(1);
      verifyNever(mockLocalDatasource.getCachedStats(any));
    });
  });
}
