import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/customer_orders_provider.dart';

/// Page Détail de Commande Client
class CustomerOrderDetailPage extends ConsumerWidget {
  final String orderId;

  const CustomerOrderDetailPage({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(customerOrderProvider(orderId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail Commande'),
        elevation: 0,
      ),
      body: orderAsync.when(
        data: (order) {
          if (order == null) {
            return const Center(child: Text('Commande non trouvée'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Header Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Commande #${order.orderNumber}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          _buildStatusChip(order.status),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildInfoRow(Icons.calendar_today, 'Date',
                          order.orderDateFormatted),
                      if (order.deliveryDate != null)
                        _buildInfoRow(Icons.local_shipping, 'Livraison prévue',
                            order.deliveryDateFormatted!),
                      if (order.delivererName != null)
                        _buildInfoRow(Icons.person, 'Livreur',
                            order.delivererName!),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Items List
              const Text(
                'Articles',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...order.items.map((item) => Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: item.productImage != null
                          ? Image.network(item.productImage!,
                              width: 50, height: 50, fit: BoxFit.cover)
                          : const Icon(Icons.inventory_2, size: 50),
                      title: Text(item.productName),
                      subtitle: Text('${item.quantity} x ${item.unitPriceFormatted}'),
                      trailing: Text(
                        item.totalPriceFormatted,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 16),

              // Totals Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildTotalRow('Sous-total', order.subtotal),
                      _buildTotalRow('Frais de livraison', order.deliveryFee),
                      _buildTotalRow('Consignes', order.packagingDeposit),
                      const Divider(height: 24),
                      _buildTotalRow('Total', order.totalAmount, isBold: true),
                      if (!order.isPaid) ...[
                        const Divider(height: 24),
                        _buildTotalRow('Payé', order.paidAmount,
                            color: Colors.green),
                        _buildTotalRow('Reste à payer', order.remainingAmount,
                            color: Colors.red, isBold: true),
                      ],
                    ],
                  ),
                ),
              ),

              // Notes
              if (order.notes != null && order.notes!.isNotEmpty) ...[
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Notes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(order.notes!),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Erreur: $error'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue),
      ),
      child: Text(
        status.displayName,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, double amount,
      {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 16 : 14,
            ),
          ),
          Text(
            NumberFormat.currency(symbol: '€').format(amount),
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              fontSize: isBold ? 18 : 14,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
