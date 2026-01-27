import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:awid_mobile/features/customer/data/repositories/customer_repository_impl.dart';
import 'package:awid_mobile/features/customer/data/datasources/customer_remote_datasource.dart';
import 'package:awid_mobile/features/customer/data/datasources/customer_local_datasource.dart';
import 'package:awid_mobile/features/customer/data/models/customer_order_model.dart';
import 'package:awid_mobile/features/customer/data/models/customer_delivery_model.dart';
import 'package:awid_mobile/features/customer/data/models/customer_account_model.dart';
import 'package:awid_mobile/features/customer/data/models/customer_notification_model.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_order.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_notification.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([CustomerRemoteDatasource, CustomerLocalDatasource])
import 'customer_repository_impl_test.mocks.dart';

void main() {
  late CustomerRepositoryImpl repository;
  late MockCustomerRemoteDatasource mockRemoteDatasource;
  late MockCustomerLocalDatasource mockLocalDatasource;

  setUp(() {
    mockRemoteDatasource = MockCustomerRemoteDatasource();
    mockLocalDatasource = MockCustomerLocalDatasource();
    repository = CustomerRepositoryImpl(
      mockRemoteDatasource,
      mockLocalDatasource,
    );
  });

  group('CustomerRepositoryImpl - Orders', () {
    test('getOrders should fetch from remote and cache', () async {
      // Arrange
      final orderModels = [
        CustomerOrderModel.fromEntity(MockData.mockCustomerOrder),
      ];
      when(mockRemoteDatasource.getOrders(
        customerId: anyNamed('customerId'),
        status: anyNamed('status'),
        startDate: anyNamed('startDate'),
        endDate: anyNamed('endDate'),
        searchQuery: anyNamed('searchQuery'),
        limit: anyNamed('limit'),
        offset: anyNamed('offset'),
      )).thenAnswer((_) async => orderModels);
      when(mockLocalDatasource.cacheOrders(any, any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.getOrders(
        customerId: MockData.testCustomerId,
      );

      // Assert
      expect(result, isNotEmpty);
      expect(result.first.id, MockData.testOrderId);
      verify(mockRemoteDatasource.getOrders(
        customerId: MockData.testCustomerId,
      )).called(1);
      verify(mockLocalDatasource.cacheOrders(
        MockData.testCustomerId,
        orderModels,
      )).called(1);
    });

    test('getOrders should return cached data on remote failure', () async {
      // Arrange
      final orderModels = [
        CustomerOrderModel.fromEntity(MockData.mockCustomerOrder),
      ];
      when(mockRemoteDatasource.getOrders(
        customerId: anyNamed('customerId'),
      )).thenThrow(Exception('Network error'));
      when(mockLocalDatasource.getCachedOrders(any))
          .thenAnswer((_) async => orderModels);

      // Act
      final result = await repository.getOrders(
        customerId: MockData.testCustomerId,
      );

      // Assert
      expect(result, isNotEmpty);
      expect(result.first.id, MockData.testOrderId);
      verify(mockLocalDatasource.getCachedOrders(MockData.testCustomerId))
          .called(1);
    });

    test('getOrders should throw when both remote and cache fail', () async {
      // Arrange
      when(mockRemoteDatasource.getOrders(
        customerId: anyNamed('customerId'),
      )).thenThrow(Exception('Network error'));
      when(mockLocalDatasource.getCachedOrders(any))
          .thenAnswer((_) async => null);

      // Act & Assert
      expect(
        () => repository.getOrders(customerId: MockData.testCustomerId),
        throwsException,
      );
    });

    test('getOrders with filters should not cache', () async {
      // Arrange
      final orderModels = [
        CustomerOrderModel.fromEntity(MockData.mockCustomerOrder),
      ];
      when(mockRemoteDatasource.getOrders(
        customerId: anyNamed('customerId'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => orderModels);

      // Act
      await repository.getOrders(
        customerId: MockData.testCustomerId,
        status: OrderStatus.pending,
      );

      // Assert
      verifyNever(mockLocalDatasource.cacheOrders(any, any));
    });

    test('getOrder should fetch from remote and cache', () async {
      // Arrange
      final orderModel = CustomerOrderModel.fromEntity(MockData.mockCustomerOrder);
      when(mockRemoteDatasource.getOrder(any))
          .thenAnswer((_) async => orderModel);
      when(mockLocalDatasource.cacheOrder(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.getOrder(MockData.testOrderId);

      // Assert
      expect(result, isNotNull);
      expect(result!.id, MockData.testOrderId);
      verify(mockRemoteDatasource.getOrder(MockData.testOrderId)).called(1);
      verify(mockLocalDatasource.cacheOrder(orderModel)).called(1);
    });

    test('getOrder should return null when not found', () async {
      // Arrange
      when(mockRemoteDatasource.getOrder(any))
          .thenAnswer((_) async => null);

      // Act
      final result = await repository.getOrder(MockData.testOrderId);

      // Assert
      expect(result, isNull);
    });

    test('getOrder should fallback to cache on error', () async {
      // Arrange
      final orderModel = CustomerOrderModel.fromEntity(MockData.mockCustomerOrder);
      when(mockRemoteDatasource.getOrder(any))
          .thenThrow(Exception('Network error'));
      when(mockLocalDatasource.getCachedOrder(any))
          .thenAnswer((_) async => orderModel);

      // Act
      final result = await repository.getOrder(MockData.testOrderId);

      // Assert
      expect(result, isNotNull);
      expect(result!.id, MockData.testOrderId);
    });

    test('getActiveOrders should filter by inDelivery status', () async {
      // Arrange
      final orderModels = [
        CustomerOrderModel.fromEntity(MockData.mockCustomerOrder),
      ];
      when(mockRemoteDatasource.getOrders(
        customerId: anyNamed('customerId'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => orderModels);

      // Act
      await repository.getActiveOrders(MockData.testCustomerId);

      // Assert
      verify(mockRemoteDatasource.getOrders(
        customerId: MockData.testCustomerId,
        status: OrderStatus.inDelivery,
      )).called(1);
    });

    test('searchOrders should not fallback to cache', () async {
      // Arrange
      when(mockRemoteDatasource.searchOrders(any, any))
          .thenThrow(Exception('Network error'));

      // Act & Assert
      expect(
        () => repository.searchOrders(MockData.testCustomerId, 'query'),
        throwsException,
      );
      verifyNever(mockLocalDatasource.getCachedOrders(any));
    });
  });

  group('CustomerRepositoryImpl - Deliveries', () {
    test('getDelivery should fetch from remote and cache', () async {
      // Arrange
      final deliveryModel = CustomerDeliveryModel(
        id: 'delivery-001',
        orderId: MockData.testOrderId,
        status: 'in_progress',
        estimatedArrival: MockData.testDateFuture,
        currentLocation: null,
        delivererName: 'John Deliverer',
        delivererPhone: '+33612345678',
      );
      when(mockRemoteDatasource.getDelivery(any))
          .thenAnswer((_) async => deliveryModel);
      when(mockLocalDatasource.cacheDelivery(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.getDelivery('delivery-001');

      // Assert
      expect(result, isNotNull);
      expect(result!.id, 'delivery-001');
      verify(mockRemoteDatasource.getDelivery('delivery-001')).called(1);
      verify(mockLocalDatasource.cacheDelivery(deliveryModel)).called(1);
    });

    test('getDelivery should fallback to cache on error', () async {
      // Arrange
      final deliveryModel = CustomerDeliveryModel(
        id: 'delivery-001',
        orderId: MockData.testOrderId,
        status: 'in_progress',
        estimatedArrival: MockData.testDateFuture,
        currentLocation: null,
        delivererName: 'John Deliverer',
        delivererPhone: '+33612345678',
      );
      when(mockRemoteDatasource.getDelivery(any))
          .thenThrow(Exception('Network error'));
      when(mockLocalDatasource.getCachedDelivery(any))
          .thenAnswer((_) async => deliveryModel);

      // Act
      final result = await repository.getDelivery('delivery-001');

      // Assert
      expect(result, isNotNull);
      expect(result!.id, 'delivery-001');
    });

    test('getActiveDeliveries should fetch and cache', () async {
      // Arrange
      final deliveryModels = [
        CustomerDeliveryModel(
          id: 'delivery-001',
          orderId: MockData.testOrderId,
          status: 'in_progress',
          estimatedArrival: MockData.testDateFuture,
          currentLocation: null,
          delivererName: 'John Deliverer',
          delivererPhone: '+33612345678',
        ),
      ];
      when(mockRemoteDatasource.getActiveDeliveries(any))
          .thenAnswer((_) async => deliveryModels);
      when(mockLocalDatasource.cacheDeliveries(any, any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.getActiveDeliveries(MockData.testCustomerId);

      // Assert
      expect(result, isNotEmpty);
      verify(mockLocalDatasource.cacheDeliveries(
        MockData.testCustomerId,
        deliveryModels,
      )).called(1);
    });

    test('getDeliveriesHistory should not cache', () async {
      // Arrange
      when(mockRemoteDatasource.getDeliveriesHistory(
        customerId: anyNamed('customerId'),
        startDate: anyNamed('startDate'),
        endDate: anyNamed('endDate'),
        limit: anyNamed('limit'),
      )).thenAnswer((_) async => []);

      // Act
      await repository.getDeliveriesHistory(
        customerId: MockData.testCustomerId,
      );

      // Assert
      verifyNever(mockLocalDatasource.cacheDeliveries(any, any));
    });

    test('subscribeToDeliveryUpdates should throw UnimplementedError', () {
      // Act & Assert
      expect(
        () => repository.subscribeToDeliveryUpdates('delivery-001'),
        throwsUnimplementedError,
      );
    });
  });

  group('CustomerRepositoryImpl - Account', () {
    test('getAccountInfo should fetch from remote and cache', () async {
      // Arrange
      final accountModel = CustomerAccountModel.fromEntity(MockData.mockCustomerAccount);
      when(mockRemoteDatasource.getAccountInfo(any))
          .thenAnswer((_) async => accountModel);
      when(mockLocalDatasource.cacheAccountInfo(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.getAccountInfo(MockData.testCustomerId);

      // Assert
      expect(result, isNotNull);
      expect(result!.id, MockData.testCustomerId);
      verify(mockLocalDatasource.cacheAccountInfo(accountModel)).called(1);
    });

    test('getAccountInfo should fallback to cache on error', () async {
      // Arrange
      final accountModel = CustomerAccountModel.fromEntity(MockData.mockCustomerAccount);
      when(mockRemoteDatasource.getAccountInfo(any))
          .thenThrow(Exception('Network error'));
      when(mockLocalDatasource.getCachedAccountInfo(any))
          .thenAnswer((_) async => accountModel);

      // Act
      final result = await repository.getAccountInfo(MockData.testCustomerId);

      // Assert
      expect(result, isNotNull);
      expect(result!.id, MockData.testCustomerId);
    });

    test('updateSettings should clear account cache', () async {
      // Arrange
      final settings = CustomerSettings(
        language: 'fr',
        notificationsEnabled: true,
        emailNotifications: true,
        smsNotifications: false,
      );
      final settingsModel = settings.toModel();
      when(mockRemoteDatasource.updateSettings(any, any))
          .thenAnswer((_) async => {});
      when(mockLocalDatasource.clearAccountCache(any))
          .thenAnswer((_) async => {});

      // Act
      await repository.updateSettings(MockData.testCustomerId, settings);

      // Assert
      verify(mockRemoteDatasource.updateSettings(
        MockData.testCustomerId,
        settingsModel,
      )).called(1);
      verify(mockLocalDatasource.clearAccountCache(MockData.testCustomerId))
          .called(1);
    });

    test('addContact should return contactId and clear cache', () async {
      // Arrange
      final contact = CustomerContact(
        name: 'Jane Doe',
        phone: '+33612345679',
        email: 'jane@example.com',
        role: 'Manager',
      );
      when(mockRemoteDatasource.addContact(any, any))
          .thenAnswer((_) async => 'contact-123');
      when(mockLocalDatasource.clearAccountCache(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.addContact(MockData.testCustomerId, contact);

      // Assert
      expect(result, 'contact-123');
      verify(mockLocalDatasource.clearAccountCache(MockData.testCustomerId))
          .called(1);
    });

    test('deleteContact should clear account cache', () async {
      // Arrange
      when(mockRemoteDatasource.deleteContact(any, any))
          .thenAnswer((_) async => {});
      when(mockLocalDatasource.clearAccountCache(any))
          .thenAnswer((_) async => {});

      // Act
      await repository.deleteContact(MockData.testCustomerId, 'contact-123');

      // Assert
      verify(mockLocalDatasource.clearAccountCache(MockData.testCustomerId))
          .called(1);
    });
  });

  group('CustomerRepositoryImpl - Notifications', () {
    test('getNotifications should fetch and cache without filters', () async {
      // Arrange
      final notificationModels = [
        CustomerNotificationModel(
          id: 'notif-001',
          customerId: MockData.testCustomerId,
          type: NotificationType.orderUpdate,
          title: 'Order Update',
          message: 'Your order is ready',
          isRead: false,
          priority: NotificationPriority.high,
          createdAt: MockData.testDate,
          data: {},
        ),
      ];
      when(mockRemoteDatasource.getNotifications(
        customerId: anyNamed('customerId'),
        type: anyNamed('type'),
        isRead: anyNamed('isRead'),
        priority: anyNamed('priority'),
        startDate: anyNamed('startDate'),
        endDate: anyNamed('endDate'),
        limit: anyNamed('limit'),
        offset: anyNamed('offset'),
      )).thenAnswer((_) async => notificationModels);
      when(mockLocalDatasource.cacheNotifications(any, any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.getNotifications(
        customerId: MockData.testCustomerId,
      );

      // Assert
      expect(result, isNotEmpty);
      verify(mockLocalDatasource.cacheNotifications(
        MockData.testCustomerId,
        notificationModels,
      )).called(1);
    });

    test('getNotifications with filters should not cache', () async {
      // Arrange
      when(mockRemoteDatasource.getNotifications(
        customerId: anyNamed('customerId'),
        type: anyNamed('type'),
      )).thenAnswer((_) async => []);

      // Act
      await repository.getNotifications(
        customerId: MockData.testCustomerId,
        type: NotificationType.orderUpdate,
      );

      // Assert
      verifyNever(mockLocalDatasource.cacheNotifications(any, any));
    });

    test('getUnreadNotificationsCount should fetch from remote', () async {
      // Arrange
      when(mockRemoteDatasource.getUnreadNotificationsCount(any))
          .thenAnswer((_) async => 5);

      // Act
      final result = await repository.getUnreadNotificationsCount(
        MockData.testCustomerId,
      );

      // Assert
      expect(result, 5);
    });

    test('getUnreadNotificationsCount should count from cache on error', () async {
      // Arrange
      final notificationModels = [
        CustomerNotificationModel(
          id: 'notif-001',
          customerId: MockData.testCustomerId,
          type: NotificationType.orderUpdate,
          title: 'Order Update',
          message: 'Your order is ready',
          isRead: false,
          priority: NotificationPriority.high,
          createdAt: MockData.testDate,
          data: {},
        ),
        CustomerNotificationModel(
          id: 'notif-002',
          customerId: MockData.testCustomerId,
          type: NotificationType.orderUpdate,
          title: 'Order Update 2',
          message: 'Your order is delivered',
          isRead: true,
          priority: NotificationPriority.medium,
          createdAt: MockData.testDate,
          data: {},
        ),
      ];
      when(mockRemoteDatasource.getUnreadNotificationsCount(any))
          .thenThrow(Exception('Network error'));
      when(mockLocalDatasource.getCachedNotifications(any))
          .thenAnswer((_) async => notificationModels);

      // Act
      final result = await repository.getUnreadNotificationsCount(
        MockData.testCustomerId,
      );

      // Assert
      expect(result, 1); // Only one unread
    });

    test('markNotificationAsRead should update cache', () async {
      // Arrange
      when(mockRemoteDatasource.markNotificationAsRead(any, any))
          .thenAnswer((_) async => {});
      when(mockLocalDatasource.markNotificationAsReadInCache(any, any))
          .thenAnswer((_) async => {});

      // Act
      await repository.markNotificationAsRead(
        MockData.testCustomerId,
        'notif-001',
      );

      // Assert
      verify(mockLocalDatasource.markNotificationAsReadInCache(
        MockData.testCustomerId,
        'notif-001',
      )).called(1);
    });

    test('markAllNotificationsAsRead should clear cache', () async {
      // Arrange
      when(mockRemoteDatasource.markAllNotificationsAsRead(any))
          .thenAnswer((_) async => 5);
      when(mockLocalDatasource.clearNotificationsCache(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await repository.markAllNotificationsAsRead(
        MockData.testCustomerId,
      );

      // Assert
      expect(result, 5);
      verify(mockLocalDatasource.clearNotificationsCache(MockData.testCustomerId))
          .called(1);
    });

    test('deleteNotification should update cache', () async {
      // Arrange
      when(mockRemoteDatasource.deleteNotification(any, any))
          .thenAnswer((_) async => {});
      when(mockLocalDatasource.deleteNotificationFromCache(any, any))
          .thenAnswer((_) async => {});

      // Act
      await repository.deleteNotification(
        MockData.testCustomerId,
        'notif-001',
      );

      // Assert
      verify(mockLocalDatasource.deleteNotificationFromCache(
        MockData.testCustomerId,
        'notif-001',
      )).called(1);
    });

    test('subscribeToNotifications should throw UnimplementedError', () {
      // Act & Assert
      expect(
        () => repository.subscribeToNotifications(MockData.testCustomerId),
        throwsUnimplementedError,
      );
    });
  });

  group('CustomerRepositoryImpl - Cache & Sync', () {
    test('syncCustomerData should fetch all data', () async {
      // Arrange
      when(mockRemoteDatasource.getOrders(customerId: anyNamed('customerId')))
          .thenAnswer((_) async => []);
      when(mockRemoteDatasource.getActiveDeliveries(any))
          .thenAnswer((_) async => []);
      when(mockRemoteDatasource.getAccountInfo(any))
          .thenAnswer((_) async => null);
      when(mockRemoteDatasource.getNotifications(customerId: anyNamed('customerId')))
          .thenAnswer((_) async => []);
      when(mockLocalDatasource.cacheOrders(any, any))
          .thenAnswer((_) async => {});
      when(mockLocalDatasource.cacheDeliveries(any, any))
          .thenAnswer((_) async => {});
      when(mockLocalDatasource.cacheNotifications(any, any))
          .thenAnswer((_) async => {});

      // Act
      await repository.syncCustomerData(MockData.testCustomerId);

      // Assert
      verify(mockRemoteDatasource.getOrders(
        customerId: MockData.testCustomerId,
      )).called(1);
      verify(mockRemoteDatasource.getActiveDeliveries(MockData.testCustomerId))
          .called(1);
      verify(mockRemoteDatasource.getAccountInfo(MockData.testCustomerId))
          .called(1);
      verify(mockRemoteDatasource.getNotifications(
        customerId: MockData.testCustomerId,
      )).called(1);
    });

    test('clearCache should clear all customer data', () async {
      // Arrange
      when(mockLocalDatasource.clearAllCache(any))
          .thenAnswer((_) async => {});

      // Act
      await repository.clearCache(MockData.testCustomerId);

      // Assert
      verify(mockLocalDatasource.clearAllCache(MockData.testCustomerId))
          .called(1);
    });

    test('hasCachedData should check local storage', () async {
      // Arrange
      when(mockLocalDatasource.hasCachedData(any))
          .thenAnswer((_) async => true);

      // Act
      final result = await repository.hasCachedData(MockData.testCustomerId);

      // Assert
      expect(result, true);
      verify(mockLocalDatasource.hasCachedData(MockData.testCustomerId))
          .called(1);
    });
  });
}
