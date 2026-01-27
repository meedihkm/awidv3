import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/customer_order.dart';
import '../providers/customer_orders_provider.dart';
import '../widgets/order_card.dart';

/// Page Liste des Commandes Client
class CustomerOrdersPage extends ConsumerStatefulWidget {
  final String customerId;

  const CustomerOrdersPage({
    super.key,
    required this.customerId,
  });

  @override
  ConsumerState<CustomerOrdersPage> createState() => _CustomerOrdersPageState();
}

class _CustomerOrdersPageState extends ConsumerState<CustomerOrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ordersAsync = ref.watch(customerOrdersProvider(widget.customerId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Commandes'),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Toutes'),
            Tab(text: 'En cours'),
            Tab(text: 'Terminées'),
          ],
          onTap: (index) {
            _onTabChanged(index);
          },
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher une commande...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref
                              .read(customerOrdersProvider(widget.customerId).notifier)
                              .refresh();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  ref
                      .read(customerOrdersProvider(widget.customerId).notifier)
                      .search(query);
                }
              },
            ),
          ),

          // Orders List
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOrdersList(ordersAsync, null),
                _buildOrdersList(ordersAsync, OrderStatusFilter.active),
                _buildOrdersList(ordersAsync, OrderStatusFilter.completed),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(
    AsyncValue<List<CustomerOrder>> ordersAsync,
    OrderStatusFilter? filter,
  ) {
    return ordersAsync.when(
      data: (orders) {
        // Filtrer les commandes selon le filtre
        var filteredOrders = orders;
        if (filter == OrderStatusFilter.active) {
          filteredOrders = orders.where((o) => o.status.isActive).toList();
        } else if (filter == OrderStatusFilter.completed) {
          filteredOrders = orders.where((o) => o.status.isCompleted).toList();
        }

        if (filteredOrders.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag_outlined,
                    size: 64, color: Colors.grey.shade400),
                const SizedBox(height: 16),
                Text(
                  'Aucune commande',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await ref
                .read(customerOrdersProvider(widget.customerId).notifier)
                .refresh();
          },
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: filteredOrders.length,
            itemBuilder: (context, index) {
              final order = filteredOrders[index];
              return OrderCardWidget(
                order: order,
                onTap: () => _navigateToOrderDetail(order.id),
              );
            },
          ),
        );
      },
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
                ref
                    .read(customerOrdersProvider(widget.customerId).notifier)
                    .refresh();
              },
              child: const Text('Réessayer'),
            ),
          ],
        ),
      ),
    );
  }

  void _onTabChanged(int index) {
    // Recharger les commandes selon l'onglet
    final notifier = ref.read(customerOrdersProvider(widget.customerId).notifier);
    
    switch (index) {
      case 0: // Toutes
        notifier.refresh();
        break;
      case 1: // En cours
        // Les commandes actives seront filtrées côté UI
        notifier.refresh();
        break;
      case 2: // Terminées
        // Les commandes terminées seront filtrées côté UI
        notifier.refresh();
        break;
    }
  }

  void _navigateToOrderDetail(String orderId) {
    // TODO: Navigate to order detail page
  }
}
