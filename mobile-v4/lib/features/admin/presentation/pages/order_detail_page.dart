import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../providers/orders_provider.dart';
import '../providers/users_provider.dart';

/// Order Detail Page
/// Page de détails d'une commande avec actions
class OrderDetailPage extends ConsumerWidget {
  const OrderDetailPage({required this.orderId, super.key});

  final String orderId;

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'confirmed':
        return Colors.blue;
      case 'preparing':
        return Colors.purple;
      case 'ready':
        return Colors.cyan;
      case 'in_delivery':
        return Colors.indigo;
      case 'delivered':
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(orderDetailProvider(orderId));

    return Scaffold(
      appBar: AppBar(title: const Text('Détails de la commande')),
      body: orderAsync.when(
        data: (order) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Header
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
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Chip(
                            label: Text(order.statusDisplayName),
                            backgroundColor: _getStatusColor(order.status).withOpacity(0.2),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(Formatters.dateTime(order.createdAt), style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Customer Info
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Client',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(order.customerName),
                        subtitle: Text(order.organizationName),
                      ),
                      if (order.deliveryAddress != null) ...[
                        const Divider(),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 20),
                            const SizedBox(width: 8),
                            Expanded(child: Text(order.deliveryAddress!)),
                          ],
                        ),
                      ],
                      if (order.deliveryInstructions != null) ...[
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.info_outline, size: 20),
                            const SizedBox(width: 8),
                            Expanded(child: Text(order.deliveryInstructions!)),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Deliverer Info
              if (order.delivererId != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Livreur',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(Icons.delivery_dining, color: Colors.white),
                          ),
                          title: Text(order.delivererName ?? 'N/A'),
                        ),
                      ],
                    ),
                  ),
                ),
              if (order.delivererId != null) const SizedBox(height: 16),

              // Items List
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Articles (${order.totalItems})',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      ...order.items.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.productName, style: const TextStyle(fontWeight: FontWeight.w500)),
                                    Text(
                                      '${item.quantity} x ${Formatters.currency(item.unitPrice)}',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                Formatters.currency(item.totalPrice),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      _buildPriceRow(context, 'Sous-total', order.subtotal),
                      _buildPriceRow(context, 'Frais de livraison', order.deliveryFee),
                      const Divider(),
                      _buildPriceRow(context, 'Total', order.totalAmount, isBold: true),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Payment Info
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Paiement',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [const Text('Méthode'), Text(order.paymentMethod ?? 'Non défini')],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Statut'),
                          Chip(
                            label: Text(order.paymentStatusDisplay),
                            backgroundColor: _getPaymentStatusColor(order.paymentStatus).withOpacity(0.2),
                            padding: EdgeInsets.zero,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Actions
              if (order.canBeAssigned || order.canBeCancelled)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (order.canBeAssigned)
                          ElevatedButton.icon(
                            onPressed: () => _showAssignDelivererDialog(context, ref, order.id),
                            icon: const Icon(Icons.person_add),
                            label: const Text('Assigner un livreur'),
                          ),
                        if (order.canBeCancelled) ...[
                          const SizedBox(height: 8),
                          OutlinedButton.icon(
                            onPressed: () => _showCancelOrderDialog(context, ref, order.id),
                            icon: const Icon(Icons.cancel),
                            label: const Text('Annuler la commande'),
                            style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        loading: () => const LoadingWidget(message: 'Chargement de la commande...'),
        error: (error, stack) => ErrorDisplayWidget(
          message: 'Erreur de chargement de la commande',
          onRetry: () {
            ref.invalidate(orderDetailProvider(orderId));
          },
        ),
      ),
    );
  }

  Widget _buildPriceRow(BuildContext context, String label, double amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(Formatters.currency(amount), style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Color _getPaymentStatusColor(String? status) {
    switch (status) {
      case 'paid':
        return Colors.green;
      case 'partial':
        return Colors.orange;
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Future<void> _showAssignDelivererDialog(BuildContext context, WidgetRef ref, String orderId) async {
    final deliverersAsync = ref.read(deliverersProvider);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Assigner un livreur'),
        content: deliverersAsync.when(
          data: (deliverers) {
            if (deliverers.isEmpty) {
              return const Text('Aucun livreur disponible');
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: deliverers.map((deliverer) {
                return ListTile(
                  leading: CircleAvatar(child: Text(deliverer.initials)),
                  title: Text(deliverer.fullName),
                  subtitle: Text(deliverer.phone),
                  onTap: () async {
                    Navigator.pop(context);
                    await ref
                        .read(orderActionsProvider.notifier)
                        .assignDeliverer(orderId: orderId, delivererId: deliverer.id);
                    ref.invalidate(orderDetailProvider(orderId));
                  },
                );
              }).toList(),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (_, __) => const Text('Erreur de chargement'),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Annuler'))],
      ),
    );
  }

  Future<void> _showCancelOrderDialog(BuildContext context, WidgetRef ref, String orderId) async {
    final reasonController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Annuler la commande'),
        content: TextField(
          controller: reasonController,
          decoration: const InputDecoration(labelText: 'Raison de l\'annulation', border: OutlineInputBorder()),
          maxLines: 3,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Annuler')),
          ElevatedButton(
            onPressed: () async {
              if (reasonController.text.trim().isEmpty) {
                return;
              }

              Navigator.pop(context);
              await ref
                  .read(orderActionsProvider.notifier)
                  .cancelOrder(orderId: orderId, reason: reasonController.text);
              ref.invalidate(orderDetailProvider(orderId));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
  }
}
