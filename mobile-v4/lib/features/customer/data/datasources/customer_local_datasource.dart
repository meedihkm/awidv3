import 'package:hive/hive.dart';

import '../models/customer_order_model.dart';
import '../models/customer_delivery_model.dart';
import '../models/customer_account_model.dart';
import '../models/customer_notification_model.dart';

/// Datasource Local pour les Opérations Client
/// Gère le cache local avec Hive
class CustomerLocalDatasource {
  static const String _ordersBoxName = 'customer_orders';
  static const String _deliveriesBoxName = 'customer_deliveries';
  static const String _accountBoxName = 'customer_account';
  static const String _notificationsBoxName = 'customer_notifications';

  // ==================== COMMANDES ====================

  /// Sauvegarde les commandes en cache
  Future<void> cacheOrders(
    String customerId,
    List<CustomerOrderModel> orders,
  ) async {
    final box = await Hive.openBox<Map>(_ordersBoxName);
    final ordersJson = orders.map((o) => o.toJson()).toList();
    await box.put(customerId, {'orders': ordersJson, 'timestamp': DateTime.now().toIso8601String()});
    await box.close();
  }

  /// Récupère les commandes du cache
  Future<List<CustomerOrderModel>?> getCachedOrders(String customerId) async {
    try {
      final box = await Hive.openBox<Map>(_ordersBoxName);
      final data = box.get(customerId);
      await box.close();

      if (data == null) return null;

      // Vérifier si le cache est encore valide (24h)
      final timestamp = DateTime.parse(data['timestamp'] as String);
      if (DateTime.now().difference(timestamp).inHours > 24) {
        return null;
      }

      final List<dynamic> ordersJson = data['orders'] as List;
      return ordersJson
          .map((json) => CustomerOrderModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return null;
    }
  }

  /// Sauvegarde une commande en cache
  Future<void> cacheOrder(CustomerOrderModel order) async {
    final box = await Hive.openBox<Map>('${_ordersBoxName}_single');
    await box.put(order.id, order.toJson());
    await box.close();
  }

  /// Récupère une commande du cache
  Future<CustomerOrderModel?> getCachedOrder(String orderId) async {
    try {
      final box = await Hive.openBox<Map>('${_ordersBoxName}_single');
      final data = box.get(orderId);
      await box.close();

      if (data == null) return null;

      return CustomerOrderModel.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  /// Efface le cache des commandes
  Future<void> clearOrdersCache(String customerId) async {
    final box = await Hive.openBox<Map>(_ordersBoxName);
    await box.delete(customerId);
    await box.close();
  }

  // ==================== LIVRAISONS ====================

  /// Sauvegarde les livraisons en cache
  Future<void> cacheDeliveries(
    String customerId,
    List<CustomerDeliveryModel> deliveries,
  ) async {
    final box = await Hive.openBox<Map>(_deliveriesBoxName);
    final deliveriesJson = deliveries.map((d) => d.toJson()).toList();
    await box.put(customerId, {
      'deliveries': deliveriesJson,
      'timestamp': DateTime.now().toIso8601String()
    });
    await box.close();
  }

  /// Récupère les livraisons du cache
  Future<List<CustomerDeliveryModel>?> getCachedDeliveries(
      String customerId) async {
    try {
      final box = await Hive.openBox<Map>(_deliveriesBoxName);
      final data = box.get(customerId);
      await box.close();

      if (data == null) return null;

      // Cache valide pendant 1h pour les livraisons actives
      final timestamp = DateTime.parse(data['timestamp'] as String);
      if (DateTime.now().difference(timestamp).inHours > 1) {
        return null;
      }

      final List<dynamic> deliveriesJson = data['deliveries'] as List;
      return deliveriesJson
          .map((json) =>
              CustomerDeliveryModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return null;
    }
  }

  /// Sauvegarde une livraison en cache
  Future<void> cacheDelivery(CustomerDeliveryModel delivery) async {
    final box = await Hive.openBox<Map>('${_deliveriesBoxName}_single');
    await box.put(delivery.id, delivery.toJson());
    await box.close();
  }

  /// Récupère une livraison du cache
  Future<CustomerDeliveryModel?> getCachedDelivery(String deliveryId) async {
    try {
      final box = await Hive.openBox<Map>('${_deliveriesBoxName}_single');
      final data = box.get(deliveryId);
      await box.close();

      if (data == null) return null;

      return CustomerDeliveryModel.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  /// Efface le cache des livraisons
  Future<void> clearDeliveriesCache(String customerId) async {
    final box = await Hive.openBox<Map>(_deliveriesBoxName);
    await box.delete(customerId);
    await box.close();
  }

  // ==================== COMPTE ====================

  /// Sauvegarde les informations du compte en cache
  Future<void> cacheAccountInfo(CustomerAccountModel account) async {
    final box = await Hive.openBox<Map>(_accountBoxName);
    await box.put(account.id, {
      'account': account.toJson(),
      'timestamp': DateTime.now().toIso8601String()
    });
    await box.close();
  }

  /// Récupère les informations du compte du cache
  Future<CustomerAccountModel?> getCachedAccountInfo(String customerId) async {
    try {
      final box = await Hive.openBox<Map>(_accountBoxName);
      final data = box.get(customerId);
      await box.close();

      if (data == null) return null;

      // Cache valide pendant 6h
      final timestamp = DateTime.parse(data['timestamp'] as String);
      if (DateTime.now().difference(timestamp).inHours > 6) {
        return null;
      }

      return CustomerAccountModel.fromJson(
          data['account'] as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  /// Efface le cache du compte
  Future<void> clearAccountCache(String customerId) async {
    final box = await Hive.openBox<Map>(_accountBoxName);
    await box.delete(customerId);
    await box.close();
  }

  // ==================== NOTIFICATIONS ====================

  /// Sauvegarde les notifications en cache
  Future<void> cacheNotifications(
    String customerId,
    List<CustomerNotificationModel> notifications,
  ) async {
    final box = await Hive.openBox<Map>(_notificationsBoxName);
    final notificationsJson = notifications.map((n) => n.toJson()).toList();
    await box.put(customerId, {
      'notifications': notificationsJson,
      'timestamp': DateTime.now().toIso8601String()
    });
    await box.close();
  }

  /// Récupère les notifications du cache
  Future<List<CustomerNotificationModel>?> getCachedNotifications(
      String customerId) async {
    try {
      final box = await Hive.openBox<Map>(_notificationsBoxName);
      final data = box.get(customerId);
      await box.close();

      if (data == null) return null;

      // Cache valide pendant 30 minutes
      final timestamp = DateTime.parse(data['timestamp'] as String);
      if (DateTime.now().difference(timestamp).inMinutes > 30) {
        return null;
      }

      final List<dynamic> notificationsJson = data['notifications'] as List;
      return notificationsJson
          .map((json) =>
              CustomerNotificationModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return null;
    }
  }

  /// Marque une notification comme lue dans le cache
  Future<void> markNotificationAsReadInCache(
    String customerId,
    String notificationId,
  ) async {
    try {
      final notifications = await getCachedNotifications(customerId);
      if (notifications == null) return;

      final updatedNotifications = notifications.map((n) {
        if (n.id == notificationId) {
          return n.copyWith(isRead: true, readAt: DateTime.now());
        }
        return n;
      }).toList();

      await cacheNotifications(customerId, updatedNotifications);
    } catch (e) {
      // Ignore cache errors
    }
  }

  /// Supprime une notification du cache
  Future<void> deleteNotificationFromCache(
    String customerId,
    String notificationId,
  ) async {
    try {
      final notifications = await getCachedNotifications(customerId);
      if (notifications == null) return;

      final updatedNotifications =
          notifications.where((n) => n.id != notificationId).toList();

      await cacheNotifications(customerId, updatedNotifications);
    } catch (e) {
      // Ignore cache errors
    }
  }

  /// Efface le cache des notifications
  Future<void> clearNotificationsCache(String customerId) async {
    final box = await Hive.openBox<Map>(_notificationsBoxName);
    await box.delete(customerId);
    await box.close();
  }

  // ==================== CACHE GLOBAL ====================

  /// Efface tout le cache du client
  Future<void> clearAllCache(String customerId) async {
    await clearOrdersCache(customerId);
    await clearDeliveriesCache(customerId);
    await clearAccountCache(customerId);
    await clearNotificationsCache(customerId);
  }

  /// Vérifie si des données sont en cache
  Future<bool> hasCachedData(String customerId) async {
    final hasOrders = await getCachedOrders(customerId) != null;
    final hasAccount = await getCachedAccountInfo(customerId) != null;
    return hasOrders || hasAccount;
  }
}
