import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

import '../providers/customer_account_provider.dart';
import '../widgets/credit_indicator.dart';

/// Page Crédit Client
class CustomerCreditPage extends ConsumerWidget {
  final String customerId;

  const CustomerCreditPage({
    super.key,
    required this.customerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditInfoAsync = ref.watch(customerCreditInfoProvider(customerId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Crédit'),
        elevation: 0,
      ),
      body: creditInfoAsync.when(
        data: (creditInfo) {
          if (creditInfo == null) {
            return const Center(child: Text('Informations non disponibles'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Credit Indicator
              CreditIndicatorWidget(creditInfo: creditInfo),
              const SizedBox(height: 24),

              // Chart
              const Text(
                'Évolution',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: creditInfo.currentBalance,
                            title: 'Dette',
                            color: Colors.red,
                            radius: 60,
                          ),
                          PieChartSectionData(
                            value: creditInfo.availableCredit,
                            title: 'Disponible',
                            color: Colors.green,
                            radius: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Actions
              const Text(
                'Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.history),
                      title: const Text('Historique des paiements'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // TODO: Navigate to payment history
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.receipt),
                      title: const Text('Factures impayées'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // TODO: Navigate to unpaid invoices
                      },
                    ),
                  ],
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
