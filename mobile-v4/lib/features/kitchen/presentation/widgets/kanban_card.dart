import 'package:flutter/material.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:awid_mobile/features/kitchen/presentation/widgets/priority_badge.dart';
import 'package:awid_mobile/features/kitchen/presentation/widgets/order_timer.dart';

/// Carte de commande dans le Kanban
class KanbanCard extends StatelessWidget {
  final KitchenOrder order;
  final VoidCallback onTap;
  final Function(KitchenOrderStatus) onStatusChange;

  const KanbanCard({
    super.key,
    required this.order,
    required this.onTap,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Numéro + Priorité
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      order.orderNumber,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  PriorityBadge(priority: order.priority),
                ],
              ),
              const SizedBox(height: 8),

              // Client
              Row(
                children: [
                  const Icon(Icons.person, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      order.customerName,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Nombre d'articles
              Row(
                children: [
                  const Icon(Icons.shopping_basket, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    '${order.items.length} article(s)',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              // Timer si en cours
              if (order.status == KitchenOrderStatus.preparing ||
                  order.status == KitchenOrderStatus.pending)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: OrderTimer(order: order),
                ),

              // Indicateurs
              if (order.isUrgent || order.isLate || order.specialInstructions != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      if (order.isUrgent)
                        _buildIndicator('URGENT', Colors.red),
                      if (order.isLate)
                        _buildIndicator('EN RETARD', Colors.orange),
                      if (order.specialInstructions != null)
                        _buildIndicator('INSTRUCTIONS', Colors.blue),
                    ],
                  ),
                ),

              // Actions rapides
              if (order.canStart || order.canMarkReady || order.canComplete)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      if (order.canStart)
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => onStatusChange(KitchenOrderStatus.preparing),
                            icon: const Icon(Icons.play_arrow, size: 16),
                            label: const Text('Démarrer', style: TextStyle(fontSize: 12)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                            ),
                          ),
                        ),
                      if (order.canMarkReady)
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => onStatusChange(KitchenOrderStatus.ready),
                            icon: const Icon(Icons.check, size: 16),
                            label: const Text('Prêt', style: TextStyle(fontSize: 12)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                            ),
                          ),
                        ),
                      if (order.canComplete)
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => onStatusChange(KitchenOrderStatus.completed),
                            icon: const Icon(Icons.done_all, size: 16),
                            label: const Text('Livré', style: TextStyle(fontSize: 12)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Indicateur (badge)
  Widget _buildIndicator(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
