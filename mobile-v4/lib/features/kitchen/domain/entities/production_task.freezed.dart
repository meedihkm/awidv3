// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductionTask {
  String get id => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  TaskType get type => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  TaskPriority get priority => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get scheduledAt => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get assignedStationId => throw _privateConstructorUsedError;
  String? get assignedStationName => throw _privateConstructorUsedError;
  String? get assignedStaffId => throw _privateConstructorUsedError;
  String? get assignedStaffName => throw _privateConstructorUsedError;
  int? get estimatedDuration => throw _privateConstructorUsedError;
  List<TaskStep>? get steps => throw _privateConstructorUsedError;
  List<String>? get requiredEquipment => throw _privateConstructorUsedError;
  List<String>? get requiredIngredients => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get completionNotes => throw _privateConstructorUsedError;
  bool get isBlocking => throw _privateConstructorUsedError;
  bool get requiresQualityCheck => throw _privateConstructorUsedError;

  /// Create a copy of ProductionTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductionTaskCopyWith<ProductionTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionTaskCopyWith<$Res> {
  factory $ProductionTaskCopyWith(
          ProductionTask value, $Res Function(ProductionTask) then) =
      _$ProductionTaskCopyWithImpl<$Res, ProductionTask>;
  @useResult
  $Res call(
      {String id,
      String orderId,
      String orderNumber,
      TaskType type,
      TaskStatus status,
      TaskPriority priority,
      String description,
      DateTime createdAt,
      DateTime? scheduledAt,
      DateTime? startedAt,
      DateTime? completedAt,
      String? assignedStationId,
      String? assignedStationName,
      String? assignedStaffId,
      String? assignedStaffName,
      int? estimatedDuration,
      List<TaskStep>? steps,
      List<String>? requiredEquipment,
      List<String>? requiredIngredients,
      String? notes,
      String? completionNotes,
      bool isBlocking,
      bool requiresQualityCheck});
}

/// @nodoc
class _$ProductionTaskCopyWithImpl<$Res, $Val extends ProductionTask>
    implements $ProductionTaskCopyWith<$Res> {
  _$ProductionTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductionTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? orderNumber = null,
    Object? type = null,
    Object? status = null,
    Object? priority = null,
    Object? description = null,
    Object? createdAt = null,
    Object? scheduledAt = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? assignedStationId = freezed,
    Object? assignedStationName = freezed,
    Object? assignedStaffId = freezed,
    Object? assignedStaffName = freezed,
    Object? estimatedDuration = freezed,
    Object? steps = freezed,
    Object? requiredEquipment = freezed,
    Object? requiredIngredients = freezed,
    Object? notes = freezed,
    Object? completionNotes = freezed,
    Object? isBlocking = null,
    Object? requiresQualityCheck = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedStationId: freezed == assignedStationId
          ? _value.assignedStationId
          : assignedStationId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStationName: freezed == assignedStationName
          ? _value.assignedStationName
          : assignedStationName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaffId: freezed == assignedStaffId
          ? _value.assignedStaffId
          : assignedStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaffName: freezed == assignedStaffName
          ? _value.assignedStaffName
          : assignedStaffName // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDuration: freezed == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<TaskStep>?,
      requiredEquipment: freezed == requiredEquipment
          ? _value.requiredEquipment
          : requiredEquipment // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      requiredIngredients: freezed == requiredIngredients
          ? _value.requiredIngredients
          : requiredIngredients // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      isBlocking: null == isBlocking
          ? _value.isBlocking
          : isBlocking // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresQualityCheck: null == requiresQualityCheck
          ? _value.requiresQualityCheck
          : requiresQualityCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductionTaskImplCopyWith<$Res>
    implements $ProductionTaskCopyWith<$Res> {
  factory _$$ProductionTaskImplCopyWith(_$ProductionTaskImpl value,
          $Res Function(_$ProductionTaskImpl) then) =
      __$$ProductionTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderId,
      String orderNumber,
      TaskType type,
      TaskStatus status,
      TaskPriority priority,
      String description,
      DateTime createdAt,
      DateTime? scheduledAt,
      DateTime? startedAt,
      DateTime? completedAt,
      String? assignedStationId,
      String? assignedStationName,
      String? assignedStaffId,
      String? assignedStaffName,
      int? estimatedDuration,
      List<TaskStep>? steps,
      List<String>? requiredEquipment,
      List<String>? requiredIngredients,
      String? notes,
      String? completionNotes,
      bool isBlocking,
      bool requiresQualityCheck});
}

