import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:awid_mobile/features/kitchen/presentation/providers/kitchen_orders_provider.dart';
import 'package:awid_mobile/features/kitchen/presentation/widgets/priority_badge.dart';
import 'package:awid_mobile/features/kitchen/presentation/widgets/order_timer.dart';

/// Page de détail d'une commande
class OrderDetailPage extends ConsumerWidget {
  final String orderId;

  const OrderDetailPage({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(kitchenOrderProvider(orderId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail de la commande'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(kitchenOrderProvider(orderId)),
          ),
        ],
      ),
      body: orderAsync.when(
        data: (order) => _buildOrderDetail(context, ref, order),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
              const SizedBox(height: 16),
              Text('Erreur: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(kitchenOrderProvider(orderId)),
                child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderDetail(BuildContext context, WidgetRef ref, KitchenOrder order) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header avec numéro et statut
          _buildHeader(order),

          // Informations principales
          _buildMainInfo(order),

          // Timer
          if (order.status == KitchenOrderStatus.preparing ||
              order.status == KitchenOrderStatus.pending)
            _buildTimerSection(order),

          // Instructions spéciales
          if (order.specialInstructions != null)
            _buildInstructionsSection(order.specialInstructions!),

          // Articles
          _buildItemsSection(order),

          // Notes
          if (order.notes != null)
            _buildNotesSection(order.notes!),

          // Actions
          _buildActionsSection(context, ref, order),
        ],
      ),
    );
  }

  /// Header
  Widget _buildHeader(KitchenOrder order) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: _getStatusColor(order.status).withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.orderNumber,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _getStatusLabel(order.status),
                style: TextStyle(
                  color: _getStatusColor(order.status),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          PriorityBadge(priority: order.priority, showLabel: true),
        ],
      ),
    );
  }

  /// Informations principales
  Widget _buildMainInfo(KitchenOrder order) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Client'),
            subtitle: Text(order.customerName),
          ),
          if (order.assignedStation != null)
            ListTile(
              leading: const Icon(Icons.workspaces),
              title: const Text('Station'),
              subtitle: Text(order.assignedStation!),
            ),
          if (order.assignedStaff != null)
            ListTile(
              leading: const Icon(Icons.badge),
              title: const Text('Assigné à'),
              subtitle: Text(order.assignedStaff!),
            ),
          ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text('Heure de commande'),
            subtitle: Text(_formatTime(order.orderTime)),
          ),
          if (order.estimatedMinutes != null)
            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text('Temps estimé'),
              subtitle: Text('${order.estimatedMinutes} minutes'),
            ),
        ],
      ),
    );
  }

  /// Section timer
  Widget _buildTimerSection(KitchenOrder order) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Temps écoulé',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          OrderTimer(order: order),
        ],
      ),
    );
  }

  /// Section instructions
  Widget _buildInstructionsSection(String instructions) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info, color: Colors.orange[700]),
              const SizedBox(width: 8),
              const Text(
                'Instructions spéciales',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(instructions),
        ],
      ),
    );
  }

  /// Section articles
  Widget _buildItemsSection(KitchenOrder order) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Articles',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...order.items.map((item) => Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: item.isPrepared ? Colors.green : Colors.grey,
                child: Text(
                  item.quantity.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(item.productName),
              subtitle: item.notes != null ? Text(item.notes!) : null,
              trailing: item.isPrepared
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : null,
            ),
          )),
        ],
      ),
    );
  }

  /// Section notes
  Widget _buildNotesSection(String notes) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.note),
              SizedBox(width: 8),
              Text(
                'Notes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(notes),
        ],
      ),
    );
  }

  /// Section actions
  Widget _buildActionsSection(BuildContext context, WidgetRef ref, KitchenOrder order) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (order.canStart)
            ElevatedButton.icon(
              onPressed: () async {
                await ref.read(kitchenOrdersProvider.notifier).startPreparation(order.id);
                if (context.mounted) Navigator.pop(context);
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('Démarrer la préparation'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
          if (order.canMarkReady) ...[
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () async {
                await ref.read(kitchenOrdersProvider.notifier).markAsReady(order.id);
                if (context.mounted) Navigator.pop(context);
              },
              icon: const Icon(Icons.check),
              label: const Text('Marquer comme prêt'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
          ],
          if (order.canComplete) ...[
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () async {
                await ref.read(kitchenOrdersProvider.notifier).complete(order.id);
                if (context.mounted) Navigator.pop(context);
              },
              icon: const Icon(Icons.done_all),
              label: const Text('Marquer comme livré'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Obtenir la couleur du statut
  Color _getStatusColor(KitchenOrderStatus status) {
    switch (status) {
      case KitchenOrderStatus.pending:
        return Colors.blue;
      case KitchenOrderStatus.preparing:
        return Colors.orange;
      case KitchenOrderStatus.ready:
        return Colors.green;
      case KitchenOrderStatus.completed:
        return Colors.grey;
      case KitchenOrderStatus.cancelled:
        return Colors.red;
    }
  }

  /// Obtenir le label du statut
  String _getStatusLabel(KitchenOrderStatus status) {
    switch (status) {
      case KitchenOrderStatus.pending:
        return 'À préparer';
      case KitchenOrderStatus.preparing:
        return 'En cours de préparation';
      case KitchenOrderStatus.ready:
        return 'Prêt pour livraison';
      case KitchenOrderStatus.completed:
        return 'Livré';
      case KitchenOrderStatus.cancelled:
        return 'Annulé';
    }
  }

  /// Formater l'heure
  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
