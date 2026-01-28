import 'package:freezed_annotation/freezed_annotation.dart';

part 'deliverer_earnings.freezed.dart';
part 'deliverer_earnings.g.dart';

/// Deliverer Earnings
/// Représente les gains d'un livreur
@freezed
class DelivererEarnings with _$DelivererEarnings {
  const factory DelivererEarnings({
    required String delivererId,
    required DateTime periodStart,
    required DateTime periodEnd,
    required double totalEarnings,
    required double deliveryFees,
    required double tips,
    required double bonuses,
    required int totalDeliveries,
    required int completedDeliveries,
    double? averageEarningsPerDelivery,
    double? averageTip,
    List<DailyEarnings>? dailyBreakdown,
  }) = _DelivererEarnings;

  factory DelivererEarnings.fromJson(Map<String, dynamic> json) =>
      _$DelivererEarningsFromJson(json);

  const DelivererEarnings._();

  /// Get formatted total earnings
  String get totalEarningsFormatted {
    return '${totalEarnings.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Get formatted delivery fees
  String get deliveryFeesFormatted {
    return '${deliveryFees.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Get formatted tips
  String get tipsFormatted {
    return '${tips.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Get formatted bonuses
  String get bonusesFormatted {
    return '${bonuses.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Get formatted period
  String get periodFormatted {
    return '${periodStart.day.toString().padLeft(2, '0')}/'
        '${periodStart.month.toString().padLeft(2, '0')} - '
        '${periodEnd.day.toString().padLeft(2, '0')}/'
        '${periodEnd.month.toString().padLeft(2, '0')}';
  }

  /// Get completion rate
  double get completionRate {
    if (totalDeliveries == 0) return 0;
    return (completedDeliveries / totalDeliveries) * 100;
  }

  /// Get tips percentage
  double get tipsPercentage {
    if (totalEarnings == 0) return 0;
    return (tips / totalEarnings) * 100;
  }

  /// Get bonuses percentage
  double get bonusesPercentage {
    if (totalEarnings == 0) return 0;
    return (bonuses / totalEarnings) * 100;
  }
}

/// Daily Earnings
/// Représente les gains quotidiens
@freezed
class DailyEarnings with _$DailyEarnings {
  const factory DailyEarnings({
    required DateTime date,
    required double earnings,
    required int deliveries,
  }) = _DailyEarnings;

  factory DailyEarnings.fromJson(Map<String, dynamic> json) =>
      _$DailyEarningsFromJson(json);

  const DailyEarnings._();

  /// Get formatted date
  String get dateFormatted {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}';
  }

  /// Get formatted earnings
  String get earningsFormatted {
    return '${earnings.toStringAsFixed(0)} DZD';
  }

  /// Get average per delivery
  double get averagePerDelivery {
    if (deliveries == 0) return 0;
    return earnings / deliveries;
  }
}

/// Deliverer Detailed Stats
/// Statistiques détaillées du livreur
@freezed
class DelivererDetailedStats with _$DelivererDetailedStats {
  const factory DelivererDetailedStats({
    required int totalDeliveries,
    required int completedDeliveries,
    required int cancelledDeliveries,
    required int failedDeliveries,
    required double averageRating,
    required int totalRatings,
    required double onTimePercentage,
    required double averageDeliveryTime,
    required int totalCustomers,
    required int repeatCustomers,
    double? bestDayEarnings,
    DateTime? bestDayDate,
    int? longestStreak,
    int? currentStreak,
  }) = _DelivererDetailedStats;

  factory DelivererDetailedStats.fromJson(Map<String, dynamic> json) =>
      _$DelivererDetailedStatsFromJson(json);

  const DelivererDetailedStats._();

  /// Get completion rate
  double get completionRate {
    if (totalDeliveries == 0) return 0;
    return (completedDeliveries / totalDeliveries) * 100;
  }

  /// Get cancellation rate
  double get cancellationRate {
    if (totalDeliveries == 0) return 0;
    return (cancelledDeliveries / totalDeliveries) * 100;
  }

  /// Get failure rate
  double get failureRate {
    if (totalDeliveries == 0) return 0;
    return (failedDeliveries / totalDeliveries) * 100;
  }

  /// Get repeat customer rate
  double get repeatCustomerRate {
    if (totalCustomers == 0) return 0;
    return (repeatCustomers / totalCustomers) * 100;
  }

  /// Get formatted average delivery time
  String get averageDeliveryTimeFormatted {
    final minutes = averageDeliveryTime.round();
    if (minutes < 60) {
      return '$minutes min';
    }
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    return '${hours}h ${remainingMinutes}min';
  }

  /// Get performance level
  String get performanceLevel {
    if (averageRating >= 4.5 && onTimePercentage >= 90 && completionRate >= 95) {
      return 'Excellent';
    } else if (averageRating >= 4.0 && onTimePercentage >= 80 && completionRate >= 90) {
      return 'Très bon';
    } else if (averageRating >= 3.5 && onTimePercentage >= 70 && completionRate >= 85) {
      return 'Bon';
    } else if (averageRating >= 3.0 && onTimePercentage >= 60 && completionRate >= 80) {
      return 'Moyen';
    }
    return 'À améliorer';
  }

  /// Get performance color
  String get performanceColor {
    switch (performanceLevel) {
      case 'Excellent':
        return 'green';
      case 'Très bon':
        return 'lightgreen';
      case 'Bon':
        return 'blue';
      case 'Moyen':
        return 'orange';
      default:
        return 'red';
    }
  }
}
