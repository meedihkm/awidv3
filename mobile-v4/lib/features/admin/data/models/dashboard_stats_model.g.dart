// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardStatsModel _$DashboardStatsModelFromJson(Map<String, dynamic> json) =>
    _DashboardStatsModel(
      totalRevenue: (json['total_revenue'] as num).toDouble(),
      totalOrders: (json['total_orders'] as num).toInt(),
      pendingOrders: (json['pending_orders'] as num).toInt(),
      completedOrders: (json['completed_orders'] as num).toInt(),
      activeDeliveries: (json['active_deliveries'] as num).toInt(),
      activeDeliverers: (json['active_deliverers'] as num).toInt(),
      averageOrderValue: (json['average_order_value'] as num).toDouble(),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DashboardStatsModelToJson(
        _DashboardStatsModel instance) =>
    <String, dynamic>{
      'total_revenue': instance.totalRevenue,
      'total_orders': instance.totalOrders,
      'pending_orders': instance.pendingOrders,
      'completed_orders': instance.completedOrders,
      'active_deliveries': instance.activeDeliveries,
      'active_deliverers': instance.activeDeliverers,
      'average_order_value': instance.averageOrderValue,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