/// @nodoc
class __$$ProductionTaskImplCopyWithImpl<$Res>
    extends _$ProductionTaskCopyWithImpl<$Res, _$ProductionTaskImpl>
    implements _$$ProductionTaskImplCopyWith<$Res> {
  __$$ProductionTaskImplCopyWithImpl(
      _$ProductionTaskImpl _value, $Res Function(_$ProductionTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductionTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? orderNumber = null,
    Object? type = null,
    Object? status = null,
    Object? priority = null,
    Object? description = null,
    Object? createdAt = null,
    Object? scheduledAt = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? assignedStationId = freezed,
    Object? assignedStationName = freezed,
    Object? assignedStaffId = freezed,
    Object? assignedStaffName = freezed,
    Object? estimatedDuration = freezed,
    Object? steps = freezed,
    Object? requiredEquipment = freezed,
    Object? requiredIngredients = freezed,
    Object? notes = freezed,
    Object? completionNotes = freezed,
    Object? isBlocking = null,
    Object? requiresQualityCheck = null,
  }) {
    return _then(_$ProductionTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedStationId: freezed == assignedStationId
          ? _value.assignedStationId
          : assignedStationId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStationName: freezed == assignedStationName
          ? _value.assignedStationName
          : assignedStationName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaffId: freezed == assignedStaffId
          ? _value.assignedStaffId
          : assignedStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaffName: freezed == assignedStaffName
          ? _value.assignedStaffName
          : assignedStaffName // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDuration: freezed == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      steps: freezed == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<TaskStep>?,
      requiredEquipment: freezed == requiredEquipment
          ? _value._requiredEquipment
          : requiredEquipment // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      requiredIngredients: freezed == requiredIngredients
          ? _value._requiredIngredients
          : requiredIngredients // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      isBlocking: null == isBlocking
          ? _value.isBlocking
          : isBlocking // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresQualityCheck: null == requiresQualityCheck
          ? _value.requiresQualityCheck
          : requiresQualityCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProductionTaskImpl extends _ProductionTask {
  const _$ProductionTaskImpl(
      {required this.id,
      required this.orderId,
      required this.orderNumber,
      required this.type,
      required this.status,
      required this.priority,
      required this.description,
      required this.createdAt,
      this.scheduledAt,
      this.startedAt,
      this.completedAt,
      this.assignedStationId,
      this.assignedStationName,
      this.assignedStaffId,
      this.assignedStaffName,
      this.estimatedDuration,
      final List<TaskStep>? steps,
      final List<String>? requiredEquipment,
      final List<String>? requiredIngredients,
      this.notes,
      this.completionNotes,
      this.isBlocking = false,
      this.requiresQualityCheck = false})
      : _steps = steps,
        _requiredEquipment = requiredEquipment,
        _requiredIngredients = requiredIngredients,
        super._();

  @override
  final String id;
  @override
  final String orderId;
  @override
  final String orderNumber;
  @override
  final TaskType type;
  @override
  final TaskStatus status;
  @override
  final TaskPriority priority;
  @override
  final String description;
  @override
  final DateTime createdAt;
  @override
  final DateTime? scheduledAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
  @override
  final String? assignedStationId;
  @override
  final String? assignedStationName;
  @override
  final String? assignedStaffId;
  @override
  final String? assignedStaffName;
  @override
  final int? estimatedDuration;
  final List<TaskStep>? _steps;
  @override
  List<TaskStep>? get steps {
    final value = _steps;
    if (value == null) return null;
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _requiredEquipment;
  @override
  List<String>? get requiredEquipment {
    final value = _requiredEquipment;
    if (value == null) return null;
    if (_requiredEquipment is EqualUnmodifiableListView)
      return _requiredEquipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _requiredIngredients;
  @override
  List<String>? get requiredIngredients {
    final value = _requiredIngredients;
    if (value == null) return null;
    if (_requiredIngredients is EqualUnmodifiableListView)
      return _requiredIngredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? notes;
  @override
  final String? completionNotes;
  @override
  @JsonKey()
  final bool isBlocking;
  @override
  @JsonKey()
  final bool requiresQualityCheck;

  @override
  String toString() {
    return 'ProductionTask(id: $id, orderId: $orderId, orderNumber: $orderNumber, type: $type, status: $status, priority: $priority, description: $description, createdAt: $createdAt, scheduledAt: $scheduledAt, startedAt: $startedAt, completedAt: $completedAt, assignedStationId: $assignedStationId, assignedStationName: $assignedStationName, assignedStaffId: $assignedStaffId, assignedStaffName: $assignedStaffName, estimatedDuration: $estimatedDuration, steps: $steps, requiredEquipment: $requiredEquipment, requiredIngredients: $requiredIngredients, notes: $notes, completionNotes: $completionNotes, isBlocking: $isBlocking, requiresQualityCheck: $requiresQualityCheck)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.assignedStationId, assignedStationId) ||
                other.assignedStationId == assignedStationId) &&
            (identical(other.assignedStationName, assignedStationName) ||
                other.assignedStationName == assignedStationName) &&
            (identical(other.assignedStaffId, assignedStaffId) ||
                other.assignedStaffId == assignedStaffId) &&
            (identical(other.assignedStaffName, assignedStaffName) ||
                other.assignedStaffName == assignedStaffName) &&
            (identical(other.estimatedDuration, estimatedDuration) ||
                other.estimatedDuration == estimatedDuration) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            const DeepCollectionEquality()
                .equals(other._requiredEquipment, _requiredEquipment) &&
            const DeepCollectionEquality()
                .equals(other._requiredIngredients, _requiredIngredients) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes) &&
            (identical(other.isBlocking, isBlocking) ||
                other.isBlocking == isBlocking) &&
            (identical(other.requiresQualityCheck, requiresQualityCheck) ||
                other.requiresQualityCheck == requiresQualityCheck));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        orderId,
        orderNumber,
        type,
        status,
        priority,
        description,
        createdAt,
        scheduledAt,
        startedAt,
        completedAt,
        assignedStationId,
        assignedStationName,
        assignedStaffId,
        assignedStaffName,
        estimatedDuration,
        const DeepCollectionEquality().hash(_steps),
        const DeepCollectionEquality().hash(_requiredEquipment),
        const DeepCollectionEquality().hash(_requiredIngredients),
        notes,
        completionNotes,
        isBlocking,
        requiresQualityCheck
      ]);

  /// Create a copy of ProductionTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionTaskImplCopyWith<_$ProductionTaskImpl> get copyWith =>
      __$$ProductionTaskImplCopyWithImpl<_$ProductionTaskImpl>(
          this, _$identity);
}

abstract class _ProductionTask extends ProductionTask {
  const factory _ProductionTask(
      {required final String id,
      required final String orderId,
      required final String orderNumber,
      required final TaskType type,
      required final TaskStatus status,
      required final TaskPriority priority,
      required final String description,
      required final DateTime createdAt,
      final DateTime? scheduledAt,
      final DateTime? startedAt,
      final DateTime? completedAt,
      final String? assignedStationId,
      final String? assignedStationName,
      final String? assignedStaffId,
      final String? assignedStaffName,
      final int? estimatedDuration,
      final List<TaskStep>? steps,
      final List<String>? requiredEquipment,
      final List<String>? requiredIngredients,
      final String? notes,
      final String? completionNotes,
      final bool isBlocking,
      final bool requiresQualityCheck}) = _$ProductionTaskImpl;
  const _ProductionTask._() : super._();

  @override
  String get id;
  @override
  String get orderId;
  @override
  String get orderNumber;
  @override
  TaskType get type;
  @override
  TaskStatus get status;
  @override
  TaskPriority get priority;
  @override
  String get description;
  @override
  DateTime get createdAt;
  @override
  DateTime? get scheduledAt;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
  @override
  String? get assignedStationId;
  @override
  String? get assignedStationName;
  @override
  String? get assignedStaffId;
  @override
  String? get assignedStaffName;
  @override
  int? get estimatedDuration;
  @override
  List<TaskStep>? get steps;
  @override
  List<String>? get requiredEquipment;
  @override
  List<String>? get requiredIngredients;
  @override
  String? get notes;
  @override
  String? get completionNotes;
  @override
  bool get isBlocking;
  @override
  bool get requiresQualityCheck;

  /// Create a copy of ProductionTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductionTaskImplCopyWith<_$ProductionTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskStep {
  String get id => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int? get estimatedMinutes => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get completedBy => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isOptional => throw _privateConstructorUsedError;
  bool get requiresVerification => throw _privateConstructorUsedError;

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskStepCopyWith<TaskStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStepCopyWith<$Res> {
  factory $TaskStepCopyWith(TaskStep value, $Res Function(TaskStep) then) =
      _$TaskStepCopyWithImpl<$Res, TaskStep>;
  @useResult
  $Res call(
      {String id,
      int order,
      String description,
      int? estimatedMinutes,
      DateTime? startedAt,
      DateTime? completedAt,
      String? completedBy,
      String? notes,
      bool isCompleted,
      bool isOptional,
      bool requiresVerification});
}

/// @nodoc
class _$TaskStepCopyWithImpl<$Res, $Val extends TaskStep>
    implements $TaskStepCopyWith<$Res> {
  _$TaskStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? order = null,
    Object? description = null,
    Object? estimatedMinutes = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? completedBy = freezed,
    Object? notes = freezed,
    Object? isCompleted = null,
    Object? isOptional = null,
    Object? requiresVerification = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedMinutes: freezed == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isOptional: null == isOptional
          ? _value.isOptional
          : isOptional // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresVerification: null == requiresVerification
          ? _value.requiresVerification
          : requiresVerification // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskStepImplCopyWith<$Res>
    implements $TaskStepCopyWith<$Res> {
  factory _$$TaskStepImplCopyWith(
          _$TaskStepImpl value, $Res Function(_$TaskStepImpl) then) =
      __$$TaskStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int order,
      String description,
      int? estimatedMinutes,
      DateTime? startedAt,
      DateTime? completedAt,
      String? completedBy,
      String? notes,
      bool isCompleted,
      bool isOptional,
      bool requiresVerification});
}

/// @nodoc
class __$$TaskStepImplCopyWithImpl<$Res>
    extends _$TaskStepCopyWithImpl<$Res, _$TaskStepImpl>
    implements _$$TaskStepImplCopyWith<$Res> {
  __$$TaskStepImplCopyWithImpl(
      _$TaskStepImpl _value, $Res Function(_$TaskStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? order = null,
    Object? description = null,
    Object? estimatedMinutes = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? completedBy = freezed,
    Object? notes = freezed,
    Object? isCompleted = null,
    Object? isOptional = null,
    Object? requiresVerification = null,
  }) {
    return _then(_$TaskStepImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedMinutes: freezed == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isOptional: null == isOptional
          ? _value.isOptional
          : isOptional // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresVerification: null == requiresVerification
          ? _value.requiresVerification
          : requiresVerification // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TaskStepImpl extends _TaskStep {
  const _$TaskStepImpl(
      {required this.id,
      required this.order,
      required this.description,
      this.estimatedMinutes,
      this.startedAt,
      this.completedAt,
      this.completedBy,
      this.notes,
      this.isCompleted = false,
      this.isOptional = false,
      this.requiresVerification = false})
      : super._();

  @override
  final String id;
  @override
  final int order;
  @override
  final String description;
  @override
  final int? estimatedMinutes;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
  @override
  final String? completedBy;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final bool isOptional;
  @override
  @JsonKey()
  final bool requiresVerification;

  @override
  String toString() {
    return 'TaskStep(id: $id, order: $order, description: $description, estimatedMinutes: $estimatedMinutes, startedAt: $startedAt, completedAt: $completedAt, completedBy: $completedBy, notes: $notes, isCompleted: $isCompleted, isOptional: $isOptional, requiresVerification: $requiresVerification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskStepImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.estimatedMinutes, estimatedMinutes) ||
                other.estimatedMinutes == estimatedMinutes) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.completedBy, completedBy) ||
                other.completedBy == completedBy) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.isOptional, isOptional) ||
                other.isOptional == isOptional) &&
            (identical(other.requiresVerification, requiresVerification) ||
                other.requiresVerification == requiresVerification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      order,
      description,
      estimatedMinutes,
      startedAt,
      completedAt,
      completedBy,
      notes,
      isCompleted,
      isOptional,
      requiresVerification);

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskStepImplCopyWith<_$TaskStepImpl> get copyWith =>
      __$$TaskStepImplCopyWithImpl<_$TaskStepImpl>(this, _$identity);
}

