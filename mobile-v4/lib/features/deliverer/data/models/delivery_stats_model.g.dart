// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryStatsModelImpl _$$DeliveryStatsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryStatsModelImpl(
      totalDeliveries: (json['total_deliveries'] as num).toInt(),
      completedToday: (json['completed_today'] as num).toInt(),
      pendingDeliveries: (json['pending_deliveries'] as num).toInt(),
      inProgressDeliveries: (json['in_progress_deliveries'] as num).toInt(),
      totalEarnings: (json['total_earnings'] as num).toDouble(),
      todayEarnings: (json['today_earnings'] as num).toDouble(),
      averageRating: (json['average_rating'] as num).toDouble(),
      totalRatings: (json['total_ratings'] as num).toInt(),
      averageDeliveryTime: (json['average_delivery_time'] as num?)?.toDouble(),
      onTimeDeliveries: (json['on_time_deliveries'] as num?)?.toInt(),
      lateDeliveries: (json['late_deliveries'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DeliveryStatsModelImplToJson(
        _$DeliveryStatsModelImpl instance) =>
    <String, dynamic>{
      'total_deliveries': instance.totalDeliveries,
      'completed_today': instance.completedToday,
      'pending_deliveries': instance.pendingDeliveries,
      'in_progress_deliveries': instance.inProgressDeliveries,
      'total_earnings': instance.totalEarnings,
      'today_earnings': instance.todayEarnings,
      'average_rating': instance.averageRating,
      'total_ratings': instance.totalRatings,
      'average_delivery_time': instance.averageDeliveryTime,
      'on_time_deliveries': instance.onTimeDeliveries,
      'late_deliveries': instance.lateDeliveries,
    };
