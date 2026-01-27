import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:awid_mobile/features/kitchen/presentation/providers/kitchen_orders_provider.dart';
import 'package:awid_mobile/features/kitchen/presentation/providers/kitchen_stats_provider.dart';
import 'package:awid_mobile/features/kitchen/presentation/providers/stock_provider.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';

/// Page dashboard cuisine
class KitchenDashboardPage extends ConsumerStatefulWidget {
  const KitchenDashboardPage({super.key});

  @override
  ConsumerState<KitchenDashboardPage> createState() => _KitchenDashboardPageState();
}

class _KitchenDashboardPageState extends ConsumerState<KitchenDashboardPage> {
  @override
  void initState() {
    super.initState();
    // Charger les données au démarrage
    Future.microtask(() {
      ref.read(kitchenOrdersProvider.notifier).loadOrders();
      ref.read(stockProvider.notifier).loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ordersState = ref.watch(kitchenOrdersProvider);
    final stockState = ref.watch(stockProvider);
    final statsAsync = ref.watch(kitchenStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuisine - Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(kitchenOrdersProvider.notifier).refresh();
              ref.read(stockProvider.notifier).loadItems(forceRefresh: true);
              ref.refresh(kitchenStatsProvider);
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Afficher notifications
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(kitchenOrdersProvider.notifier).refresh();
          await ref.read(stockProvider.notifier).loadItems(forceRefresh: true);
          ref.refresh(kitchenStatsProvider);
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Statistiques du jour
              _buildStatsSection(statsAsync),
              const SizedBox(height: 24),

              // Alertes
              _buildAlertsSection(ordersState, stockState),
              const SizedBox(height: 24),

              // Commandes en cours
              _buildOrdersSection(ordersState),
              const SizedBox(height: 24),

              // Stock critique
              _buildStockSection(stockState),
              const SizedBox(height: 24),

              // Actions rapides
              _buildQuickActions(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/kitchen/kanban');
        },
        icon: const Icon(Icons.view_kanban),
        label: const Text('Kanban'),
      ),
    );
  }

  /// Section statistiques
  Widget _buildStatsSection(AsyncValue statsAsync) {
    return statsAsync.when(
      data: (stats) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Statistiques du jour',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Total',
                      stats.totalOrders.toString(),
                      Icons.receipt_long,
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      'Complétées',
                      stats.completedOrders.toString(),
                      Icons.check_circle,
                      Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'En attente',
                      stats.pendingOrders.toString(),
                      Icons.pending,
                      Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      'Temps moy.',
                      '${stats.averagePreparationTime.toStringAsFixed(0)} min',
                      Icons.timer,
                      Colors.purple,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: stats.completionRate / 100,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(
                  stats.completionRate > 80 ? Colors.green : Colors.orange,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Taux de complétion: ${stats.completionRate.toStringAsFixed(1)}%',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
      loading: () => const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, stack) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Erreur: $error'),
        ),
      ),
    );
  }

  /// Carte statistique
  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  /// Section alertes
  Widget _buildAlertsSection(ordersState, stockState) {
    final delayedOrders = ordersState.delayedOrders;
    final urgentOrders = ordersState.urgentOrders;
    final lowStock = stockState.lowStockItems;

    if (delayedOrders.isEmpty && urgentOrders.isEmpty && lowStock.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      color: Colors.red[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.warning, color: Colors.red[700]),
                const SizedBox(width: 8),
                const Text(
                  'Alertes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (delayedOrders.isNotEmpty)
              _buildAlertItem(
                '${delayedOrders.length} commande(s) en retard',
                Icons.schedule,
                Colors.red,
              ),
            if (urgentOrders.isNotEmpty)
              _buildAlertItem(
                '${urgentOrders.length} commande(s) urgente(s)',
                Icons.priority_high,
                Colors.orange,
              ),
            if (lowStock.isNotEmpty)
              _buildAlertItem(
                '${lowStock.length} article(s) en stock bas',
                Icons.inventory_2,
                Colors.amber,
              ),
          ],
        ),
      ),
    );
  }

  /// Item d'alerte
  Widget _buildAlertItem(String text, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  /// Section commandes
  Widget _buildOrdersSection(ordersState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Commandes en cours',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/kitchen/kanban');
              },
              child: const Text('Voir tout'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildOrderStatusCard(
                'À préparer',
                ordersState.pendingOrders.length,
                Colors.blue,
                KitchenOrderStatus.pending,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildOrderStatusCard(
                'En cours',
                ordersState.preparingOrders.length,
                Colors.orange,
                KitchenOrderStatus.preparing,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildOrderStatusCard(
                'Prêt',
                ordersState.readyOrders.length,
                Colors.green,
                KitchenOrderStatus.ready,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Carte statut commande
  Widget _buildOrderStatusCard(String label, int count, Color color, KitchenOrderStatus status) {
    return InkWell(
      onTap: () {
        ref.read(kitchenOrdersProvider.notifier).filterByStatus(status);
        Navigator.pushNamed(context, '/kitchen/kanban');
      },
      child: Card(
        color: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section stock
  Widget _buildStockSection(stockState) {
    final lowStock = stockState.lowStockItems;

    if (lowStock.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Stock critique',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/kitchen/stock');
              },
              child: const Text('Gérer'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...lowStock.take(3).map((item) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: item.isCritical ? Colors.red : Colors.orange,
              child: Icon(
                Icons.inventory_2,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text(item.productName),
            subtitle: Text(item.formattedQuantity),
            trailing: Icon(
              Icons.warning,
              color: item.isCritical ? Colors.red : Colors.orange,
            ),
          ),
        )),
      ],
    );
  }

  /// Actions rapides
  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Actions rapides',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                'Kanban',
                Icons.view_kanban,
                Colors.blue,
                () => Navigator.pushNamed(context, '/kitchen/kanban'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildActionButton(
                'Stock',
                Icons.inventory,
                Colors.green,
                () => Navigator.pushNamed(context, '/kitchen/stock'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                'Statistiques',
                Icons.bar_chart,
                Colors.purple,
                () => Navigator.pushNamed(context, '/kitchen/stats'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildActionButton(
                'Paramètres',
                Icons.settings,
                Colors.grey,
                () => Navigator.pushNamed(context, '/kitchen/settings'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Bouton d'action
  Widget _buildActionButton(String label, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