abstract class _TaskStep extends TaskStep {
  const factory _TaskStep(
      {required final String id,
      required final int order,
      required final String description,
      final int? estimatedMinutes,
      final DateTime? startedAt,
      final DateTime? completedAt,
      final String? completedBy,
      final String? notes,
      final bool isCompleted,
      final bool isOptional,
      final bool requiresVerification}) = _$TaskStepImpl;
  const _TaskStep._() : super._();

  @override
  String get id;
  @override
  int get order;
  @override
  String get description;
  @override
  int? get estimatedMinutes;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
  @override
  String? get completedBy;
  @override
  String? get notes;
  @override
  bool get isCompleted;
  @override
  bool get isOptional;
  @override
  bool get requiresVerification;

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskStepImplCopyWith<_$TaskStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QualityChecklist {
  String get id => throw _privateConstructorUsedError;
  String get taskId => throw _privateConstructorUsedError;
  List<QualityCheckItem> get items => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get completedBy => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isPassed => throw _privateConstructorUsedError;

  /// Create a copy of QualityChecklist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QualityChecklistCopyWith<QualityChecklist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QualityChecklistCopyWith<$Res> {
  factory $QualityChecklistCopyWith(
          QualityChecklist value, $Res Function(QualityChecklist) then) =
      _$QualityChecklistCopyWithImpl<$Res, QualityChecklist>;
  @useResult
  $Res call(
      {String id,
      String taskId,
      List<QualityCheckItem> items,
      DateTime? completedAt,
      String? completedBy,
      String? notes,
      bool isPassed});
}

/// @nodoc
class _$QualityChecklistCopyWithImpl<$Res, $Val extends QualityChecklist>
    implements $QualityChecklistCopyWith<$Res> {
  _$QualityChecklistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QualityChecklist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? items = null,
    Object? completedAt = freezed,
    Object? completedBy = freezed,
    Object? notes = freezed,
    Object? isPassed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<QualityCheckItem>,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isPassed: null == isPassed
          ? _value.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QualityChecklistImplCopyWith<$Res>
    implements $QualityChecklistCopyWith<$Res> {
  factory _$$QualityChecklistImplCopyWith(_$QualityChecklistImpl value,
          $Res Function(_$QualityChecklistImpl) then) =
      __$$QualityChecklistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String taskId,
      List<QualityCheckItem> items,
      DateTime? completedAt,
      String? completedBy,
      String? notes,
      bool isPassed});
}

