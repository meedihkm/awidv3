import 'package:socket_io_client/socket_io_client.dart' as io;

import '../config/api_config.dart';
import '../constants/api_constants.dart';
import '../constants/storage_keys.dart';
import '../storage/secure_storage.dart';

/// WebSocket Client
/// Client Socket.io pour les communications temps réel
class WebSocketClient {
  io.Socket? _socket;
  final SecureStorage _secureStorage = SecureStorage();
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  /// Connect to WebSocket server
  Future<void> connect() async {
    if (_socket != null && _isConnected) {
      return;
    }

    final accessToken = await _secureStorage.read(StorageKeys.accessToken);

    _socket = io.io(
      ApiConfig.wsUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .enableReconnection()
          .setReconnectionDelay(1000)
          .setReconnectionDelayMax(5000)
          .setReconnectionAttempts(5)
          .setAuth({'token': accessToken})
          .build(),
    );

    _socket!.onConnect((_) {
      _isConnected = true;
      print('✅ WebSocket connected');
    });

    _socket!.onDisconnect((_) {
      _isConnected = false;
      print('❌ WebSocket disconnected');
    });

    _socket!.onError((error) {
      print('❌ WebSocket error: $error');
    });

    _socket!.connect();
  }

  /// Disconnect from WebSocket server
  void disconnect() {
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
    _isConnected = false;
  }

  /// Emit event
  void emit(String event, dynamic data) {
    if (_socket != null && _isConnected) {
      _socket!.emit(event, data);
    }
  }

  /// Listen to event
  void on(String event, Function(dynamic) callback) {
    _socket?.on(event, callback);
  }

  /// Remove listener
  void off(String event) {
    _socket?.off(event);
  }

  /// Join room
  void joinRoom(String room) {
    emit('join', {'room': room});
  }

  /// Leave room
  void leaveRoom(String room) {
    emit('leave', {'room': room});
  }

  /// Listen to order events
  void listenToOrders(Function(dynamic) callback) {
    on(ApiConstants.wsEventOrderCreated, callback);
    on(ApiConstants.wsEventOrderUpdated, callback);
  }

  /// Listen to delivery events
  void listenToDeliveries(Function(dynamic) callback) {
    on(ApiConstants.wsEventDeliveryUpdated, callback);
  }

  /// Listen to location updates
  void listenToLocation(Function(dynamic) callback) {
    on(ApiConstants.wsEventLocationUpdated, callback);
  }

  /// Listen to stats updates
  void listenToStats(Function(dynamic) callback) {
    on(ApiConstants.wsEventStatsUpdated, callback);
  }

  /// Send location update
  void sendLocationUpdate(double latitude, double longitude) {
    emit('location:update', {
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }
}
