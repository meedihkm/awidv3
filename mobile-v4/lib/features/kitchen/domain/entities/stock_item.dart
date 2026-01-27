import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_item.freezed.dart';

/// Unité de mesure
enum StockUnit {
  kg, // Kilogramme
  g, // Gramme
  l, // Litre
  ml, // Millilitre
  unit, // Unité
  box, // Boîte
  pack, // Pack
}

/// Niveau de stock
enum StockLevel {
  critical, // Critique (< 10%)
  low, // Bas (< 25%)
  normal, // Normal (25-75%)
  high, // Élevé (> 75%)
}

/// Entité représentant un article en stock
@freezed
class StockItem with _$StockItem {
  const factory StockItem({
    required String id,
    required String productId,
    required String productName,
    required double currentQuantity,
    required double minimumQuantity,
    required double maximumQuantity,
    required StockUnit unit,
    String? category,
    String? supplier,
    String? location,
    String? imageUrl,
    DateTime? lastRestockDate,
    DateTime? expirationDate,
    double? unitCost,
    String? barcode,
    @Default(false) bool isPerishable,
    @Default(false) bool requiresRefrigeration,
  }) = _StockItem;

  const StockItem._();

  /// Niveau de stock
  StockLevel get stockLevel {
    final percentage = (currentQuantity / maximumQuantity) * 100;
    if (percentage < 10) return StockLevel.critical;
    if (percentage < 25) return StockLevel.low;
    if (percentage > 75) return StockLevel.high;
    return StockLevel.normal;
  }

  /// Quantité manquante pour atteindre le maximum
  double get quantityToRestock {
    final needed = maximumQuantity - currentQuantity;
    return needed > 0 ? needed : 0;
  }

  /// Est en rupture de stock
  bool get isOutOfStock {
    return currentQuantity <= 0;
  }

  /// Est en stock critique
  bool get isCritical {
    return stockLevel == StockLevel.critical || currentQuantity <= minimumQuantity;
  }

  /// Est en stock bas
  bool get isLow {
    return stockLevel == StockLevel.low;
  }

  /// Jours avant expiration
  int? get daysUntilExpiration {
    if (expirationDate == null) return null;
    return expirationDate!.difference(DateTime.now()).inDays;
  }

  /// Est proche de l'expiration (< 7 jours)
  bool get isNearExpiration {
    final days = daysUntilExpiration;
    return days != null && days < 7 && days >= 0;
  }

  /// Est expiré
  bool get isExpired {
    final days = daysUntilExpiration;
    return days != null && days < 0;
  }

  /// Valeur totale du stock
  double get totalValue {
    if (unitCost == null) return 0;
    return currentQuantity * unitCost!;
  }

  /// Quantité formatée avec unité
  String get formattedQuantity {
    return '${currentQuantity.toStringAsFixed(1)} ${_unitToString(unit)}';
  }

  /// Convertir unité en string
  String _unitToString(StockUnit unit) {
    switch (unit) {
      case StockUnit.kg:
        return 'kg';
      case StockUnit.g:
        return 'g';
      case StockUnit.l:
        return 'L';
      case StockUnit.ml:
        return 'mL';
      case StockUnit.unit:
        return 'unité(s)';
      case StockUnit.box:
        return 'boîte(s)';
      case StockUnit.pack:
        return 'pack(s)';
    }
  }
}

/// Mouvement de stock
@freezed
class StockMovement with _$StockMovement {
  const factory StockMovement({
    required String id,
    required String stockItemId,
    required String productName,
    required StockMovementType type,
    required double quantity,
    required StockUnit unit,
    required DateTime timestamp,
    String? orderId,
    String? userId,
    String? userName,
    String? reason,
    String? notes,
  }) = _StockMovement;

  const StockMovement._();

  /// Quantité formatée avec signe
  String get formattedQuantity {
    final sign = type == StockMovementType.stockIn ? '+' : '-';
    return '$sign${quantity.toStringAsFixed(1)}';
  }
}

/// Type de mouvement de stock
enum StockMovementType {
  stockIn, // Entrée (réapprovisionnement)
  stockOut, // Sortie (utilisation)
  adjustment, // Ajustement (inventaire)
  waste, // Perte (péremption, casse)
  transfer, // Transfert
}

/// Alerte de stock
@freezed
class StockAlert with _$StockAlert {
  const factory StockAlert({
    required String id,
    required String stockItemId,
    required String productName,
    required StockAlertType type,
    required StockAlertSeverity severity,
    required DateTime createdAt,
    String? message,
    bool? isResolved,
    DateTime? resolvedAt,
  }) = _StockAlert;

  const StockAlert._();

  /// Est active
  bool get isActive {
    return isResolved != true;
  }

  /// Durée depuis création en heures
  int get hoursSinceCreated {
    return DateTime.now().difference(createdAt).inHours;
  }
}

/// Type d'alerte de stock
enum StockAlertType {
  outOfStock, // Rupture de stock
  lowStock, // Stock bas
  criticalStock, // Stock critique
  nearExpiration, // Proche expiration
  expired, // Expiré
}

/// Sévérité de l'alerte
enum StockAlertSeverity {
  info,
  warning,
  critical,
  urgent,
}
