// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductionTask {
  String get id;
  String get orderId;
  String get orderNumber;
  TaskType get type;
  TaskStatus get status;
  TaskPriority get priority;
  String get description;
  DateTime get createdAt;
  DateTime? get scheduledAt;
  DateTime? get startedAt;
  DateTime? get completedAt;
  String? get assignedStationId;
  String? get assignedStationName;
  String? get assignedStaffId;
  String? get assignedStaffName;
  int? get estimatedDuration;
  List<TaskStep>? get steps;
  List<String>? get requiredEquipment;
  List<String>? get requiredIngredients;
  String? get notes;
  String? get completionNotes;
  bool get isBlocking;
  bool get requiresQualityCheck;

  /// Create a copy of ProductionTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductionTaskCopyWith<ProductionTask> get copyWith =>
      _$ProductionTaskCopyWithImpl<ProductionTask>(
          this as ProductionTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductionTask &&
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
            const DeepCollectionEquality().equals(other.steps, steps) &&
            const DeepCollectionEquality()
                .equals(other.requiredEquipment, requiredEquipment) &&
            const DeepCollectionEquality()
                .equals(other.requiredIngredients, requiredIngredients) &&
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
        const DeepCollectionEquality().hash(steps),
        const DeepCollectionEquality().hash(requiredEquipment),
        const DeepCollectionEquality().hash(requiredIngredients),
        notes,
        completionNotes,
        isBlocking,
        requiresQualityCheck
      ]);

  @override
  String toString() {
    return 'ProductionTask(id: $id, orderId: $orderId, orderNumber: $orderNumber, type: $type, status: $status, priority: $priority, description: $description, createdAt: $createdAt, scheduledAt: $scheduledAt, startedAt: $startedAt, completedAt: $completedAt, assignedStationId: $assignedStationId, assignedStationName: $assignedStationName, assignedStaffId: $assignedStaffId, assignedStaffName: $assignedStaffName, estimatedDuration: $estimatedDuration, steps: $steps, requiredEquipment: $requiredEquipment, requiredIngredients: $requiredIngredients, notes: $notes, completionNotes: $completionNotes, isBlocking: $isBlocking, requiresQualityCheck: $requiresQualityCheck)';
  }
}