/// @nodoc
class __$$QualityChecklistImplCopyWithImpl<$Res>
    extends _$QualityChecklistCopyWithImpl<$Res, _$QualityChecklistImpl>
    implements _$$QualityChecklistImplCopyWith<$Res> {
  __$$QualityChecklistImplCopyWithImpl(_$QualityChecklistImpl _value,
      $Res Function(_$QualityChecklistImpl) _then)
      : super(_value, _then);

  /// Create a copy of QualityChecklist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? items = null,
    Object? completedAt = freezed,
    Object? completedBy = freezed,
    Object? notes = freezed,
    Object? isPassed = null,
  }) {
    return _then(_$QualityChecklistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<QualityCheckItem>,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isPassed: null == isPassed
          ? _value.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$QualityChecklistImpl extends _QualityChecklist {
  const _$QualityChecklistImpl(
      {required this.id,
      required this.taskId,
      required final List<QualityCheckItem> items,
      this.completedAt,
      this.completedBy,
      this.notes,
      this.isPassed = false})
      : _items = items,
        super._();

  @override
  final String id;
  @override
  final String taskId;
  final List<QualityCheckItem> _items;
  @override
  List<QualityCheckItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime? completedAt;
  @override
  final String? completedBy;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isPassed;

  @override
  String toString() {
    return 'QualityChecklist(id: $id, taskId: $taskId, items: $items, completedAt: $completedAt, completedBy: $completedBy, notes: $notes, isPassed: $isPassed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QualityChecklistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.completedBy, completedBy) ||
                other.completedBy == completedBy) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isPassed, isPassed) ||
                other.isPassed == isPassed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      taskId,
      const DeepCollectionEquality().hash(_items),
      completedAt,
      completedBy,
      notes,
      isPassed);

  /// Create a copy of QualityChecklist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QualityChecklistImplCopyWith<_$QualityChecklistImpl> get copyWith =>
      __$$QualityChecklistImplCopyWithImpl<_$QualityChecklistImpl>(
          this, _$identity);
}

