import 'package:flutter/material.dart';

import '../../domain/entities/delivery.dart';

/// Widget card pour afficher une livraison
class DeliveryCard extends StatelessWidget {
  const DeliveryCard({
    required this.delivery,
    super.key,
    this.onTap,
  });
  final Delivery delivery;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final priorityColor = _getPriorityColor(context);
    final statusColor = _getStatusColor(context);

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Numéro + Statut
              Row(
                children: [
                  // Icône priorité
                  if (delivery.priorityLevel > 0)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: priorityColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        Icons.priority_high,
                        size: 16,
                        color: priorityColor,
                      ),
                    ),
                  if (delivery.priorityLevel > 0) const SizedBox(width: 8),

                  // Numéro commande
                  Expanded(
                    child: Text(
                      'Commande #${delivery.orderNumber}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Badge statut
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      delivery.statusDisplayName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Client
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      delivery.customerName,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Adresse
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      delivery.deliveryAddress,
                      style: theme.textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Heure programmée
              if (delivery.scheduledFor != null)
                Row(
                  children: [
                    Icon(
                      delivery.isLate ? Icons.warning_amber : Icons.schedule,
                      size: 16,
                      color: delivery.isLate ? theme.colorScheme.error : theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatScheduledTime(delivery.scheduledFor!),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: delivery.isLate ? theme.colorScheme.error : null,
                      ),
                    ),
                    if (delivery.isLate) ...[
                      const SizedBox(width: 4),
                      Text(
                        '(En retard)',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),

              const Divider(height: 24),

              // Footer: Articles + Montant
              Row(
                children: [
                  // Nombre d'articles
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${delivery.itemsCount ?? 0} article${(delivery.itemsCount ?? 0) > 1 ? 's' : ''}',
                    style: theme.textTheme.bodySmall,
                  ),

                  const Spacer(),

                  // Montant
                  Text(
                    '${delivery.totalAmount.toStringAsFixed(2)} DA',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),

              // Instructions spéciales
              if (delivery.deliveryInstructions != null && delivery.deliveryInstructions!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          delivery.deliveryInstructions!,
                          style: theme.textTheme.bodySmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getPriorityColor(BuildContext context) {
    final theme = Theme.of(context);
    switch (delivery.priorityLevel) {
      case 3: // Urgent
        return theme.colorScheme.error;
      case 2: // Prioritaire
        return Colors.orange;
      case 1: // Moyen
        return Colors.amber;
      default: // Normal
        return theme.colorScheme.primary;
    }
  }

  Color _getStatusColor(BuildContext context) {
    final theme = Theme.of(context);
    switch (delivery.status) {
      case 'pending':
      case 'assigned':
        return Colors.orange;
      case 'picked_up':
      case 'in_transit':
        return theme.colorScheme.primary;
      case 'delivered':
      case 'completed':
        return Colors.green;
      case 'cancelled':
      case 'failed':
        return theme.colorScheme.error;
      default:
        return Colors.grey;
    }
  }

  String _formatScheduledTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = dateTime.difference(now);

    if (difference.isNegative) {
      return 'Prévu à ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    }

    if (difference.inHours < 1) {
      return 'Dans ${difference.inMinutes} min';
    }

    if (difference.inHours < 24) {
      return 'Dans ${difference.inHours}h ${difference.inMinutes % 60}min';
    }

    return '${dateTime.day}/${dateTime.month} à ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
