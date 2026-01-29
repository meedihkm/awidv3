// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kitchen_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KitchenStatsModel _$KitchenStatsModelFromJson(Map<String, dynamic> json) =>
    _KitchenStatsModel(
      date: json['date'] as String,
      totalOrders: (json['total_orders'] as num).toInt(),
      completedOrders: (json['completed_orders'] as num).toInt(),
      pendingOrders: (json['pending_orders'] as num).toInt(),
      cancelledOrders: (json['cancelled_orders'] as num).toInt(),
      averagePreparationTime:
          (json['average_preparation_time'] as num).toDouble(),
      onTimeRate: (json['on_time_rate'] as num).toDouble(),
      delayedOrders: (json['delayed_orders'] as num).toInt(),
      ordersByHour: (json['orders_by_hour'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      ordersByStation:
          (json['orders_by_station'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      averageTimeByStation:
          (json['average_time_by_station'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      topProducts: (json['top_products'] as List<dynamic>?)
          ?.map((e) => TopProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      staffPerformance: (json['staff_performance'] as List<dynamic>?)
          ?.map(
              (e) => StaffPerformanceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KitchenStatsModelToJson(_KitchenStatsModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'total_orders': instance.totalOrders,
      'completed_orders': instance.completedOrders,
      'pending_orders': instance.pendingOrders,
      'cancelled_orders': instance.cancelledOrders,
      'average_preparation_time': instance.averagePreparationTime,
      'on_time_rate': instance.onTimeRate,
      'delayed_orders': instance.delayedOrders,
      'orders_by_hour': instance.ordersByHour,
      'orders_by_station': instance.ordersByStation,
      'average_time_by_station': instance.averageTimeByStation,
      'top_products': instance.topProducts?.map((e) => e.toJson()).toList(),
      'staff_performance':
          instance.staffPerformance?.map((e) => e.toJson()).toList(),
    };

_TopProductModel _$TopProductModelFromJson(Map<String, dynamic> json) =>
    _TopProductModel(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      orderCount: (json['order_count'] as num).toInt(),
      totalQuantity: (json['total_quantity'] as num).toInt(),
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$TopProductModelToJson(_TopProductModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'order_count': instance.orderCount,
      'total_quantity': instance.totalQuantity,
      'image_url': instance.imageUrl,
    };

_StaffPerformanceModel _$StaffPerformanceModelFromJson(
        Map<String, dynamic> json) =>
    _StaffPerformanceModel(
      staffId: json['staff_id'] as String,
      staffName: json['staff_name'] as String,
      ordersCompleted: (json['orders_completed'] as num).toInt(),
      averageTime: (json['average_time'] as num).toDouble(),
      qualityScore: (json['quality_score'] as num).toDouble(),
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$StaffPerformanceModelToJson(
        _StaffPerformanceModel instance) =>
    <String, dynamic>{
      'staff_id': instance.staffId,
      'staff_name': instance.staffName,
      'orders_completed': instance.ordersCompleted,
      'average_time': instance.averageTime,
      'quality_score': instance.qualityScore,
      'avatar_url': instance.avatarUrl,
    };

_PeriodStatsModel _$PeriodStatsModelFromJson(Map<String, dynamic> json) =>
    _PeriodStatsModel(
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      totalOrders: (json['total_orders'] as num).toInt(),
      completedOrders: (json['completed_orders'] as num).toInt(),
      averagePreparationTime:
          (json['average_preparation_time'] as num).toDouble(),
      revenue: (json['revenue'] as num).toDouble(),
      dailyStats: (json['daily_stats'] as List<dynamic>?)
          ?.map((e) => DailyStatsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PeriodStatsModelToJson(_PeriodStatsModel instance) =>
    <String, dynamic>{
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'total_orders': instance.totalOrders,
      'completed_orders': instance.completedOrders,
      'average_preparation_time': instance.averagePreparationTime,
      'revenue': instance.revenue,
      'daily_stats': instance.dailyStats?.map((e) => e.toJson()).toList(),
    };

_DailyStatsModel _$DailyStatsModelFromJson(Map<String, dynamic> json) =>
    _DailyStatsModel(
      date: json['date'] as String,
      orderCount: (json['order_count'] as num).toInt(),
      completedCount: (json['completed_count'] as num).toInt(),
      averageTime: (json['average_time'] as num).toDouble(),
      revenue: (json['revenue'] as num).toDouble(),
    );

Map<String, dynamic> _$DailyStatsModelToJson(_DailyStatsModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'order_count': instance.orderCount,
      'completed_count': instance.completedCount,
      'average_time': instance.averageTime,
      'revenue': instance.revenue,
    };

_HourlyStatsModel _$HourlyStatsModelFromJson(Map<String, dynamic> json) =>
    _HourlyStatsModel(
      hour: (json['hour'] as num).toInt(),
      orderCount: (json['order_count'] as num).toInt(),
      averageTime: (json['average_time'] as num).toDouble(),
      delayedCount: (json['delayed_count'] as num).toInt(),
    );

Map<String, dynamic> _$HourlyStatsModelToJson(_HourlyStatsModel instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'order_count': instance.orderCount,
      'average_time': instance.averageTime,
      'delayed_count': instance.delayedCount,
    };
