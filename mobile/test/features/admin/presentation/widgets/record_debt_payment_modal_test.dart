import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:awid/core/models/debt_model.dart';
import 'package:awid/core/services/api_service.dart';
import 'package:awid/features/admin/presentation/widgets/record_debt_payment_modal.dart';

class MockApiService extends ApiService {
  MockApiService() : super.forTesting();

  bool recordPaymentCalled = false;
  Map<String, dynamic>? lastPaymentData;
  bool shouldThrowError = false;

  @override
  Future<Map<String, dynamic>> recordDebtPayment(Map<String, dynamic> paymentData) async {
    recordPaymentCalled = true;
    lastPaymentData = paymentData;
    
    if (shouldThrowError) {
      throw ApiException(400, "Erreur test");
    }
    
    return {'success': true};
  }
}

void main() {
  late MockApiService mockApi;
  late CustomerDebt testDebt;

  setUp(() {
    mockApi = MockApiService();
    testDebt = CustomerDebt(
      customerId: 'cust123',
      customerName: 'Test Client',
      totalDebt: 5000.0,
      unpaidOrders: 5,
    );
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => RecordDebtPaymentModal(
                  debt: testDebt,
                  onSuccess: () {},
                  apiService: mockApi,
                ),
              );
            },
            child: Text('Open'),
          ),
        ),
      ),
    );
  }

  testWidgets('RecordDebtPaymentModal verifies valid input and submits', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    
    // Open modal
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    // Verify UI elements
    expect(find.text('Recouvrer une dette'), findsOneWidget);
    expect(find.textContaining('Test Client'), findsOneWidget);
    expect(find.textContaining('5000'), findsOneWidget);

    // Enter Amount
    await tester.enterText(find.byType(TextFormField).first, '1000');
    await tester.pump();

    // Enter Note
    await tester.enterText(find.byType(TextFormField).last, 'Test Note');
    await tester.pump();

    // Tap Submit
    await tester.tap(find.text('Enregistrer le paiement'));
    await tester.pump(); // Start loading
    await tester.pump(); // Finish future

    // Verify API called
    expect(mockApi.recordPaymentCalled, true);
    expect(mockApi.lastPaymentData!['customer_id'], 'cust123');
    expect(mockApi.lastPaymentData!['amount'], 1000.0);
    expect(mockApi.lastPaymentData!['note'], 'Test Note');
    expect(mockApi.lastPaymentData!['payment_type'], 'cash'); // Default
  });

  testWidgets('RecordDebtPaymentModal validates amount > debt', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    
    // Open modal
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    // Enter Amount > Debt (6000 > 5000)
    await tester.enterText(find.byType(TextFormField).first, '6000');
    await tester.pump();

    // Tap Submit
    await tester.tap(find.text('Enregistrer le paiement'));
    await tester.pump();

    // Verify Error Message
    expect(find.text('Supérieur à la dette'), findsOneWidget);
    expect(mockApi.recordPaymentCalled, false);
  });

  testWidgets('RecordDebtPaymentModal handles API error', (WidgetTester tester) async {
    mockApi.shouldThrowError = true;
    await tester.pumpWidget(createTestWidget());
    
    // Open modal
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    // Valid Input
    await tester.enterText(find.byType(TextFormField).first, '1000');
    
    // Submit
    await tester.tap(find.text('Enregistrer le paiement'));
    await tester.pump(); // Start future
    await tester.pump(); // Complete future

    // Verify Error SnackBar
    expect(find.textContaining('Erreur test'), findsOneWidget);
    
    // Verify Modal still open (title still visible)
    expect(find.text('Recouvrer une dette'), findsOneWidget);
  });
}
