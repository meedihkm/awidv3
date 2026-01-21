import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import '../setup.dart';

void main() {
  group('Golden Tests', () {
    testGoldens('Login Page Golden Test', (tester) async {
      final loginPage = MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF43A047), Color(0xFF1B5E20)],
              ),
            ),
            child: Center(
              child: Card(
                margin: const EdgeInsets.all(24),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.local_shipping, size: 56, color: Color(0xFF2E7D32)),
                      const SizedBox(height: 16),
                      const Text('Awid', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 32),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E7D32),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          child: const Text('Se connecter', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpWidgetBuilder(loginPage);
      await screenMatchesGolden(tester, 'login_page_normal');
    });

    testGoldens('Login Page with Error Golden Test', (tester) async {
      final loginPageWithError = MaterialApp(
        home: Scaffold(
          body: Center(
            child: Card(
              margin: const EdgeInsets.all(24),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.local_shipping, size: 56, color: Color(0xFF2E7D32)),
                    const SizedBox(height: 16),
                    const Text('Awid', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.error, color: Colors.red),
                          SizedBox(width: 8),
                          Expanded(child: Text('Email ou mot de passe incorrect')),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: 'Email invalide',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpWidgetBuilder(loginPageWithError);
      await screenMatchesGolden(tester, 'login_page_with_error');
    });

    testGoldens('Order Card States Golden Test', (tester) async {
      final orderCards = MaterialApp(
        home: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Pending Order
              Card(
                child: ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.pending, color: Colors.orange),
                  ),
                  title: const Text('Commande #123'),
                  subtitle: const Text('Status: En attente'),
                  trailing: const Chip(
                    label: Text('Pending'),
                    backgroundColor: Colors.orange,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Delivered Order
              Card(
                child: ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check_circle, color: Colors.green),
                  ),
                  title: const Text('Commande #124'),
                  subtitle: const Text('Status: Livrée'),
                  trailing: const Chip(
                    label: Text('Delivered'),
                    backgroundColor: Colors.green,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidgetBuilder(orderCards);
      await screenMatchesGolden(tester, 'order_cards_states');
    });

    testGoldens('Delivery Card States Golden Test', (tester) async {
      final deliveryCards = MaterialApp(
        home: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Assigned
              _buildDeliveryCard('Assignée', Colors.blue, Icons.assignment),
              const SizedBox(height: 8),
              // In Progress
              _buildDeliveryCard('En cours', Colors.orange, Icons.local_shipping),
              const SizedBox(height: 8),
              // Delivered
              _buildDeliveryCard('Livrée', Colors.green, Icons.check_circle),
            ],
          ),
        ),
      );

      await tester.pumpWidgetBuilder(deliveryCards);
      await screenMatchesGolden(tester, 'delivery_cards_states');
    });
  });
}

Widget _buildDeliveryCard(String status, Color color, IconData icon) {
  return Card(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Livraison #456', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(status, style: TextStyle(color: color)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Note: To update golden files, run:
// flutter test --update-goldens
//
// To verify goldens match:
// flutter test
