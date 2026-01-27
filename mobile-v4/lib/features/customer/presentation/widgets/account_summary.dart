import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/customer_account.dart';

/// Widget Résumé du Compte
/// Affiche un résumé des informations du compte client
class AccountSummaryWidget extends StatelessWidget {
  final CustomerAccount account;

  const AccountSummaryWidget({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue.shade100,
                  child: Text(
                    account.name.substring(0, 1).toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        account.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        account.organizationName,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 32),

            // Stats Grid
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    context,
                    icon: Icons.shopping_cart,
                    label: 'Commandes',
                    value: account.stats.totalOrders.toString(),
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatItem(
                    context,
                    icon: Icons.check_circle,
                    label: 'Livrées',
                    value: account.stats.completedOrders.toString(),
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatItem(
                    context,
                    icon: Icons.euro,
                    label: 'Dépensé',
                    value: NumberFormat.compact(locale: 'fr').format(account.stats.totalSpent),
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Customer Level Badge
            if (account.stats.isLoyal)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.amber.shade400, Colors.orange.shade600],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      'Client ${account.stats.customerLevel}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
