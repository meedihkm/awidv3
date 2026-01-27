import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_stats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kitchen_stats_model.freezed.dart';
part 'kitchen_stats_model.g.dart';

/// Model pour KitchenStats
@freezed
class KitchenStatsModel with _$KitchenStatsModel {
  const factory KitchenStatsModel({
    required String date,
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
    List<TopProductModel>? topProducts,
    List<StaffPerformanceModel>? staffPerformance,
  }) = _KitchenStatsModel;

  const KitchenStatsModel._();

  factory KitchenStatsModel.fromJson(Map<String, dynamic> json) =>
      _$KitchenStatsModelFromJson(json);

  /// Convertir vers entité
  KitchenStats toEntity() {
    return KitchenStats(
      date: DateTime.parse(date),
      totalOrders: totalOrders,
      completedOrders: completedOrders,
      pendingOrders: pendingOrders,
      cancelledOrders: cancelledOrders,
      averagePreparationTime: averagePreparationTime,
      onTimeRate: onTimeRate,
      delayedOrders: delayedOrders,
      ordersByHour: ordersByHour,
      ordersByStation: ordersByStation,
      averageTimeByStation: averageTimeByStation,
      topProducts: topProducts?.map((p) => p.toEntity()).toList(),
      staffPerformance: staffPerformance?.map((s) => s.toEntity()).toList(),
    );
  }

  /// Créer depuis entité
  factory KitchenStatsModel.fromEntity(KitchenStats entity) {
    return KitchenStatsModel(
      date: entity.date.toIso8601String(),
      totalOrders: entity.totalOrders,
      completedOrders: entity.completedOrders,
      pendingOrders: entity.pendingOrders,
      cancelledOrders: entity.cancelledOrders,
      averagePreparationTime: entity.averagePreparationTime,
      onTimeRate: entity.onTimeRate,
      delayedOrders: entity.delayedOrders,
      ordersByHour: entity.ordersByHour,
      ordersByStation: entity.ordersByStation,
      averageTimeByStation: entity.averageTimeByStation,
      topProducts: entity.topProducts?.map((p) => TopProductModel.fromEntity(p)).toList(),
      staffPerformance: entity.staffPerformance?.map((s) => StaffPerformanceModel.fromEntity(s)).toList(),
    );
  }
}

/// Model pour TopProduct
@freezed
class TopProductModel with _$TopProductModel {
  const factory TopProductModel({
    required String productId,
    required String productName,
    required int orderCount,
    required int totalQuantity,
    String? imageUrl,
  }) = _TopProductModel;

  const TopProductModel._();

  factory TopProductModel.fromJson(Map<String, dynamic> json) =>
      _$TopProductModelFromJson(json);

  TopProduct toEntity() {
    return TopProduct(
      productId: productId,
      productName: productName,
      orderCount: orderCount,
      totalQuantity: totalQuantity,
      imageUrl: imageUrl,
    );
  }

  factory TopProductModel.fromEntity(TopProduct entity) {
    return TopProductModel(
      productId: entity.productId,
      productName: entity.productName,
      orderCount: entity.orderCount,
      totalQuantity: entity.totalQuantity,
      imageUrl: entity.imageUrl,
    );
  }
}

/// Model pour StaffPerformance
@freezed
class StaffPerformanceModel with _$StaffPerformanceModel {
  const factory StaffPerformanceModel({
    required String staffId,
    required String staffName,
    required int ordersCompleted,
    required double averageTime,
    required double qualityScore,
    String? avatarUrl,
  }) = _StaffPerformanceModel;

  const StaffPerformanceModel._();

  factory StaffPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$StaffPerformanceModelFromJson(json);

  StaffPerformance toEntity() {
    return StaffPerformance(
      staffId: staffId,
      staffName: staffName,
      ordersCompleted: ordersCompleted,
      averageTime: averageTime,
      qualityScore: qualityScore,
      avatarUrl: avatarUrl,
    );
  }

  factory StaffPerformanceModel.fromEntity(StaffPerformance entity) {
    return StaffPerformanceModel(
      staffId: entity.staffId,
      staffName: entity.staffName,
      ordersCompleted: entity.ordersCompleted,
      averageTime: entity.averageTime,
      qualityScore: entity.qualityScore,
      avatarUrl: entity.avatarUrl,
    );
  }
}

/// Model pour PeriodStats
@freezed
class PeriodStatsModel with _$PeriodStatsModel {
  const factory PeriodStatsModel({
    required String startDate,
    required String endDate,
    required int totalOrders,
    required int completedOrders,
    required double averagePreparationTime,
    required double revenue,
    List<DailyStatsModel>? dailyStats,
  }) = _PeriodStatsModel;

  const PeriodStatsModel._();

  factory PeriodStatsModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodStatsModelFromJson(json);

  PeriodStats toEntity() {
    return PeriodStats(
      startDate: DateTime.parse(startDate),
      endDate: DateTime.parse(endDate),
      totalOrders: totalOrders,
      completedOrders: completedOrders,
      averagePreparationTime: averagePreparationTime,
      revenue: revenue,
      dailyStats: dailyStats?.map((d) => d.toEntity()).toList(),
    );
  }

  factory PeriodStatsModel.fromEntity(PeriodStats entity) {
    return PeriodStatsModel(
      startDate: entity.startDate.toIso8601String(),
      endDate: entity.endDate.toIso8601String(),
      totalOrders: entity.totalOrders,
      completedOrders: entity.completedOrders,
      averagePreparationTime: entity.averagePreparationTime,
      revenue: entity.revenue,
      dailyStats: entity.dailyStats?.map((d) => DailyStatsModel.fromEntity(d)).toList(),
    );
  }
}

/// Model pour DailyStats
@freezed
class DailyStatsModel with _$DailyStatsModel {
  const factory DailyStatsModel({
    required String date,
    required int orderCount,
    required int completedCount,
    required double averageTime,
    required double revenue,
  }) = _DailyStatsModel;

  const DailyStatsModel._();

  factory DailyStatsModel.fromJson(Map<String, dynamic> json) =>
      _$DailyStatsModelFromJson(json);

  DailyStats toEntity() {
    return DailyStats(
      date: DateTime.parse(date),
      orderCount: orderCount,
      completedCount: completedCount,
      averageTime: averageTime,
      revenue: revenue,
    );
  }

  factory DailyStatsModel.fromEntity(DailyStats entity) {
    return DailyStatsModel(
      date: entity.date.toIso8601String(),
      orderCount: entity.orderCount,
      completedCount: entity.completedCount,
      averageTime: entity.averageTime,
      revenue: entity.revenue,
    );
  }
}

/// Model pour HourlyStats
@freezed
class HourlyStatsModel with _$HourlyStatsModel {
  const factory HourlyStatsModel({
    required int hour,
    required int orderCount,
    required double averageTime,
    required int delayedCount,
  }) = _HourlyStatsModel;

  const HourlyStatsModel._();

  factory HourlyStatsModel.fromJson(Map<String, dynamic> json) =>
      _$HourlyStatsModelFromJson(json);

  HourlyStats toEntity() {
    return HourlyStats(
      hour: hour,
      orderCount: orderCount,
      averageTime: averageTime,
      delayedCount: delayedCount,
    );
  }

  factory HourlyStatsModel.fromEntity(HourlyStats entity) {
    return HourlyStatsModel(
      hour: entity.hour,
      orderCount: entity.orderCount,
      averageTime: entity.averageTime,
      delayedCount: entity.delayedCount,
    );
  }
}
