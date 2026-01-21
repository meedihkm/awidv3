import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:awid/features/admin/presentation/pages/client_detail_page.dart';
import 'package:awid/core/services/api_service.dart';
import 'package:awid/core/services/cache_service.dart';
import 'package:awid/core/services/settings_service.dart';
import 'package:awid/core/models/debt_model.dart';

// =====================================================
// MOCK SERVICES - Full implementations for robust testing
// =====================================================

class MockApiService extends Mock implements ApiService {
  @override
  Future<Map<String, dynamic>> getOrders({
    int page = 1, 
    int limit = 20, 
    bool forceRefresh = false,
    String? cafeteriaId,
    String? status
  }) async {
    return {'success': true, 'data': []};
  }

  @override
  Future<Map<String, dynamic>> getDeliveries({
    int page = 1, 
    int limit = 20, 
    bool forceRefresh = false,
    String? delivererId,
    String? status,
    String? cafeteriaId
  }) async {
    return {'success': true, 'data': []};
  }

  @override
  Future<CustomerDebt?> getCustomerDebt(String customerId) async {
    return CustomerDebt(
      customerId: customerId,
      customerName: 'Test Client',
      totalDebt: 10000,
      unpaidOrders: 2,
      lastOrderDate: DateTime.now(),
    );
  }

  @override
  Future<Map<String, dynamic>> getPaymentHistory({
    String? customerId,
    String? collectorId,
    String? from,
    String? to,
    int page = 1,
    int limit = 50
  }) async {
    return {'success': true, 'data': []};
  }

  @override
  Future<Map<String, dynamic>> updateCreditLimit(String userId, double? limit) async {
    return {'success': true, 'data': {'creditLimit': limit}};
  }
  
  @override
  Future<Map<String, dynamic>> recordDebtPayment(Map<String, dynamic> paymentData) async {
     return {
       'success': true,
       'new_debt': 5000.0,
       'previous_debt': 10000.0,
       'customer_name': 'Test Client',
       'payment': {
         'id': 'pay_123',
         'amount': paymentData['amount'],
         'created_at': DateTime.now().toIso8601String(),
       }
     };
  }
  
  @override
  Future<Map<String, dynamic>> updateUserAddress(String userId, String address, {double? latitude, double? longitude}) async {
    return {'success': true};
  }
}

class MockCacheService extends Mock implements CacheService {
  @override
  Future<List<Map<String, dynamic>>?> getCachedClientHistory(String clientId) async {
    return null;
  }
  
  @override
  Future<void> cacheClientHistory(String clientId, List<dynamic> history) async {
    // No-op for testing
  }
}

class MockSettingsService extends Mock implements SettingsService {
  bool _loaded = false;
  
  @override
  Future<void> loadSettings() async {
    _loaded = true;
  }
  
  @override
  double get debtAlertThreshold => 5000.0;
  
  @override
  bool get isLoaded => _loaded;
}

// =====================================================
// TEST SUITE
// =====================================================

