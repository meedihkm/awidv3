import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';
import '../../domain/entities/customer_order.dart';
import '../../domain/entities/customer_delivery.dart';
import '../../domain/entities/customer_account.dart';
import '../../domain/entities/customer_notification.dart';
import '../models/customer_order_model.dart';
import '../models/customer_delivery_model.dart';
import '../models/customer_account_model.dart';
import '../models/customer_notification_model.dart';

/// Datasource Remote pour les Opérations Client
/// Gère toutes les communications avec l'API backend
class CustomerRemoteDatasource {
  final DioClient _dioClient;

  const CustomerRemoteDatasource(this._dioClient);

  // ==================== COMMANDES ====================

  /// Récupère les commandes du client
  Future<List<CustomerOrderModel>> getOrders({
    required String customerId,
    OrderStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    String? searchQuery,
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'customer_id': customerId,
        if (status != null) 'status': status.name,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
        if (searchQuery != null) 'search': searchQuery,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      };

      final response = await _dioClient.get(
        '/customer/orders',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => CustomerOrderModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Récupère une commande spécifique
  Future<CustomerOrderModel?> getOrder(String orderId) async {
    try {
      final response = await _dioClient.get('/customer/orders/$orderId');

      if (response.data['data'] == null) return null;

      return CustomerOrderModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw _handleError(e);
    }
  }

  /// Recherche des commandes
  Future<List<CustomerOrderModel>> searchOrders(
    String customerId,
    String query,
  ) async {
    try {
      final response = await _dioClient.get(
        '/customer/orders/search',
        queryParameters: {
          'customer_id': customerId,
          'q': query,
        },
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => CustomerOrderModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==================== LIVRAISONS ====================

  /// Récupère une livraison spécifique
  Future<CustomerDeliveryModel?> getDelivery(String deliveryId) async {
    try {
      final response = await _dioClient.get('/customer/deliveries/$deliveryId');

      if (response.data['data'] == null) return null;

      return CustomerDeliveryModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw _handleError(e);
    }
  }

  /// Récupère les livraisons actives
  Future<List<CustomerDeliveryModel>> getActiveDeliveries(
      String customerId) async {
    try {
      final response = await _dioClient.get(
        '/customer/deliveries/active',
        queryParameters: {'customer_id': customerId},
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data
          .map((json) => CustomerDeliveryModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Récupère l'historique des livraisons
  Future<List<CustomerDeliveryModel>> getDeliveriesHistory({
    required String customerId,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'customer_id': customerId,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
        if (limit != null) 'limit': limit,
      };

      final response = await _dioClient.get(
        '/customer/deliveries/history',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data
          .map((json) => CustomerDeliveryModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==================== COMPTE ====================

  /// Récupère les informations du compte
  Future<CustomerAccountModel?> getAccountInfo(String customerId) async {
    try {
      final response = await _dioClient.get('/customer/account/$customerId');

      if (response.data['data'] == null) return null;

      return CustomerAccountModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw _handleError(e);
    }
  }

  /// Récupère les informations de crédit
  Future<CustomerCreditInfoModel?> getCreditInfo(String customerId) async {
    try {
      final response =
          await _dioClient.get('/customer/account/$customerId/credit');

      if (response.data['data'] == null) return null;

      return CustomerCreditInfoModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw _handleError(e);
    }
  }

  /// Récupère les informations de consignes
  Future<CustomerPackagingInfoModel?> getPackagingInfo(
      String customerId) async {
    try {
      final response =
          await _dioClient.get('/customer/account/$customerId/packaging');

      if (response.data['data'] == null) return null;

      return CustomerPackagingInfoModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw _handleError(e);
    }
  }

  /// Met à jour les paramètres
  Future<void> updateSettings(
    String customerId,
    CustomerSettingsModel settings,
  ) async {
    try {
      await _dioClient.put(
        '/customer/account/$customerId/settings',
        data: settings.toJson(),
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Met à jour un contact
  Future<void> updateContact(
    String customerId,
    String contactId,
    CustomerContactModel contact,
  ) async {
    try {
      await _dioClient.put(
        '/customer/account/$customerId/contacts/$contactId',
        data: contact.toJson(),
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Ajoute un contact
  Future<String> addContact(
    String customerId,
    CustomerContactModel contact,
  ) async {
    try {
      final response = await _dioClient.post(
        '/customer/account/$customerId/contacts',
        data: contact.toJson(),
      );

      return response.data['data']['id'] as String;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Supprime un contact
  Future<void> deleteContact(String customerId, String contactId) async {
    try {
      await _dioClient.delete(
        '/customer/account/$customerId/contacts/$contactId',
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==================== NOTIFICATIONS ====================

  /// Récupère les notifications
  Future<List<CustomerNotificationModel>> getNotifications({
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
      final queryParams = <String, dynamic>{
        'customer_id': customerId,
        if (type != null) 'type': type.name,
        if (isRead != null) 'is_read': isRead,
        if (priority != null) 'priority': priority.name,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      };

      final response = await _dioClient.get(
        '/customer/notifications',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data
          .map((json) => CustomerNotificationModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Récupère le nombre de notifications non lues
  Future<int> getUnreadNotificationsCount(String customerId) async {
    try {
      final response = await _dioClient.get(
        '/customer/notifications/unread/count',
        queryParameters: {'customer_id': customerId},
      );

      return response.data['data']['count'] as int;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Marque une notification comme lue
  Future<void> markNotificationAsRead(
    String customerId,
    String notificationId,
  ) async {
    try {
      await _dioClient.put(
        '/customer/notifications/$notificationId/read',
        data: {'customer_id': customerId},
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Marque toutes les notifications comme lues
  Future<int> markAllNotificationsAsRead(String customerId) async {
    try {
      final response = await _dioClient.put(
        '/customer/notifications/read-all',
        data: {'customer_id': customerId},
      );

      return response.data['data']['count'] as int;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Supprime une notification
  Future<void> deleteNotification(
    String customerId,
    String notificationId,
  ) async {
    try {
      await _dioClient.delete(
        '/customer/notifications/$notificationId',
        queryParameters: {'customer_id': customerId},
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Supprime toutes les notifications lues
  Future<int> deleteReadNotifications(String customerId) async {
    try {
      final response = await _dioClient.delete(
        '/customer/notifications/read',
        queryParameters: {'customer_id': customerId},
      );

      return response.data['data']['count'] as int;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==================== GESTION DES ERREURS ====================

  /// Gère les erreurs Dio
  Exception _handleError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return Exception('Délai d\'attente dépassé. Vérifiez votre connexion.');
    }

    if (error.type == DioExceptionType.connectionError) {
      return Exception(
          'Erreur de connexion. Vérifiez votre connexion internet.');
    }

    if (error.response != null) {
      final statusCode = error.response!.statusCode;
      final message = error.response!.data?['message'] ?? 'Erreur inconnue';

      switch (statusCode) {
        case 400:
          return Exception('Requête invalide: $message');
        case 401:
          return Exception('Non autorisé. Veuillez vous reconnecter.');
        case 403:
          return Exception('Accès refusé: $message');
        case 404:
          return Exception('Ressource non trouvée');
        case 500:
          return Exception('Erreur serveur. Réessayez plus tard.');
        default:
          return Exception('Erreur: $message');
      }
    }

    return Exception('Erreur réseau: ${error.message}');
  }
}
