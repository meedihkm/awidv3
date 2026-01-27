import 'package:flutter/material.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:awid_mobile/features/kitchen/presentation/widgets/kanban_card.dart';

/// Colonne du tableau Kanban
class KanbanColumn extends StatelessWidget {
  final String title;
  final KitchenOrderStatus status;
  final List<KitchenOrder> orders;
  final Color color;
  final Function(KitchenOrder) onOrderTap;
  final Function(KitchenOrder, KitchenOrderStatus) onOrderStatusChange;

  const KanbanColumn({
    super.key,
    required this.title,
    required this.status,
    required this.orders,
    required this.color,
    required this.onOrderTap,
    required this.onOrderStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header de la colonne
          _buildHeader(),
          const SizedBox(height: 8),

          // Liste des cartes
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: orders.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        return KanbanCard(
                          order: order,
                          onTap: () => onOrderTap(order),
                          onStatusChange: (newStatus) => onOrderStatusChange(order, newStatus),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  /// Header de la colonne
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              orders.length.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// État vide
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox,
            size: 48,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 8),
          Text(
            'Aucune commande',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
