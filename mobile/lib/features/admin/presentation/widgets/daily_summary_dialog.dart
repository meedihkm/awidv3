import 'package:flutter/material.dart';

class DailySummaryDialog extends StatelessWidget {
  final Map<String, dynamic> stats;

  const DailySummaryDialog({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue.shade600, Colors.blue.shade400]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.wb_sunny, color: Colors.white, size: 32),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bonjour!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Résumé d\'hier', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Stats
            Row(
              children: [
                _buildStatBox('CA', '${_formatNumber(stats['ca'] ?? 0)} DA', Colors.green, Icons.trending_up),
                SizedBox(width: 12),
                _buildStatBox('Commandes', '${stats['orders'] ?? 0}', Colors.blue, Icons.shopping_bag),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                _buildStatBox('Livrées', '${stats['delivered'] ?? 0}', Colors.teal, Icons.check_circle),
                SizedBox(width: 12),
                _buildStatBox('Collecté', '${_formatNumber(stats['collected'] ?? 0)} DA', Colors.purple, Icons.payments),
              ],
            ),

            // Performance
            if (stats['deliveryRate'] != null) ...[
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.speed, color: Colors.orange),
                    SizedBox(width: 10),
                    Text('Taux de livraison: '),
                    Spacer(),
                    Text(
                      '${stats['deliveryRate']}%',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: _getRateColor(stats['deliveryRate'])),
                    ),
                  ],
                ),
              ),
            ],

            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('C\'est parti!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String label, String value, Color color, IconData icon) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            SizedBox(height: 6),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color)),
            Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 11)),
          ],
        ),
      ),
    );
  }

  String _formatNumber(dynamic value) {
    if (value == null) return '0';
    final num = value is double ? value : (value as num).toDouble();
    return num.toStringAsFixed(0);
  }

  Color _getRateColor(dynamic rate) {
    final r = rate is double ? rate : (rate as num).toDouble();
    if (r >= 90) return Colors.green;
    if (r >= 70) return Colors.orange;
    return Colors.red;
  }
}
