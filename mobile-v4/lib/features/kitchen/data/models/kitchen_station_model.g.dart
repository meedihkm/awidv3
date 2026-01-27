// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kitchen_station_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitchenStationModelImpl _$$KitchenStationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KitchenStationModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      assignedStaffId: json['assignedStaffId'] as String?,
      assignedStaffName: json['assignedStaffName'] as String?,
      currentOrderIds: (json['currentOrderIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      capacity: (json['capacity'] as num?)?.toInt(),
      activeOrders: (json['activeOrders'] as num?)?.toInt(),
      lastActivityTime: json['lastActivityTime'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$KitchenStationModelImplToJson(
        _$KitchenStationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'status': instance.status,
      'assignedStaffId': instance.assignedStaffId,
      'assignedStaffName': instance.assignedStaffName,
      'currentOrderIds': instance.currentOrderIds,
      'capacity': instance.capacity,
      'activeOrders': instance.activeOrders,
      'lastActivityTime': instance.lastActivityTime,
      'notes': instance.notes,
    };

_$StationAssignmentModelImpl _$$StationAssignmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StationAssignmentModelImpl(
      orderId: json['orderId'] as String,
      stationId: json['stationId'] as String,
      stationName: json['stationName'] as String,
      assignedAt: json['assignedAt'] as String,
      startedAt: json['startedAt'] as String?,
      completedAt: json['completedAt'] as String?,
      assignedBy: json['assignedBy'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$StationAssignmentModelImplToJson(
        _$StationAssignmentModelImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'stationId': instance.stationId,
      'stationName': instance.stationName,
      'assignedAt': instance.assignedAt,
      'startedAt': instance.startedAt,
      'completedAt': instance.completedAt,
      'assignedBy': instance.assignedBy,
      'notes': instance.notes,
    };