abstract class _QualityChecklist extends QualityChecklist {
  const factory _QualityChecklist(
      {required final String id,
      required final String taskId,
      required final List<QualityCheckItem> items,
      final DateTime? completedAt,
      final String? completedBy,
      final String? notes,
      final bool isPassed}) = _$QualityChecklistImpl;
  const _QualityChecklist._() : super._();

  @override
  String get id;
  @override
  String get taskId;
  @override
  List<QualityCheckItem> get items;
  @override
  DateTime? get completedAt;
  @override
  String? get completedBy;
  @override
  String? get notes;
  @override
  bool get isPassed;

  /// Create a copy of QualityChecklist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QualityChecklistImplCopyWith<_$QualityChecklistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QualityCheckItem {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isPassed => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get checkedAt => throw _privateConstructorUsedError;
  String? get checkedBy => throw _privateConstructorUsedError;

  /// Create a copy of QualityCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QualityCheckItemCopyWith<QualityCheckItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QualityCheckItemCopyWith<$Res> {
  factory $QualityCheckItemCopyWith(
          QualityCheckItem value, $Res Function(QualityCheckItem) then) =
      _$QualityCheckItemCopyWithImpl<$Res, QualityCheckItem>;
  @useResult
  $Res call(
      {String id,
      String description,
      bool isPassed,
      String? notes,
      DateTime? checkedAt,
      String? checkedBy});
}

