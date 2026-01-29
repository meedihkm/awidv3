// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductionTaskModel _$ProductionTaskModelFromJson(Map<String, dynamic> json) =>
    _ProductionTaskModel(
      id: json['id'] as String,
      orderId: json['order_id'] as String,
      orderNumber: json['order_number'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      priority: json['priority'] as String,
      description: json['description'] as String,
      createdAt: json['created_at'] as String,
      scheduledAt: json['scheduled_at'] as String?,
      startedAt: json['started_at'] as String?,
      completedAt: json['completed_at'] as String?,
      assignedStationId: json['assigned_station_id'] as String?,
      assignedStationName: json['assigned_station_name'] as String?,
      assignedStaffId: json['assigned_staff_id'] as String?,
      assignedStaffName: json['assigned_staff_name'] as String?,
      estimatedDuration: (json['estimated_duration'] as num?)?.toInt(),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => TaskStepModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiredEquipment: (json['required_equipment'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requiredIngredients: (json['required_ingredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notes: json['notes'] as String?,
      completionNotes: json['completion_notes'] as String?,
      isBlocking: json['is_blocking'] as bool? ?? false,
      requiresQualityCheck: json['requires_quality_check'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductionTaskModelToJson(
        _ProductionTaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'order_number': instance.orderNumber,
      'type': instance.type,
      'status': instance.status,
      'priority': instance.priority,
      'description': instance.description,
      'created_at': instance.createdAt,
      'scheduled_at': instance.scheduledAt,
      'started_at': instance.startedAt,
      'completed_at': instance.completedAt,
      'assigned_station_id': instance.assignedStationId,
      'assigned_station_name': instance.assignedStationName,
      'assigned_staff_id': instance.assignedStaffId,
      'assigned_staff_name': instance.assignedStaffName,
      'estimated_duration': instance.estimatedDuration,
      'steps': instance.steps?.map((e) => e.toJson()).toList(),
      'required_equipment': instance.requiredEquipment,
      'required_ingredients': instance.requiredIngredients,
      'notes': instance.notes,
      'completion_notes': instance.completionNotes,
      'is_blocking': instance.isBlocking,
      'requires_quality_check': instance.requiresQualityCheck,
    };

_TaskStepModel _$TaskStepModelFromJson(Map<String, dynamic> json) =>
    _TaskStepModel(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      description: json['description'] as String,
      estimatedMinutes: (json['estimated_minutes'] as num?)?.toInt(),
      startedAt: json['started_at'] as String?,
      completedAt: json['completed_at'] as String?,
      completedBy: json['completed_by'] as String?,
      notes: json['notes'] as String?,
      isCompleted: json['is_completed'] as bool? ?? false,
      isOptional: json['is_optional'] as bool? ?? false,
      requiresVerification: json['requires_verification'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskStepModelToJson(_TaskStepModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'description': instance.description,
      'estimated_minutes': instance.estimatedMinutes,
      'started_at': instance.startedAt,
      'completed_at': instance.completedAt,
      'completed_by': instance.completedBy,
      'notes': instance.notes,
      'is_completed': instance.isCompleted,
      'is_optional': instance.isOptional,
      'requires_verification': instance.requiresVerification,
    };
