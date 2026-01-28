import 'package:flutter/material.dart';

import '../../domain/entities/delivery_stats.dart';

/// Widget résumé des statistiques livreur
class StatsSummary extends StatelessWidget {
  const StatsSummary({
    required this.stats,
    super.key,
  });
  final DeliveryStats stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final performanceColor = _getPerformanceColor(context);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.local_shipping,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mes Statistiques',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Badge performance
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: performanceColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  stats.performanceLevel,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Stats Grid
          Row(
            children: [
              // Total livraisons
              Expanded(
                child: _StatItem(
                  icon: Icons.check_circle_outline,
                  label: 'Livrées',
                  value: stats.totalDeliveries.toString(),
                ),
              ),
              const SizedBox(width: 12),

              // Taux de complétion
              Expanded(
                child: _StatItem(
                  icon: Icons.trending_up,
                  label: 'Taux',
                  value: '${stats.completionRate.toStringAsFixed(0)}%',
                ),
              ),
              const SizedBox(width: 12),

              // À l'heure
              Expanded(
                child: _StatItem(
                  icon: Icons.schedule,
                  label: 'À l\'heure',
                  value: '${stats.onTimeRate?.toStringAsFixed(0) ?? '0'}%',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              // Note moyenne
              Expanded(
                child: _StatItem(
                  icon: Icons.star,
                  label: 'Note',
                  value: stats.averageRating.toStringAsFixed(1),
                ),
              ),
              const SizedBox(width: 12),

              // Revenus
              Expanded(
                child: _StatItem(
                  icon: Icons.attach_money,
                  label: 'Revenus',
                  value: '${stats.totalEarnings.toStringAsFixed(0)} DA',
                  isLarge: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getPerformanceColor(BuildContext context) {
    switch (stats.performanceLevel.toLowerCase()) {
      case 'excellent':
        return Colors.green;
      case 'bon':
        return Colors.blue;
      case 'moyen':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }
}

/// Widget item de statistique
class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    this.isLarge = false,
  });
  final IconData icon;
  final String label;
  final String value;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isLarge ? 16 : null,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
