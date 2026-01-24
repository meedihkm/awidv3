// =====================================================
// MODELS : Statistiques Financières
// =====================================================

/// Statistiques financières globales pour une période donnée
class FinancialStats {
  FinancialStats({
    required this.totalRevenue,
    required this.totalCollected,
    required this.totalUnpaid,
    required this.orderCount,
    required this.deliveredCount,
    required this.pendingCount,
    required this.failedCount,
    required this.revenueByClient,
    required this.revenueByProduct,
    required this.statsByDeliverer,
  });

  /// Crée des statistiques vides
  factory FinancialStats.empty() {
    return FinancialStats(
      totalRevenue: 0,
      totalCollected: 0,
      totalUnpaid: 0,
      orderCount: 0,
      deliveredCount: 0,
      pendingCount: 0,
      failedCount: 0,
      revenueByClient: {},
      revenueByProduct: {},
      statsByDeliverer: {},
    );
  }
  final double totalRevenue;
  final double totalCollected;
  final double totalUnpaid;
  final int orderCount;
  final int deliveredCount;
  final int pendingCount;
  final int failedCount;
  final Map<String, double> revenueByClient;
  final Map<String, double> revenueByProduct;
  final Map<String, DelivererStats> statsByDeliverer;

  /// Taux de recouvrement en pourcentage
  double get recoveryRate => totalRevenue > 0 ? (totalCollected / totalRevenue * 100) : 0.0;

  /// Vérifie si les statistiques sont vides
  bool get isEmpty => orderCount == 0;
}

/// Statistiques d'un livreur
class DelivererStats {
  DelivererStats({
    required this.id,
    required this.name,
    required this.totalDeliveries,
    required this.deliveredCount,
    required this.failedCount,
    required this.amountCollected,
  });

  /// Crée des stats vides pour un livreur
  factory DelivererStats.empty(String id, String name) {
    return DelivererStats(
      id: id,
      name: name,
      totalDeliveries: 0,
      deliveredCount: 0,
      failedCount: 0,
      amountCollected: 0,
    );
  }
  final String id;
  final String name;
  final int totalDeliveries;
  final int deliveredCount;
  final int failedCount;
  final double amountCollected;

  /// Taux de réussite en pourcentage
  double get successRate => totalDeliveries > 0 ? (deliveredCount / totalDeliveries * 100) : 0.0;
}

/// Filtre de période pour les statistiques
enum PeriodFilter {
  day,
  week,
  month;

  String get label {
    switch (this) {
      case PeriodFilter.day:
        return 'Jour';
      case PeriodFilter.week:
        return 'Semaine';
      case PeriodFilter.month:
        return 'Mois';
    }
  }
}

/// Filtre pour l'onglet dettes
class DebtFilter {
  DebtFilter({
    this.customerId,
    this.delivererId,
    this.dateFrom,
    this.dateTo,
  });
  final String? customerId;
  final String? delivererId;
  final DateTime? dateFrom;
  final DateTime? dateTo;

  bool get hasFilters => customerId != null || delivererId != null || dateFrom != null || dateTo != null;

  DebtFilter copyWith({
    String? customerId,
    String? delivererId,
    DateTime? dateFrom,
    DateTime? dateTo,
    bool clearCustomer = false,
    bool clearDeliverer = false,
    bool clearDates = false,
  }) {
    return DebtFilter(
      customerId: clearCustomer ? null : (customerId ?? this.customerId),
      delivererId: clearDeliverer ? null : (delivererId ?? this.delivererId),
      dateFrom: clearDates ? null : (dateFrom ?? this.dateFrom),
      dateTo: clearDates ? null : (dateTo ?? this.dateTo),
    );
  }

  DebtFilter clear() {
    return DebtFilter();
  }
}
