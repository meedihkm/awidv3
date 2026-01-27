import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/customer_tracking_provider.dart';
import '../widgets/delivery_map.dart';

/// Page Suivi de Livraison en Temps Réel
class CustomerDeliveryTrackingPage extends ConsumerWidget {
  final String deliveryId;

  const CustomerDeliveryTrackingPage({
    super.key,
    required this.deliveryId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deliveryAsync = ref.watch(deliveryTrackingProvider(deliveryId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Suivi Livraison'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(deliveryTrackingProvider(deliveryId).notifier).refresh();
            },
          ),
        ],
      ),
      body: deliveryAsync.when(
        data: (delivery) => Column(
          children: [
            // Map
            DeliveryMapWidget(delivery: delivery),

            // Delivery Info
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Status Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                _getStatusIcon(delivery.status),
                                color: _getStatusColor(delivery.status),
                                size: 32,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      delivery.status.displayName,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      delivery.statusMessage,
                                      style: const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (delivery.estimatedArrival != null) ...[
                            const Divider(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Arrivée estimée'),
                                Text(
                                  delivery.estimatedTimeRemaining ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          if (delivery.distanceRemaining != null) ...[
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Distance restante'),
                                Text(
                                  delivery.distanceRemainingFormatted ?? '',
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Deliverer Info
                  Card(
                    child: ListTile(
                      leading: delivery.delivererPhoto != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(delivery.delivererPhoto!),
                            )
                          : const CircleAvatar(child: Icon(Icons.person)),
                      title: Text(delivery.delivererName),
                      subtitle: delivery.delivererPhone != null
                          ? Text(delivery.delivererPhone!)
                          : null,
                      trailing: delivery.delivererPhone != null
                          ? IconButton(
                              icon: const Icon(Icons.phone),
                              onPressed: () {
                                // TODO: Call deliverer
                              },
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Orders Info
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Détails',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildInfoRow('Numéro', delivery.deliveryNumber),
                          _buildInfoRow('Commandes', '${delivery.ordersCount}'),
                          _buildInfoRow('Montant', delivery.totalAmountFormatted),
                          _buildInfoRow('Adresse', delivery.deliveryAddress),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Erreur: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(deliveryTrackingProvider(deliveryId).notifier).refresh();
                },
                child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getStatusIcon(status) {
    switch (status.toString()) {
      case 'DeliveryStatus.inProgress':
        return Icons.local_shipping;
      case 'DeliveryStatus.nearDestination':
        return Icons.near_me;
      case 'DeliveryStatus.arrived':
        return Icons.check_circle;
      default:
        return Icons.info;
    }
  }

  Color _getStatusColor(status) {
    switch (status.toString()) {
      case 'DeliveryStatus.inProgress':
        return Colors.blue;
      case 'DeliveryStatus.nearDestination':
        return Colors.orange;
      case 'DeliveryStatus.arrived':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
