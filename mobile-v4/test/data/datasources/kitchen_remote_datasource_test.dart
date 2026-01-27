import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:awid_mobile/core/network/dio_client.dart';
import 'package:awid_mobile/features/kitchen/data/datasources/kitchen_remote_datasource.dart';
import 'package:awid_mobile/features/kitchen/data/models/kitchen_order_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/kitchen_stats_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/stock_item_model.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([DioClient])
import 'kitchen_remote_datasource_test.mocks.dart';

void main() {
  late KitchenRemoteDatasource datasource;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    datasource = KitchenRemoteDatasource(mockDioClient);
  });

  group('KitchenRemoteDatasource - Orders', () {
    test('getOrders should return list of orders', () async {
      // Arrange
      final responseData = {
        'data': [MockData.mockKitchenOrderJson],
      };
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getOrders();

      // Assert
      expect(result, isA<List<KitchenOrderModel>>());
      expect(result, isNotEmpty);
      verify(mockDioClient.get(
        '/kitchen/orders',
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });

    test('getOrders should include query parameters', () async {
      // Arrange
      final responseData = {'data': []};
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      await datasource.getOrders(
        status: KitchenOrderStatus.pending,
        priority: OrderPriority.high,
        stationId: 'station-001',
        date: MockData.testDate,
      );

      // Assert
      final captured = verify(mockDioClient.get(
        '/kitchen/orders',
        queryParameters: captureAnyNamed('queryParameters'),
      )).captured.first as Map<String, dynamic>;
      
      expect(captured['status'], 'pending');
      expect(captured['priority'], 'high');
      expect(captured['stationId'], 'station-001');
      expect(captured['date'], isNotNull);
    });

    test('getOrders should handle empty response', () async {
      // Arrange
      final responseData = {'data': []};
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getOrders();

      // Assert
      expect(result, isEmpty);
    });

    test('getOrders should throw on DioException', () async {
      // Arrange
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(errorResponse(statusCode: 500));

      // Act & Assert
      expect(
        () => datasource.getOrders(),
        throwsException,
      );
    });

    test('getOrderById should return single order', () async {
      // Arrange
      final responseData = {
        'data': MockData.mockKitchenOrderJson,
      };
      when(mockDioClient.get(any))
          .thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getOrderById(MockData.testOrderId);

      // Assert
      expect(result, isA<KitchenOrderModel>());
      expect(result.id, MockData.testOrderId);
      verify(mockDioClient.get('/kitchen/orders/${MockData.testOrderId}'))
          .called(1);
    });

    test('updateOrderStatus should return updated order', () async {
      // Arrange
      final responseData = {
        'data': MockData.mockKitchenOrderJson,
      };
      when(mockDioClient.patch(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.updateOrderStatus(
        orderId: MockData.testOrderId,
        status: KitchenOrderStatus.preparing,
        stationId: 'station-001',
        staffId: 'staff-001',
        notes: 'Started preparation',
      );

      // Assert
      expect(result, isA<KitchenOrderModel>());
      final captured = verify(mockDioClient.patch(
        '/kitchen/orders/${MockData.testOrderId}/status',
        data: captureAnyNamed('data'),
      )).captured.first as Map<String, dynamic>;
      
      expect(captured['status'], 'preparing');
      expect(captured['stationId'], 'station-001');
      expect(captured['staffId'], 'staff-001');
      expect(captured['notes'], 'Started preparation');
    });

    test('assignOrderToStation should return assigned order', () async {
      // Arrange
      final responseData = {
        'data': MockData.mockKitchenOrderJson,
      };
      when(mockDioClient.post(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.assignOrderToStation(
        orderId: MockData.testOrderId,
        stationId: 'station-001',
        staffId: 'staff-001',
      );

      // Assert
      expect(result, isA<KitchenOrderModel>());
      verify(mockDioClient.post(
        '/kitchen/orders/${MockData.testOrderId}/assign',
        data: anyNamed('data'),
      )).called(1);
    });

    test('updateOrderPriority should return updated order', () async {
      // Arrange
      final responseData = {
        'data': MockData.mockKitchenOrderJson,
      };
      when(mockDioClient.patch(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.updateOrderPriority(
        orderId: MockData.testOrderId,
        priority: OrderPriority.urgent,
      );

      // Assert
      expect(result, isA<KitchenOrderModel>());
      final captured = verify(mockDioClient.patch(
        '/kitchen/orders/${MockData.testOrderId}/priority',
        data: captureAnyNamed('data'),
      )).captured.first as Map<String, dynamic>;
      
      expect(captured['priority'], 'urgent');
    });

    test('markItemPrepared should return updated order', () async {
      // Arrange
      final responseData = {
        'data': MockData.mockKitchenOrderJson,
      };
      when(mockDioClient.post(any))
          .thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.markItemPrepared(
        orderId: MockData.testOrderId,
        itemId: 'item-001',
      );

      // Assert
      expect(result, isA<KitchenOrderModel>());
      verify(mockDioClient.post(
        '/kitchen/orders/${MockData.testOrderId}/items/item-001/prepared',
      )).called(1);
    });
  });

  group('KitchenRemoteDatasource - Stock', () {
    test('getStockItems should return list of items', () async {
      // Arrange
      final responseData = {
        'data': [MockData.mockStockItemJson],
      };
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getStockItems();

      // Assert
      expect(result, isA<List<StockItemModel>>());
      expect(result, isNotEmpty);
      verify(mockDioClient.get(
        '/kitchen/stock',
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });

    test('getStockItems should include filters', () async {
      // Arrange
      final responseData = {'data': []};
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      await datasource.getStockItems(
        category: 'vegetables',
        level: StockLevel.low,
      );

      // Assert
      final captured = verify(mockDioClient.get(
        '/kitchen/stock',
        queryParameters: captureAnyNamed('queryParameters'),
      )).captured.first as Map<String, dynamic>;
      
      expect(captured['category'], 'vegetables');
      expect(captured['level'], 'low');
    });

    test('getStockItemById should return single item', () async {
      // Arrange
      final responseData = {
        'data': MockData.mockStockItemJson,
      };
      when(mockDioClient.get(any))
          .thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getStockItemById(MockData.testProductId);

      // Assert
      expect(result, isA<StockItemModel>());
      expect(result.id, MockData.testProductId);
      verify(mockDioClient.get('/kitchen/stock/${MockData.testProductId}'))
          .called(1);
    });

    test('adjustStockQuantity should return updated item', () async {
      // Arrange
      final responseData = {
        'data': MockData.mockStockItemJson,
      };
      when(mockDioClient.post(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.adjustStockQuantity(
        itemId: MockData.testProductId,
        quantity: 10.0,
        type: StockMovementType.stockIn,
        reason: 'Restock',
        orderId: MockData.testOrderId,
      );

      // Assert
      expect(result, isA<StockItemModel>());
      final captured = verify(mockDioClient.post(
        '/kitchen/stock/${MockData.testProductId}/adjust',
        data: captureAnyNamed('data'),
      )).captured.first as Map<String, dynamic>;
      
      expect(captured['quantity'], 10.0);
      expect(captured['type'], 'stockIn');
      expect(captured['reason'], 'Restock');
      expect(captured['orderId'], MockData.testOrderId);
    });

    test('createStockItem should return created item', () async {
      // Arrange
      final itemData = {
        'productName': 'New Product',
        'currentQuantity': 50.0,
        'minQuantity': 10.0,
        'maxQuantity': 100.0,
        'unit': 'kg',
      };
      final responseData = {
        'data': MockData.mockStockItemJson,
      };
      when(mockDioClient.post(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.createStockItem(itemData);

      // Assert
      expect(result, isA<StockItemModel>());
      verify(mockDioClient.post(
        '/kitchen/stock',
        data: itemData,
      )).called(1);
    });

    test('updateStockItem should return updated item', () async {
      // Arrange
      final updateData = {'minQuantity': 15.0};
      final responseData = {
        'data': MockData.mockStockItemJson,
      };
      when(mockDioClient.patch(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.updateStockItem(
        itemId: MockData.testProductId,
        data: updateData,
      );

      // Assert
      expect(result, isA<StockItemModel>());
      verify(mockDioClient.patch(
        '/kitchen/stock/${MockData.testProductId}',
        data: updateData,
      )).called(1);
    });

    test('getStockAlerts should return list of alerts', () async {
      // Arrange
      final responseData = {
        'data': [
          {
            'id': 'alert-001',
            'itemId': MockData.testProductId,
            'type': 'low_stock',
            'message': 'Stock is low',
            'createdAt': MockData.testDate.toIso8601String(),
          },
        ],
      };
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getStockAlerts();

      // Assert
      expect(result, isNotEmpty);
      verify(mockDioClient.get(
        '/kitchen/stock/alerts',
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });

    test('resolveStockAlert should complete successfully', () async {
      // Arrange
      when(mockDioClient.post(any))
          .thenAnswer((_) async => successResponse({}));

      // Act
      await datasource.resolveStockAlert('alert-001');

      // Assert
      verify(mockDioClient.post('/kitchen/stock/alerts/alert-001/resolve'))
          .called(1);
    });
  });

  group('KitchenRemoteDatasource - Statistics', () {
    test('getStats should return statistics', () async {
      // Arrange
      final responseData = {
        'data': MockData.mockKitchenStatsJson,
      };
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getStats();

      // Assert
      expect(result, isA<KitchenStatsModel>());
      verify(mockDioClient.get(
        '/kitchen/stats',
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });

    test('getStats should include date parameter', () async {
      // Arrange
      final responseData = {
        'data': MockData.mockKitchenStatsJson,
      };
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      await datasource.getStats(date: MockData.testDate);

      // Assert
      final captured = verify(mockDioClient.get(
        '/kitchen/stats',
        queryParameters: captureAnyNamed('queryParameters'),
      )).captured.first as Map<String, dynamic>;
      
      expect(captured['date'], isNotNull);
    });

    test('getPeriodStats should return period statistics', () async {
      // Arrange
      final responseData = {
        'data': {
          'startDate': MockData.testDatePast.toIso8601String(),
          'endDate': MockData.testDate.toIso8601String(),
          'totalOrders': 500,
          'averagePreparationTime': 25.5,
        },
      };
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getPeriodStats(
        startDate: MockData.testDatePast,
        endDate: MockData.testDate,
      );

      // Assert
      expect(result, isA<PeriodStatsModel>());
      verify(mockDioClient.get(
        '/kitchen/stats/period',
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });

    test('getHourlyStats should return hourly statistics', () async {
      // Arrange
      final responseData = {
        'data': [
          {
            'hour': 12,
            'orders': 25,
            'averageTime': 20.5,
          },
        ],
      };
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getHourlyStats();

      // Assert
      expect(result, isNotEmpty);
      verify(mockDioClient.get(
        '/kitchen/stats/hourly',
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });
  });

  group('KitchenRemoteDatasource - Error Handling', () {
    test('should handle connection timeout', () async {
      // Arrange
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(timeoutError());

      // Act & Assert
      expect(
        () => datasource.getOrders(),
        throwsA(predicate((e) => e.toString().contains('Délai'))),
      );
    });

    test('should handle connection error', () async {
      // Arrange
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(connectionError());

      // Act & Assert
      expect(
        () => datasource.getOrders(),
        throwsA(predicate((e) => e.toString().contains('réseau'))),
      );
    });

    test('should handle 404 error', () async {
      // Arrange
      when(mockDioClient.get(any))
          .thenThrow(errorResponse(statusCode: 404));

      // Act & Assert
      expect(
        () => datasource.getOrderById(MockData.testOrderId),
        throwsException,
      );
    });

    test('should handle 500 error', () async {
      // Arrange
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(errorResponse(
        statusCode: 500,
        message: 'Internal Server Error',
      ));

      // Act & Assert
      expect(
        () => datasource.getOrders(),
        throwsException,
      );
    });

    test('should extract error message from response', () async {
      // Arrange
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(errorResponse(
        statusCode: 400,
        message: 'Invalid parameters',
        data: {'message': 'Custom error message'},
      ));

      // Act & Assert
      expect(
        () => datasource.getOrders(),
        throwsA(predicate((e) => e.toString().contains('Custom error message'))),
      );
    });
  });
}
