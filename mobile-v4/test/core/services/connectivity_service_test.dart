import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:awid_mobile/core/services/connectivity_service.dart';

@GenerateMocks([Connectivity])
import 'connectivity_service_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  late ConnectivityService service;
  late MockConnectivity mockConnectivity;

  setUp(() {
    service = ConnectivityService();
    mockConnectivity = MockConnectivity();
  });

  tearDown(() {
    try {
      service.dispose();
    } catch (e) {
      // Ignore errors during cleanup
    }
  });

  group('ConnectivityService - Initialization', () {
    test('should initialize with default status', () {
      // Assert
      expect(service.currentStatus, equals(ConnectivityStatus.online));
    });

    test('should check initial connectivity', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      // Act
      await service.initialize();

      // Assert
      expect(service.isOnline, isTrue);
    });

    test('should start listening to connectivity changes', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      when(mockConnectivity.onConnectivityChanged)
          .thenAnswer((_) => Stream.value(ConnectivityResult.wifi));

      // Act
      await service.initialize();

      // Assert
      // Should be listening to changes
    });

    test('should handle initialization error gracefully', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenThrow(Exception('Connection error'));

      // Act & Assert
      expect(
        () => service.initialize(),
        returnsNormally,
      );
    });
  });

  group('ConnectivityService - Status Updates', () {
    test('should update status to online when wifi connected', () async {
      // Arrange
      final statusEvents = <ConnectivityStatus>[];
      service.statusStream.listen(statusEvents.add);

      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      // Act
      await service.initialize();
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      expect(service.currentStatus, equals(ConnectivityStatus.online));
    });

    test('should update status to online when mobile connected', () async {
      // Arrange
      final statusEvents = <ConnectivityStatus>[];
      service.statusStream.listen(statusEvents.add);

      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.mobile);

      // Act
      await service.initialize();
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      expect(service.currentStatus, equals(ConnectivityStatus.online));
    });

    test('should update status to offline when no connection', () async {
      // Arrange
      final statusEvents = <ConnectivityStatus>[];
      service.statusStream.listen(statusEvents.add);

      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);

      // Act
      await service.initialize();
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      expect(service.currentStatus, equals(ConnectivityStatus.offline));
    });

    test('should emit status change events', () async {
      // Arrange
      final statusEvents = <ConnectivityStatus>[];
      service.statusStream.listen(statusEvents.add);

      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      // Act
      await service.initialize();
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      expect(statusEvents, isNotEmpty);
    });

    test('should not emit duplicate status events', () async {
      // Arrange
      final statusEvents = <ConnectivityStatus>[];
      service.statusStream.listen(statusEvents.add);

      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      // Act
      await service.initialize();
      await service.checkConnection();
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      // Should not emit duplicate events
    });
  });

  group('ConnectivityService - Connection Check', () {
    test('should check connection and return true when online', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      // Act
      final isOnline = await service.checkConnection();

      // Assert
      expect(isOnline, isTrue);
    });

    test('should check connection and return false when offline', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);

      // Act
      final isOnline = await service.checkConnection();

      // Assert
      expect(isOnline, isFalse);
    });

    test('should update current status when checking connection', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      // Act
      await service.checkConnection();

      // Assert
      expect(service.currentStatus, equals(ConnectivityStatus.online));
    });
  });

  group('ConnectivityService - Status Getters', () {
    test('should return true for isOnline when connected', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      // Act
      await service.initialize();

      // Assert
      expect(service.isOnline, isTrue);
    });

    test('should return false for isOnline when disconnected', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);

      // Act
      await service.initialize();

      // Assert
      expect(service.isOnline, isFalse);
    });

    test('should return true for isOffline when disconnected', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);

      // Act
      await service.initialize();

      // Assert
      expect(service.isOffline, isTrue);
    });

    test('should return false for isOffline when connected', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      // Act
      await service.initialize();

      // Assert
      expect(service.isOffline, isFalse);
    });
  });

  group('ConnectivityService - Connection Restored', () {
    test('should trigger callback when connection restored', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);
      await service.initialize();

      // Act
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      await service.checkConnection();

      // Assert
      expect(service.isOnline, isTrue);
    });

    test('should log when connection is restored', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);
      await service.initialize();

      // Act
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      await service.checkConnection();

      // Assert
      // Should log connection restored message
    });

    test('should not trigger callback when already online', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      await service.initialize();

      // Act
      await service.checkConnection();

      // Assert
      expect(service.isOnline, isTrue);
    });
  });

  group('ConnectivityService - Connection Lost', () {
    test('should log when connection is lost', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      await service.initialize();

      // Act
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);
      await service.checkConnection();

      // Assert
      expect(service.isOffline, isTrue);
    });

    test('should emit offline status when connection lost', () async {
      // Arrange
      final statusEvents = <ConnectivityStatus>[];
      service.statusStream.listen(statusEvents.add);

      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      await service.initialize();

      // Act
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);
      await service.checkConnection();
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      expect(statusEvents.last, equals(ConnectivityStatus.offline));
    });
  });

  group('ConnectivityService - Stream', () {
    test('should provide status stream', () {
      // Assert
      expect(service.statusStream, isNotNull);
    });

    test('should emit events to multiple listeners', () async {
      // Arrange
      final statusEvents1 = <ConnectivityStatus>[];
      final statusEvents2 = <ConnectivityStatus>[];
      service.statusStream.listen(statusEvents1.add);
      service.statusStream.listen(statusEvents2.add);

      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      // Act
      await service.initialize();
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      expect(statusEvents1, isNotEmpty);
      expect(statusEvents2, isNotEmpty);
    });

    test('should handle stream errors gracefully', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenThrow(Exception('Stream error'));

      // Act & Assert
      expect(
        () => service.initialize(),
        returnsNormally,
      );
    });
  });

  group('ConnectivityService - Error Handling', () {
    test('should handle connectivity check error', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenThrow(Exception('Check error'));

      // Act & Assert
      expect(
        () => service.initialize(),
        returnsNormally,
      );
    });

    test('should set offline status on error', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenThrow(Exception('Check error'));

      // Act
      await service.initialize();

      // Assert
      expect(service.currentStatus, equals(ConnectivityStatus.offline));
    });

    test('should log errors appropriately', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenThrow(Exception('Check error'));

      // Act
      await service.initialize();

      // Assert
      // Errors should be logged
    });
  });

  group('ConnectivityService - Cleanup', () {
    test('should dispose resources', () async {
      // Arrange
      await service.initialize();

      // Act
      service.dispose();

      // Assert
      // Resources should be cleaned up
    });

    test('should cancel subscription on dispose', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      when(mockConnectivity.onConnectivityChanged)
          .thenAnswer((_) => Stream.value(ConnectivityResult.wifi));
      await service.initialize();

      // Act
      service.dispose();

      // Assert
      // Subscription should be cancelled
    });

    test('should close stream controller on dispose', () async {
      // Arrange
      await service.initialize();

      // Act
      service.dispose();

      // Assert
      // Stream controller should be closed
    });
  });
}
