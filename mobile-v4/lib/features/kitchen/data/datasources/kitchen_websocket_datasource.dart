import 'dart:async';
import 'package:awid_mobile/core/network/websocket_service.dart';
import 'package:awid_mobile/core/network/websocket_events.dart';
import 'package:awid_mobile/features/kitchen/data/models/kitchen_order_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/stock_item_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/kitchen_stats_model.dart';

/// Datasource WebSocket pour la cuisine
class KitchenWebSocketDatasource {
  final WebSocketService _webSocketService;

  KitchenWebSocketDatasource(this._webSocketService);

  /// Stream des mises à jour de commandes
  Stream<KitchenOrderModel> watchOrderUpdates() {
    return _webSocketService.orderUpdates.map((event) {
      // Convertir l'événement en model
      return KitchenOrderModel.fromJson(event.data ?? {});
    }).handleError((error) {
      print('Error in kitchen order updates stream: $error');
    });
  }

  /// Stream des alertes de stock
  Stream<StockAlertModel> watchStockAlerts() {
    return _webSocketService.stockAlerts.map((event) {
      return StockAlertModel(
        id: event.stockItemId,
        stockItemId: event.stockItemId,
        productName: event.productName,
        type: event.alertType,
        severity: event.severity,
        createdAt: event.timestamp.toIso8601String(),
        message: 'Stock: ${event.currentQuantity}',
      );
    }).handleError((error) {
      print('Error in stock alerts stream: $error');
    });
  }

  /// Stream des statistiques en temps réel
  Stream<KitchenStatsModel> watchStats() {
    // Créer un stream controller pour les stats
    final controller = StreamController<KitchenStatsModel>();

    // Écouter les mises à jour de commandes pour recalculer les stats
    _webSocketService.orderUpdates.listen((event) {
      // TODO: Recalculer les stats et émettre
      // Pour l'instant, on ne fait rien
    });

    return controller.stream;
  }

  /// Rejoindre la room cuisine
  void joinKitchenRoom(String kitchenId) {
    _webSocketService.joinRoom('kitchen:$kitchenId');
  }

  /// Quitter la room cuisine
  void leaveKitchenRoom(String kitchenId) {
    _webSocketService.leaveRoom('kitchen:$kitchenId');
  }

  /// Émettre un événement de mise à jour de commande
  void emitOrderUpdate(String orderId, String status) {
    _webSocketService.emit('kitchen:order:update', {
      'orderId': orderId,
      'status': status,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Émettre un événement de mise à jour de stock
  void emitStockUpdate(String stockItemId, double quantity) {
    _webSocketService.emit('kitchen:stock:update', {
      'stockItemId': stockItemId,
      'quantity': quantity,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }
}
