import 'package:flutter/material.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';

/// Widget d'alerte de stock
class StockAlertWidget extends StatelessWidget {
  final StockAlert alert;

  const StockAlertWidget({
    super.key,
    required this.alert,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    IconData icon;

    switch (alert.severity) {
      case StockAlertSeverity.urgent:
        color = Colors.red;
        icon = Icons.error;
        break;
      case StockAlertSeverity.critical:
        color = Colors.deepOrange;
        icon = Icons.warning;
        break;
      case StockAlertSeverity.warning:
        color = Colors.orange;
        icon = Icons.warning_amber;
        break;
      case StockAlertSeverity.info:
        color = Colors.blue;
        icon = Icons.info;
        break;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: color.withOpacity(0.1),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          alert.productName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(_getAlertTypeLabel(alert.type)),
            if (alert.message != null) ...[
              const SizedBox(height: 4),
              Text(
                alert.message!,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
            const SizedBox(height: 4),
            Text(
              'Il y a ${alert.hoursSinceCreated}h',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _getSeverityLabel(alert.severity),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getAlertTypeLabel(StockAlertType type) {
    switch (type) {
      case StockAlertType.outOfStock:
        return 'Rupture de stock';
      case StockAlertType.lowStock:
        return 'Stock bas';
      case StockAlertType.criticalStock:
        return 'Stock critique';
      case StockAlertType.nearExpiration:
        return 'Proche de l\'expiration';
      case StockAlertType.expired:
        return 'Expiré';
    }
  }

  String _getSeverityLabel(StockAlertSeverity severity) {
    switch (severity) {
      case StockAlertSeverity.urgent:
        return 'URGENT';
      case StockAlertSeverity.critical:
        return 'CRITIQUE';
      case StockAlertSeverity.warning:
        return 'ATTENTION';
      case StockAlertSeverity.info:
        return 'INFO';
    }
  }
}
