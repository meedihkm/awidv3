import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/delivery.dart';
import '../providers/deliverer_provider.dart';

/// Page détails d'une livraison
class DeliveryDetailPage extends ConsumerWidget {
  const DeliveryDetailPage({
    required this.deliveryId,
    super.key,
  });
  final String deliveryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // TODO: Créer un provider pour récupérer une livraison par ID
    // Pour l'instant, on simule avec les données de la liste
    final deliveriesState = ref.watch(deliveriesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails Livraison'),
        actions: [
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              // TODO: Navigation vers carte
            },
            tooltip: 'Voir sur la carte',
          ),
        ],
      ),
      body: deliveriesState.when(
        data: (deliveries) {
          final delivery = deliveries.firstWhere(
            (d) => d.id == deliveryId,
            orElse: () => deliveries.first,
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Card
                _HeaderCard(delivery: delivery),
                const SizedBox(height: 16),

                // Client Info
                _SectionCard(
                  title: 'Informations Client',
                  icon: Icons.person,
                  children: [
                    _InfoRow(
                      label: 'Nom',
                      value: delivery.customerName,
                    ),
                    _InfoRow(
                      label: 'Téléphone',
                      value: delivery.customerPhone,
                      trailing: IconButton(
                        icon: const Icon(Icons.phone),
                        onPressed: () {
                          // TODO: Appeler le client
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Delivery Info
                _SectionCard(
                  title: 'Informations Livraison',
                  icon: Icons.local_shipping,
                  children: [
                    _InfoRow(
                      label: 'Adresse',
                      value: delivery.deliveryAddress,
                    ),
                    if (delivery.scheduledFor != null)
                      _InfoRow(
                        label: 'Heure prévue',
                        value: _formatDateTime(delivery.scheduledFor!),
                      ),
                    if (delivery.specialInstructions != null)
                      _InfoRow(
                        label: 'Instructions',
                        value: delivery.specialInstructions!,
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                // Order Info
                _SectionCard(
                  title: 'Détails Commande',
                  icon: Icons.shopping_bag,
                  children: [
                    _InfoRow(
                      label: 'Numéro',
                      value: '#${delivery.orderNumber}',
                    ),
                    _InfoRow(
                      label: 'Articles',
                      value: '${delivery.itemsCount} article${delivery.itemsCount > 1 ? 's' : ''}',
                    ),
                    _InfoRow(
                      label: 'Montant',
                      value: '${delivery.totalAmount.toStringAsFixed(2)} DA',
                      valueStyle: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Actions
                if (delivery.canBeStarted)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Démarrer la livraison'),
                      onPressed: () async {
                        await ref.read(deliveryActionsNotifierProvider.notifier).startDelivery(deliveryId);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Livraison démarrée'),
                            ),
                          );
                        }
                      },
                    ),
                  ),

                if (delivery.isInProgress)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.check_circle),
                      label: const Text('Marquer comme livrée'),
                      onPressed: () async {
                        // TODO: Navigation vers page de preuve de livraison
                        await ref.read(deliveryActionsNotifierProvider.notifier).completeDelivery(deliveryId);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Livraison complétée'),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text('Erreur: $error'),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} à ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}

/// Widget card header avec statut
class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.delivery});
  final Delivery delivery;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor(context);

    return Card(
      color: statusColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getStatusIcon(),
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        delivery.status.displayName,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: statusColor,
                        ),
                      ),
                      Text(
                        'Commande #${delivery.orderNumber}',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (delivery.isLate) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber,
                      color: theme.colorScheme.error,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Cette livraison est en retard',
                      style: TextStyle(
                        color: theme.colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(BuildContext context) {
    final theme = Theme.of(context);
    switch (delivery.status) {
      case DeliveryStatus.pending:
      case DeliveryStatus.assigned:
        return Colors.orange;
      case DeliveryStatus.pickedUp:
      case DeliveryStatus.inTransit:
        return theme.colorScheme.primary;
      case DeliveryStatus.delivered:
      case DeliveryStatus.completed:
        return Colors.green;
      case DeliveryStatus.cancelled:
      case DeliveryStatus.failed:
        return theme.colorScheme.error;
    }
  }

  IconData _getStatusIcon() {
    switch (delivery.status) {
      case DeliveryStatus.pending:
      case DeliveryStatus.assigned:
        return Icons.schedule;
      case DeliveryStatus.pickedUp:
        return Icons.shopping_bag;
      case DeliveryStatus.inTransit:
        return Icons.local_shipping;
      case DeliveryStatus.delivered:
      case DeliveryStatus.completed:
        return Icons.check_circle;
      case DeliveryStatus.cancelled:
      case DeliveryStatus.failed:
        return Icons.cancel;
    }
  }
}

/// Widget section card
class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.icon,
    required this.children,
  });
  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// Widget info row
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.valueStyle,
    this.trailing,
  });
  final String label;
  final String value;
  final TextStyle? valueStyle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: valueStyle ?? theme.textTheme.bodyMedium,
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
