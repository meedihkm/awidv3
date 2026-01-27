import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/dashboard_stats.dart';

part 'dashboard_stats_model.freezed.dart';
part 'dashboard_stats_model.g.dart';

/// Dashboard Stats Model
/// Modèle de données pour les statistiques
@freezed
class DashboardStatsModel with _$DashboardStatsModel {
  const factory DashboardStatsModel({
    required double totalRevenue,
    required int totalOrders,
    required int pendingOrders,
    required int completedOrders,
    required int activeDeliveries,
    required int activeDeliverers,
    required double averageOrderValue,
    required DateTime updatedAt,
  }) = _DashboardStatsModel;

  const DashboardStatsModel._();

  factory DashboardStatsModel.fromJson(Map<String, dynamic> json) => _$DashboardStatsModelFromJson(json);

  /// Convert to domain entity
  DashboardStats toEntity() {
    return DashboardStats(
      totalRevenue: totalRevenue,
      totalOrders: totalOrders,
      pendingOrders: pendingOrders,
      completedOrders: completedOrders,
      activeDeliveries: activeDeliveries,
      activeDeliverers: activeDeliverers,
      averageOrderValue: averageOrderValue,
      updatedAt: updatedAt,
    );
  }
}
