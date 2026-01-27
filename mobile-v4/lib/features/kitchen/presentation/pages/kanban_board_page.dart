import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:awid_mobile/features/kitchen/presentation/providers/kitchen_orders_provider.dart';
import 'package:awid_mobile/features/kitchen/presentation/providers/kanban_provider.dart';
import 'package:awid_mobile/features/kitchen/presentation/widgets/kanban_column.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';

/// Page tableau Kanban pour la cuisine
class KanbanBoardPage extends ConsumerStatefulWidget {
  const KanbanBoardPage({super.key});

  @override
  ConsumerState<KanbanBoardPage> createState() => _KanbanBoardPageState();
}

class _KanbanBoardPageState extends ConsumerState<KanbanBoardPage> {
  String _searchQuery = '';
  OrderPriority? _filterPriority;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _loadOrders();
    });
  }

  Future<void> _loadOrders() async {
    await ref.read(kitchenOrdersProvider.notifier).loadOrders();
    final orders = ref.read(kitchenOrdersProvider).orders;
    ref.read(kanbanProvider.notifier).loadOrders(orders);
  }

  @override
  Widget build(BuildContext context) {
    final ordersState = ref.watch(kitchenOrdersProvider);
    final kanbanState = ref.watch(kanbanProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban - Production'),
        actions: [
          // Filtre priorité
          PopupMenuButton<OrderPriority?>(
            icon: Icon(
              Icons.filter_list,
              color: _filterPriority != null ? Colors.blue : null,
            ),
            onSelected: (priority) {
              setState(() {
                _filterPriority = priority;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: null,
                child: Text('Toutes les priorités'),
              ),
              const PopupMenuItem(
                value: OrderPriority.urgent,
                child: Row(
                  children: [
                    Icon(Icons.priority_high, color: Colors.red, size: 20),
                    SizedBox(width: 8),
                    Text('Urgent'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: OrderPriority.high,
                child: Row(
                  children: [
                    Icon(Icons.arrow_upward, color: Colors.orange, size: 20),
                    SizedBox(width: 8),
                    Text('Haute'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: OrderPriority.normal,
                child: Row(
                  children: [
                    Icon(Icons.remove, color: Colors.blue, size: 20),
                    SizedBox(width: 8),
                    Text('Normale'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: OrderPriority.low,
                child: Row(
                  children: [
                    Icon(Icons.arrow_downward, color: Colors.grey, size: 20),
                    SizedBox(width: 8),
                    Text('Basse'),
                  ],
                ),
              ),
            ],
          ),
          // Rafraîchir
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadOrders,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher une commande...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
        ),
      ),
      body: ordersState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ordersState.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                      const SizedBox(height: 16),
                      Text('Erreur: ${ordersState.error}'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadOrders,
                        child: const Text('Réessayer'),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _loadOrders,
                  child: _buildKanbanBoard(kanbanState),
                ),
    );
  }

  /// Construire le tableau Kanban
  Widget _buildKanbanBoard(KanbanState kanbanState) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Colonne À préparer
          KanbanColumn(
            title: 'À préparer',
            status: KitchenOrderStatus.pending,
            orders: _filterOrders(kanbanState.ordersInColumn(KitchenOrderStatus.pending)),
            color: Colors.blue,
            onOrderTap: _showOrderDetail,
            onOrderStatusChange: _changeOrderStatus,
          ),
          const SizedBox(width: 12),

          // Colonne En cours
          KanbanColumn(
            title: 'En cours',
            status: KitchenOrderStatus.preparing,
            orders: _filterOrders(kanbanState.ordersInColumn(KitchenOrderStatus.preparing)),
            color: Colors.orange,
            onOrderTap: _showOrderDetail,
            onOrderStatusChange: _changeOrderStatus,
          ),
          const SizedBox(width: 12),

          // Colonne Prêt
          KanbanColumn(
            title: 'Prêt',
            status: KitchenOrderStatus.ready,
            orders: _filterOrders(kanbanState.ordersInColumn(KitchenOrderStatus.ready)),
            color: Colors.green,
            onOrderTap: _showOrderDetail,
            onOrderStatusChange: _changeOrderStatus,
          ),
          const SizedBox(width: 12),

          // Colonne Livré
          KanbanColumn(
            title: 'Livré',
            status: KitchenOrderStatus.completed,
            orders: _filterOrders(kanbanState.ordersInColumn(KitchenOrderStatus.completed)),
            color: Colors.grey,
            onOrderTap: _showOrderDetail,
            onOrderStatusChange: _changeOrderStatus,
          ),
        ],
      ),
    );
  }

  /// Filtrer les commandes
  List<KitchenOrder> _filterOrders(List<KitchenOrder> orders) {
    var filtered = orders;

    // Filtre par recherche
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((order) {
        return order.orderNumber.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            order.customerName.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    // Filtre par priorité
    if (_filterPriority != null) {
      filtered = filtered.where((order) => order.priority == _filterPriority).toList();
    }

    return filtered;
  }

  /// Afficher le détail d'une commande
  void _showOrderDetail(KitchenOrder order) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            controller: scrollController,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Commande ${order.orderNumber}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Divider(),

              // Informations client
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Client'),
                subtitle: Text(order.customerName),
              ),

              // Statut
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Statut'),
                subtitle: Text(_getStatusLabel(order.status)),
                trailing: _buildStatusChip(order.status),
              ),

              // Priorité
              ListTile(
                leading: const Icon(Icons.priority_high),
                title: const Text('Priorité'),
                subtitle: Text(_getPriorityLabel(order.priority)),
                trailing: _buildPriorityChip(order.priority),
              ),

              // Temps
              if (order.estimatedMinutes != null)
                ListTile(
                  leading: const Icon(Icons.timer),
                  title: const Text('Temps estimé'),
                  subtitle: Text('${order.estimatedMinutes} minutes'),
                  trailing: order.isLate
                      ? const Chip(
                          label: Text('En retard'),
                          backgroundColor: Colors.red,
                          labelStyle: TextStyle(color: Colors.white),
                        )
                      : null,
                ),

              // Instructions spéciales
              if (order.specialInstructions != null) ...[
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.note),
                  title: Text('Instructions spéciales'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(order.specialInstructions!),
                ),
              ],

              // Articles
              const Divider(),
              const ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('Articles'),
              ),
              ...order.items.map((item) => ListTile(
                leading: CircleAvatar(
                  child: Text(item.quantity.toString()),
                ),
                title: Text(item.productName),
                subtitle: item.notes != null ? Text(item.notes!) : null,
                trailing: item.isPrepared
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : null,
              )),

              const SizedBox(height: 16),

              // Actions
              if (order.canStart)
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _changeOrderStatus(order, KitchenOrderStatus.preparing);
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Démarrer la préparation'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                ),
              if (order.canMarkReady)
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _changeOrderStatus(order, KitchenOrderStatus.ready);
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Marquer comme prêt'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              if (order.canComplete)
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _changeOrderStatus(order, KitchenOrderStatus.completed);
                  },
                  icon: const Icon(Icons.done_all),
                  label: const Text('Marquer comme livré'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Changer le statut d'une commande
  Future<void> _changeOrderStatus(KitchenOrder order, KitchenOrderStatus newStatus) async {
    final notifier = ref.read(kitchenOrdersProvider.notifier);

    switch (newStatus) {
      case KitchenOrderStatus.preparing:
        await notifier.startPreparation(order.id);
        break;
      case KitchenOrderStatus.ready:
        await notifier.markAsReady(order.id);
        break;
      case KitchenOrderStatus.completed:
        await notifier.complete(order.id);
        break;
      default:
        break;
    }

    // Recharger le Kanban
    final orders = ref.read(kitchenOrdersProvider).orders;
    ref.read(kanbanProvider.notifier).loadOrders(orders);
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

  /// Obtenir le label de priorité
  String _getPriorityLabel(OrderPriority priority) {
    switch (priority) {
      case OrderPriority.urgent:
        return 'Urgent';
      case OrderPriority.high:
        return 'Haute';
      case OrderPriority.normal:
        return 'Normale';
      case OrderPriority.low:
        return 'Basse';
    }
  }

  /// Construire le chip de statut
  Widget _buildStatusChip(KitchenOrderStatus status) {
    Color color;
    switch (status) {
      case KitchenOrderStatus.pending:
        color = Colors.blue;
        break;
      case KitchenOrderStatus.preparing:
        color = Colors.orange;
        break;
      case KitchenOrderStatus.ready:
        color = Colors.green;
        break;
      case KitchenOrderStatus.completed:
        color = Colors.grey;
        break;
      case KitchenOrderStatus.cancelled:
        color = Colors.red;
        break;
    }

    return Chip(
      label: Text(_getStatusLabel(status)),
      backgroundColor: color.withOpacity(0.2),
      labelStyle: TextStyle(color: color),
    );
  }

  /// Construire le chip de priorité
  Widget _buildPriorityChip(OrderPriority priority) {
    Color color;
    IconData icon;
    switch (priority) {
      case OrderPriority.urgent:
        color = Colors.red;
        icon = Icons.priority_high;
        break;
      case OrderPriority.high:
        color = Colors.orange;
        icon = Icons.arrow_upward;
        break;
      case OrderPriority.normal:
        color = Colors.blue;
        icon = Icons.remove;
        break;
      case OrderPriority.low:
        color = Colors.grey;
        icon = Icons.arrow_downward;
        break;
    }

    return Chip(
      avatar: Icon(icon, size: 16, color: color),
      label: Text(_getPriorityLabel(priority)),
      backgroundColor: color.withOpacity(0.2),
      labelStyle: TextStyle(color: color),
    );
  }
}
