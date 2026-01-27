import 'dart:async';
import 'package:awid_mobile/core/network/websocket_service.dart';
import 'package:awid_mobile/core/network/websocket_events.dart';

/// Datasource WebSocket pour le client
class CustomerWebSocketDatasource {
  final WebSocketService _webSocketService;

  CustomerWebSocketDatasource(this._webSocketService);

  /// Stream des mises à jour de commande
  Stream<OrderUpdateEvent> watchOrderUpdates() {
    return _webSocketService.orderUpdates.handleError((error) {
      print('Error in customer order updates stream: $error');
    });
  }

  /// Stream des mises à jour de livraison
  Stream<DeliveryUpdateEvent> watchDeliveryUpdates() {
    return _webSocketService.deliveryUpdates.handleError((error) {
      print('Error in customer delivery updates stream: $error');
    });
  }

  /// Stream des notifications
  Stream<NotificationEvent> watchNotifications() {
    return _webSocketService.notifications.handleError((error) {
      print('Error in customer notifications stream: $error');
    });
  }

  /// Rejoindre la room client
  void joinCustomerRoom(String customerId) {
    _webSocketService.joinRoom('customer:$customerId');
  }

  /// Quitter la room client
  void leaveCustomerRoom(String customerId) {
    _webSocketService.leaveRoom('customer:$customerId');
  }

  /// Rejoindre la room de suivi de livraison
  void joinDeliveryTrackingRoom(String deliveryId) {
    _webSocketService.joinRoom('delivery:$deliveryId');
  }

  /// Quitter la room de suivi de livraison
  void leaveDeliveryTrackingRoom(String deliveryId) {
    _webSocketService.leaveRoom('delivery:$deliveryId');
  }

  /// Émettre un événement de lecture de notification
  void emitNotificationRead(String notificationId) {
    _webSocketService.emit('customer:notification:read', {
      'notificationId': notificationId,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }
}
