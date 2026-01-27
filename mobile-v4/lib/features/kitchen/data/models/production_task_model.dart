import 'package:awid_mobile/features/kitchen/domain/entities/production_task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_task_model.freezed.dart';
part 'production_task_model.g.dart';

/// Model pour ProductionTask
@freezed
class ProductionTaskModel with _$ProductionTaskModel {
  const factory ProductionTaskModel({
    required String id,
    required String orderId,
    required String orderNumber,
    required String type,
    required String status,
    required String priority,
    required String description,
    required String createdAt,
    String? scheduledAt,
    String? startedAt,
    String? completedAt,
    String? assignedStationId,
    String? assignedStationName,
    String? assignedStaffId,
    String? assignedStaffName,
    int? estimatedDuration,
    List<TaskStepModel>? steps,
    List<String>? requiredEquipment,
    List<String>? requiredIngredients,
    String? notes,
    String? completionNotes,
    @Default(false) bool isBlocking,
    @Default(false) bool requiresQualityCheck,
  }) = _ProductionTaskModel;

  const ProductionTaskModel._();

  factory ProductionTaskModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionTaskModelFromJson(json);

  /// Convertir vers entité
  ProductionTask toEntity() {
    return ProductionTask(
      id: id,
      orderId: orderId,
      orderNumber: orderNumber,
      type: _parseType(type),
      status: _parseStatus(status),
      priority: _parsePriority(priority),
      description: description,
      createdAt: DateTime.parse(createdAt),
      scheduledAt: scheduledAt != null ? DateTime.parse(scheduledAt!) : null,
      startedAt: startedAt != null ? DateTime.parse(startedAt!) : null,
      completedAt: completedAt != null ? DateTime.parse(completedAt!) : null,
      assignedStationId: assignedStationId,
      assignedStationName: assignedStationName,
      assignedStaffId: assignedStaffId,
      assignedStaffName: assignedStaffName,
      estimatedDuration: estimatedDuration,
      steps: steps?.map((s) => s.toEntity()).toList(),
      requiredEquipment: requiredEquipment,
      requiredIngredients: requiredIngredients,
      notes: notes,
      completionNotes: completionNotes,
      isBlocking: isBlocking,
      requiresQualityCheck: requiresQualityCheck,
    );
  }

  /// Créer depuis entité
  factory ProductionTaskModel.fromEntity(ProductionTask entity) {
    return ProductionTaskModel(
      id: entity.id,
      orderId: entity.orderId,
      orderNumber: entity.orderNumber,
      type: _typeToString(entity.type),
      status: _statusToString(entity.status),
      priority: _priorityToString(entity.priority),
      description: entity.description,
      createdAt: entity.createdAt.toIso8601String(),
      scheduledAt: entity.scheduledAt?.toIso8601String(),
      startedAt: entity.startedAt?.toIso8601String(),
      completedAt: entity.completedAt?.toIso8601String(),
      assignedStationId: entity.assignedStationId,
      assignedStationName: entity.assignedStationName,
      assignedStaffId: entity.assignedStaffId,
      assignedStaffName: entity.assignedStaffName,
      estimatedDuration: entity.estimatedDuration,
      steps: entity.steps?.map((s) => TaskStepModel.fromEntity(s)).toList(),
      requiredEquipment: entity.requiredEquipment,
      requiredIngredients: entity.requiredIngredients,
      notes: entity.notes,
      completionNotes: entity.completionNotes,
      isBlocking: entity.isBlocking,
      requiresQualityCheck: entity.requiresQualityCheck,
    );
  }

  static TaskType _parseType(String type) {
    switch (type.toLowerCase()) {
      case 'preparation':
        return TaskType.preparation;
      case 'cooking':
        return TaskType.cooking;
      case 'assembly':
        return TaskType.assembly;
      case 'packaging':
        return TaskType.packaging;
      case 'quality':
        return TaskType.quality;
      case 'cleaning':
        return TaskType.cleaning;
      default:
        return TaskType.preparation;
    }
  }

  static String _typeToString(TaskType type) {
    return type.name;
  }

  static TaskStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return TaskStatus.pending;
      case 'assigned':
        return TaskStatus.assigned;
      case 'inprogress':
        return TaskStatus.inProgress;
      case 'paused':
        return TaskStatus.paused;
      case 'completed':
        return TaskStatus.completed;
      case 'cancelled':
        return TaskStatus.cancelled;
      default:
        return TaskStatus.pending;
    }
  }

  static String _statusToString(TaskStatus status) {
    switch (status) {
      case TaskStatus.inProgress:
        return 'inProgress';
      default:
        return status.name;
    }
  }

  static TaskPriority _parsePriority(String priority) {
    switch (priority.toLowerCase()) {
      case 'low':
        return TaskPriority.low;
      case 'normal':
        return TaskPriority.normal;
      case 'high':
        return TaskPriority.high;
      case 'urgent':
        return TaskPriority.urgent;
      default:
        return TaskPriority.normal;
    }
  }

  static String _priorityToString(TaskPriority priority) {
    return priority.name;
  }
}

/// Model pour TaskStep
@freezed
class TaskStepModel with _$TaskStepModel {
  const factory TaskStepModel({
    required String id,
    required int order,
    required String description,
    int? estimatedMinutes,
    String? startedAt,
    String? completedAt,
    String? completedBy,
    String? notes,
    @Default(false) bool isCompleted,
    @Default(false) bool isOptional,
    @Default(false) bool requiresVerification,
  }) = _TaskStepModel;

  const TaskStepModel._();

  factory TaskStepModel.fromJson(Map<String, dynamic> json) =>
      _$TaskStepModelFromJson(json);

  TaskStep toEntity() {
    return TaskStep(
      id: id,
      order: order,
      description: description,
      estimatedMinutes: estimatedMinutes,
      startedAt: startedAt != null ? DateTime.parse(startedAt!) : null,
      completedAt: completedAt != null ? DateTime.parse(completedAt!) : null,
      completedBy: completedBy,
      notes: notes,
      isCompleted: isCompleted,
      isOptional: isOptional,
      requiresVerification: requiresVerification,
    );
  }

  factory TaskStepModel.fromEntity(TaskStep entity) {
    return TaskStepModel(
      id: entity.id,
      order: entity.order,
      description: entity.description,
      estimatedMinutes: entity.estimatedMinutes,
      startedAt: entity.startedAt?.toIso8601String(),
      completedAt: entity.completedAt?.toIso8601String(),
      completedBy: entity.completedBy,
      notes: entity.notes,
      isCompleted: entity.isCompleted,
      isOptional: entity.isOptional,
      requiresVerification: entity.requiresVerification,
    );
  }
}