/// @nodoc
class _$QualityCheckItemCopyWithImpl<$Res, $Val extends QualityCheckItem>
    implements $QualityCheckItemCopyWith<$Res> {
  _$QualityCheckItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QualityCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? isPassed = null,
    Object? notes = freezed,
    Object? checkedAt = freezed,
    Object? checkedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isPassed: null == isPassed
          ? _value.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedAt: freezed == checkedAt
          ? _value.checkedAt
          : checkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkedBy: freezed == checkedBy
          ? _value.checkedBy
          : checkedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QualityCheckItemImplCopyWith<$Res>
    implements $QualityCheckItemCopyWith<$Res> {
  factory _$$QualityCheckItemImplCopyWith(_$QualityCheckItemImpl value,
          $Res Function(_$QualityCheckItemImpl) then) =
      __$$QualityCheckItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String description,
      bool isPassed,
      String? notes,
      DateTime? checkedAt,
      String? checkedBy});
}

/// @nodoc
class __$$QualityCheckItemImplCopyWithImpl<$Res>
    extends _$QualityCheckItemCopyWithImpl<$Res, _$QualityCheckItemImpl>
    implements _$$QualityCheckItemImplCopyWith<$Res> {
  __$$QualityCheckItemImplCopyWithImpl(_$QualityCheckItemImpl _value,
      $Res Function(_$QualityCheckItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of QualityCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? isPassed = null,
    Object? notes = freezed,
    Object? checkedAt = freezed,
    Object? checkedBy = freezed,
  }) {
    return _then(_$QualityCheckItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isPassed: null == isPassed
          ? _value.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedAt: freezed == checkedAt
          ? _value.checkedAt
          : checkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkedBy: freezed == checkedBy
          ? _value.checkedBy
          : checkedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$QualityCheckItemImpl implements _QualityCheckItem {
  const _$QualityCheckItemImpl(
      {required this.id,
      required this.description,
      required this.isPassed,
      this.notes,
      this.checkedAt,
      this.checkedBy});

  @override
  final String id;
  @override
  final String description;
  @override
  final bool isPassed;
  @override
  final String? notes;
  @override
  final DateTime? checkedAt;
  @override
  final String? checkedBy;

  @override
  String toString() {
    return 'QualityCheckItem(id: $id, description: $description, isPassed: $isPassed, notes: $notes, checkedAt: $checkedAt, checkedBy: $checkedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QualityCheckItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isPassed, isPassed) ||
                other.isPassed == isPassed) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.checkedAt, checkedAt) ||
                other.checkedAt == checkedAt) &&
            (identical(other.checkedBy, checkedBy) ||
                other.checkedBy == checkedBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, description, isPassed, notes, checkedAt, checkedBy);

  /// Create a copy of QualityCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QualityCheckItemImplCopyWith<_$QualityCheckItemImpl> get copyWith =>
      __$$QualityCheckItemImplCopyWithImpl<_$QualityCheckItemImpl>(
          this, _$identity);
}

abstract class _QualityCheckItem implements QualityCheckItem {
  const factory _QualityCheckItem(
      {required final String id,
      required final String description,
      required final bool isPassed,
      final String? notes,
      final DateTime? checkedAt,
      final String? checkedBy}) = _$QualityCheckItemImpl;

  @override
  String get id;
  @override
  String get description;
  @override
  bool get isPassed;
  @override
  String? get notes;
  @override
  DateTime? get checkedAt;
  @override
  String? get checkedBy;

  /// Create a copy of QualityCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QualityCheckItemImplCopyWith<_$QualityCheckItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskBlocker {
  String get id => throw _privateConstructorUsedError;
  String get taskId => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get resolvedAt => throw _privateConstructorUsedError;
  String? get resolvedBy => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;
  bool get isResolved => throw _privateConstructorUsedError;

  /// Create a copy of TaskBlocker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskBlockerCopyWith<TaskBlocker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskBlockerCopyWith<$Res> {
  factory $TaskBlockerCopyWith(
          TaskBlocker value, $Res Function(TaskBlocker) then) =
      _$TaskBlockerCopyWithImpl<$Res, TaskBlocker>;
  @useResult
  $Res call(
      {String id,
      String taskId,
      String reason,
      DateTime createdAt,
      DateTime? resolvedAt,
      String? resolvedBy,
      String? resolution,
      bool isResolved});
}

/// @nodoc
class _$TaskBlockerCopyWithImpl<$Res, $Val extends TaskBlocker>
    implements $TaskBlockerCopyWith<$Res> {
  _$TaskBlockerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskBlocker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? reason = null,
    Object? createdAt = null,
    Object? resolvedAt = freezed,
    Object? resolvedBy = freezed,
    Object? resolution = freezed,
    Object? isResolved = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolvedBy: freezed == resolvedBy
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskBlockerImplCopyWith<$Res>
    implements $TaskBlockerCopyWith<$Res> {
  factory _$$TaskBlockerImplCopyWith(
          _$TaskBlockerImpl value, $Res Function(_$TaskBlockerImpl) then) =
      __$$TaskBlockerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String taskId,
      String reason,
      DateTime createdAt,
      DateTime? resolvedAt,
      String? resolvedBy,
      String? resolution,
      bool isResolved});
}

