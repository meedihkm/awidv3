import 'dart:async';
import 'package:awid_mobile/core/network/websocket_service.dart';
import 'package:awid_mobile/core/network/websocket_events.dart';

/// Datasource WebSocket pour le livreur
class DelivererWebSocketDatasource {
  final WebSocketService _webSocketService;

  DelivererWebSocketDatasource(this._webSocketService);

  /// Stream des mises à jour de livraison
  Stream<DeliveryUpdateEvent> watchDeliveryUpdates() {
    return _webSocketService.deliveryUpdates.handleError((error) {
      print('Error in delivery updates stream: $error');
    });
  }

  /// Stream des notifications
  Stream<NotificationEvent> watchNotifications() {
    return _webSocketService.notifications.handleError((error) {
      print('Error in notifications stream: $error');
    });
  }

  /// Rejoindre la room livreur
  void joinDelivererRoom(String delivererId) {
    _webSocketService.joinRoom('deliverer:$delivererId');
  }

  /// Quitter la room livreur
  void leaveDelivererRoom(String delivererId) {
    _webSocketService.leaveRoom('deliverer:$delivererId');
  }

  /// Émettre une mise à jour de position
  void emitLocationUpdate(String deliveryId, double latitude, double longitude) {
    _webSocketService.emit('deliverer:location:update', {
      'deliveryId': deliveryId,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Émettre une mise à jour de statut de livraison
  void emitDeliveryStatusUpdate(String deliveryId, String status) {
    _webSocketService.emit('deliverer:delivery:status', {
      'deliveryId': deliveryId,
      'status': status,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Émettre un événement de début de livraison
  void emitDeliveryStarted(String deliveryId) {
    _webSocketService.emit('deliverer:delivery:started', {
      'deliveryId': deliveryId,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Émettre un événement de livraison complétée
  void emitDeliveryCompleted(String deliveryId) {
    _webSocketService.emit('deliverer:delivery:completed', {
      'deliveryId': deliveryId,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }
}
