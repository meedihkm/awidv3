import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/customer_orders_provider.dart';
import '../providers/customer_account_provider.dart';
import '../providers/customer_tracking_provider.dart';
import '../widgets/account_summary.dart';
import '../widgets/credit_indicator.dart';
import '../widgets/order_card.dart';

/// Page Dashboard Client
/// Vue d'ensemble du compte avec accès rapide aux fonctionnalités
class CustomerDashboardPage extends ConsumerStatefulWidget {
  final String customerId;

  const CustomerDashboardPage({
    super.key,
    required this.customerId,
  });

  @override
  ConsumerState<CustomerDashboardPage> createState() => _CustomerDashboardPageState();
}

class _CustomerDashboardPageState extends ConsumerState<CustomerDashboardPage> {
  @override
  Widget build(BuildContext context) {
    final accountAsync = ref.watch(customerAccountProvider(widget.customerId));
    final activeOrdersAsync = ref.watch(activeOrdersProvider(widget.customerId));
    final activeDeliveriesAsync = ref.watch(activeDeliveriesProvider(widget.customerId));
    final unreadCountAsync = ref.watch(unreadNotificationsCountProvider(widget.customerId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de Bord'),
        elevation: 0,
        actions: [
          // Notifications badge
          unreadCountAsync.when(
            data: (count) => count > 0
                ? Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () => _navigateToNotifications(),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            count > 99 ? '99+' : count.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )
                : IconButton(
                    icon: const Icon(Icons.notifications_none),
                    onPressed: () => _navigateToNotifications(),
                  ),
            loading: () => IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () => _navigateToNotifications(),
            ),
            error: (_, __) => IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () => _navigateToNotifications(),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(customerAccountProvider(widget.customerId));
          ref.invalidate(activeOrdersProvider(widget.customerId));
          ref.invalidate(activeDeliveriesProvider(widget.customerId));
          ref.invalidate(unreadNotificationsCountProvider(widget.customerId));
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Account Summary
            accountAsync.when(
              data: (account) => AccountSummaryWidget(account: account),
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
            ),
            const SizedBox(height: 16),

            // Credit Indicator
            accountAsync.when(
              data: (account) => CreditIndicatorWidget(
                creditInfo: account.creditInfo,
                onTap: () => _navigateToCredit(),
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 24),

            // Active Deliveries Section
            activeDeliveriesAsync.when(
              data: (deliveries) {
                if (deliveries.isEmpty) return const SizedBox.shrink();
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Livraisons en cours',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextButton(
                          onPressed: () => _navigateToDeliveryTracking(deliveries.first.id),
                          child: const Text('Suivre'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...deliveries.take(2).map((delivery) => Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: const Icon(Icons.local_shipping, color: Colors.orange),
                            title: Text('Livraison #${delivery.deliveryNumber}'),
                            subtitle: Text(delivery.status.displayName),
                            trailing: delivery.estimatedArrival != null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Icon(Icons.access_time, size: 16),
                                      Text(
                                        delivery.estimatedTimeRemaining ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )
                                : null,
                            onTap: () => _navigateToDeliveryTracking(delivery.id),
                          ),
                        )),
                    const SizedBox(height: 16),
                  ],
                );
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),

            // Active Orders Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Commandes actives',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextButton(
                  onPressed: () => _navigateToOrders(),
                  child: const Text('Voir tout'),
                ),
              ],
            ),
            const SizedBox(height: 8),

            activeOrdersAsync.when(
              data: (orders) {
                if (orders.isEmpty) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          Icon(Icons.shopping_bag_outlined,
                              size: 64, color: Colors.grey.shade400),
                          const SizedBox(height: 16),
                          Text(
                            'Aucune commande active',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return Column(
                  children: orders.take(3).map((order) {
                    return OrderCardWidget(
                      order: order,
                      onTap: () => _navigateToOrderDetail(order.id),
                    );
                  }).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: Colors.red),
                      const SizedBox(height: 8),
                      Text('Erreur: $error'),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          ref.refresh(activeOrdersProvider(widget.customerId));
                        },
                        child: const Text('Réessayer'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Quick Actions
            Text(
              'Actions rapides',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildQuickActionCard(
                    context,
                    icon: Icons.history,
                    label: 'Historique',
                    color: Colors.blue,
                    onTap: () => _navigateToHistory(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildQuickActionCard(
                    context,
                    icon: Icons.account_balance_wallet,
                    label: 'Crédit',
                    color: Colors.green,
                    onTap: () => _navigateToCredit(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildQuickActionCard(
                    context,
                    icon: Icons.inventory_2,
                    label: 'Consignes',
                    color: Colors.orange,
                    onTap: () => _navigateToPackaging(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildQuickActionCard(
                    context,
                    icon: Icons.person,
                    label: 'Compte',
                    color: Colors.purple,
                    onTap: () => _navigateToAccount(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 32, color: color),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToOrders() {
    // TODO: Navigate to orders page
  }

  void _navigateToOrderDetail(String orderId) {
    // TODO: Navigate to order detail page
  }

  void _navigateToDeliveryTracking(String deliveryId) {
    // TODO: Navigate to delivery tracking page
  }

  void _navigateToHistory() {
    // TODO: Navigate to history page
  }

  void _navigateToCredit() {
    // TODO: Navigate to credit page
  }

  void _navigateToPackaging() {
    // TODO: Navigate to packaging page
  }

  void _navigateToAccount() {
    // TODO: Navigate to account page
  }

  void _navigateToNotifications() {
    // TODO: Navigate to notifications page
  }
}
