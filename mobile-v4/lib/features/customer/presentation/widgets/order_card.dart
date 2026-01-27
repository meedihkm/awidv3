import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/customer_order.dart';

/// Widget Carte de Commande
/// Affiche un résumé d'une commande dans une carte
class OrderCardWidget extends StatelessWidget {
  final CustomerOrder order;
  final VoidCallback? onTap;

  const OrderCardWidget({
    super.key,
    required this.order,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Commande #${order.orderNumber}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  _buildStatusChip(order.status),
                ],
              ),
              const SizedBox(height: 12),

              // Date
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    order.orderDateFormatted,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Items count
              Row(
                children: [
                  const Icon(Icons.shopping_bag, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    '${order.itemsCount} article${order.itemsCount > 1 ? 's' : ''}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Amount and Payment Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Montant total',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        order.totalAmountFormatted,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  if (!order.isPaid)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: order.isPartiallyPaid
                            ? Colors.orange.withOpacity(0.1)
                            : Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: order.isPartiallyPaid ? Colors.orange : Colors.red,
                        ),
                      ),
                      child: Text(
                        order.paymentStatus,
                        style: TextStyle(
                          color: order.isPartiallyPaid ? Colors.orange : Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),

              // Remaining amount if partially paid
              if (order.isPartiallyPaid) ...[
                const SizedBox(height: 8),
                Text(
                  'Reste à payer: ${order.remainingAmountFormatted}',
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(OrderStatus status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getStatusColor(status).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _getStatusColor(status)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            status.icon,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(width: 4),
          Text(
            status.displayName,
            style: TextStyle(
              color: _getStatusColor(status),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.confirmed:
        return Colors.blue;
      case OrderStatus.preparing:
        return Colors.purple;
      case OrderStatus.ready:
        return Colors.green;
      case OrderStatus.inDelivery:
        return Colors.teal;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
      case OrderStatus.failed:
        return Colors.red;
    }
  }
}
