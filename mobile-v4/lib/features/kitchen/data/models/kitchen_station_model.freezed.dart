// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_station_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KitchenStationModel {
  String get id;
  String get name;
  String get type;
  String get status;
  String? get assignedStaffId;
  String? get assignedStaffName;
  List<String>? get currentOrderIds;
  int? get capacity;
  int? get activeOrders;
  String? get lastActivityTime;
  String? get notes;

  /// Create a copy of KitchenStationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KitchenStationModelCopyWith<KitchenStationModel> get copyWith =>
      _$KitchenStationModelCopyWithImpl<KitchenStationModel>(
          this as KitchenStationModel, _$identity);

  /// Serializes this KitchenStationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KitchenStationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignedStaffId, assignedStaffId) ||
                other.assignedStaffId == assignedStaffId) &&
            (identical(other.assignedStaffName, assignedStaffName) ||
                other.assignedStaffName == assignedStaffName) &&
            const DeepCollectionEquality()
                .equals(other.currentOrderIds, currentOrderIds) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.activeOrders, activeOrders) ||
                other.activeOrders == activeOrders) &&
            (identical(other.lastActivityTime, lastActivityTime) ||
                other.lastActivityTime == lastActivityTime) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      status,
      assignedStaffId,
      assignedStaffName,
      const DeepCollectionEquality().hash(currentOrderIds),
      capacity,
      activeOrders,
      lastActivityTime,
      notes);

  @override
  String toString() {
    return 'KitchenStationModel(id: $id, name: $name, type: $type, status: $status, assignedStaffId: $assignedStaffId, assignedStaffName: $assignedStaffName, currentOrderIds: $currentOrderIds, capacity: $capacity, activeOrders: $activeOrders, lastActivityTime: $lastActivityTime, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $KitchenStationModelCopyWith<$Res> {
  factory $KitchenStationModelCopyWith(
          KitchenStationModel value, $Res Function(KitchenStationModel) _then) =
      _$KitchenStationModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      String status,
      String? assignedStaffId,
      String? assignedStaffName,
      List<String>? currentOrderIds,
      int? capacity,
      int? activeOrders,
      String? lastActivityTime,
      String? notes});
}

