// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductionTaskModel {
  String get id;
  String get orderId;
  String get orderNumber;
  String get type;
  String get status;
  String get priority;
  String get description;
  String get createdAt;
  String? get scheduledAt;
  String? get startedAt;
  String? get completedAt;
  String? get assignedStationId;
  String? get assignedStationName;
  String? get assignedStaffId;
  String? get assignedStaffName;
  int? get estimatedDuration;
  List<TaskStepModel>? get steps;
  List<String>? get requiredEquipment;
  List<String>? get requiredIngredients;
  String? get notes;
  String? get completionNotes;
  bool get isBlocking;
  bool get requiresQualityCheck;

  /// Create a copy of ProductionTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductionTaskModelCopyWith<ProductionTaskModel> get copyWith =>
      _$ProductionTaskModelCopyWithImpl<ProductionTaskModel>(
          this as ProductionTaskModel, _$identity);

  /// Serializes this ProductionTaskModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductionTaskModel &&
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
    return 'ProductionTaskModel(id: $id, orderId: $orderId, orderNumber: $orderNumber, type: $type, status: $status, priority: $priority, description: $description, createdAt: $createdAt, scheduledAt: $scheduledAt, startedAt: $startedAt, completedAt: $completedAt, assignedStationId: $assignedStationId, assignedStationName: $assignedStationName, assignedStaffId: $assignedStaffId, assignedStaffName: $assignedStaffName, estimatedDuration: $estimatedDuration, steps: $steps, requiredEquipment: $requiredEquipment, requiredIngredients: $requiredIngredients, notes: $notes, completionNotes: $completionNotes, isBlocking: $isBlocking, requiresQualityCheck: $requiresQualityCheck)';
  }
}

