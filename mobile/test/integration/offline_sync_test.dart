import 'package:flutter_test/flutter_test.dart';
import 'package:awid/core/database/sync_service.dart';
import 'package:awid/core/services/api_service.dart';
import 'package:awid/core/database/hive_service.dart';

class MockApiService extends ApiService {
  MockApiService() : super.forTesting();

  bool createOrderCalled = false;
  Map<String, dynamic>? lastOrderData;
  bool updateDeliveryCalled = false;
  Map<String, dynamic>? lastDeliveryUpdate;
  bool shouldThrowConflict = false;

  @override
  Future<Map<String, dynamic>> createOrder(Map<String, dynamic> order) async {
    createOrderCalled = true;
    lastOrderData = order;
    return {'success': true, 'data': {'id': '123'}};
  }

  @override
  Future<Map<String, dynamic>> updateDeliveryStatus(String id, Map<String, dynamic> status) async {
    updateDeliveryCalled = true;
    if (shouldThrowConflict) {
      throw ApiException(409, 'Conflict');
    }
    lastDeliveryUpdate = status;
    return {'success': true};
  }
}

class MockHiveService extends HiveService {
  MockHiveService() : super.forTesting();

  Map<dynamic, Map<dynamic, dynamic>> actionsMap = {};
  int _counter = 0;
  
  @override
  Future<void> addOfflineAction(String type, Map<String, dynamic> payload) async {
    final key = _counter++;
    actionsMap[key] = {'type': type, 'payload': payload, 'status': 'pending'};
  }
  
  @override
  Map<dynamic, Map<dynamic, dynamic>> getPendingActionsMap() {
    return actionsMap;
  }

  @override
  Future<int> getPendingActionsCount() async {
    return actionsMap.length;
  }
  
  @override
  Future<void> deleteActionByKey(dynamic key) async {
    actionsMap.remove(key);
  }
  
  @override
   Future<void> updateAction(dynamic key, Map<String, dynamic> action) async {
     actionsMap[key] = action;
   }
}

void main() {
  late SyncService syncService;
  late MockApiService mockApi;
  late MockHiveService mockHive;

  setUp(() {
    mockApi = MockApiService();
    mockHive = MockHiveService();
    syncService = SyncService();
    
    // Inject mocks
    syncService.apiService = mockApi;
    syncService.hiveService = mockHive;
    syncService.isOnline = true; // Ensure sync can process
  });

  test('SyncService: CREATE_ORDER action sent to API and removed from queue', () async {
    // Act
    await syncService.addOfflineAction('CREATE_ORDER', {'items': []});
    
    // Assert
    expect(mockApi.createOrderCalled, true, reason: 'API createOrder should be called');
    expect(mockHive.actionsMap.isEmpty, true, reason: 'Queue should be empty after sync');
  });
  
  test('SyncService: UPDATE_DELIVERY processes correctly and cleans payload', () async {
    // Act
    final payload = {'deliveryId': 'del123', 'status': 'delivered'};
    await syncService.addOfflineAction('UPDATE_DELIVERY', payload);
    
    // Assert
    expect(mockApi.updateDeliveryCalled, true);
    expect(mockApi.lastDeliveryUpdate!['status'], 'delivered');
    expect(mockApi.lastDeliveryUpdate!.containsKey('deliveryId'), false, reason: 'deliveryId should be stripped from API payload');
    expect(mockHive.actionsMap.isEmpty, true);
  });

  test('SyncService: Conflict (409) marks action as needs_review and keeps it', () async {
    // Arrange
    mockApi.shouldThrowConflict = true;
    final payload = {'deliveryId': 'del123', 'status': 'delivered'};

    // Act
    await syncService.addOfflineAction('UPDATE_DELIVERY', payload);
    
    // Assert
    expect(mockApi.updateDeliveryCalled, true);
    expect(mockHive.actionsMap.isNotEmpty, true, reason: 'Action should NOT be deleted on conflict');
    final action = mockHive.actionsMap.values.first;
    expect(action['status'], 'needs_review', reason: 'Action status should be updated to needs_review');
  });
}
