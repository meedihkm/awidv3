import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:awid_mobile/core/network/websocket_events.dart';
import 'package:awid_mobile/core/config/api_config.dart';

/// Service WebSocket centralisé
class WebSocketService {
  static final WebSocketService _instance = WebSocketService._internal();
  factory WebSocketService() => _instance;
  WebSocketService._internal();

  IO.Socket? _socket;
  bool _isConnected = false;
  String? _userId;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  static const int _maxReconnectAttempts = 5;
  static const Duration _reconnectDelay = Duration(seconds: 3);

  // Streams pour les événements
  final _orderUpdatesController = StreamController<OrderUpdateEvent>.broadcast();
  final _deliveryUpdatesController = StreamController<DeliveryUpdateEvent>.broadcast();
  final _stockAlertsController = StreamController<StockAlertEvent>.broadcast();
  final _notificationsController = StreamController<NotificationEvent>.broadcast();
  final _connectionStatusController = StreamController<bool>.broadcast();

  // Getters pour les streams
  Stream<OrderUpdateEvent> get orderUpdates => _orderUpdatesController.stream;
  Stream<DeliveryUpdateEvent> get deliveryUpdates => _deliveryUpdatesController.stream;
  Stream<StockAlertEvent> get stockAlerts => _stockAlertsController.stream;
  Stream<NotificationEvent> get notifications => _notificationsController.stream;
  Stream<bool> get connectionStatus => _connectionStatusController.stream;

  bool get isConnected => _isConnected;

  /// Initialiser la connexion WebSocket
  Future<void> connect(String userId, String token) async {
    if (_isConnected) {
      return;
    }

    _userId = userId;

    try {
      _socket = IO.io(
        ApiConfig.wsUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .enableReconnection()
            .setReconnectionAttempts(_maxReconnectAttempts)
            .setReconnectionDelay(_reconnectDelay.inMilliseconds)
            .setAuth({'token': token})
            .build(),
      );

      _setupEventHandlers();
      _socket!.connect();
    } catch (e) {
      print('WebSocket connection error: $e');
      _scheduleReconnect();
    }
  }

  /// Configurer les gestionnaires d'événements
  void _setupEventHandlers() {
    if (_socket == null) return;

    // Événements de connexion
    _socket!.onConnect((_) {
      print('WebSocket connected');
      _isConnected = true;
      _reconnectAttempts = 0;
      if (!_connectionStatusController.isClosed) {
        _connectionStatusController.add(true);
      }
      _joinUserRoom();
    });

    _socket!.onDisconnect((_) {
      print('WebSocket disconnected');
      _isConnected = false;
      if (!_connectionStatusController.isClosed) {
        _connectionStatusController.add(false);
      }
      _scheduleReconnect();
    });

    _socket!.onConnectError((error) {
      print('WebSocket connection error: $error');
      _isConnected = false;
      if (!_connectionStatusController.isClosed) {
        _connectionStatusController.add(false);
      }
    });

    _socket!.onError((error) {
      print('WebSocket error: $error');
    });

    // Événements métier
    _socket!.on('order:updated', (data) {
      try {
        final event = OrderUpdateEvent.fromJson(data);
        if (!_orderUpdatesController.isClosed) {
          _orderUpdatesController.add(event);
        }
      } catch (e) {
        print('Error parsing order update: $e');
      }
    });

    _socket!.on('delivery:updated', (data) {
      try {
        final event = DeliveryUpdateEvent.fromJson(data);
        if (!_deliveryUpdatesController.isClosed) {
          _deliveryUpdatesController.add(event);
        }
      } catch (e) {
        print('Error parsing delivery update: $e');
      }
    });

    _socket!.on('stock:alert', (data) {
      try {
        final event = StockAlertEvent.fromJson(data);
        if (!_stockAlertsController.isClosed) {
          _stockAlertsController.add(event);
        }
      } catch (e) {
        print('Error parsing stock alert: $e');
      }
    });

    _socket!.on('notification', (data) {
      try {
        final event = NotificationEvent.fromJson(data);
        if (!_notificationsController.isClosed) {
          _notificationsController.add(event);
        }
      } catch (e) {
        print('Error parsing notification: $e');
      }
    });

    // Heartbeat
    _socket!.on('pong', (_) {
      // Réponse au ping
    });
  }

  /// Rejoindre la room de l'utilisateur
  void _joinUserRoom() {
    if (_userId != null && _socket != null) {
      _socket!.emit('join:user', {'userId': _userId});
    }
  }

  /// Planifier une reconnexion
  void _scheduleReconnect() {
    if (_reconnectAttempts >= _maxReconnectAttempts) {
      print('Max reconnection attempts reached');
      return;
    }

    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(_reconnectDelay, () {
      _reconnectAttempts++;
      print('Reconnecting... Attempt $_reconnectAttempts');
      _socket?.connect();
    });
  }

  /// Émettre un événement
  void emit(String event, dynamic data) {
    if (_socket != null && _isConnected) {
      _socket!.emit(event, data);
    } else {
      print('Cannot emit event: WebSocket not connected');
    }
  }

  /// S'abonner à une room spécifique
  void joinRoom(String room) {
    emit('join:room', {'room': room});
  }

  /// Se désabonner d'une room
  void leaveRoom(String room) {
    emit('leave:room', {'room': room});
  }

  /// Envoyer un ping
  void ping() {
    emit('ping', {});
  }

  /// Déconnecter
  void disconnect() {
    _reconnectTimer?.cancel();
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
    _isConnected = false;
    _userId = null;
    _reconnectAttempts = 0;
    if (!_connectionStatusController.isClosed) {
      _connectionStatusController.add(false);
    }
  }

  /// Nettoyer les ressources
  void dispose() {
    disconnect();
    _orderUpdatesController.close();
    _deliveryUpdatesController.close();
    _stockAlertsController.close();
    _notificationsController.close();
    _connectionStatusController.close();
  }
}