/// @nodoc
abstract mixin class $ProductionTaskCopyWith<$Res> {
  factory $ProductionTaskCopyWith(
          ProductionTask value, $Res Function(ProductionTask) _then) =
      _$ProductionTaskCopyWithImpl;
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
class _$ProductionTaskCopyWithImpl<$Res>
    implements $ProductionTaskCopyWith<$Res> {
  _$ProductionTaskCopyWithImpl(this._self, this._then);

  final ProductionTask _self;
  final $Res Function(ProductionTask) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledAt: freezed == scheduledAt
          ? _self.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedStationId: freezed == assignedStationId
          ? _self.assignedStationId
          : assignedStationId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStationName: freezed == assignedStationName
          ? _self.assignedStationName
          : assignedStationName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaffId: freezed == assignedStaffId
          ? _self.assignedStaffId
          : assignedStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaffName: freezed == assignedStaffName
          ? _self.assignedStaffName
          : assignedStaffName // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDuration: freezed == estimatedDuration
          ? _self.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      steps: freezed == steps
          ? _self.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<TaskStep>?,
      requiredEquipment: freezed == requiredEquipment
          ? _self.requiredEquipment
          : requiredEquipment // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      requiredIngredients: freezed == requiredIngredients
          ? _self.requiredIngredients
          : requiredIngredients // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      isBlocking: null == isBlocking
          ? _self.isBlocking
          : isBlocking // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresQualityCheck: null == requiresQualityCheck
          ? _self.requiresQualityCheck
          : requiresQualityCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductionTask].
extension ProductionTaskPatterns on ProductionTask {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProductionTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductionTask() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProductionTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionTask():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProductionTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionTask() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
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
            bool requiresQualityCheck)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductionTask() when $default != null:
        return $default(
            _that.id,
            _that.orderId,
            _that.orderNumber,
            _that.type,
            _that.status,
            _that.priority,
            _that.description,
            _that.createdAt,
            _that.scheduledAt,
            _that.startedAt,
            _that.completedAt,
            _that.assignedStationId,
            _that.assignedStationName,
            _that.assignedStaffId,
            _that.assignedStaffName,
            _that.estimatedDuration,
            _that.steps,
            _that.requiredEquipment,
            _that.requiredIngredients,
            _that.notes,
            _that.completionNotes,
            _that.isBlocking,
            _that.requiresQualityCheck);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
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
            bool requiresQualityCheck)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionTask():
        return $default(
            _that.id,
            _that.orderId,
            _that.orderNumber,
            _that.type,
            _that.status,
            _that.priority,
            _that.description,
            _that.createdAt,
            _that.scheduledAt,
            _that.startedAt,
            _that.completedAt,
            _that.assignedStationId,
            _that.assignedStationName,
            _that.assignedStaffId,
            _that.assignedStaffName,
            _that.estimatedDuration,
            _that.steps,
            _that.requiredEquipment,
            _that.requiredIngredients,
            _that.notes,
            _that.completionNotes,
            _that.isBlocking,
            _that.requiresQualityCheck);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
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
            bool requiresQualityCheck)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionTask() when $default != null:
        return $default(
            _that.id,
            _that.orderId,
            _that.orderNumber,
            _that.type,
            _that.status,
            _that.priority,
            _that.description,
            _that.createdAt,
            _that.scheduledAt,
            _that.startedAt,
            _that.completedAt,
            _that.assignedStationId,
            _that.assignedStationName,
            _that.assignedStaffId,
            _that.assignedStaffName,
            _that.estimatedDuration,
            _that.steps,
            _that.requiredEquipment,
            _that.requiredIngredients,
            _that.notes,
            _that.completionNotes,
            _that.isBlocking,
            _that.requiresQualityCheck);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductionTask extends ProductionTask {
  const _ProductionTask(
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

  /// Create a copy of ProductionTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductionTaskCopyWith<_ProductionTask> get copyWith =>
      __$ProductionTaskCopyWithImpl<_ProductionTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductionTask &&
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

  @override
  String toString() {
    return 'ProductionTask(id: $id, orderId: $orderId, orderNumber: $orderNumber, type: $type, status: $status, priority: $priority, description: $description, createdAt: $createdAt, scheduledAt: $scheduledAt, startedAt: $startedAt, completedAt: $completedAt, assignedStationId: $assignedStationId, assignedStationName: $assignedStationName, assignedStaffId: $assignedStaffId, assignedStaffName: $assignedStaffName, estimatedDuration: $estimatedDuration, steps: $steps, requiredEquipment: $requiredEquipment, requiredIngredients: $requiredIngredients, notes: $notes, completionNotes: $completionNotes, isBlocking: $isBlocking, requiresQualityCheck: $requiresQualityCheck)';
  }
}

/// @nodoc
abstract mixin class _$ProductionTaskCopyWith<$Res>
    implements $ProductionTaskCopyWith<$Res> {
  factory _$ProductionTaskCopyWith(
          _ProductionTask value, $Res Function(_ProductionTask) _then) =
      __$ProductionTaskCopyWithImpl;
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
class __$ProductionTaskCopyWithImpl<$Res>
    implements _$ProductionTaskCopyWith<$Res> {
  __$ProductionTaskCopyWithImpl(this._self, this._then);

  final _ProductionTask _self;
  final $Res Function(_ProductionTask) _then;

  /// Create a copy of ProductionTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_ProductionTask(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledAt: freezed == scheduledAt
          ? _self.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedStationId: freezed == assignedStationId
          ? _self.assignedStationId
          : assignedStationId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStationName: freezed == assignedStationName
          ? _self.assignedStationName
          : assignedStationName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaffId: freezed == assignedStaffId
          ? _self.assignedStaffId
          : assignedStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaffName: freezed == assignedStaffName
          ? _self.assignedStaffName
          : assignedStaffName // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDuration: freezed == estimatedDuration
          ? _self.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      steps: freezed == steps
          ? _self._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<TaskStep>?,
      requiredEquipment: freezed == requiredEquipment
          ? _self._requiredEquipment
          : requiredEquipment // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      requiredIngredients: freezed == requiredIngredients
          ? _self._requiredIngredients
          : requiredIngredients // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      completionNotes: freezed == completionNotes
          ? _self.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      isBlocking: null == isBlocking
          ? _self.isBlocking
          : isBlocking // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresQualityCheck: null == requiresQualityCheck
          ? _self.requiresQualityCheck
          : requiresQualityCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$TaskStep {
  String get id;
  int get order;
  String get description;
  int? get estimatedMinutes;
  DateTime? get startedAt;
  DateTime? get completedAt;
  String? get completedBy;
  String? get notes;
  bool get isCompleted;
  bool get isOptional;
  bool get requiresVerification;

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskStepCopyWith<TaskStep> get copyWith =>
      _$TaskStepCopyWithImpl<TaskStep>(this as TaskStep, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskStep &&
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

  @override
  String toString() {
    return 'TaskStep(id: $id, order: $order, description: $description, estimatedMinutes: $estimatedMinutes, startedAt: $startedAt, completedAt: $completedAt, completedBy: $completedBy, notes: $notes, isCompleted: $isCompleted, isOptional: $isOptional, requiresVerification: $requiresVerification)';
  }
}

/// @nodoc
abstract mixin class $TaskStepCopyWith<$Res> {
  factory $TaskStepCopyWith(TaskStep value, $Res Function(TaskStep) _then) =
      _$TaskStepCopyWithImpl;
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
class _$TaskStepCopyWithImpl<$Res> implements $TaskStepCopyWith<$Res> {
  _$TaskStepCopyWithImpl(this._self, this._then);

  final TaskStep _self;
  final $Res Function(TaskStep) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedMinutes: freezed == estimatedMinutes
          ? _self.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _self.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isOptional: null == isOptional
          ? _self.isOptional
          : isOptional // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresVerification: null == requiresVerification
          ? _self.requiresVerification
          : requiresVerification // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [TaskStep].
extension TaskStepPatterns on TaskStep {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TaskStep value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaskStep() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TaskStep value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskStep():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TaskStep value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskStep() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            int order,
            String description,
            int? estimatedMinutes,
            DateTime? startedAt,
            DateTime? completedAt,
            String? completedBy,
            String? notes,
            bool isCompleted,
            bool isOptional,
            bool requiresVerification)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaskStep() when $default != null:
        return $default(
            _that.id,
            _that.order,
            _that.description,
            _that.estimatedMinutes,
            _that.startedAt,
            _that.completedAt,
            _that.completedBy,
            _that.notes,
            _that.isCompleted,
            _that.isOptional,
            _that.requiresVerification);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            int order,
            String description,
            int? estimatedMinutes,
            DateTime? startedAt,
            DateTime? completedAt,
            String? completedBy,
            String? notes,
            bool isCompleted,
            bool isOptional,
            bool requiresVerification)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskStep():
        return $default(
            _that.id,
            _that.order,
            _that.description,
            _that.estimatedMinutes,
            _that.startedAt,
            _that.completedAt,
            _that.completedBy,
            _that.notes,
            _that.isCompleted,
            _that.isOptional,
            _that.requiresVerification);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            int order,
            String description,
            int? estimatedMinutes,
            DateTime? startedAt,
            DateTime? completedAt,
            String? completedBy,
            String? notes,
            bool isCompleted,
            bool isOptional,
            bool requiresVerification)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskStep() when $default != null:
        return $default(
            _that.id,
            _that.order,
            _that.description,
            _that.estimatedMinutes,
            _that.startedAt,
            _that.completedAt,
            _that.completedBy,
            _that.notes,
            _that.isCompleted,
            _that.isOptional,
            _that.requiresVerification);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TaskStep extends TaskStep {
  const _TaskStep(
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

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskStepCopyWith<_TaskStep> get copyWith =>
      __$TaskStepCopyWithImpl<_TaskStep>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskStep &&
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

  @override
  String toString() {
    return 'TaskStep(id: $id, order: $order, description: $description, estimatedMinutes: $estimatedMinutes, startedAt: $startedAt, completedAt: $completedAt, completedBy: $completedBy, notes: $notes, isCompleted: $isCompleted, isOptional: $isOptional, requiresVerification: $requiresVerification)';
  }
}

/// @nodoc
abstract mixin class _$TaskStepCopyWith<$Res>
    implements $TaskStepCopyWith<$Res> {
  factory _$TaskStepCopyWith(_TaskStep value, $Res Function(_TaskStep) _then) =
      __$TaskStepCopyWithImpl;
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
class __$TaskStepCopyWithImpl<$Res> implements _$TaskStepCopyWith<$Res> {
  __$TaskStepCopyWithImpl(this._self, this._then);

  final _TaskStep _self;
  final $Res Function(_TaskStep) _then;

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_TaskStep(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedMinutes: freezed == estimatedMinutes
          ? _self.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _self.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isOptional: null == isOptional
          ? _self.isOptional
          : isOptional // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresVerification: null == requiresVerification
          ? _self.requiresVerification
          : requiresVerification // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$QualityChecklist {
  String get id;
  String get taskId;
  List<QualityCheckItem> get items;
  DateTime? get completedAt;
  String? get completedBy;
  String? get notes;
  bool get isPassed;

  /// Create a copy of QualityChecklist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QualityChecklistCopyWith<QualityChecklist> get copyWith =>
      _$QualityChecklistCopyWithImpl<QualityChecklist>(
          this as QualityChecklist, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QualityChecklist &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            const DeepCollectionEquality().equals(other.items, items) &&
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
      const DeepCollectionEquality().hash(items),
      completedAt,
      completedBy,
      notes,
      isPassed);

  @override
  String toString() {
    return 'QualityChecklist(id: $id, taskId: $taskId, items: $items, completedAt: $completedAt, completedBy: $completedBy, notes: $notes, isPassed: $isPassed)';
  }
}

/// @nodoc
abstract mixin class $QualityChecklistCopyWith<$Res> {
  factory $QualityChecklistCopyWith(
          QualityChecklist value, $Res Function(QualityChecklist) _then) =
      _$QualityChecklistCopyWithImpl;
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
class _$QualityChecklistCopyWithImpl<$Res>
    implements $QualityChecklistCopyWith<$Res> {
  _$QualityChecklistCopyWithImpl(this._self, this._then);

  final QualityChecklist _self;
  final $Res Function(QualityChecklist) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _self.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<QualityCheckItem>,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _self.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isPassed: null == isPassed
          ? _self.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [QualityChecklist].
extension QualityChecklistPatterns on QualityChecklist {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QualityChecklist value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QualityChecklist() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QualityChecklist value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QualityChecklist():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_QualityChecklist value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QualityChecklist() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String taskId,
            List<QualityCheckItem> items,
            DateTime? completedAt,
            String? completedBy,
            String? notes,
            bool isPassed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QualityChecklist() when $default != null:
        return $default(_that.id, _that.taskId, _that.items, _that.completedAt,
            _that.completedBy, _that.notes, _that.isPassed);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String taskId,
            List<QualityCheckItem> items,
            DateTime? completedAt,
            String? completedBy,
            String? notes,
            bool isPassed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QualityChecklist():
        return $default(_that.id, _that.taskId, _that.items, _that.completedAt,
            _that.completedBy, _that.notes, _that.isPassed);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String taskId,
            List<QualityCheckItem> items,
            DateTime? completedAt,
            String? completedBy,
            String? notes,
            bool isPassed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QualityChecklist() when $default != null:
        return $default(_that.id, _that.taskId, _that.items, _that.completedAt,
            _that.completedBy, _that.notes, _that.isPassed);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QualityChecklist extends QualityChecklist {
  const _QualityChecklist(
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

  /// Create a copy of QualityChecklist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QualityChecklistCopyWith<_QualityChecklist> get copyWith =>
      __$QualityChecklistCopyWithImpl<_QualityChecklist>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QualityChecklist &&
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

  @override
  String toString() {
    return 'QualityChecklist(id: $id, taskId: $taskId, items: $items, completedAt: $completedAt, completedBy: $completedBy, notes: $notes, isPassed: $isPassed)';
  }
}

/// @nodoc
abstract mixin class _$QualityChecklistCopyWith<$Res>
    implements $QualityChecklistCopyWith<$Res> {
  factory _$QualityChecklistCopyWith(
          _QualityChecklist value, $Res Function(_QualityChecklist) _then) =
      __$QualityChecklistCopyWithImpl;
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
class __$QualityChecklistCopyWithImpl<$Res>
    implements _$QualityChecklistCopyWith<$Res> {
  __$QualityChecklistCopyWithImpl(this._self, this._then);

  final _QualityChecklist _self;
  final $Res Function(_QualityChecklist) _then;

  /// Create a copy of QualityChecklist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? items = null,
    Object? completedAt = freezed,
    Object? completedBy = freezed,
    Object? notes = freezed,
    Object? isPassed = null,
  }) {
    return _then(_QualityChecklist(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _self.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<QualityCheckItem>,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _self.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isPassed: null == isPassed
          ? _self.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$QualityCheckItem {
  String get id;
  String get description;
  bool get isPassed;
  String? get notes;
  DateTime? get checkedAt;
  String? get checkedBy;

  /// Create a copy of QualityCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QualityCheckItemCopyWith<QualityCheckItem> get copyWith =>
      _$QualityCheckItemCopyWithImpl<QualityCheckItem>(
          this as QualityCheckItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QualityCheckItem &&
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

  @override
  String toString() {
    return 'QualityCheckItem(id: $id, description: $description, isPassed: $isPassed, notes: $notes, checkedAt: $checkedAt, checkedBy: $checkedBy)';
  }
}

/// @nodoc
abstract mixin class $QualityCheckItemCopyWith<$Res> {
  factory $QualityCheckItemCopyWith(
          QualityCheckItem value, $Res Function(QualityCheckItem) _then) =
      _$QualityCheckItemCopyWithImpl;
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
class _$QualityCheckItemCopyWithImpl<$Res>
    implements $QualityCheckItemCopyWith<$Res> {
  _$QualityCheckItemCopyWithImpl(this._self, this._then);

  final QualityCheckItem _self;
  final $Res Function(QualityCheckItem) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isPassed: null == isPassed
          ? _self.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedAt: freezed == checkedAt
          ? _self.checkedAt
          : checkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkedBy: freezed == checkedBy
          ? _self.checkedBy
          : checkedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QualityCheckItem].
extension QualityCheckItemPatterns on QualityCheckItem {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QualityCheckItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QualityCheckItem() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QualityCheckItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QualityCheckItem():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_QualityCheckItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QualityCheckItem() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String description, bool isPassed,
            String? notes, DateTime? checkedAt, String? checkedBy)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QualityCheckItem() when $default != null:
        return $default(_that.id, _that.description, _that.isPassed,
            _that.notes, _that.checkedAt, _that.checkedBy);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String description, bool isPassed,
            String? notes, DateTime? checkedAt, String? checkedBy)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QualityCheckItem():
        return $default(_that.id, _that.description, _that.isPassed,
            _that.notes, _that.checkedAt, _that.checkedBy);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String description, bool isPassed,
            String? notes, DateTime? checkedAt, String? checkedBy)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QualityCheckItem() when $default != null:
        return $default(_that.id, _that.description, _that.isPassed,
            _that.notes, _that.checkedAt, _that.checkedBy);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QualityCheckItem implements QualityCheckItem {
  const _QualityCheckItem(
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

  /// Create a copy of QualityCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QualityCheckItemCopyWith<_QualityCheckItem> get copyWith =>
      __$QualityCheckItemCopyWithImpl<_QualityCheckItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QualityCheckItem &&
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

  @override
  String toString() {
    return 'QualityCheckItem(id: $id, description: $description, isPassed: $isPassed, notes: $notes, checkedAt: $checkedAt, checkedBy: $checkedBy)';
  }
}

/// @nodoc
abstract mixin class _$QualityCheckItemCopyWith<$Res>
    implements $QualityCheckItemCopyWith<$Res> {
  factory _$QualityCheckItemCopyWith(
          _QualityCheckItem value, $Res Function(_QualityCheckItem) _then) =
      __$QualityCheckItemCopyWithImpl;
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
class __$QualityCheckItemCopyWithImpl<$Res>
    implements _$QualityCheckItemCopyWith<$Res> {
  __$QualityCheckItemCopyWithImpl(this._self, this._then);

  final _QualityCheckItem _self;
  final $Res Function(_QualityCheckItem) _then;

  /// Create a copy of QualityCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? isPassed = null,
    Object? notes = freezed,
    Object? checkedAt = freezed,
    Object? checkedBy = freezed,
  }) {
    return _then(_QualityCheckItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isPassed: null == isPassed
          ? _self.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedAt: freezed == checkedAt
          ? _self.checkedAt
          : checkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkedBy: freezed == checkedBy
          ? _self.checkedBy
          : checkedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$TaskBlocker {
  String get id;
  String get taskId;
  String get reason;
  DateTime get createdAt;
  DateTime? get resolvedAt;
  String? get resolvedBy;
  String? get resolution;
  bool get isResolved;

  /// Create a copy of TaskBlocker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskBlockerCopyWith<TaskBlocker> get copyWith =>
      _$TaskBlockerCopyWithImpl<TaskBlocker>(this as TaskBlocker, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskBlocker &&
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

  @override
  String toString() {
    return 'TaskBlocker(id: $id, taskId: $taskId, reason: $reason, createdAt: $createdAt, resolvedAt: $resolvedAt, resolvedBy: $resolvedBy, resolution: $resolution, isResolved: $isResolved)';
  }
}

/// @nodoc
abstract mixin class $TaskBlockerCopyWith<$Res> {
  factory $TaskBlockerCopyWith(
          TaskBlocker value, $Res Function(TaskBlocker) _then) =
      _$TaskBlockerCopyWithImpl;
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
class _$TaskBlockerCopyWithImpl<$Res> implements $TaskBlockerCopyWith<$Res> {
  _$TaskBlockerCopyWithImpl(this._self, this._then);

  final TaskBlocker _self;
  final $Res Function(TaskBlocker) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _self.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resolvedAt: freezed == resolvedAt
          ? _self.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolvedBy: freezed == resolvedBy
          ? _self.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolution: freezed == resolution
          ? _self.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: null == isResolved
          ? _self.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [TaskBlocker].
extension TaskBlockerPatterns on TaskBlocker {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TaskBlocker value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaskBlocker() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TaskBlocker value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskBlocker():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TaskBlocker value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskBlocker() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String taskId,
            String reason,
            DateTime createdAt,
            DateTime? resolvedAt,
            String? resolvedBy,
            String? resolution,
            bool isResolved)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaskBlocker() when $default != null:
        return $default(
            _that.id,
            _that.taskId,
            _that.reason,
            _that.createdAt,
            _that.resolvedAt,
            _that.resolvedBy,
            _that.resolution,
            _that.isResolved);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String taskId,
            String reason,
            DateTime createdAt,
            DateTime? resolvedAt,
            String? resolvedBy,
            String? resolution,
            bool isResolved)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskBlocker():
        return $default(
            _that.id,
            _that.taskId,
            _that.reason,
            _that.createdAt,
            _that.resolvedAt,
            _that.resolvedBy,
            _that.resolution,
            _that.isResolved);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String taskId,
            String reason,
            DateTime createdAt,
            DateTime? resolvedAt,
            String? resolvedBy,
            String? resolution,
            bool isResolved)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskBlocker() when $default != null:
        return $default(
            _that.id,
            _that.taskId,
            _that.reason,
            _that.createdAt,
            _that.resolvedAt,
            _that.resolvedBy,
            _that.resolution,
            _that.isResolved);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TaskBlocker extends TaskBlocker {
  const _TaskBlocker(
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

  /// Create a copy of TaskBlocker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskBlockerCopyWith<_TaskBlocker> get copyWith =>
      __$TaskBlockerCopyWithImpl<_TaskBlocker>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskBlocker &&
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

  @override
  String toString() {
    return 'TaskBlocker(id: $id, taskId: $taskId, reason: $reason, createdAt: $createdAt, resolvedAt: $resolvedAt, resolvedBy: $resolvedBy, resolution: $resolution, isResolved: $isResolved)';
  }
}

/// @nodoc
abstract mixin class _$TaskBlockerCopyWith<$Res>
    implements $TaskBlockerCopyWith<$Res> {
  factory _$TaskBlockerCopyWith(
          _TaskBlocker value, $Res Function(_TaskBlocker) _then) =
      __$TaskBlockerCopyWithImpl;
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
class __$TaskBlockerCopyWithImpl<$Res> implements _$TaskBlockerCopyWith<$Res> {
  __$TaskBlockerCopyWithImpl(this._self, this._then);

  final _TaskBlocker _self;
  final $Res Function(_TaskBlocker) _then;

  /// Create a copy of TaskBlocker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_TaskBlocker(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _self.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resolvedAt: freezed == resolvedAt
          ? _self.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolvedBy: freezed == resolvedBy
          ? _self.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolution: freezed == resolution
          ? _self.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: null == isResolved
          ? _self.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
