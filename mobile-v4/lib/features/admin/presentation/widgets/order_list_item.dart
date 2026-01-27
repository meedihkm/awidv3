import 'package:flutter/material.dart';

import '../../../../core/config/theme_config.dart';
import '../../../../core/utils/formatters.dart';
import '../../domain/entities/order_summary.dart';

/// Order List Item Widget
/// Item de liste pour une commande
class OrderListItem extends StatelessWidget {
  const OrderListItem({required this.order, super.key, this.onTap});
  final OrderSummary order;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(),
          child: Icon(_getStatusIcon(), color: Colors.white, size: 20),
        ),
        title: Text(order.customerName, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(order.customerOrganization),
            const SizedBox(height: 2),
            Text(
              '${order.itemsCount} articles • ${Formatters.relativeTime(order.createdAt)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              Formatters.currency(order.totalAmount),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: _getStatusColor().withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _getStatusLabel(),
                style: TextStyle(color: _getStatusColor(), fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  Color _getStatusColor() {
    switch (order.status) {
      case 'pending':
        return ThemeConfig.warningColor;
      case 'confirmed':
      case 'preparing':
        return ThemeConfig.infoColor;
      case 'ready':
      case 'in_delivery':
        return ThemeConfig.primaryColor;
      case 'delivered':
        return ThemeConfig.successColor;
      case 'cancelled':
        return ThemeConfig.errorColor;
      default:
        return ThemeConfig.textSecondaryColor;
    }
  }

  IconData _getStatusIcon() {
    switch (order.status) {
      case 'pending':
        return Icons.schedule;
      case 'confirmed':
        return Icons.check_circle_outline;
      case 'preparing':
        return Icons.restaurant;
      case 'ready':
        return Icons.done_all;
      case 'in_delivery':
        return Icons.local_shipping;
      case 'delivered':
        return Icons.check_circle;
      case 'cancelled':
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }

  String _getStatusLabel() {
    switch (order.status) {
      case 'pending':
        return 'En attente';
      case 'confirmed':
        return 'Confirmée';
      case 'preparing':
        return 'En préparation';
      case 'ready':
        return 'Prête';
      case 'in_delivery':
        return 'En livraison';
      case 'delivered':
        return 'Livrée';
      case 'cancelled':
        return 'Annulée';
      default:
        return order.status;
    }
  }
}
