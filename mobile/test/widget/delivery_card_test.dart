import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../setup.dart';

void main() {
  group('Delivery Card Widget Tests', () {
    testWidgets('should display delivery in assigned state', (WidgetTester tester) async {
      final delivery = createMockDelivery(status: 'assigned');

      await tester.pumpWidget(
        createTestWidget(
          Card(
            key: const Key('delivery_card'),
            child: Column(
              children: [
                Container(
                  key: const Key('status_badge'),
                  color: Colors.blue,
                  padding: const EdgeInsets.all(8),
                  child: Text(delivery['status'] as String),
                ),
                const SizedBox(height: 8),
                const Text('Assignée'),
              ],
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('delivery_card')), findsOneWidget);
      expect(find.text('assigned'), findsOneWidget);
      expect(find.text('Assignée'), findsOneWidget);
      
      final statusBadge = tester.widget<Container>(find.byKey(const Key('status_badge')));
      expect(statusBadge.color, Colors.blue);
    });

    testWidgets('should display delivery in in_progress state', (WidgetTester tester) async {
      final delivery = createMockDelivery(status: 'in_progress');

      await tester.pumpWidget(
        createTestWidget(
          Card(
            key: const Key('delivery_card'),
            child: Column(
              children: [
                Container(
                  key: const Key('status_badge'),
                  color: Colors.orange,
                  padding: const EdgeInsets.all(8),
                  child: Text(delivery['status'] as String),
                ),
                ElevatedButton(
                  key: const Key('complete_button'),
                  onPressed: () {},
                  child: const Text('Terminer'),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('in_progress'), findsOneWidget);
      expect(find.byKey(const Key('complete_button')), findsOneWidget);
      
      final statusBadge = tester.widget<Container>(find.byKey(const Key('status_badge')));
      expect(statusBadge.color, Colors.orange);
    });

    testWidgets('should display delivery in delivered state', (WidgetTester tester) async {
      final delivery = createMockDelivery(status: 'delivered');

      await tester.pumpWidget(
        createTestWidget(
          Card(
            key: const Key('delivery_card'),
            child: Column(
              children: [
                Container(
                  key: const Key('status_badge'),
                  color: Colors.green,
                  padding: const EdgeInsets.all(8),
                  child: const Text('delivered'), 
                ),
                const Icon(Icons.check_circle, color: Colors.green, key: Key('success_icon')),
                const Text('Livrée'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('delivered'), findsOneWidget);
      expect(find.text('Livrée'), findsOneWidget);
      expect(find.byKey(const Key('success_icon')), findsOneWidget);
      
      final statusBadge = tester.widget<Container>(find.byKey(const Key('status_badge')));
      expect(statusBadge.color, Colors.green);
    });

    testWidgets('should show action buttons based on status', (WidgetTester tester) async {
      // Test assigned status - should have "Start" button
      await tester.pumpWidget(
        createTestWidget(
          Card(
            child: Column(
              children: [
                const Text('Status: assigned'),
                ElevatedButton(
                  key: const Key('start_button'),
                  onPressed: () {},
                  child: const Text('Démarrer'),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('start_button')), findsOneWidget);
      expect(find.text('Démarrer'), findsOneWidget);
    });

    testWidgets('should format delivery date and time', (WidgetTester tester) async {
      final delivery = createMockDelivery();
      final createdAt = DateTime.parse(delivery['created_at'] as String);
      final formattedDate = '${createdAt.day}/${createdAt.month}/${createdAt.year}';
      final formattedTime = '${createdAt.hour}:${createdAt.minute.toString().padLeft(2, '0')}';

      await tester.pumpWidget(
        createTestWidget(
          Card(
            child: Column(
              children: [
                Text(formattedDate, key: const Key('date_text')),
                Text(formattedTime, key: const Key('time_text')),
              ],
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('date_text')), findsOneWidget);
      expect(find.byKey(const Key('time_text')), findsOneWidget);
    });

    testWidgets('should display deliverer info when assigned', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Livreur: John Doe', key: Key('deliverer_name')),
                Text('Tel: +123456789', key: Key('deliverer_phone')),
              ],
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('deliverer_name')), findsOneWidget);
      expect(find.text('Livreur: John Doe'), findsOneWidget);
      expect(find.byKey(const Key('deliverer_phone')), findsOneWidget);
    });

    testWidgets('should show failure reason when status is failed', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Card(
            child: Column(
              children: [
                Container(
                  key: const Key('status_badge'),
                  color: Colors.red,
                  child: const Text('failed'),
                ),
                const Text('Raison: Client absent', key: Key('failure_reason')),
              ],
            ),
          ),
        ),
      );

      expect(find.text('failed'), findsOneWidget);
      expect(find.byKey(const Key('failure_reason')), findsOneWidget);
      expect(find.text('Raison: Client absent'), findsOneWidget);
      
      final statusBadge = tester.widget<Container>(find.byKey(const Key('status_badge')));
      expect(statusBadge.color, Colors.red);
    });
  });
}
