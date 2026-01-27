import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/customer_account_provider.dart';

/// Page Consignes Client
class CustomerPackagingPage extends ConsumerWidget {
  final String customerId;

  const CustomerPackagingPage({
    super.key,
    required this.customerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packagingInfoAsync = ref.watch(customerPackagingInfoProvider(customerId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Consignes'),
        elevation: 0,
      ),
      body: packagingInfoAsync.when(
        data: (packagingInfo) {
          if (packagingInfo == null) {
            return const Center(child: Text('Informations non disponibles'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Summary Card
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.inventory_2,
                        size: 48,
                        color: Colors.orange,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Solde Total',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        NumberFormat.currency(symbol: '€').format(packagingInfo.totalValue),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${packagingInfo.totalQuantity} consigne${packagingInfo.totalQuantity > 1 ? 's' : ''}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Items List
              const Text(
                'Détail par type',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (packagingInfo.items.isEmpty)
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Center(
                      child: Text('Aucune consigne en cours'),
                    ),
                  ),
                )
              else
                ...packagingInfo.items.map((item) => Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.inventory_2),
                        ),
                        title: Text(item.packagingName),
                        subtitle: Text(
                          'Valeur unitaire: ${NumberFormat.currency(symbol: '€').format(item.unitValue)}',
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'x${item.quantity}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(symbol: '€').format(item.totalValue),
                              style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              const SizedBox(height: 24),

              // Info Card
              Card(
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info, color: Colors.blue.shade700),
                          const SizedBox(width: 8),
                          const Text(
                            'Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Les consignes sont des emballages réutilisables. '
                        'Retournez-les lors de votre prochaine livraison pour récupérer leur valeur.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Erreur: $error')),
      ),
    );
  }
}
