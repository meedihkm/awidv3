import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/theme_config.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/admin_provider.dart';
import '../widgets/order_list_item.dart';
import '../widgets/stat_card.dart';

/// Admin Dashboard Page
/// Page principale du dashboard admin
class AdminDashboardPage extends ConsumerStatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  ConsumerState<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends ConsumerState<AdminDashboardPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).user;
    final statsAsync = ref.watch(dashboardStatsProvider);
    final ordersAsync = ref.watch(recentOrdersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(dashboardStatsProvider.notifier).loadStats();
          await ref.read(recentOrdersProvider.notifier).loadOrders();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Container(
                padding: const EdgeInsets.all(16),
                color: ThemeConfig.primaryColor.withOpacity(0.1),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: ThemeConfig.primaryColor,
                      child: Text(
                        user?.firstName[0].toUpperCase() ?? 'A',
                        style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bonjour, ${user?.firstName ?? "Admin"}!',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text('Voici votre tableau de bord', style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Stats Section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Statistiques',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    statsAsync.when(
                      data: (stats) => Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: StatCard(
                                  title: 'Chiffre d\'affaires',
                                  value: Formatters.currency(stats.totalRevenue),
                                  icon: Icons.attach_money,
                                  color: ThemeConfig.successColor,
                                  subtitle: 'Total',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: StatCard(
                                  title: 'Commandes',
                                  value: stats.totalOrders.toString(),
                                  icon: Icons.shopping_cart,
                                  color: ThemeConfig.primaryColor,
                                  subtitle: '${stats.completedOrders} complétées',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: StatCard(
                                  title: 'En attente',
                                  value: stats.pendingOrders.toString(),
                                  icon: Icons.schedule,
                                  color: ThemeConfig.warningColor,
                                  subtitle: 'Commandes',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: StatCard(
                                  title: 'Livraisons',
                                  value: stats.activeDeliveries.toString(),
                                  icon: Icons.local_shipping,
                                  color: ThemeConfig.infoColor,
                                  subtitle: '${stats.activeDeliverers} livreurs actifs',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      loading: () => const LoadingWidget(message: 'Chargement des statistiques...'),
                      error: (error, stack) => ErrorDisplayWidget(
                        message: 'Erreur de chargement des stats',
                        onRetry: () {
                          ref.read(dashboardStatsProvider.notifier).loadStats();
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Recent Orders Section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Commandes récentes',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Navigate to all orders
                          },
                          child: const Text('Voir tout'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ordersAsync.when(
                      data: (orders) {
                        if (orders.isEmpty) {
                          return const Center(
                            child: Padding(padding: EdgeInsets.all(32.0), child: Text('Aucune commande')),
                          );
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: orders.length > 5 ? 5 : orders.length,
                          itemBuilder: (context, index) {
                            final order = orders[index];
                            return OrderListItem(
                              order: order,
                              onTap: () {
                                // TODO: Navigate to order detail
                              },
                            );
                          },
                        );
                      },
                      loading: () => const LoadingWidget(message: 'Chargement des commandes...'),
                      error: (error, stack) => ErrorDisplayWidget(
                        message: 'Erreur de chargement des commandes',
                        onRetry: () {
                          ref.read(recentOrdersProvider.notifier).loadOrders();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to create order
        },
        icon: const Icon(Icons.add),
        label: const Text('Nouvelle commande'),
      ),
    );
  }
}
