import '../entities/customer_order.dart';
import '../entities/customer_delivery.dart';
import '../entities/customer_account.dart';
import '../entities/customer_notification.dart';

/// Repository pour les Opérations Client
/// Interface pour gérer les commandes, livraisons, compte et notifications du client
abstract class CustomerRepository {
  // ==================== COMMANDES ====================

  /// Récupère les commandes du client
  Future<List<CustomerOrder>> getOrders({
    required String customerId,
    OrderStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    String? searchQuery,
    int? limit,
    int? offset,
  });

  /// Récupère une commande spécifique
  Future<CustomerOrder?> getOrder(String orderId);

  /// Récupère les commandes actives
  Future<List<CustomerOrder>> getActiveOrders(String customerId);

  /// Recherche des commandes
  Future<List<CustomerOrder>> searchOrders(String customerId, String query);

  // ==================== LIVRAISONS ====================

  /// Récupère une livraison spécifique
  Future<CustomerDelivery?> getDelivery(String deliveryId);

  /// Récupère les livraisons actives du client
  Future<List<CustomerDelivery>> getActiveDeliveries(String customerId);

  /// Récupère l'historique des livraisons
  Future<List<CustomerDelivery>> getDeliveriesHistory({
    required String customerId,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  });

  /// S'abonne aux mises à jour de livraison en temps réel
  Stream<CustomerDelivery> subscribeToDeliveryUpdates(String deliveryId);

  // ==================== COMPTE ====================

  /// Récupère les informations complètes du compte
  Future<CustomerAccount?> getAccountInfo(String customerId);

  /// Récupère les informations de crédit
  Future<CustomerCreditInfo?> getCreditInfo(String customerId);

  /// Récupère les informations de consignes
  Future<CustomerPackagingInfo?> getPackagingInfo(String customerId);

  /// Met à jour les paramètres du compte
  Future<void> updateSettings(String customerId, CustomerSettings settings);

  /// Met à jour un contact
  Future<void> updateContact(
    String customerId,
    String contactId,
    CustomerContact contact,
  );

  /// Ajoute un nouveau contact
  Future<String> addContact(String customerId, CustomerContact contact);

  /// Supprime un contact
  Future<void> deleteContact(String customerId, String contactId);

  // ==================== NOTIFICATIONS ====================

  /// Récupère les notifications du client
  Future<List<CustomerNotification>> getNotifications({
    required String customerId,
    NotificationType? type,
    bool? isRead,
    NotificationPriority? priority,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    int? offset,
  });

  /// Récupère le nombre de notifications non lues
  Future<int> getUnreadNotificationsCount(String customerId);

  /// Marque une notification comme lue
  Future<void> markNotificationAsRead(String customerId, String notificationId);

  /// Marque toutes les notifications comme lues
  Future<int> markAllNotificationsAsRead(String customerId);

  /// Supprime une notification
  Future<void> deleteNotification(String customerId, String notificationId);

  /// Supprime toutes les notifications lues
  Future<int> deleteReadNotifications(String customerId);

  /// S'abonne aux nouvelles notifications
  Stream<CustomerNotification> subscribeToNotifications(String customerId);

  // ==================== CACHE & SYNCHRONISATION ====================

  /// Synchronise les données du client
  Future<void> syncCustomerData(String customerId);

  /// Efface le cache local
  Future<void> clearCache(String customerId);

  /// Vérifie si des données sont en cache
  Future<bool> hasCachedData(String customerId);
}