/// @nodoc
class _$KitchenStationModelCopyWithImpl<$Res>
    implements $KitchenStationModelCopyWith<$Res> {
  _$KitchenStationModelCopyWithImpl(this._self, this._then);

  final KitchenStationModel _self;
  final $Res Function(KitchenStationModel) _then;

  /// Create a copy of KitchenStationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? status = null,
    Object? assignedStaffId = freezed,
    Object? assignedStaffName = freezed,
    Object? currentOrderIds = freezed,
    Object? capacity = freezed,
    Object? activeOrders = freezed,
    Object? lastActivityTime = freezed,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      assignedStaffId: freezed == assignedStaffId
          ? _self.assignedStaffId
          : assignedStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaffName: freezed == assignedStaffName
          ? _self.assignedStaffName
          : assignedStaffName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentOrderIds: freezed == currentOrderIds
          ? _self.currentOrderIds
          : currentOrderIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      capacity: freezed == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      activeOrders: freezed == activeOrders
          ? _self.activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      lastActivityTime: freezed == lastActivityTime
          ? _self.lastActivityTime
          : lastActivityTime // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [KitchenStationModel].
extension KitchenStationModelPatterns on KitchenStationModel {
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
    TResult Function(_KitchenStationModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenStationModel() when $default != null:
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
    TResult Function(_KitchenStationModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStationModel():
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
    TResult? Function(_KitchenStationModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStationModel() when $default != null:
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
            String name,
            String type,
            String status,
            String? assignedStaffId,
            String? assignedStaffName,
            List<String>? currentOrderIds,
            int? capacity,
            int? activeOrders,
            String? lastActivityTime,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenStationModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.status,
            _that.assignedStaffId,
            _that.assignedStaffName,
            _that.currentOrderIds,
            _that.capacity,
            _that.activeOrders,
            _that.lastActivityTime,
            _that.notes);
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
            String name,
            String type,
            String status,
            String? assignedStaffId,
            String? assignedStaffName,
            List<String>? currentOrderIds,
            int? capacity,
            int? activeOrders,
            String? lastActivityTime,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStationModel():
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.status,
            _that.assignedStaffId,
            _that.assignedStaffName,
            _that.currentOrderIds,
            _that.capacity,
            _that.activeOrders,
            _that.lastActivityTime,
            _that.notes);
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
            String name,
            String type,
            String status,
            String? assignedStaffId,
            String? assignedStaffName,
            List<String>? currentOrderIds,
            int? capacity,
            int? activeOrders,
            String? lastActivityTime,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStationModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.status,
            _that.assignedStaffId,
            _that.assignedStaffName,
            _that.currentOrderIds,
            _that.capacity,
            _that.activeOrders,
            _that.lastActivityTime,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _KitchenStationModel extends KitchenStationModel {
  const _KitchenStationModel(
      {required this.id,
      required this.name,
      required this.type,
      required this.status,
      this.assignedStaffId,
      this.assignedStaffName,
      final List<String>? currentOrderIds,
      this.capacity,
      this.activeOrders,
      this.lastActivityTime,
      this.notes})
      : _currentOrderIds = currentOrderIds,
        super._();
  factory _KitchenStationModel.fromJson(Map<String, dynamic> json) =>
      _$KitchenStationModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String status;
  @override
  final String? assignedStaffId;
  @override
  final String? assignedStaffName;
  final List<String>? _currentOrderIds;
  @override
  List<String>? get currentOrderIds {
    final value = _currentOrderIds;
    if (value == null) return null;
    if (_currentOrderIds is EqualUnmodifiableListView) return _currentOrderIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? capacity;
  @override
  final int? activeOrders;
  @override
  final String? lastActivityTime;
  @override
  final String? notes;

  /// Create a copy of KitchenStationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KitchenStationModelCopyWith<_KitchenStationModel> get copyWith =>
      __$KitchenStationModelCopyWithImpl<_KitchenStationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KitchenStationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KitchenStationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignedStaffId, assignedStaffId) ||
                other.assignedStaffId == assignedStaffId) &&
            (identical(other.assignedStaffName, assignedStaffName) ||
                other.assignedStaffName == assignedStaffName) &&
            const DeepCollectionEquality()
                .equals(other._currentOrderIds, _currentOrderIds) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.activeOrders, activeOrders) ||
                other.activeOrders == activeOrders) &&
            (identical(other.lastActivityTime, lastActivityTime) ||
                other.lastActivityTime == lastActivityTime) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      status,
      assignedStaffId,
      assignedStaffName,
      const DeepCollectionEquality().hash(_currentOrderIds),
      capacity,
      activeOrders,
      lastActivityTime,
      notes);

  @override
  String toString() {
    return 'KitchenStationModel(id: $id, name: $name, type: $type, status: $status, assignedStaffId: $assignedStaffId, assignedStaffName: $assignedStaffName, currentOrderIds: $currentOrderIds, capacity: $capacity, activeOrders: $activeOrders, lastActivityTime: $lastActivityTime, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$KitchenStationModelCopyWith<$Res>
    implements $KitchenStationModelCopyWith<$Res> {
  factory _$KitchenStationModelCopyWith(_KitchenStationModel value,
          $Res Function(_KitchenStationModel) _then) =
      __$KitchenStationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      String status,
      String? assignedStaffId,
      String? assignedStaffName,
      List<String>? currentOrderIds,
      int? capacity,
      int? activeOrders,
      String? lastActivityTime,
      String? notes});
}

