// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductionTaskModel _$ProductionTaskModelFromJson(Map<String, dynamic> json) {
  return _ProductionTaskModel.fromJson(json);
}

/// @nodoc
mixin _$ProductionTaskModel {
  String get id => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get scheduledAt => throw _privateConstructorUsedError;
  String? get startedAt => throw _privateConstructorUsedError;
  String? get completedAt => throw _privateConstructorUsedError;
  String? get assignedStationId => throw _privateConstructorUsedError;
  String? get assignedStationName => throw _privateConstructorUsedError;
  String? get assignedStaffId => throw _privateConstructorUsedError;
  String? get assignedStaffName => throw _privateConstructorUsedError;
  int? get estimatedDuration => throw _privateConstructorUsedError;
  List<TaskStepModel>? get steps => throw _privateConstructorUsedError;
  List<String>? get requiredEquipment => throw _privateConstructorUsedError;
  List<String>? get requiredIngredients => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get completionNotes => throw _privateConstructorUsedError;
  bool get isBlocking => throw _privateConstructorUsedError;
  bool get requiresQualityCheck => throw _privateConstructorUsedError;

  /// Serializes this ProductionTaskModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductionTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductionTaskModelCopyWith<ProductionTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionTaskModelCopyWith<$Res> {
  factory $ProductionTaskModelCopyWith(
          ProductionTaskModel value, $Res Function(ProductionTaskModel) then) =
      _$ProductionTaskModelCopyWithImpl<$Res, ProductionTaskModel>;
  @useResult
  $Res call(
      {String id,
      String orderId,
      String orderNumber,
      String type,
      String status,
      String priority,
      String description,
      String createdAt,
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
      bool isBlocking,
      bool requiresQualityCheck});
}

/// @nodoc
class _$ProductionTaskModelCopyWithImpl<$Res, $Val extends ProductionTaskModel>
    implements $ProductionTaskModelCopyWith<$Res> {
  _$ProductionTaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductionTaskModel
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
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as List<TaskStepModel>?,
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
abstract class _$$ProductionTaskModelImplCopyWith<$Res>
    implements $ProductionTaskModelCopyWith<$Res> {
  factory _$$ProductionTaskModelImplCopyWith(_$ProductionTaskModelImpl value,
          $Res Function(_$ProductionTaskModelImpl) then) =
      __$$ProductionTaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderId,
      String orderNumber,
      String type,
      String status,
      String priority,
      String description,
      String createdAt,
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
      bool isBlocking,
      bool requiresQualityCheck});
}

