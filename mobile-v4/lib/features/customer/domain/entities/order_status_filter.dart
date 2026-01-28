/// Order Status Filter Enum
/// Filtre pour les statuts de commande
enum OrderStatusFilter {
  /// All orders
  all,

  /// Active orders (pending, preparing, ready, delivering)
  active,

  /// Completed orders
  completed,

  /// Cancelled orders
  cancelled,
}

/// Extension on OrderStatusFilter
extension OrderStatusFilterX on OrderStatusFilter {
  /// Get display name
  String get displayName {
    switch (this) {
      case OrderStatusFilter.all:
        return 'Toutes';
      case OrderStatusFilter.active:
        return 'En cours';
      case OrderStatusFilter.completed:
        return 'Terminées';
      case OrderStatusFilter.cancelled:
        return 'Annulées';
    }
  }
}
