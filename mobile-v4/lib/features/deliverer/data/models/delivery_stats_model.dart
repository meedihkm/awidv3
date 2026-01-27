import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/delivery_stats.dart';

part 'delivery_stats_model.freezed.dart';
part 'delivery_stats_model.g.dart';

/// Delivery Stats Model
/// Model pour la sérialisation JSON des statistiques
@freezed
class DeliveryStatsModel with _$DeliveryStatsModel {
  const factory DeliveryStatsModel({
    @JsonKey(name: 'total_deliveries') required int totalDeliveries,
    @JsonKey(name: 'completed_today') required int completedToday,
    @JsonKey(name: 'pending_deliveries') required int pendingDeliveries,
    @JsonKey(name: 'in_progress_deliveries') required int inProgressDeliveries,
    @JsonKey(name: 'total_earnings') required double totalEarnings,
    @JsonKey(name: 'today_earnings') required double todayEarnings,
    @JsonKey(name: 'average_rating') required double averageRating,
    @JsonKey(name: 'total_ratings') required int totalRatings,
    @JsonKey(name: 'average_delivery_time') double? averageDeliveryTime,
    @JsonKey(name: 'on_time_deliveries') int? onTimeDeliveries,
    @JsonKey(name: 'late_deliveries') int? lateDeliveries,
  }) = _DeliveryStatsModel;

  /// From Entity
  factory DeliveryStatsModel.fromEntity(DeliveryStats entity) {
    return DeliveryStatsModel(
      totalDeliveries: entity.totalDeliveries,
      completedToday: entity.completedToday,
      pendingDeliveries: entity.pendingDeliveries,
      inProgressDeliveries: entity.inProgressDeliveries,
      totalEarnings: entity.totalEarnings,
      todayEarnings: entity.todayEarnings,
      averageRating: entity.averageRating,
      totalRatings: entity.totalRatings,
      averageDeliveryTime: entity.averageDeliveryTime,
      onTimeDeliveries: entity.onTimeDeliveries,
      lateDeliveries: entity.lateDeliveries,
    );
  }

  const DeliveryStatsModel._();

  /// From JSON
  factory DeliveryStatsModel.fromJson(Map<String, dynamic> json) => _$DeliveryStatsModelFromJson(json);

  /// To Entity
  DeliveryStats toEntity() {
    return DeliveryStats(
      totalDeliveries: totalDeliveries,
      completedToday: completedToday,
      pendingDeliveries: pendingDeliveries,
      inProgressDeliveries: inProgressDeliveries,
      totalEarnings: totalEarnings,
      todayEarnings: todayEarnings,
      averageRating: averageRating,
      totalRatings: totalRatings,
      averageDeliveryTime: averageDeliveryTime,
      onTimeDeliveries: onTimeDeliveries,
      lateDeliveries: lateDeliveries,
    );
  }
}
