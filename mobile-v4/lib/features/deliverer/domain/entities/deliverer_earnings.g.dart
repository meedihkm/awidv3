// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliverer_earnings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DelivererEarnings _$DelivererEarningsFromJson(Map<String, dynamic> json) =>
    _DelivererEarnings(
      delivererId: json['deliverer_id'] as String,
      periodStart: DateTime.parse(json['period_start'] as String),
      periodEnd: DateTime.parse(json['period_end'] as String),
      totalEarnings: (json['total_earnings'] as num).toDouble(),
      deliveryFees: (json['delivery_fees'] as num).toDouble(),
      tips: (json['tips'] as num).toDouble(),
      bonuses: (json['bonuses'] as num).toDouble(),
      totalDeliveries: (json['total_deliveries'] as num).toInt(),
      completedDeliveries: (json['completed_deliveries'] as num).toInt(),
      averageEarningsPerDelivery:
          (json['average_earnings_per_delivery'] as num?)?.toDouble(),
      averageTip: (json['average_tip'] as num?)?.toDouble(),
      dailyBreakdown: (json['daily_breakdown'] as List<dynamic>?)
          ?.map((e) => DailyEarnings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DelivererEarningsToJson(_DelivererEarnings instance) =>
    <String, dynamic>{
      'deliverer_id': instance.delivererId,
      'period_start': instance.periodStart.toIso8601String(),
      'period_end': instance.periodEnd.toIso8601String(),
      'total_earnings': instance.totalEarnings,
      'delivery_fees': instance.deliveryFees,
      'tips': instance.tips,
      'bonuses': instance.bonuses,
      'total_deliveries': instance.totalDeliveries,
      'completed_deliveries': instance.completedDeliveries,
      'average_earnings_per_delivery': instance.averageEarningsPerDelivery,
      'average_tip': instance.averageTip,
      'daily_breakdown':
          instance.dailyBreakdown?.map((e) => e.toJson()).toList(),
    };

_DailyEarnings _$DailyEarningsFromJson(Map<String, dynamic> json) =>
    _DailyEarnings(
      date: DateTime.parse(json['date'] as String),
      earnings: (json['earnings'] as num).toDouble(),
      deliveries: (json['deliveries'] as num).toInt(),
    );

Map<String, dynamic> _$DailyEarningsToJson(_DailyEarnings instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'earnings': instance.earnings,
      'deliveries': instance.deliveries,
    };

_DelivererDetailedStats _$DelivererDetailedStatsFromJson(
        Map<String, dynamic> json) =>
    _DelivererDetailedStats(
      totalDeliveries: (json['total_deliveries'] as num).toInt(),
      completedDeliveries: (json['completed_deliveries'] as num).toInt(),
      cancelledDeliveries: (json['cancelled_deliveries'] as num).toInt(),
      failedDeliveries: (json['failed_deliveries'] as num).toInt(),
      averageRating: (json['average_rating'] as num).toDouble(),
      totalRatings: (json['total_ratings'] as num).toInt(),
      onTimePercentage: (json['on_time_percentage'] as num).toDouble(),
      averageDeliveryTime: (json['average_delivery_time'] as num).toDouble(),
      totalCustomers: (json['total_customers'] as num).toInt(),
      repeatCustomers: (json['repeat_customers'] as num).toInt(),
      bestDayEarnings: (json['best_day_earnings'] as num?)?.toDouble(),
      bestDayDate: json['best_day_date'] == null
          ? null
          : DateTime.parse(json['best_day_date'] as String),
      longestStreak: (json['longest_streak'] as num?)?.toInt(),
      currentStreak: (json['current_streak'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DelivererDetailedStatsToJson(
        _DelivererDetailedStats instance) =>
    <String, dynamic>{
      'total_deliveries': instance.totalDeliveries,
      'completed_deliveries': instance.completedDeliveries,
      'cancelled_deliveries': instance.cancelledDeliveries,
      'failed_deliveries': instance.failedDeliveries,
      'average_rating': instance.averageRating,
      'total_ratings': instance.totalRatings,
      'on_time_percentage': instance.onTimePercentage,
      'average_delivery_time': instance.averageDeliveryTime,
      'total_customers': instance.totalCustomers,
      'repeat_customers': instance.repeatCustomers,
      'best_day_earnings': instance.bestDayEarnings,
      'best_day_date': instance.bestDayDate?.toIso8601String(),
      'longest_streak': instance.longestStreak,
      'current_streak': instance.currentStreak,
    };
