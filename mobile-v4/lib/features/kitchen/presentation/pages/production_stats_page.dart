import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:awid_mobile/features/kitchen/presentation/providers/kitchen_stats_provider.dart';
import 'package:awid_mobile/features/kitchen/presentation/widgets/stats_chart.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_stats.dart';

/// Page des statistiques de production
class ProductionStatsPage extends ConsumerStatefulWidget {
  const ProductionStatsPage({super.key});

  @override
  ConsumerState<ProductionStatsPage> createState() => _ProductionStatsPageState();
}

class _ProductionStatsPageState extends ConsumerState<ProductionStatsPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final statsAsync = ref.watch(kitchenStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistiques de Production'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _selectDate,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(kitchenStatsProvider),
          ),
        ],
      ),
      body: statsAsync.when(
        data: (stats) => _buildStatsContent(stats),
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
                onPressed: () => ref.refresh(kitchenStatsProvider),
                child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsContent(KitchenStats stats) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.refresh(kitchenStatsProvider);
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date sélectionnée
            _buildDateHeader(),
            const SizedBox(height: 24),

            // Vue d'ensemble
            _buildOverviewSection(stats),
            const SizedBox(height: 24),

            // Performance
            _buildPerformanceSection(stats),
            const SizedBox(height: 24),

            // Graphiques
            _buildChartsSection(stats),
            const SizedBox(height: 24),

            // Top produits
            if (stats.topProducts != null && stats.topProducts!.isNotEmpty)
              _buildTopProductsSection(stats.topProducts!),
            const SizedBox(height: 24),

            // Performance du personnel
            if (stats.staffPerformance != null && stats.staffPerformance!.isNotEmpty)
              _buildStaffPerformanceSection(stats.staffPerformance!),
          ],
        ),
      ),
    );
  }

  /// Header avec date
  Widget _buildDateHeader() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: Text(
          _formatDate(_selectedDate),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: _selectDate,
      ),
    );
  }

  /// Section vue d'ensemble
  Widget _buildOverviewSection(KitchenStats stats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Vue d\'ensemble',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
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
                'Annulées',
                stats.cancelledOrders.toString(),
                Icons.cancel,
                Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Section performance
  Widget _buildPerformanceSection(KitchenStats stats) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Performance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildPerformanceRow(
              'Taux de complétion',
              '${stats.completionRate.toStringAsFixed(1)}%',
              stats.completionRate / 100,
              stats.completionRate > 80 ? Colors.green : Colors.orange,
            ),
            const SizedBox(height: 12),
            _buildPerformanceRow(
              'Taux à l\'heure',
              '${stats.onTimeRate.toStringAsFixed(1)}%',
              stats.onTimeRate / 100,
              stats.onTimeRate > 80 ? Colors.green : Colors.orange,
            ),
            const SizedBox(height: 12),
            _buildPerformanceRow(
              'Taux d\'annulation',
              '${stats.cancellationRate.toStringAsFixed(1)}%',
              stats.cancellationRate / 100,
              stats.cancellationRate < 10 ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Temps moyen de préparation'),
                Text(
                  '${stats.averagePreparationTime.toStringAsFixed(0)} min',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Ligne de performance
  Widget _buildPerformanceRow(String label, String value, double progress, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ],
    );
  }

  /// Section graphiques
  Widget _buildChartsSection(KitchenStats stats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Graphiques',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        if (stats.ordersByHour != null && stats.ordersByHour!.isNotEmpty)
          StatsChart(
            title: 'Commandes par heure',
            data: stats.ordersByHour!,
          ),
      ],
    );
  }

  /// Section top produits
  Widget _buildTopProductsSection(List<TopProduct> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Produits les plus commandés',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...products.take(5).map((product) => Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(product.orderCount.toString()),
            ),
            title: Text(product.productName),
            subtitle: Text('${product.totalQuantity} unités'),
            trailing: const Icon(Icons.trending_up, color: Colors.green),
          ),
        )),
      ],
    );
  }

  /// Section performance du personnel
  Widget _buildStaffPerformanceSection(List<StaffPerformance> staff) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Performance du personnel',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...staff.map((member) => Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(member.staffName[0]),
            ),
            title: Text(member.staffName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${member.ordersCompleted} commandes'),
                Text('Temps moyen: ${member.averageTime.toStringAsFixed(0)} min'),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${member.performanceScore.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('Score', style: TextStyle(fontSize: 10)),
              ],
            ),
          ),
        )),
      ],
    );
  }

  /// Carte statistique
  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
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
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Sélectionner une date
  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      ref.refresh(kitchenStatsProvider);
    }
  }

  /// Formater la date
  String _formatDate(DateTime date) {
    final months = [
      'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
      'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
