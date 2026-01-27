import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/deliverer_provider.dart';
import '../providers/location_provider.dart';
import '../widgets/delivery_card.dart';
import '../widgets/location_tracker.dart';
import '../widgets/stats_summary.dart';
import 'deliveries_list_page.dart';

/// Page dashboard livreur avec stats et livraisons actives
class DelivererDashboardPage extends ConsumerStatefulWidget {
  const DelivererDashboardPage({super.key});

  @override
  ConsumerState<DelivererDashboardPage> createState() => _DelivererDashboardPageState();
}

class _DelivererDashboardPageState extends ConsumerState<DelivererDashboardPage> {
  @override
  void initState() {
    super.initState();
    // Charger les données initiales
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(deliveriesProvider.notifier).loadDeliveries();
      ref.read(locationNotifierProvider.notifier).startTracking();
    });
  }

  @override
  void dispose() {
    // Arrêter le tracking GPS
    ref.read(locationNotifierProvider.notifier).stopTracking();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deliveriesState = ref.watch(deliveriesProvider);
    final statsAsync = ref.watch(deliveryStatsProvider);
    final activeDeliveryAsync = ref.watch(activeDeliveryProvider);
    final locationState = ref.watch(locationNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Livraisons'),
        actions: [
          // Indicateur tracking GPS
          const LocationTracker(),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigation vers notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Logout
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(deliveriesNotifierProvider.notifier).loadDeliveries();
          ref.invalidate(deliveryStatsProvider);
          ref.invalidate(activeDeliveryProvider);
        },
        child: CustomScrollView(
          slivers: [
            // Stats Summary
            SliverToBoxAdapter(
              child: statsAsync.when(
                data: (stats) => StatsSummary(stats: stats),
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (error, stack) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Erreur: $error',
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ),
              ),
            ),

            // Livraison Active
            SliverToBoxAdapter(
              child: activeDeliveryAsync.when(
                data: (delivery) {
                  if (delivery == null) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Livraison en cours',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        DeliveryCard(
                          delivery: delivery,
                          onTap: () {
                            // TODO: Navigation vers détails
                          },
                        ),
                      ],
                    ),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),

            // Liste des livraisons
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Livraisons assignées',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DeliveriesListPage(),
                          ),
                        );
                      },
                      child: const Text('Voir tout'),
                    ),
                  ],
                ),
              ),
            ),

            deliveriesState.when(
              data: (deliveries) {
                if (deliveries.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_shipping_outlined, size: 64),
                          SizedBox(height: 16),
                          Text('Aucune livraison assignée'),
                        ],
                      ),
                    ),
                  );
                }

                // Afficher seulement les 5 premières
                final limitedDeliveries = deliveries.take(5).toList();

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final delivery = limitedDeliveries[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: DeliveryCard(
                            delivery: delivery,
                            onTap: () {
                              // TODO: Navigation vers détails
                            },
                          ),
                        );
                      },
                      childCount: limitedDeliveries.length,
                    ),
                  ),
                );
              },
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      Text('Erreur: $error'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(deliveriesNotifierProvider.notifier).loadDeliveries();
                        },
                        child: const Text('Réessayer'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Padding bottom
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
          ],
        ),
      ),
    );
  }
}
