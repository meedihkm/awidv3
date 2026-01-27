import 'package:flutter/material.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';

/// Badge de priorité pour une commande
class PriorityBadge extends StatelessWidget {
  final OrderPriority priority;
  final bool showLabel;

  const PriorityBadge({
    super.key,
    required this.priority,
    this.showLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    IconData icon;
    String label;

    switch (priority) {
      case OrderPriority.urgent:
        color = Colors.red;
        icon = Icons.priority_high;
        label = 'URGENT';
        break;
      case OrderPriority.high:
        color = Colors.orange;
        icon = Icons.arrow_upward;
        label = 'HAUTE';
        break;
      case OrderPriority.normal:
        color = Colors.blue;
        icon = Icons.remove;
        label = 'NORMALE';
        break;
      case OrderPriority.low:
        color = Colors.grey;
        icon = Icons.arrow_downward;
        label = 'BASSE';
        break;
    }

    if (showLabel) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: color),
    );
  }
}
