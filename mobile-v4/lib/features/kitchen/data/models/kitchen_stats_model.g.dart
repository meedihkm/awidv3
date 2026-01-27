// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kitchen_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitchenStatsModelImpl _$$KitchenStatsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KitchenStatsModelImpl(
      date: json['date'] as String,
      totalOrders: (json['totalOrders'] as num).toInt(),
      completedOrders: (json['completedOrders'] as num).toInt(),
      pendingOrders: (json['pendingOrders'] as num).toInt(),
      cancelledOrders: (json['cancelledOrders'] as num).toInt(),
      averagePreparationTime:
          (json['averagePreparationTime'] as num).toDouble(),
      onTimeRate: (json['onTimeRate'] as num).toDouble(),
      delayedOrders: (json['delayedOrders'] as num).toInt(),
      ordersByHour: (json['ordersByHour'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      ordersByStation: (json['ordersByStation'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      averageTimeByStation:
          (json['averageTimeByStation'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      topProducts: (json['topProducts'] as List<dynamic>?)
          ?.map((e) => TopProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      staffPerformance: (json['staffPerformance'] as List<dynamic>?)
          ?.map(
              (e) => StaffPerformanceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$KitchenStatsModelImplToJson(
        _$KitchenStatsModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'totalOrders': instance.totalOrders,
      'completedOrders': instance.completedOrders,
      'pendingOrders': instance.pendingOrders,
      'cancelledOrders': instance.cancelledOrders,
      'averagePreparationTime': instance.averagePreparationTime,
      'onTimeRate': instance.onTimeRate,
      'delayedOrders': instance.delayedOrders,
      'ordersByHour': instance.ordersByHour,
      'ordersByStation': instance.ordersByStation,
      'averageTimeByStation': instance.averageTimeByStation,
      'topProducts': instance.topProducts,
      'staffPerformance': instance.staffPerformance,
    };

_$TopProductModelImpl _$$TopProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TopProductModelImpl(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      orderCount: (json['orderCount'] as num).toInt(),
      totalQuantity: (json['totalQuantity'] as num).toInt(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$TopProductModelImplToJson(
        _$TopProductModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'orderCount': instance.orderCount,
      'totalQuantity': instance.totalQuantity,
      'imageUrl': instance.imageUrl,
    };

_$StaffPerformanceModelImpl _$$StaffPerformanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StaffPerformanceModelImpl(
      staffId: json['staffId'] as String,
      staffName: json['staffName'] as String,
      ordersCompleted: (json['ordersCompleted'] as num).toInt(),
      averageTime: (json['averageTime'] as num).toDouble(),
      qualityScore: (json['qualityScore'] as num).toDouble(),
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$$StaffPerformanceModelImplToJson(
        _$StaffPerformanceModelImpl instance) =>
    <String, dynamic>{
      'staffId': instance.staffId,
      'staffName': instance.staffName,
      'ordersCompleted': instance.ordersCompleted,
      'averageTime': instance.averageTime,
      'qualityScore': instance.qualityScore,
      'avatarUrl': instance.avatarUrl,
    };

_$PeriodStatsModelImpl _$$PeriodStatsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PeriodStatsModelImpl(
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      totalOrders: (json['totalOrders'] as num).toInt(),
      completedOrders: (json['completedOrders'] as num).toInt(),
      averagePreparationTime:
          (json['averagePreparationTime'] as num).toDouble(),
      revenue: (json['revenue'] as num).toDouble(),
      dailyStats: (json['dailyStats'] as List<dynamic>?)
          ?.map((e) => DailyStatsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PeriodStatsModelImplToJson(
        _$PeriodStatsModelImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'totalOrders': instance.totalOrders,
      'completedOrders': instance.completedOrders,
      'averagePreparationTime': instance.averagePreparationTime,
      'revenue': instance.revenue,
      'dailyStats': instance.dailyStats,
    };

_$DailyStatsModelImpl _$$DailyStatsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyStatsModelImpl(
      date: json['date'] as String,
      orderCount: (json['orderCount'] as num).toInt(),
      completedCount: (json['completedCount'] as num).toInt(),
      averageTime: (json['averageTime'] as num).toDouble(),
      revenue: (json['revenue'] as num).toDouble(),
    );

Map<String, dynamic> _$$DailyStatsModelImplToJson(
        _$DailyStatsModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'orderCount': instance.orderCount,
      'completedCount': instance.completedCount,
      'averageTime': instance.averageTime,
      'revenue': instance.revenue,
    };

_$HourlyStatsModelImpl _$$HourlyStatsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HourlyStatsModelImpl(
      hour: (json['hour'] as num).toInt(),
      orderCount: (json['orderCount'] as num).toInt(),
      averageTime: (json['averageTime'] as num).toDouble(),
      delayedCount: (json['delayedCount'] as num).toInt(),
    );

Map<String, dynamic> _$$HourlyStatsModelImplToJson(
        _$HourlyStatsModelImpl instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'orderCount': instance.orderCount,
      'averageTime': instance.averageTime,
      'delayedCount': instance.delayedCount,
    };
