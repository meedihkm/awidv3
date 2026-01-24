// =====================================================
// WIDGET : Carte du Taux de Recouvrement
// =====================================================

import 'package:flutter/material.dart';

/// Affiche le taux de recouvrement avec une barre de progression
class RecoveryRateCard extends StatelessWidget {
  const RecoveryRateCard({
    required this.rate,
    super.key,
  });
  final double rate;

  @override
  Widget build(BuildContext context) {
    final color = _getColorForRate(rate);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Taux de recouvrement',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${rate.toStringAsFixed(1)}%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: rate / 100,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(color),
              minHeight: 12,
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorForRate(double rate) {
    if (rate >= 80) return Colors.green;
    if (rate >= 50) return Colors.orange;
    return Colors.red;
  }
}
