import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_stats.freezed.dart';

/// Delivery Stats Entity
/// Représente les statistiques d'un livreur
@freezed
class DeliveryStats with _$DeliveryStats {
  const factory DeliveryStats({
    required int totalDeliveries,
    required int completedToday,
    required int pendingDeliveries,
    required int inProgressDeliveries,
    required double totalEarnings,
    required double todayEarnings,
    required double averageRating,
    required int totalRatings,
    double? averageDeliveryTime,
    int? onTimeDeliveries,
    int? lateDeliveries,
  }) = _DeliveryStats;

  const DeliveryStats._();

  /// Get completion rate percentage
  double get completionRate {
    if (totalDeliveries == 0) return 0;
    final completed = totalDeliveries - (pendingDeliveries + inProgressDeliveries);
    return (completed / totalDeliveries) * 100;
  }

  /// Get on-time rate percentage
  double? get onTimeRate {
    if (onTimeDeliveries == null || totalDeliveries == 0) return null;
    return (onTimeDeliveries! / totalDeliveries) * 100;
  }

  /// Get rating stars (0-5)
  double get ratingStars => averageRating;

  /// Check if has good rating (>= 4.0)
  bool get hasGoodRating => averageRating >= 4.0;

  /// Check if has excellent rating (>= 4.5)
  bool get hasExcellentRating => averageRating >= 4.5;

  /// Get performance level
  String get performanceLevel {
    if (hasExcellentRating && (onTimeRate ?? 0) >= 90) {
      return 'Excellent';
    } else if (hasGoodRating && (onTimeRate ?? 0) >= 80) {
      return 'Bon';
    } else if (averageRating >= 3.0 && (onTimeRate ?? 0) >= 70) {
      return 'Moyen';
    }
    return 'À améliorer';
  }

  /// Get performance color
  String get performanceColor {
    switch (performanceLevel) {
      case 'Excellent':
        return 'green';
      case 'Bon':
        return 'blue';
      case 'Moyen':
        return 'orange';
      default:
        return 'red';
    }
  }

  /// Get average delivery time formatted
  String? get averageDeliveryTimeFormatted {
    if (averageDeliveryTime == null) return null;
    final minutes = averageDeliveryTime!.round();
    if (minutes < 60) {
      return '$minutes min';
    }
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    return '${hours}h ${remainingMinutes}min';
  }
}
