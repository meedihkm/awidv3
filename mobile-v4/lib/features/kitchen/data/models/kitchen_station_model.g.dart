// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kitchen_station_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KitchenStationModel _$KitchenStationModelFromJson(Map<String, dynamic> json) =>
    _KitchenStationModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      assignedStaffId: json['assigned_staff_id'] as String?,
      assignedStaffName: json['assigned_staff_name'] as String?,
      currentOrderIds: (json['current_order_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      capacity: (json['capacity'] as num?)?.toInt(),
      activeOrders: (json['active_orders'] as num?)?.toInt(),
      lastActivityTime: json['last_activity_time'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$KitchenStationModelToJson(
        _KitchenStationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'status': instance.status,
      'assigned_staff_id': instance.assignedStaffId,
      'assigned_staff_name': instance.assignedStaffName,
      'current_order_ids': instance.currentOrderIds,
      'capacity': instance.capacity,
      'active_orders': instance.activeOrders,
      'last_activity_time': instance.lastActivityTime,
      'notes': instance.notes,
    };

_StationAssignmentModel _$StationAssignmentModelFromJson(
        Map<String, dynamic> json) =>
    _StationAssignmentModel(
      orderId: json['order_id'] as String,
      stationId: json['station_id'] as String,
      stationName: json['station_name'] as String,
      assignedAt: json['assigned_at'] as String,
      startedAt: json['started_at'] as String?,
      completedAt: json['completed_at'] as String?,
      assignedBy: json['assigned_by'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$StationAssignmentModelToJson(
        _StationAssignmentModel instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'station_id': instance.stationId,
      'station_name': instance.stationName,
      'assigned_at': instance.assignedAt,
      'started_at': instance.startedAt,
      'completed_at': instance.completedAt,
      'assigned_by': instance.assignedBy,
      'notes': instance.notes,
    };
