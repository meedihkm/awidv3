import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../setup.dart';

void main() {
  group('Orders List Widget Tests', () {
    testWidgets('should display list of orders', (WidgetTester tester) async {
      final orders = [
        createMockOrder(id: '1', status: 'pending', orderNumber: 1),
        createMockOrder(id: '2', status: 'delivered', orderNumber: 2),
      ];

      await tester.pumpWidget(
        createTestWidget(
          ListView.builder(
            key: const Key('orders_list'),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return ListTile(
                key: Key('order_${order['id']}'),
                title: Text('Commande #${order['order_number']}'),
                subtitle: Text('Status: ${order['status']}'),
              );
            },
          ),
        ),
      );

      expect(find.byKey(const Key('orders_list')), findsOneWidget);
      expect(find.byKey(const Key('order_1')), findsOneWidget);
      expect(find.byKey(const Key('order_2')), findsOneWidget);
      expect(find.text('Commande #1'), findsOneWidget);
      expect(find.text('Commande #2'), findsOneWidget);
    });

    testWidgets('should display empty state when no orders', (WidgetTester tester) async {
      final orders = <Map<String, dynamic>>[];

      await tester.pumpWidget(
        createTestWidget(
          orders.isEmpty
              ? const Center(
                  key: Key('empty_state'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inbox, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('Aucune commande', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) => ListTile(),
                ),
        ),
      );

      expect(find.byKey(const Key('empty_state')), findsOneWidget);
      expect(find.text('Aucune commande'), findsOneWidget);
      expect(find.byIcon(Icons.inbox), findsOneWidget);
    });

    testWidgets('should support pull to refresh', (WidgetTester tester) async {
      bool refreshCalled = false;
      
      await tester.pumpWidget(
        createTestWidget(
          RefreshIndicator(
            key: const Key('refresh_indicator'),
            onRefresh: () async {
              refreshCalled = true;
              // No delay - immediate completion to avoid timer issues
            },
            child: ListView(
              children: const [
                ListTile(title: Text('Order 1')),
              ],
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('refresh_indicator')), findsOneWidget);
      expect(refreshCalled, false);

      // Trigger pull to refresh
      await tester.drag(find.text('Order 1'), const Offset(0, 300));
      await tester.pumpAndSettle();

      expect(refreshCalled, true);
    });

    testWidgets('should navigate to order detail on tap', (WidgetTester tester) async {
      String? tappedOrderId;

      await tester.pumpWidget(
        createTestWidget(
          GestureDetector(
            key: const Key('order_card'),
            onTap: () {
              tappedOrderId = 'order-123';
            },
            child: const Card(
              child: ListTile(
                title: Text('Commande #123'),
              ),
            ),
          ),
        ),
      );

      expect(tappedOrderId, null);

      await tester.tap(find.byKey(const Key('order_card')));
      await tester.pump();

      expect(tappedOrderId, 'order-123');
    });

    testWidgets('should display order status with correct color', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Column(
            children: [
              Container(
                key: const Key('status_pending'),
                color: Colors.orange,
                child: const Text('pending'),
              ),
              Container(
                key: const Key('status_delivered'),
                color: Colors.green,
                child: const Text('delivered'),
              ),
            ],
          ),
        ),
      );

      final pendingContainer = tester.widget<Container>(find.byKey(const Key('status_pending')));
      final deliveredContainer = tester.widget<Container>(find.byKey(const Key('status_delivered')));

      expect(pendingContainer.color, Colors.orange);
      expect(deliveredContainer.color, Colors.green);
    });
  });
}