/// @nodoc
class __$$TaskBlockerImplCopyWithImpl<$Res>
    extends _$TaskBlockerCopyWithImpl<$Res, _$TaskBlockerImpl>
    implements _$$TaskBlockerImplCopyWith<$Res> {
  __$$TaskBlockerImplCopyWithImpl(
      _$TaskBlockerImpl _value, $Res Function(_$TaskBlockerImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskBlocker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? reason = null,
    Object? createdAt = null,
    Object? resolvedAt = freezed,
    Object? resolvedBy = freezed,
    Object? resolution = freezed,
    Object? isResolved = null,
  }) {
    return _then(_$TaskBlockerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolvedBy: freezed == resolvedBy
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TaskBlockerImpl extends _TaskBlocker {
  const _$TaskBlockerImpl(
      {required this.id,
      required this.taskId,
      required this.reason,
      required this.createdAt,
      this.resolvedAt,
      this.resolvedBy,
      this.resolution,
      this.isResolved = false})
      : super._();

  @override
  final String id;
  @override
  final String taskId;
  @override
  final String reason;
  @override
  final DateTime createdAt;
  @override
  final DateTime? resolvedAt;
  @override
  final String? resolvedBy;
  @override
  final String? resolution;
  @override
  @JsonKey()
  final bool isResolved;

  @override
  String toString() {
    return 'TaskBlocker(id: $id, taskId: $taskId, reason: $reason, createdAt: $createdAt, resolvedAt: $resolvedAt, resolvedBy: $resolvedBy, resolution: $resolution, isResolved: $isResolved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskBlockerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt) &&
            (identical(other.resolvedBy, resolvedBy) ||
                other.resolvedBy == resolvedBy) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, taskId, reason, createdAt,
      resolvedAt, resolvedBy, resolution, isResolved);

  /// Create a copy of TaskBlocker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskBlockerImplCopyWith<_$TaskBlockerImpl> get copyWith =>
      __$$TaskBlockerImplCopyWithImpl<_$TaskBlockerImpl>(this, _$identity);
}

abstract class _TaskBlocker extends TaskBlocker {
  const factory _TaskBlocker(
      {required final String id,
      required final String taskId,
      required final String reason,
      required final DateTime createdAt,
      final DateTime? resolvedAt,
      final String? resolvedBy,
      final String? resolution,
      final bool isResolved}) = _$TaskBlockerImpl;
  const _TaskBlocker._() : super._();

  @override
  String get id;
  @override
  String get taskId;
  @override
  String get reason;
  @override
  DateTime get createdAt;
  @override
  DateTime? get resolvedAt;
  @override
  String? get resolvedBy;
  @override
  String? get resolution;
  @override
  bool get isResolved;

  /// Create a copy of TaskBlocker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskBlockerImplCopyWith<_$TaskBlockerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
