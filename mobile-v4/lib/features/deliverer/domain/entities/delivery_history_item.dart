import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_history_item.freezed.dart';
part 'delivery_history_item.g.dart';

/// Delivery History Item
/// Représente un élément de l'historique de livraison
@freezed
class DeliveryHistoryItem with _$DeliveryHistoryItem {
  const factory DeliveryHistoryItem({
    required String id,
    required String orderNumber,
    required String customerName,
    required String customerAddress,
    required DateTime deliveryDate,
    required DeliveryHistoryStatus status,
    required double orderAmount,
    double? deliveryFee,
    double? tip,
    String? notes,
    String? rating,
    String? feedback,
    DateTime? completedAt,
    int? deliveryDuration, // in minutes
  }) = _DeliveryHistoryItem;

  factory DeliveryHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$DeliveryHistoryItemFromJson(json);

  const DeliveryHistoryItem._();

  /// Get total earnings for this delivery
  double get totalEarnings {
    return (deliveryFee ?? 0) + (tip ?? 0);
  }

  /// Get formatted total earnings
  String get totalEarningsFormatted {
    return '${totalEarnings.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Get formatted order amount
  String get orderAmountFormatted {
    return '${orderAmount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Get formatted delivery date
  String get deliveryDateFormatted {
    return '${deliveryDate.day.toString().padLeft(2, '0')}/'
        '${deliveryDate.month.toString().padLeft(2, '0')}/'
        '${deliveryDate.year}';
  }

  /// Get formatted delivery time
  String get deliveryTimeFormatted {
    return '${deliveryDate.hour.toString().padLeft(2, '0')}:'
        '${deliveryDate.minute.toString().padLeft(2, '0')}';
  }

  /// Get formatted delivery duration
  String? get deliveryDurationFormatted {
    if (deliveryDuration == null) return null;
    if (deliveryDuration! < 60) {
      return '$deliveryDuration min';
    }
    final hours = deliveryDuration! ~/ 60;
    final minutes = deliveryDuration! % 60;
    return '${hours}h ${minutes}min';
  }

  /// Check if has rating
  bool get hasRating => rating != null && rating!.isNotEmpty;

  /// Check if has feedback
  bool get hasFeedback => feedback != null && feedback!.isNotEmpty;

  /// Check if was completed on time
  bool get wasOnTime {
    if (completedAt == null || deliveryDuration == null) return true;
    return deliveryDuration! <= 45; // Assuming 45 minutes is the target
  }

  // Legacy compatibility getters
  String get deliveryNumber => orderNumber;
  String get deliveryAddress => customerAddress;
  int get orderCount => 1; // Une livraison = une commande dans ce contexte
  double get totalAmount => orderAmount;
  double? get paymentCollected => orderAmount; // Si livré, considéré comme payé
  double? get packagingDeposited => null; // À implémenter si nécessaire
  double? get packagingReturned => null; // À implémenter si nécessaire
  bool get hasProofOfDelivery => status == DeliveryHistoryStatus.completed;
}

/// Delivery History Status
enum DeliveryHistoryStatus {
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('failed')
  failed,
}

extension DeliveryHistoryStatusX on DeliveryHistoryStatus {
  /// Get display name
  String get displayName {
    switch (this) {
      case DeliveryHistoryStatus.completed:
        return 'Livrée';
      case DeliveryHistoryStatus.cancelled:
        return 'Annulée';
      case DeliveryHistoryStatus.failed:
        return 'Échouée';
    }
  }

  /// Get color
  String get color {
    switch (this) {
      case DeliveryHistoryStatus.completed:
        return 'green';
      case DeliveryHistoryStatus.cancelled:
        return 'orange';
      case DeliveryHistoryStatus.failed:
        return 'red';
    }
  }

  /// Get icon
  String get icon {
    switch (this) {
      case DeliveryHistoryStatus.completed:
        return '✅';
      case DeliveryHistoryStatus.cancelled:
        return '❌';
      case DeliveryHistoryStatus.failed:
        return '⚠️';
    }
  }
}