/// @nodoc
class __$KitchenStationModelCopyWithImpl<$Res>
    implements _$KitchenStationModelCopyWith<$Res> {
  __$KitchenStationModelCopyWithImpl(this._self, this._then);

  final _KitchenStationModel _self;
  final $Res Function(_KitchenStationModel) _then;

  /// Create a copy of KitchenStationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? status = null,
    Object? assignedStaffId = freezed,
    Object? assignedStaffName = freezed,
    Object? currentOrderIds = freezed,
    Object? capacity = freezed,
    Object? activeOrders = freezed,
    Object? lastActivityTime = freezed,
    Object? notes = freezed,
  }) {
    return _then(_KitchenStationModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      assignedStaffId: freezed == assignedStaffId
          ? _self.assignedStaffId
          : assignedStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaffName: freezed == assignedStaffName
          ? _self.assignedStaffName
          : assignedStaffName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentOrderIds: freezed == currentOrderIds
          ? _self._currentOrderIds
          : currentOrderIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      capacity: freezed == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      activeOrders: freezed == activeOrders
          ? _self.activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      lastActivityTime: freezed == lastActivityTime
          ? _self.lastActivityTime
          : lastActivityTime // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$StationAssignmentModel {
  String get orderId;
  String get stationId;
  String get stationName;
  String get assignedAt;
  String? get startedAt;
  String? get completedAt;
  String? get assignedBy;
  String? get notes;

  /// Create a copy of StationAssignmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StationAssignmentModelCopyWith<StationAssignmentModel> get copyWith =>
      _$StationAssignmentModelCopyWithImpl<StationAssignmentModel>(
          this as StationAssignmentModel, _$identity);

  /// Serializes this StationAssignmentModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StationAssignmentModel &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.stationId, stationId) ||
                other.stationId == stationId) &&
            (identical(other.stationName, stationName) ||
                other.stationName == stationName) &&
            (identical(other.assignedAt, assignedAt) ||
                other.assignedAt == assignedAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.assignedBy, assignedBy) ||
                other.assignedBy == assignedBy) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, stationId, stationName,
      assignedAt, startedAt, completedAt, assignedBy, notes);

  @override
  String toString() {
    return 'StationAssignmentModel(orderId: $orderId, stationId: $stationId, stationName: $stationName, assignedAt: $assignedAt, startedAt: $startedAt, completedAt: $completedAt, assignedBy: $assignedBy, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $StationAssignmentModelCopyWith<$Res> {
  factory $StationAssignmentModelCopyWith(StationAssignmentModel value,
          $Res Function(StationAssignmentModel) _then) =
      _$StationAssignmentModelCopyWithImpl;
  @useResult
  $Res call(
      {String orderId,
      String stationId,
      String stationName,
      String assignedAt,
      String? startedAt,
      String? completedAt,
      String? assignedBy,
      String? notes});
}

