import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:awid_mobile/core/network/dio_client.dart';
import 'package:awid_mobile/features/customer/data/datasources/customer_remote_datasource.dart';
import 'package:awid_mobile/features/customer/data/models/customer_order_model.dart';
import 'package:awid_mobile/features/customer/data/models/customer_delivery_model.dart';
import 'package:awid_mobile/features/customer/data/models/customer_account_model.dart';
import 'package:awid_mobile/features/customer/data/models/customer_notification_model.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_order.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_notification.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([DioClient])
import 'customer_remote_datasource_test.mocks.dart';

void main() {
  late CustomerRemoteDatasource datasource;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    datasource = CustomerRemoteDatasource(mockDioClient);
  });

  group('CustomerRemoteDatasource - Orders', () {
    test('getOrders should return list of orders', () async {
      // Arrange
      final responseData = {
        'data': [MockData.mockCustomerOrderJson],
      };
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getOrders(
        customerId: MockData.testCustomerId,
      );

      // Assert
      expect(result, isA<List<CustomerOrderModel>>());
      expect(result, isNotEmpty);
      verify(mockDioClient.get(
        '/customer/orders',
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });

    test('getOrders should include all query parameters', () async {
      // Arrange
      final responseData = {'data': []};
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      await datasource.getOrders(
        customerId: MockData.testCustomerId,
        status: OrderStatus.pending,
        startDate: MockData.testDatePast,
        endDate: MockData.testDate,
        searchQuery: 'pizza',
        limit: 20,
        offset: 0,
      );

      // Assert
      final captured = verify(mockDioClient.get(
        '/customer/orders',
        queryParameters: captureAnyNamed('queryParameters'),
      )).captured.first as Map<String, dynamic>;
      
      expect(captured['customer_id'], MockData.testCustomerId);
      expect(captured['status'], 'pending');
      expect(captured['start_date'], isNotNull);
      expect(captured['end_date'], isNotNull);
      expect(captured['search'], 'pizza');
      expect(captured['limit'], 20);
      expect(captured['offset'], 0);
    });

    test('getOrders should handle empty response', () async {
      // Arrange
      final responseData = {'data': []};
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getOrders(
        customerId: MockData.testCustomerId,
      );

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
        () => datasource.getOrders(customerId: MockData.testCustomerId),
        throwsException,
      );
    });

    test('getOrder should return single order', () async {
      // Arrange
      final responseData = {
        'data': MockData.mockCustomerOrderJson,
      };
      when(mockDioClient.get(any))
          .thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getOrder(MockData.testOrderId);

      // Assert
      expect(result, isA<CustomerOrderModel>());
      expect(result!.id, MockData.testOrderId);
      verify(mockDioClient.get('/customer/orders/${MockData.testOrderId}'))
          .called(1);
    });

    test('getOrder should return null on 404', () async {
      // Arrange
      when(mockDioClient.get(any))
          .thenThrow(errorResponse(statusCode: 404));

      // Act
      final result = await datasource.getOrder(MockData.testOrderId);

      // Assert
      expect(result, isNull);
    });

    test('getOrder should return null when data is null', () async {
      // Arrange
      final responseData = {'data': null};
      when(mockDioClient.get(any))
          .thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getOrder(MockData.testOrderId);

      // Assert
      expect(result, isNull);
    });

    test('searchOrders should return search results', () async {
      // Arrange
      final responseData = {
        'data': [MockData.mockCustomerOrderJson],
      };
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.searchOrders(
        MockData.testCustomerId,
        'pizza',
      );

      // Assert
      expect(result, isNotEmpty);
      final captured = verify(mockDioClient.get(
        '/customer/orders/search',
        queryParameters: captureAnyNamed('queryParameters'),
      )).captured.first as Map<String, dynamic>;
      
      expect(captured['customer_id'], MockData.testCustomerId);
      expect(captured['q'], 'pizza');
    });
  });

  group('CustomerRemoteDatasource - Deliveries', () {
    test('getDelivery should return single delivery', () async {
      // Arrange
      final deliveryJson = {
        'id': 'delivery-001',
        'orderId': MockData.testOrderId,
        'status': 'in_progress',
        'estimatedArrival': MockData.testDateFuture.toIso8601String(),
        'delivererName': 'John Deliverer',
        'delivererPhone': '+33612345678',
      };
      final responseData = {'data': deliveryJson};
      when(mockDioClient.get(any))
          .thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getDelivery('delivery-001');

      // Assert
      expect(result, isA<CustomerDeliveryModel>());
      expect(result!.id, 'delivery-001');
      verify(mockDioClient.get('/customer/deliveries/delivery-001')).called(1);
    });

    test('getDelivery should return null on 404', () async {
      // Arrange
      when(mockDioClient.get(any))
          .thenThrow(errorResponse(statusCode: 404));

      // Act
      final result = await datasource.getDelivery('delivery-001');

      // Assert
      expect(result, isNull);
    });

    test('getActiveDeliveries should return list of deliveries', () async {
      // Arrange
      final deliveryJson = {
        'id': 'delivery-001',
        'orderId': MockData.testOrderId,
        'status': 'in_progress',
        'estimatedArrival': MockData.testDateFuture.toIso8601String(),
        'delivererName': 'John Deliverer',
        'delivererPhone': '+33612345678',
      };
      final responseData = {'data': [deliveryJson]};
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getActiveDeliveries(MockData.testCustomerId);

      // Assert
      expect(result, isNotEmpty);
      verify(mockDioClient.get(
        '/customer/deliveries/active',
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });

    test('getDeliveriesHistory should include query parameters', () async {
      // Arrange
      final responseData = {'data': []};
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      await datasource.getDeliveriesHistory(
        customerId: MockData.testCustomerId,
        startDate: MockData.testDatePast,
        endDate: MockData.testDate,
        limit: 50,
      );

      // Assert
      final captured = verify(mockDioClient.get(
        '/customer/deliveries/history',
        queryParameters: captureAnyNamed('queryParameters'),
      )).captured.first as Map<String, dynamic>;
      
      expect(captured['customer_id'], MockData.testCustomerId);
      expect(captured['start_date'], isNotNull);
      expect(captured['end_date'], isNotNull);
      expect(captured['limit'], 50);
    });
  });

  group('CustomerRemoteDatasource - Account', () {
    test('getAccountInfo should return account', () async {
      // Arrange
      final responseData = {
        'data': MockData.mockCustomerAccountJson,
      };
      when(mockDioClient.get(any))
          .thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getAccountInfo(MockData.testCustomerId);

      // Assert
      expect(result, isA<CustomerAccountModel>());
      expect(result!.id, MockData.testCustomerId);
      verify(mockDioClient.get('/customer/account/${MockData.testCustomerId}'))
          .called(1);
    });

    test('getAccountInfo should return null on 404', () async {
      // Arrange
      when(mockDioClient.get(any))
          .thenThrow(errorResponse(statusCode: 404));

      // Act
      final result = await datasource.getAccountInfo(MockData.testCustomerId);

      // Assert
      expect(result, isNull);
    });

    test('getCreditInfo should return credit info', () async {
      // Arrange
      final creditInfoJson = {
        'creditLimit': 1000.0,
        'currentCredit': 250.0,
        'availableCredit': 750.0,
      };
      final responseData = {'data': creditInfoJson};
      when(mockDioClient.get(any))
          .thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getCreditInfo(MockData.testCustomerId);

      // Assert
      expect(result, isA<CustomerCreditInfoModel>());
      verify(mockDioClient.get('/customer/account/${MockData.testCustomerId}/credit'))
          .called(1);
    });

    test('getPackagingInfo should return packaging info', () async {
      // Arrange
      final packagingInfoJson = {
        'totalDeposit': 50.0,
        'items': [],
      };
      final responseData = {'data': packagingInfoJson};
      when(mockDioClient.get(any))
          .thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getPackagingInfo(MockData.testCustomerId);

      // Assert
      expect(result, isA<CustomerPackagingInfoModel>());
      verify(mockDioClient.get('/customer/account/${MockData.testCustomerId}/packaging'))
          .called(1);
    });

    test('updateSettings should send PUT request', () async {
      // Arrange
      final settings = CustomerSettingsModel(
        preferredLanguage: 'fr',
        emailNotifications: true,
        smsNotifications: false,
        pushNotifications: true,
      );
      when(mockDioClient.put(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => successResponse({}));

      // Act
      await datasource.updateSettings(MockData.testCustomerId, settings);

      // Assert
      verify(mockDioClient.put(
        '/customer/account/${MockData.testCustomerId}/settings',
        data: anyNamed('data'),
      )).called(1);
    });

    test('updateContact should send PUT request', () async {
      // Arrange
      final contact = CustomerContactModel(
        id: 'contact-1',
        name: 'Jane Doe',
        phone: '+33612345679',
        email: 'jane@example.com',
        role: 'Manager',
      );
      when(mockDioClient.put(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => successResponse({}));

      // Act
      await datasource.updateContact(
        MockData.testCustomerId,
        'contact-123',
        contact,
      );

      // Assert
      verify(mockDioClient.put(
        '/customer/account/${MockData.testCustomerId}/contacts/contact-123',
        data: anyNamed('data'),
      )).called(1);
    });

    test('addContact should return contact ID', () async {
      // Arrange
      final contact = CustomerContactModel(
        id: 'contact-1',
        name: 'Jane Doe',
        phone: '+33612345679',
        email: 'jane@example.com',
        role: 'Manager',
      );
      final responseData = {
        'data': {'id': 'contact-123'},
      };
      when(mockDioClient.post(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.addContact(
        MockData.testCustomerId,
        contact,
      );

      // Assert
      expect(result, 'contact-123');
      verify(mockDioClient.post(
        '/customer/account/${MockData.testCustomerId}/contacts',
        data: anyNamed('data'),
      )).called(1);
    });

    test('deleteContact should send DELETE request', () async {
      // Arrange
      when(mockDioClient.delete(any))
          .thenAnswer((_) async => successResponse({}));

      // Act
      await datasource.deleteContact(MockData.testCustomerId, 'contact-123');

      // Assert
      verify(mockDioClient.delete(
        '/customer/account/${MockData.testCustomerId}/contacts/contact-123',
      )).called(1);
    });
  });

  group('CustomerRemoteDatasource - Notifications', () {
    test('getNotifications should return list of notifications', () async {
      // Arrange
      final notificationJson = {
        'id': 'notif-001',
        'customerId': MockData.testCustomerId,
        'type': 'order_update',
        'title': 'Order Update',
        'message': 'Your order is ready',
        'isRead': false,
        'priority': 'high',
        'createdAt': MockData.testDate.toIso8601String(),
        'data': {},
      };
      final responseData = {'data': [notificationJson]};
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getNotifications(
        customerId: MockData.testCustomerId,
      );

      // Assert
      expect(result, isA<List<CustomerNotificationModel>>());
      expect(result, isNotEmpty);
      verify(mockDioClient.get(
        '/customer/notifications',
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });

    test('getNotifications should include all filters', () async {
      // Arrange
      final responseData = {'data': []};
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      await datasource.getNotifications(
        customerId: MockData.testCustomerId,
        type: NotificationType.orderConfirmed,
        isRead: false,
        priority: NotificationPriority.high,
        startDate: MockData.testDatePast,
        endDate: MockData.testDate,
        limit: 20,
        offset: 0,
      );

      // Assert
      final captured = verify(mockDioClient.get(
        '/customer/notifications',
        queryParameters: captureAnyNamed('queryParameters'),
      )).captured.first as Map<String, dynamic>;
      
      expect(captured['customer_id'], MockData.testCustomerId);
      expect(captured['type'], 'order_update');
      expect(captured['is_read'], false);
      expect(captured['priority'], 'high');
      expect(captured['start_date'], isNotNull);
      expect(captured['end_date'], isNotNull);
      expect(captured['limit'], 20);
      expect(captured['offset'], 0);
    });

    test('getUnreadNotificationsCount should return count', () async {
      // Arrange
      final responseData = {
        'data': {'count': 5},
      };
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.getUnreadNotificationsCount(
        MockData.testCustomerId,
      );

      // Assert
      expect(result, 5);
      verify(mockDioClient.get(
        '/customer/notifications/unread/count',
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });

    test('markNotificationAsRead should send PUT request', () async {
      // Arrange
      when(mockDioClient.put(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => successResponse({}));

      // Act
      await datasource.markNotificationAsRead(
        MockData.testCustomerId,
        'notif-001',
      );

      // Assert
      verify(mockDioClient.put(
        '/customer/notifications/notif-001/read',
        data: anyNamed('data'),
      )).called(1);
    });

    test('markAllNotificationsAsRead should return count', () async {
      // Arrange
      final responseData = {
        'data': {'count': 10},
      };
      when(mockDioClient.put(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.markAllNotificationsAsRead(
        MockData.testCustomerId,
      );

      // Assert
      expect(result, 10);
      verify(mockDioClient.put(
        '/customer/notifications/read-all',
        data: anyNamed('data'),
      )).called(1);
    });

    test('deleteNotification should send DELETE request', () async {
      // Arrange
      when(mockDioClient.delete(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse({}));

      // Act
      await datasource.deleteNotification(
        MockData.testCustomerId,
        'notif-001',
      );

      // Assert
      verify(mockDioClient.delete(
        '/customer/notifications/notif-001',
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });

    test('deleteReadNotifications should return count', () async {
      // Arrange
      final responseData = {
        'data': {'count': 15},
      };
      when(mockDioClient.delete(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successResponse(responseData));

      // Act
      final result = await datasource.deleteReadNotifications(
        MockData.testCustomerId,
      );

      // Assert
      expect(result, 15);
      verify(mockDioClient.delete(
        '/customer/notifications/read',
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });
  });

  group('CustomerRemoteDatasource - Error Handling', () {
    test('should handle connection timeout', () async {
      // Arrange
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(timeoutError());

      // Act & Assert
      expect(
        () => datasource.getOrders(customerId: MockData.testCustomerId),
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
        () => datasource.getOrders(customerId: MockData.testCustomerId),
        throwsA(predicate((e) => e.toString().contains('connexion'))),
      );
    });

    test('should handle 400 error', () async {
      // Arrange
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(errorResponse(
        statusCode: 400,
        message: 'Bad Request',
      ));

      // Act & Assert
      expect(
        () => datasource.getOrders(customerId: MockData.testCustomerId),
        throwsA(predicate((e) => e.toString().contains('Requête invalide'))),
      );
    });

    test('should handle 401 error', () async {
      // Arrange
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(errorResponse(statusCode: 401));

      // Act & Assert
      expect(
        () => datasource.getOrders(customerId: MockData.testCustomerId),
        throwsA(predicate((e) => e.toString().contains('Non autorisé'))),
      );
    });

    test('should handle 403 error', () async {
      // Arrange
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(errorResponse(statusCode: 403));

      // Act & Assert
      expect(
        () => datasource.getOrders(customerId: MockData.testCustomerId),
        throwsA(predicate((e) => e.toString().contains('Accès refusé'))),
      );
    });

    test('should handle 500 error', () async {
      // Arrange
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(errorResponse(statusCode: 500));

      // Act & Assert
      expect(
        () => datasource.getOrders(customerId: MockData.testCustomerId),
        throwsA(predicate((e) => e.toString().contains('Erreur serveur'))),
      );
    });

    test('should extract custom error message', () async {
      // Arrange
      when(mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(errorResponse(
        statusCode: 400,
        data: {'message': 'Custom error message'},
      ));

      // Act & Assert
      expect(
        () => datasource.getOrders(customerId: MockData.testCustomerId),
        throwsA(predicate((e) => e.toString().contains('Custom error message'))),
      );
    });
  });
}
