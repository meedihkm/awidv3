import 'package:freezed_annotation/freezed_annotation.dart';

part 'kitchen_stats.freezed.dart';

/// Statistiques de cuisine
@freezed
class KitchenStats with _$KitchenStats {
  const factory KitchenStats({
    required DateTime date,
    required int totalOrders,
    required int completedOrders,
    required int pendingOrders,
    required int cancelledOrders,
    required double averagePreparationTime,
    required double onTimeRate,
    required int delayedOrders,
    Map<String, int>? ordersByHour,
    Map<String, int>? ordersByStation,
    Map<String, double>? averageTimeByStation,
    List<TopProduct>? topProducts,
    List<StaffPerformance>? staffPerformance,
  }) = _KitchenStats;

  const KitchenStats._();

  /// Taux de complétion en pourcentage
  double get completionRate {
    if (totalOrders == 0) return 0;
    return (completedOrders / totalOrders) * 100;
  }

  /// Taux d'annulation en pourcentage
  double get cancellationRate {
    if (totalOrders == 0) return 0;
    return (cancelledOrders / totalOrders) * 100;
  }

  /// Taux de retard en pourcentage
  double get delayRate {
    if (completedOrders == 0) return 0;
    return (delayedOrders / completedOrders) * 100;
  }

  /// Commandes en cours
  int get activeOrders {
    return totalOrders - completedOrders - cancelledOrders;
  }

  /// Performance globale (0-100)
  double get overallPerformance {
    final completion = completionRate * 0.4;
    final onTime = onTimeRate * 0.4;
    final lowCancellation = (100 - cancellationRate) * 0.2;
    return completion + onTime + lowCancellation;
  }
}

/// Produit le plus commandé
@freezed
class TopProduct with _$TopProduct {
  const factory TopProduct({
    required String productId,
    required String productName,
    required int orderCount,
    required int totalQuantity,
    String? imageUrl,
  }) = _TopProduct;
}

/// Performance du personnel
@freezed
class StaffPerformance with _$StaffPerformance {
  const factory StaffPerformance({
    required String staffId,
    required String staffName,
    required int ordersCompleted,
    required double averageTime,
    required double qualityScore,
    String? avatarUrl,
  }) = _StaffPerformance;

  const StaffPerformance._();

  /// Score de performance global (0-100)
  double get performanceScore {
    // Plus de commandes = mieux (max 40 points)
    final volumeScore = (ordersCompleted / 50 * 40).clamp(0, 40);
    
    // Temps moyen plus bas = mieux (max 30 points)
    final timeScore = averageTime > 0 
        ? ((60 - averageTime) / 60 * 30).clamp(0, 30)
        : 0;
    
    // Score qualité (max 30 points)
    final quality = qualityScore * 30 / 100;
    
    return volumeScore + timeScore + quality;
  }
}

/// Statistiques horaires
@freezed
class HourlyStats with _$HourlyStats {
  const factory HourlyStats({
    required int hour,
    required int orderCount,
    required double averageTime,
    required int delayedCount,
  }) = _HourlyStats;

  const HourlyStats._();

  /// Taux de retard
  double get delayRate {
    if (orderCount == 0) return 0;
    return (delayedCount / orderCount) * 100;
  }

  /// Heure formatée
  String get formattedHour {
    return '${hour.toString().padLeft(2, '0')}:00';
  }
}

/// Statistiques par période
@freezed
class PeriodStats with _$PeriodStats {
  const factory PeriodStats({
    required DateTime startDate,
    required DateTime endDate,
    required int totalOrders,
    required int completedOrders,
    required double averagePreparationTime,
    required double revenue,
    List<DailyStats>? dailyStats,
  }) = _PeriodStats;

  const PeriodStats._();

  /// Nombre de jours dans la période
  int get daysCount {
    return endDate.difference(startDate).inDays + 1;
  }

  /// Moyenne de commandes par jour
  double get averageOrdersPerDay {
    if (daysCount == 0) return 0;
    return totalOrders / daysCount;
  }

  /// Revenu moyen par commande
  double get averageRevenuePerOrder {
    if (totalOrders == 0) return 0;
    return revenue / totalOrders;
  }
}

/// Statistiques journalières
@freezed
class DailyStats with _$DailyStats {
  const factory DailyStats({
    required DateTime date,
    required int orderCount,
    required int completedCount,
    required double averageTime,
    required double revenue,
  }) = _DailyStats;

  const DailyStats._();

  /// Taux de complétion
  double get completionRate {
    if (orderCount == 0) return 0;
    return (completedCount / orderCount) * 100;
  }

  /// Date formatée
  String get formattedDate {
    return '${date.day}/${date.month}';
  }
}