/// @nodoc
class _$StationAssignmentModelCopyWithImpl<$Res>
    implements $StationAssignmentModelCopyWith<$Res> {
  _$StationAssignmentModelCopyWithImpl(this._self, this._then);

  final StationAssignmentModel _self;
  final $Res Function(StationAssignmentModel) _then;

  /// Create a copy of StationAssignmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? stationId = null,
    Object? stationName = null,
    Object? assignedAt = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? assignedBy = freezed,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      stationId: null == stationId
          ? _self.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      stationName: null == stationName
          ? _self.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String,
      assignedAt: null == assignedAt
          ? _self.assignedAt
          : assignedAt // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedBy: freezed == assignedBy
          ? _self.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [StationAssignmentModel].
extension StationAssignmentModelPatterns on StationAssignmentModel {
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
    TResult Function(_StationAssignmentModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StationAssignmentModel() when $default != null:
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
    TResult Function(_StationAssignmentModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StationAssignmentModel():
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
    TResult? Function(_StationAssignmentModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StationAssignmentModel() when $default != null:
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
            String orderId,
            String stationId,
            String stationName,
            String assignedAt,
            String? startedAt,
            String? completedAt,
            String? assignedBy,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StationAssignmentModel() when $default != null:
        return $default(
            _that.orderId,
            _that.stationId,
            _that.stationName,
            _that.assignedAt,
            _that.startedAt,
            _that.completedAt,
            _that.assignedBy,
            _that.notes);
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
            String orderId,
            String stationId,
            String stationName,
            String assignedAt,
            String? startedAt,
            String? completedAt,
            String? assignedBy,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StationAssignmentModel():
        return $default(
            _that.orderId,
            _that.stationId,
            _that.stationName,
            _that.assignedAt,
            _that.startedAt,
            _that.completedAt,
            _that.assignedBy,
            _that.notes);
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
            String orderId,
            String stationId,
            String stationName,
            String assignedAt,
            String? startedAt,
            String? completedAt,
            String? assignedBy,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StationAssignmentModel() when $default != null:
        return $default(
            _that.orderId,
            _that.stationId,
            _that.stationName,
            _that.assignedAt,
            _that.startedAt,
            _that.completedAt,
            _that.assignedBy,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StationAssignmentModel extends StationAssignmentModel {
  const _StationAssignmentModel(
      {required this.orderId,
      required this.stationId,
      required this.stationName,
      required this.assignedAt,
      this.startedAt,
      this.completedAt,
      this.assignedBy,
      this.notes})
      : super._();
  factory _StationAssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$StationAssignmentModelFromJson(json);

  @override
  final String orderId;
  @override
  final String stationId;
  @override
  final String stationName;
  @override
  final String assignedAt;
  @override
  final String? startedAt;
  @override
  final String? completedAt;
  @override
  final String? assignedBy;
  @override
  final String? notes;

  /// Create a copy of StationAssignmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StationAssignmentModelCopyWith<_StationAssignmentModel> get copyWith =>
      __$StationAssignmentModelCopyWithImpl<_StationAssignmentModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StationAssignmentModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StationAssignmentModel &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.stationId, stationId) ||
                other.stationId == stationId) &&
            (identical(other.stationName, stationName) ||
                other.stationName == stationName) &&
            (identical(other.assignedAt, assignedAt) ||
                other.assignedAt == assignedAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.assignedBy, assignedBy) ||
                other.assignedBy == assignedBy) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, stationId, stationName,
      assignedAt, startedAt, completedAt, assignedBy, notes);

  @override
  String toString() {
    return 'StationAssignmentModel(orderId: $orderId, stationId: $stationId, stationName: $stationName, assignedAt: $assignedAt, startedAt: $startedAt, completedAt: $completedAt, assignedBy: $assignedBy, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$StationAssignmentModelCopyWith<$Res>
    implements $StationAssignmentModelCopyWith<$Res> {
  factory _$StationAssignmentModelCopyWith(_StationAssignmentModel value,
          $Res Function(_StationAssignmentModel) _then) =
      __$StationAssignmentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String orderId,
      String stationId,
      String stationName,
      String assignedAt,
      String? startedAt,
      String? completedAt,
      String? assignedBy,
      String? notes});
}

/// @nodoc
class __$StationAssignmentModelCopyWithImpl<$Res>
    implements _$StationAssignmentModelCopyWith<$Res> {
  __$StationAssignmentModelCopyWithImpl(this._self, this._then);

  final _StationAssignmentModel _self;
  final $Res Function(_StationAssignmentModel) _then;

  /// Create a copy of StationAssignmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orderId = null,
    Object? stationId = null,
    Object? stationName = null,
    Object? assignedAt = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? assignedBy = freezed,
    Object? notes = freezed,
  }) {
    return _then(_StationAssignmentModel(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      stationId: null == stationId
          ? _self.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      stationName: null == stationName
          ? _self.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String,
      assignedAt: null == assignedAt
          ? _self.assignedAt
          : assignedAt // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedBy: freezed == assignedBy
          ? _self.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