/// @nodoc
abstract mixin class $ProductionTaskModelCopyWith<$Res> {
  factory $ProductionTaskModelCopyWith(
          ProductionTaskModel value, $Res Function(ProductionTaskModel) _then) =
      _$ProductionTaskModelCopyWithImpl;
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
class _$ProductionTaskModelCopyWithImpl<$Res>
    implements $ProductionTaskModelCopyWith<$Res> {
  _$ProductionTaskModelCopyWithImpl(this._self, this._then);

  final ProductionTaskModel _self;
  final $Res Function(ProductionTaskModel) _then;

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
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: freezed == scheduledAt
          ? _self.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as List<TaskStepModel>?,
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

/// Adds pattern-matching-related methods to [ProductionTaskModel].
extension ProductionTaskModelPatterns on ProductionTaskModel {
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
    TResult Function(_ProductionTaskModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductionTaskModel() when $default != null:
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
    TResult Function(_ProductionTaskModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionTaskModel():
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
    TResult? Function(_ProductionTaskModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionTaskModel() when $default != null:
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
            bool requiresQualityCheck)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductionTaskModel() when $default != null:
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
            bool requiresQualityCheck)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionTaskModel():
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
            bool requiresQualityCheck)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionTaskModel() when $default != null:
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
@JsonSerializable()
class _ProductionTaskModel extends ProductionTaskModel {
  const _ProductionTaskModel(
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
  factory _ProductionTaskModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionTaskModelFromJson(json);

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

  /// Create a copy of ProductionTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductionTaskModelCopyWith<_ProductionTaskModel> get copyWith =>
      __$ProductionTaskModelCopyWithImpl<_ProductionTaskModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductionTaskModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductionTaskModel &&
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

  @override
  String toString() {
    return 'ProductionTaskModel(id: $id, orderId: $orderId, orderNumber: $orderNumber, type: $type, status: $status, priority: $priority, description: $description, createdAt: $createdAt, scheduledAt: $scheduledAt, startedAt: $startedAt, completedAt: $completedAt, assignedStationId: $assignedStationId, assignedStationName: $assignedStationName, assignedStaffId: $assignedStaffId, assignedStaffName: $assignedStaffName, estimatedDuration: $estimatedDuration, steps: $steps, requiredEquipment: $requiredEquipment, requiredIngredients: $requiredIngredients, notes: $notes, completionNotes: $completionNotes, isBlocking: $isBlocking, requiresQualityCheck: $requiresQualityCheck)';
  }
}

/// @nodoc
abstract mixin class _$ProductionTaskModelCopyWith<$Res>
    implements $ProductionTaskModelCopyWith<$Res> {
  factory _$ProductionTaskModelCopyWith(_ProductionTaskModel value,
          $Res Function(_ProductionTaskModel) _then) =
      __$ProductionTaskModelCopyWithImpl;
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
class __$ProductionTaskModelCopyWithImpl<$Res>
    implements _$ProductionTaskModelCopyWith<$Res> {
  __$ProductionTaskModelCopyWithImpl(this._self, this._then);

  final _ProductionTaskModel _self;
  final $Res Function(_ProductionTaskModel) _then;

  /// Create a copy of ProductionTaskModel
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
    return _then(_ProductionTaskModel(
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
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: freezed == scheduledAt
          ? _self.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as List<TaskStepModel>?,
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
mixin _$TaskStepModel {
  String get id;
  int get order;
  String get description;
  int? get estimatedMinutes;
  String? get startedAt;
  String? get completedAt;
  String? get completedBy;
  String? get notes;
  bool get isCompleted;
  bool get isOptional;
  bool get requiresVerification;

  /// Create a copy of TaskStepModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskStepModelCopyWith<TaskStepModel> get copyWith =>
      _$TaskStepModelCopyWithImpl<TaskStepModel>(
          this as TaskStepModel, _$identity);

  /// Serializes this TaskStepModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskStepModel &&
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

  @override
  String toString() {
    return 'TaskStepModel(id: $id, order: $order, description: $description, estimatedMinutes: $estimatedMinutes, startedAt: $startedAt, completedAt: $completedAt, completedBy: $completedBy, notes: $notes, isCompleted: $isCompleted, isOptional: $isOptional, requiresVerification: $requiresVerification)';
  }
}

/// @nodoc
abstract mixin class $TaskStepModelCopyWith<$Res> {
  factory $TaskStepModelCopyWith(
          TaskStepModel value, $Res Function(TaskStepModel) _then) =
      _$TaskStepModelCopyWithImpl;
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
class _$TaskStepModelCopyWithImpl<$Res>
    implements $TaskStepModelCopyWith<$Res> {
  _$TaskStepModelCopyWithImpl(this._self, this._then);

  final TaskStepModel _self;
  final $Res Function(TaskStepModel) _then;

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
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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

/// Adds pattern-matching-related methods to [TaskStepModel].
extension TaskStepModelPatterns on TaskStepModel {
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
    TResult Function(_TaskStepModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaskStepModel() when $default != null:
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
    TResult Function(_TaskStepModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskStepModel():
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
    TResult? Function(_TaskStepModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskStepModel() when $default != null:
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
            String? startedAt,
            String? completedAt,
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
      case _TaskStepModel() when $default != null:
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
            String? startedAt,
            String? completedAt,
            String? completedBy,
            String? notes,
            bool isCompleted,
            bool isOptional,
            bool requiresVerification)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskStepModel():
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
            String? startedAt,
            String? completedAt,
            String? completedBy,
            String? notes,
            bool isCompleted,
            bool isOptional,
            bool requiresVerification)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaskStepModel() when $default != null:
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
@JsonSerializable()
class _TaskStepModel extends TaskStepModel {
  const _TaskStepModel(
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
  factory _TaskStepModel.fromJson(Map<String, dynamic> json) =>
      _$TaskStepModelFromJson(json);

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

  /// Create a copy of TaskStepModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskStepModelCopyWith<_TaskStepModel> get copyWith =>
      __$TaskStepModelCopyWithImpl<_TaskStepModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskStepModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskStepModel &&
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

  @override
  String toString() {
    return 'TaskStepModel(id: $id, order: $order, description: $description, estimatedMinutes: $estimatedMinutes, startedAt: $startedAt, completedAt: $completedAt, completedBy: $completedBy, notes: $notes, isCompleted: $isCompleted, isOptional: $isOptional, requiresVerification: $requiresVerification)';
  }
}

/// @nodoc
abstract mixin class _$TaskStepModelCopyWith<$Res>
    implements $TaskStepModelCopyWith<$Res> {
  factory _$TaskStepModelCopyWith(
          _TaskStepModel value, $Res Function(_TaskStepModel) _then) =
      __$TaskStepModelCopyWithImpl;
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
class __$TaskStepModelCopyWithImpl<$Res>
    implements _$TaskStepModelCopyWith<$Res> {
  __$TaskStepModelCopyWithImpl(this._self, this._then);

  final _TaskStepModel _self;
  final $Res Function(_TaskStepModel) _then;

  /// Create a copy of TaskStepModel
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
    return _then(_TaskStepModel(
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
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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

// dart format on
