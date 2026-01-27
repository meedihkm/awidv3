import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_stats.freezed.dart';

/// Dashboard Stats Entity
/// Statistiques du dashboard admin
@freezed
class DashboardStats with _$DashboardStats {
  const factory DashboardStats({
    required double totalRevenue,
    required int totalOrders,
    required int pendingOrders,
    required int completedOrders,
    required int activeDeliveries,
    required int activeDeliverers,
    required double averageOrderValue,
    required DateTime updatedAt,
  }) = _DashboardStats;

  const DashboardStats._();

  /// Get revenue formatted
  String get revenueFormatted => '${totalRevenue.toStringAsFixed(2)} DA';

  /// Get completion rate
  double get completionRate {
    if (totalOrders == 0) return 0;
    return (completedOrders / totalOrders) * 100;
  }
}