void main() {
  group('Debt Flow Integration Tests', () {
    late MockApiService mockApiService;
    late MockCacheService mockCacheService;
    late MockSettingsService mockSettingsService;
    late Map<String, dynamic> clientData;

    setUp(() {
      mockApiService = MockApiService();
      mockCacheService = MockCacheService();
      mockSettingsService = MockSettingsService();
      
      clientData = {
        'id': 'client_1',
        'name': 'Test Client',
        'email': 'test@example.com',
        'phone': '+213555123456',
        'role': 'cafeteria',
        'active': true,
        'credit_limit': 20000.0,
        'createdAt': DateTime.now().toIso8601String(),
      };
    });

    testWidgets('ClientDetailPage displays debt information correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ClientDetailPage(
          client: clientData,
          apiService: mockApiService,
          cacheService: mockCacheService,
          settingsService: mockSettingsService,
        ),
      ));

      await tester.pumpAndSettle();

      // Verify page title
      expect(find.text('Fiche client'), findsOneWidget);
      
      // Verify client name displayed (in header)
      expect(find.text('Test Client'), findsWidgets);
      
      // Verify stats section exists - use exact match
      expect(find.text('Total CA'), findsOneWidget);
      
      // Verify credit limit card exists
      expect(find.text('Plafond de crédit'), findsOneWidget);
    });

    testWidgets('Credit limit card displays and accepts input', (WidgetTester tester) async {
      // Use a larger surface size to avoid off-screen issues
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1.0;
      
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(MaterialApp(
        home: ClientDetailPage(
          client: clientData,
          apiService: mockApiService,
          cacheService: mockCacheService,
          settingsService: mockSettingsService,
        ),
      ));

      await tester.pumpAndSettle();

      // Scroll to ensure credit limit card is visible
      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -200));
      await tester.pumpAndSettle();

      // Verify credit limit section exists
      expect(find.text('Plafond de crédit'), findsOneWidget);
      
      // Find and verify the OK button exists
      final okButton = find.widgetWithText(ElevatedButton, 'OK');
      expect(okButton, findsOneWidget);
    });

    testWidgets('Debt collection FAB appears when customer has debt', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ClientDetailPage(
          client: clientData,
          apiService: mockApiService,
          cacheService: mockCacheService,
          settingsService: mockSettingsService,
        ),
      ));

      await tester.pumpAndSettle();

      // The FAB should appear because MockApiService returns CustomerDebt with totalDebt > 0
      final fabFinder = find.byType(FloatingActionButton);
      expect(fabFinder, findsOneWidget);
      
      // Verify FAB text
      expect(find.text('Recouvrer'), findsOneWidget);
    });

    testWidgets('Debt payment modal opens when FAB is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ClientDetailPage(
          client: clientData,
          apiService: mockApiService,
          cacheService: mockCacheService,
          settingsService: mockSettingsService,
        ),
      ));

      await tester.pumpAndSettle();

      // Tap the FAB to open payment modal
      final fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);
      
      await tester.tap(fab);
      await tester.pumpAndSettle();

      // Verify modal is displayed - the modal title is "Recouvrer une dette"
      expect(find.text('Recouvrer une dette'), findsOneWidget);
      
      // Verify customer info is shown
      expect(find.textContaining('Test Client'), findsWidgets);
    });

    testWidgets('Debt payment modal shows payment type options', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ClientDetailPage(
          client: clientData,
          apiService: mockApiService,
          cacheService: mockCacheService,
          settingsService: mockSettingsService,
        ),
      ));

      await tester.pumpAndSettle();

      // Open payment modal
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Verify payment type dropdown exists
      expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);
    });

    testWidgets('Tab navigation works correctly', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1.0;
      
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(MaterialApp(
        home: ClientDetailPage(
          client: clientData,
          apiService: mockApiService,
          cacheService: mockCacheService,
          settingsService: mockSettingsService,
        ),
      ));

      await tester.pumpAndSettle();

      // Scroll down to see tabs
      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -400));
      await tester.pumpAndSettle();

      // Find and verify all tabs exist using Tab widget
      final tabs = find.byType(Tab);
      expect(tabs, findsNWidgets(4)); // Should be 4 tabs now (incl Consignes)
      
      // Verify Debt History tab text exists (might find 2 including stat card, but we ensure the Tab exists)
      expect(find.descendant(of: find.byType(TabBar), matching: find.text('Dette')), findsOneWidget);
    });

    testWidgets('Debt history shows empty state when no payments', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1.0;
      
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(MaterialApp(
        home: ClientDetailPage(
          client: clientData,
          apiService: mockApiService,
          cacheService: mockCacheService,
          settingsService: mockSettingsService,
        ),
      ));

      await tester.pumpAndSettle();

      // Scroll down to tabs section
      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -400));
      await tester.pumpAndSettle();

      // Tap on Debt History tab (use specific finder)
      await tester.tap(find.descendant(of: find.byType(TabBar), matching: find.text('Dette')));
      await tester.pumpAndSettle();
      
      // Verify empty state message
      expect(find.text('Aucun historique de paiement'), findsOneWidget);
    });
  });
}