/// @nodoc
class __$$ProductionTaskModelImplCopyWithImpl<$Res>
    extends _$ProductionTaskModelCopyWithImpl<$Res, _$ProductionTaskModelImpl>
    implements _$$ProductionTaskModelImplCopyWith<$Res> {
  __$$ProductionTaskModelImplCopyWithImpl(_$ProductionTaskModelImpl _value,
      $Res Function(_$ProductionTaskModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductionTaskModel
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
    return _then(_$ProductionTaskModelImpl(
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
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as List<TaskStepModel>?,
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
@JsonSerializable()
class _$ProductionTaskModelImpl extends _ProductionTaskModel {
  const _$ProductionTaskModelImpl(
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
      final List<TaskStepModel>? steps,
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

  factory _$ProductionTaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionTaskModelImplFromJson(json);

  @override
  final String id;
  @override
  final String orderId;
  @override
  final String orderNumber;
  @override
  final String type;
  @override
  final String status;
  @override
  final String priority;
  @override
  final String description;
  @override
  final String createdAt;
  @override
  final String? scheduledAt;
  @override
  final String? startedAt;
  @override
  final String? completedAt;
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
  final List<TaskStepModel>? _steps;
  @override
  List<TaskStepModel>? get steps {
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
    return 'ProductionTaskModel(id: $id, orderId: $orderId, orderNumber: $orderNumber, type: $type, status: $status, priority: $priority, description: $description, createdAt: $createdAt, scheduledAt: $scheduledAt, startedAt: $startedAt, completedAt: $completedAt, assignedStationId: $assignedStationId, assignedStationName: $assignedStationName, assignedStaffId: $assignedStaffId, assignedStaffName: $assignedStaffName, estimatedDuration: $estimatedDuration, steps: $steps, requiredEquipment: $requiredEquipment, requiredIngredients: $requiredIngredients, notes: $notes, completionNotes: $completionNotes, isBlocking: $isBlocking, requiresQualityCheck: $requiresQualityCheck)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionTaskModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ProductionTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionTaskModelImplCopyWith<_$ProductionTaskModelImpl> get copyWith =>
      __$$ProductionTaskModelImplCopyWithImpl<_$ProductionTaskModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionTaskModelImplToJson(
      this,
    );
  }
}

abstract class _ProductionTaskModel extends ProductionTaskModel {
  const factory _ProductionTaskModel(
      {required final String id,
      required final String orderId,
      required final String orderNumber,
      required final String type,
      required final String status,
      required final String priority,
      required final String description,
      required final String createdAt,
      final String? scheduledAt,
      final String? startedAt,
      final String? completedAt,
      final String? assignedStationId,
      final String? assignedStationName,
      final String? assignedStaffId,
      final String? assignedStaffName,
      final int? estimatedDuration,
      final List<TaskStepModel>? steps,
      final List<String>? requiredEquipment,
      final List<String>? requiredIngredients,
      final String? notes,
      final String? completionNotes,
      final bool isBlocking,
      final bool requiresQualityCheck}) = _$ProductionTaskModelImpl;
  const _ProductionTaskModel._() : super._();

  factory _ProductionTaskModel.fromJson(Map<String, dynamic> json) =
      _$ProductionTaskModelImpl.fromJson;

  @override
  String get id;
  @override
  String get orderId;
  @override
  String get orderNumber;
  @override
  String get type;
  @override
  String get status;
  @override
  String get priority;
  @override
  String get description;
  @override
  String get createdAt;
  @override
  String? get scheduledAt;
  @override
  String? get startedAt;
  @override
  String? get completedAt;
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
  List<TaskStepModel>? get steps;
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

  /// Create a copy of ProductionTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductionTaskModelImplCopyWith<_$ProductionTaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskStepModel _$TaskStepModelFromJson(Map<String, dynamic> json) {
  return _TaskStepModel.fromJson(json);
}

/// @nodoc
mixin _$TaskStepModel {
  String get id => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int? get estimatedMinutes => throw _privateConstructorUsedError;
  String? get startedAt => throw _privateConstructorUsedError;
  String? get completedAt => throw _privateConstructorUsedError;
  String? get completedBy => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isOptional => throw _privateConstructorUsedError;
  bool get requiresVerification => throw _privateConstructorUsedError;

  /// Serializes this TaskStepModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskStepModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskStepModelCopyWith<TaskStepModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStepModelCopyWith<$Res> {
  factory $TaskStepModelCopyWith(
          TaskStepModel value, $Res Function(TaskStepModel) then) =
      _$TaskStepModelCopyWithImpl<$Res, TaskStepModel>;
  @useResult
  $Res call(
      {String id,
      int order,
      String description,
      int? estimatedMinutes,
      String? startedAt,
      String? completedAt,
      String? completedBy,
      String? notes,
      bool isCompleted,
      bool isOptional,
      bool requiresVerification});
}

/// @nodoc
class _$TaskStepModelCopyWithImpl<$Res, $Val extends TaskStepModel>
    implements $TaskStepModelCopyWith<$Res> {
  _$TaskStepModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskStepModel
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
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$TaskStepModelImplCopyWith<$Res>
    implements $TaskStepModelCopyWith<$Res> {
  factory _$$TaskStepModelImplCopyWith(
          _$TaskStepModelImpl value, $Res Function(_$TaskStepModelImpl) then) =
      __$$TaskStepModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int order,
      String description,
      int? estimatedMinutes,
      String? startedAt,
      String? completedAt,
      String? completedBy,
      String? notes,
      bool isCompleted,
      bool isOptional,
      bool requiresVerification});
}

/// @nodoc
class __$$TaskStepModelImplCopyWithImpl<$Res>
    extends _$TaskStepModelCopyWithImpl<$Res, _$TaskStepModelImpl>
    implements _$$TaskStepModelImplCopyWith<$Res> {
  __$$TaskStepModelImplCopyWithImpl(
      _$TaskStepModelImpl _value, $Res Function(_$TaskStepModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskStepModel
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
    return _then(_$TaskStepModelImpl(
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
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
@JsonSerializable()
class _$TaskStepModelImpl extends _TaskStepModel {
  const _$TaskStepModelImpl(
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

  factory _$TaskStepModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskStepModelImplFromJson(json);

  @override
  final String id;
  @override
  final int order;
  @override
  final String description;
  @override
  final int? estimatedMinutes;
  @override
  final String? startedAt;
  @override
  final String? completedAt;
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
    return 'TaskStepModel(id: $id, order: $order, description: $description, estimatedMinutes: $estimatedMinutes, startedAt: $startedAt, completedAt: $completedAt, completedBy: $completedBy, notes: $notes, isCompleted: $isCompleted, isOptional: $isOptional, requiresVerification: $requiresVerification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskStepModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of TaskStepModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskStepModelImplCopyWith<_$TaskStepModelImpl> get copyWith =>
      __$$TaskStepModelImplCopyWithImpl<_$TaskStepModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskStepModelImplToJson(
      this,
    );
  }
}

abstract class _TaskStepModel extends TaskStepModel {
  const factory _TaskStepModel(
      {required final String id,
      required final int order,
      required final String description,
      final int? estimatedMinutes,
      final String? startedAt,
      final String? completedAt,
      final String? completedBy,
      final String? notes,
      final bool isCompleted,
      final bool isOptional,
      final bool requiresVerification}) = _$TaskStepModelImpl;
  const _TaskStepModel._() : super._();

  factory _TaskStepModel.fromJson(Map<String, dynamic> json) =
      _$TaskStepModelImpl.fromJson;

  @override
  String get id;
  @override
  int get order;
  @override
  String get description;
  @override
  int? get estimatedMinutes;
  @override
  String? get startedAt;
  @override
  String? get completedAt;
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

  /// Create a copy of TaskStepModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskStepModelImplCopyWith<_$TaskStepModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
