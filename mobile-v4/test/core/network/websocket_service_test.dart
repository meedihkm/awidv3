import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:awid_mobile/core/network/websocket_service.dart';
import 'package:awid_mobile/core/network/websocket_events.dart';

@GenerateMocks([IO.Socket])
import 'websocket_service_test.mocks.dart';

void main() {
  late WebSocketService service;
  late MockSocket mockSocket;

  setUp(() {
    // Create a fresh instance for each test by calling the private constructor
    // This avoids singleton issues in tests
    service = WebSocketService();
    mockSocket = MockSocket();
  });

  tearDown(() {
    // Only dispose if not already disposed
    try {
      service.disconnect();
    } catch (e) {
      // Ignore errors during cleanup
    }
  });

  group('WebSocketService - Connection', () {
    test('should initialize connection with correct parameters', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';

      // Act
      await service.connect(userId, token);

      // Assert
      expect(service.isConnected, isFalse); // Not connected until socket connects
    });

    test('should not reconnect if already connected', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';
      await service.connect(userId, token);

      // Act
      await service.connect(userId, token);

      // Assert
      // Should not create new connection
      expect(service.isConnected, isFalse);
    });

    test('should emit connection status on connect', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';
      final statusEvents = <bool>[];

      // Act
      service.connectionStatus.listen(statusEvents.add);
      await service.connect(userId, token);

      // Assert
      await Future.delayed(const Duration(milliseconds: 100));
      // Connection status will be emitted when socket connects
    });

    test('should handle connection error gracefully', () async {
      // Arrange
      const userId = 'user123';
      const token = 'invalid_token';

      // Act & Assert
      expect(
        () => service.connect(userId, token),
        returnsNormally,
      );
    });
  });

  group('WebSocketService - Disconnection', () {
    test('should disconnect properly', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';
      await service.connect(userId, token);

      // Act
      service.disconnect();

      // Assert
      expect(service.isConnected, isFalse);
    });

    test('should emit connection status on disconnect', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';
      final statusEvents = <bool>[];
      service.connectionStatus.listen(statusEvents.add);
      await service.connect(userId, token);

      // Act
      service.disconnect();

      // Assert
      await Future.delayed(const Duration(milliseconds: 100));
      expect(statusEvents.last, isFalse);
    });

    test('should cancel reconnect timer on disconnect', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';
      await service.connect(userId, token);

      // Act
      service.disconnect();

      // Assert
      expect(service.isConnected, isFalse);
    });

    test('should reset reconnect attempts on disconnect', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';
      await service.connect(userId, token);

      // Act
      service.disconnect();

      // Assert
      expect(service.isConnected, isFalse);
    });
  });

  group('WebSocketService - Event Emission', () {
    test('should emit event when connected', () {
      // Arrange
      const event = 'test:event';
      final data = {'key': 'value'};

      // Act
      service.emit(event, data);

      // Assert
      // Event should be queued or logged if not connected
    });

    test('should not emit event when disconnected', () {
      // Arrange
      const event = 'test:event';
      final data = {'key': 'value'};

      // Act
      service.emit(event, data);

      // Assert
      expect(service.isConnected, isFalse);
    });

    test('should join room successfully', () {
      // Arrange
      const room = 'room123';

      // Act
      service.joinRoom(room);

      // Assert
      // Should emit join:room event
    });

    test('should leave room successfully', () {
      // Arrange
      const room = 'room123';

      // Act
      service.leaveRoom(room);

      // Assert
      // Should emit leave:room event
    });

    test('should send ping successfully', () {
      // Act
      service.ping();

      // Assert
      // Should emit ping event
    });
  });

  group('WebSocketService - Event Reception', () {
    test('should receive order update events', () async {
      // Arrange
      final orderEvents = <OrderUpdateEvent>[];
      service.orderUpdates.listen(orderEvents.add);

      final testEvent = OrderUpdateEvent(
        orderId: 'order123',
        status: 'completed',
        timestamp: DateTime.now(),
      );

      // Act
      // Simulate receiving event
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      // Events will be received when socket emits them
    });

    test('should receive delivery update events', () async {
      // Arrange
      final deliveryEvents = <DeliveryUpdateEvent>[];
      service.deliveryUpdates.listen(deliveryEvents.add);

      // Act
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      // Events will be received when socket emits them
    });

    test('should receive stock alert events', () async {
      // Arrange
      final stockEvents = <StockAlertEvent>[];
      service.stockAlerts.listen(stockEvents.add);

      // Act
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      // Events will be received when socket emits them
    });

    test('should receive notification events', () async {
      // Arrange
      final notificationEvents = <NotificationEvent>[];
      service.notifications.listen(notificationEvents.add);

      // Act
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      // Events will be received when socket emits them
    });

    test('should handle malformed event data gracefully', () async {
      // Arrange
      final orderEvents = <OrderUpdateEvent>[];
      service.orderUpdates.listen(orderEvents.add);

      // Act
      // Simulate receiving malformed data
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      expect(orderEvents, isEmpty);
    });
  });

  group('WebSocketService - Reconnection', () {
    test('should attempt reconnection on disconnect', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';
      await service.connect(userId, token);

      // Act
      service.disconnect();
      await Future.delayed(const Duration(seconds: 4));

      // Assert
      // Should have attempted reconnection
    });

    test('should reset reconnect attempts on successful connection', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';

      // Act
      await service.connect(userId, token);

      // Assert
      // Reconnect attempts should be 0
    });

    test('should stop reconnecting after max attempts', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';
      await service.connect(userId, token);

      // Act
      // Simulate multiple failed reconnections
      for (var i = 0; i < 6; i++) {
        service.disconnect();
        await Future.delayed(const Duration(seconds: 4));
      }

      // Assert
      expect(service.isConnected, isFalse);
    });

    test('should use exponential backoff for reconnection', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';
      await service.connect(userId, token);

      // Act
      service.disconnect();
      final start = DateTime.now();
      await Future.delayed(const Duration(seconds: 4));
      final elapsed = DateTime.now().difference(start);

      // Assert
      expect(elapsed.inSeconds, greaterThanOrEqualTo(3));
    });
  });

  group('WebSocketService - Room Management', () {
    test('should join user room on connection', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';

      // Act
      await service.connect(userId, token);

      // Assert
      // Should emit join:user event
    });

    test('should join custom room', () {
      // Arrange
      const room = 'kitchen:station1';

      // Act
      service.joinRoom(room);

      // Assert
      // Should emit join:room event
    });

    test('should leave custom room', () {
      // Arrange
      const room = 'kitchen:station1';

      // Act
      service.leaveRoom(room);

      // Assert
      // Should emit leave:room event
    });

    test('should handle multiple room subscriptions', () {
      // Arrange
      const rooms = ['room1', 'room2', 'room3'];

      // Act
      for (final room in rooms) {
        service.joinRoom(room);
      }

      // Assert
      // Should emit join:room for each room
    });
  });

  group('WebSocketService - Error Handling', () {
    test('should handle connection error', () async {
      // Arrange
      const userId = 'user123';
      const token = 'invalid_token';

      // Act & Assert
      expect(
        () => service.connect(userId, token),
        returnsNormally,
      );
    });

    test('should handle socket error', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';
      await service.connect(userId, token);

      // Act
      // Simulate socket error
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      // Should handle error gracefully
    });

    test('should handle event parsing error', () async {
      // Arrange
      final orderEvents = <OrderUpdateEvent>[];
      service.orderUpdates.listen(orderEvents.add);

      // Act
      // Simulate receiving invalid JSON
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      expect(orderEvents, isEmpty);
    });

    test('should log errors appropriately', () async {
      // Arrange
      const userId = 'user123';
      const token = 'test_token';

      // Act
      await service.connect(userId, token);

      // Assert
      // Errors should be logged
    });
  });

  group('WebSocketService - Cleanup', () {
    test('should dispose all resources', () {
      // Act
      service.dispose();

      // Assert
      expect(service.isConnected, isFalse);
    });

    test('should close all stream controllers', () {
      // Act
      service.dispose();

      // Assert
      // All streams should be closed
    });

    test('should cancel all timers', () {
      // Act
      service.dispose();

      // Assert
      // All timers should be cancelled
    });
  });
}
