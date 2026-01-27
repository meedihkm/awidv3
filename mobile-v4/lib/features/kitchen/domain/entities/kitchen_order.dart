import 'package:freezed_annotation/freezed_annotation.dart';

part 'kitchen_order.freezed.dart';

/// Statuts de commande en cuisine
enum KitchenOrderStatus {
  pending, // À préparer
  preparing, // En cours de préparation
  ready, // Prêt pour livraison
  completed, // Livré
  cancelled, // Annulé
}

/// Priorité de commande
enum OrderPriority {
  low,
  normal,
  high,
  urgent,
}

/// Entité représentant une commande en cuisine
@freezed
class KitchenOrder with _$KitchenOrder {
  const factory KitchenOrder({
    required String id,
    required String orderNumber,
    required String customerId,
    required String customerName,
    required KitchenOrderStatus status,
    required OrderPriority priority,
    required List<KitchenOrderItem> items,
    required DateTime orderTime,
    DateTime? startTime,
    DateTime? readyTime,
    DateTime? completedTime,
    String? assignedStation,
    String? assignedStaff,
    String? notes,
    String? specialInstructions,
    int? estimatedMinutes,
    @Default(false) bool isUrgent,
    @Default(false) bool isDelayed,
  }) = _KitchenOrder;

  const KitchenOrder._();

  /// Durée de préparation en minutes
  int? get preparationDuration {
    if (startTime == null) return null;
    final endTime = readyTime ?? DateTime.now();
    return endTime.difference(startTime!).inMinutes;
  }

  /// Temps écoulé depuis la commande
  int get elapsedMinutes {
    return DateTime.now().difference(orderTime).inMinutes;
  }

  /// Est en retard
  bool get isLate {
    if (estimatedMinutes == null) return false;
    return elapsedMinutes > estimatedMinutes!;
  }

  /// Temps restant estimé
  int? get remainingMinutes {
    if (estimatedMinutes == null) return null;
    final remaining = estimatedMinutes! - elapsedMinutes;
    return remaining > 0 ? remaining : 0;
  }

  /// Peut être démarré
  bool get canStart => status == KitchenOrderStatus.pending;

  /// Peut être marqué comme prêt
  bool get canMarkReady => status == KitchenOrderStatus.preparing;

  /// Peut être complété
  bool get canComplete => status == KitchenOrderStatus.ready;
}

/// Article d'une commande cuisine
@freezed
class KitchenOrderItem with _$KitchenOrderItem {
  const factory KitchenOrderItem({
    required String id,
    required String productId,
    required String productName,
    required int quantity,
    String? unit,
    String? notes,
    String? imageUrl,
    @Default(false) bool isPrepared,
    @Default(false) bool requiresSpecialPreparation,
  }) = _KitchenOrderItem;

  const KitchenOrderItem._();

  /// Quantité formatée avec unité
  String get formattedQuantity {
    if (unit != null) {
      return '$quantity $unit';
    }
    return quantity.toString();
  }
}
