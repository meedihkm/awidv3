import '../../domain/entities/customer_order.dart';
import '../../domain/entities/customer_delivery.dart';
import '../../domain/entities/customer_account.dart';
import '../../domain/entities/customer_notification.dart';
import '../../domain/repositories/customer_repository.dart';
import '../datasources/customer_remote_datasource.dart';
import '../datasources/customer_local_datasource.dart';
import '../models/customer_account_model.dart';
import '../models/customer_order_model.dart';
import '../models/customer_delivery_model.dart';
import '../models/customer_notification_model.dart';

/// Implémentation du Repository Client
/// Gère la logique de cache et de synchronisation
class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerRemoteDatasource _remoteDatasource;
  final CustomerLocalDatasource _localDatasource;

  const CustomerRepositoryImpl(
    this._remoteDatasource,
    this._localDatasource,
  );

  // ==================== COMMANDES ====================

  @override
  Future<List<CustomerOrder>> getOrders({
    required String customerId,
    OrderStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    String? searchQuery,
    int? limit,
    int? offset,
  }) async {
    try {
      // Essayer de récupérer depuis l'API
      final ordersModels = await _remoteDatasource.getOrders(
        customerId: customerId,
        status: status,
        startDate: startDate,
        endDate: endDate,
        searchQuery: searchQuery,
        limit: limit,
        offset: offset,
      );

      // Mettre en cache
      if (searchQuery == null && status == null) {
        await _localDatasource.cacheOrders(customerId, ordersModels);
      }

      return ordersModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      // En cas d'erreur, essayer le cache
      final cachedOrders = await _localDatasource.getCachedOrders(customerId);
      if (cachedOrders != null) {
        return cachedOrders.map((model) => model.toEntity()).toList();
      }
      rethrow;
    }
  }

  @override
  Future<CustomerOrder?> getOrder(String orderId) async {
    try {
      // Essayer depuis l'API
      final orderModel = await _remoteDatasource.getOrder(orderId);
      if (orderModel == null) return null;

      // Mettre en cache
      await _localDatasource.cacheOrder(orderModel);

      return orderModel.toEntity();
    } catch (e) {
      // Essayer le cache
      final cachedOrder = await _localDatasource.getCachedOrder(orderId);
      if (cachedOrder != null) {
        return cachedOrder.toEntity();
      }
      rethrow;
    }
  }

  @override
  Future<List<CustomerOrder>> getActiveOrders(String customerId) async {
    return getOrders(
      customerId: customerId,
      status: OrderStatus.inDelivery,
    );
  }

  @override
  Future<List<CustomerOrder>> searchOrders(
    String customerId,
    String query,
  ) async {
    try {
      final ordersModels = await _remoteDatasource.searchOrders(
        customerId,
        query,
      );

      return ordersModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      // Pour la recherche, pas de fallback sur le cache
      rethrow;
    }
  }

  // ==================== LIVRAISONS ====================

  @override
  Future<CustomerDelivery?> getDelivery(String deliveryId) async {
    try {
      final deliveryModel = await _remoteDatasource.getDelivery(deliveryId);
      if (deliveryModel == null) return null;

      // Mettre en cache
      await _localDatasource.cacheDelivery(deliveryModel);

      return deliveryModel.toEntity();
    } catch (e) {
      // Essayer le cache
      final cachedDelivery =
          await _localDatasource.getCachedDelivery(deliveryId);
      if (cachedDelivery != null) {
        return cachedDelivery.toEntity();
      }
      rethrow;
    }
  }

  @override
  Future<List<CustomerDelivery>> getActiveDeliveries(String customerId) async {
    try {
      final deliveriesModels =
          await _remoteDatasource.getActiveDeliveries(customerId);

      // Mettre en cache
      await _localDatasource.cacheDeliveries(customerId, deliveriesModels);

      return deliveriesModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      // Essayer le cache
      final cachedDeliveries =
          await _localDatasource.getCachedDeliveries(customerId);
      if (cachedDeliveries != null) {
        return cachedDeliveries.map((model) => model.toEntity()).toList();
      }
      rethrow;
    }
  }

  @override
  Future<List<CustomerDelivery>> getDeliveriesHistory({
    required String customerId,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  }) async {
    try {
      final deliveriesModels = await _remoteDatasource.getDeliveriesHistory(
        customerId: customerId,
        startDate: startDate,
        endDate: endDate,
        limit: limit,
      );

      return deliveriesModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<CustomerDelivery> subscribeToDeliveryUpdates(String deliveryId) {
    // TODO: Implémenter WebSocket pour les mises à jour en temps réel
    throw UnimplementedError('WebSocket not implemented yet');
  }

  // ==================== COMPTE ====================

  @override
  Future<CustomerAccount?> getAccountInfo(String customerId) async {
    try {
      final accountModel = await _remoteDatasource.getAccountInfo(customerId);
      if (accountModel == null) return null;

      // Mettre en cache
      await _localDatasource.cacheAccountInfo(accountModel);

      return accountModel.toEntity();
    } catch (e) {
      // Essayer le cache
      final cachedAccount =
          await _localDatasource.getCachedAccountInfo(customerId);
      if (cachedAccount != null) {
        return cachedAccount.toEntity();
      }
      rethrow;
    }
  }

  @override
  Future<CustomerCreditInfo?> getCreditInfo(String customerId) async {
    try {
      final creditInfoModel =
          await _remoteDatasource.getCreditInfo(customerId);
      return creditInfoModel?.toEntity();
    } catch (e) {
      // Essayer depuis le compte en cache
      final cachedAccount =
          await _localDatasource.getCachedAccountInfo(customerId);
      if (cachedAccount != null) {
        return cachedAccount.creditInfo.toEntity();
      }
      rethrow;
    }
  }

  @override
  Future<CustomerPackagingInfo?> getPackagingInfo(String customerId) async {
    try {
      final packagingInfoModel =
          await _remoteDatasource.getPackagingInfo(customerId);
      return packagingInfoModel?.toEntity();
    } catch (e) {
      // Essayer depuis le compte en cache
      final cachedAccount =
          await _localDatasource.getCachedAccountInfo(customerId);
      if (cachedAccount != null) {
        return cachedAccount.packagingInfo.toEntity();
      }
      rethrow;
    }
  }

  @override
  Future<void> updateSettings(
    String customerId,
    CustomerSettings settings,
  ) async {
    final settingsModel = settings.toModel();
    await _remoteDatasource.updateSettings(customerId, settingsModel);

    // Invalider le cache du compte
    await _localDatasource.clearAccountCache(customerId);
  }

  @override
  Future<void> updateContact(
    String customerId,
    String contactId,
    CustomerContact contact,
  ) async {
    final contactModel = contact.toModel();
    await _remoteDatasource.updateContact(customerId, contactId, contactModel);

    // Invalider le cache du compte
    await _localDatasource.clearAccountCache(customerId);
  }

  @override
  Future<String> addContact(String customerId, CustomerContact contact) async {
    final contactModel = contact.toModel();
    final contactId =
        await _remoteDatasource.addContact(customerId, contactModel);

    // Invalider le cache du compte
    await _localDatasource.clearAccountCache(customerId);

    return contactId;
  }

  @override
  Future<void> deleteContact(String customerId, String contactId) async {
    await _remoteDatasource.deleteContact(customerId, contactId);

    // Invalider le cache du compte
    await _localDatasource.clearAccountCache(customerId);
  }

  // ==================== NOTIFICATIONS ====================

  @override
  Future<List<CustomerNotification>> getNotifications({
    required String customerId,
    NotificationType? type,
    bool? isRead,
    NotificationPriority? priority,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    int? offset,
  }) async {
    try {
      final notificationsModels = await _remoteDatasource.getNotifications(
        customerId: customerId,
        type: type,
        isRead: isRead,
        priority: priority,
        startDate: startDate,
        endDate: endDate,
        limit: limit,
        offset: offset,
      );

      // Mettre en cache si pas de filtres
      if (type == null && isRead == null && priority == null) {
        await _localDatasource.cacheNotifications(
            customerId, notificationsModels);
      }

      return notificationsModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      // Essayer le cache
      final cachedNotifications =
          await _localDatasource.getCachedNotifications(customerId);
      if (cachedNotifications != null) {
        return cachedNotifications.map((model) => model.toEntity()).toList();
      }
      rethrow;
    }
  }

  @override
  Future<int> getUnreadNotificationsCount(String customerId) async {
    try {
      return await _remoteDatasource.getUnreadNotificationsCount(customerId);
    } catch (e) {
      // Essayer de compter depuis le cache
      final cachedNotifications =
          await _localDatasource.getCachedNotifications(customerId);
      if (cachedNotifications != null) {
        return cachedNotifications.where((n) => !n.isRead).length;
      }
      rethrow;
    }
  }

  @override
  Future<void> markNotificationAsRead(
    String customerId,
    String notificationId,
  ) async {
    await _remoteDatasource.markNotificationAsRead(customerId, notificationId);

    // Mettre à jour le cache
    await _localDatasource.markNotificationAsReadInCache(
        customerId, notificationId);
  }

  @override
  Future<int> markAllNotificationsAsRead(String customerId) async {
    final count =
        await _remoteDatasource.markAllNotificationsAsRead(customerId);

    // Invalider le cache
    await _localDatasource.clearNotificationsCache(customerId);

    return count;
  }

  @override
  Future<void> deleteNotification(
    String customerId,
    String notificationId,
  ) async {
    await _remoteDatasource.deleteNotification(customerId, notificationId);

    // Mettre à jour le cache
    await _localDatasource.deleteNotificationFromCache(
        customerId, notificationId);
  }

  @override
  Future<int> deleteReadNotifications(String customerId) async {
    final count = await _remoteDatasource.deleteReadNotifications(customerId);

    // Invalider le cache
    await _localDatasource.clearNotificationsCache(customerId);

    return count;
  }

  @override
  Stream<CustomerNotification> subscribeToNotifications(String customerId) {
    // TODO: Implémenter WebSocket pour les notifications en temps réel
    throw UnimplementedError('WebSocket not implemented yet');
  }

  // ==================== CACHE & SYNCHRONISATION ====================

  @override
  Future<void> syncCustomerData(String customerId) async {
    // Synchroniser toutes les données
    await Future.wait([
      getOrders(customerId: customerId),
      getActiveDeliveries(customerId),
      getAccountInfo(customerId),
      getNotifications(customerId: customerId),
    ]);
  }

  @override
  Future<void> clearCache(String customerId) async {
    await _localDatasource.clearAllCache(customerId);
  }

  @override
  Future<bool> hasCachedData(String customerId) async {
    return await _localDatasource.hasCachedData(customerId);
  }
}
