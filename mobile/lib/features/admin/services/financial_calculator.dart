// =====================================================
// SERVICE : Calculateur de Statistiques Financières
// =====================================================

import '../models/financial_stats.dart';

/// Service responsable du calcul des statistiques financières
class FinancialCalculator {
  /// Calcule les statistiques financières à partir des commandes et livraisons
  static FinancialStats calculateStats({
    required List<dynamic> orders,
    required List<dynamic> deliveries,
  }) {
    if (orders.isEmpty) {
      return FinancialStats.empty();
    }

    double totalRevenue = 0;
    double totalCollected = 0;
    var deliveredCount = 0;
    var pendingCount = 0;
    var failedCount = 0;

    final revenueByClient = <String, double>{};
    final revenueByProduct = <String, double>{};
    final statsByDeliverer = <String, DelivererStats>{};

    // Calculer les stats des commandes
    for (final order in orders) {
      final total = _parseDouble(order['total']);
      final paid = _parseDouble(order['amountPaid']);
      final status = order['status'] ?? '';
      final clientName = (order['customer']?['name'] ?? 'Inconnu').toString();

      // Totaux
      totalRevenue += total;
      totalCollected += paid;

      // Compteurs de statut
      switch (status) {
        case 'delivered':
          deliveredCount++;
          break;
        case 'pending':
          pendingCount++;
          break;
        case 'failed':
        case 'locked':
          failedCount++;
          break;
      }

      // CA par client
      revenueByClient[clientName] = (revenueByClient[clientName] ?? 0) + total;

      // CA par produit
      final items = order['items'] as List? ?? [];
      for (final item in items) {
        final productName = (item['productName'] ?? 'Produit').toString();
        final quantity = _parseDouble(item['quantity']);
        final unitPrice = _parseDouble(item['unitPrice']);
        final itemTotal = quantity * unitPrice;
        revenueByProduct[productName] = (revenueByProduct[productName] ?? 0) + itemTotal;
      }
    }

    // Calculer les stats des livreurs
    for (final delivery in deliveries) {
      final delivererId = (delivery['delivererId'] ?? '').toString();
      final delivererName = (delivery['deliverer']?['name'] ?? 'Livreur').toString();
      final status = delivery['status'] ?? '';
      final collected = _parseDouble(delivery['amountCollected']);

      // Initialiser les stats du livreur si nécessaire
      if (!statsByDeliverer.containsKey(delivererId)) {
        statsByDeliverer[delivererId] = DelivererStats.empty(delivererId, delivererName);
      }

      // Mettre à jour les compteurs
      final currentStats = statsByDeliverer[delivererId]!;
      statsByDeliverer[delivererId] = DelivererStats(
        id: currentStats.id,
        name: currentStats.name,
        totalDeliveries: currentStats.totalDeliveries + 1,
        deliveredCount: currentStats.deliveredCount + (status == 'delivered' ? 1 : 0),
        failedCount: currentStats.failedCount + (status == 'failed' ? 1 : 0),
        amountCollected: currentStats.amountCollected + (status == 'delivered' && collected > 0 ? collected : 0),
      );
    }

    return FinancialStats(
      totalRevenue: totalRevenue,
      totalCollected: totalCollected,
      totalUnpaid: totalRevenue - totalCollected,
      orderCount: orders.length,
      deliveredCount: deliveredCount,
      pendingCount: pendingCount,
      failedCount: failedCount,
      revenueByClient: revenueByClient,
      revenueByProduct: revenueByProduct,
      statsByDeliverer: statsByDeliverer,
    );
  }

  /// Parse un nombre de manière sécurisée
  static double _parseDouble(dynamic value) {
    if (value == null) return 0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0;
  }
}
