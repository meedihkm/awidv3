// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KitchenStation {
  String get id;
  String get name;
  StationType get type;
  StationStatus get status;
  String? get assignedStaffId;
  String? get assignedStaffName;
  List<String>? get currentOrderIds;
  int? get capacity;
  int? get activeOrders;
  DateTime? get lastActivityTime;
  String? get notes;

  /// Create a copy of KitchenStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KitchenStationCopyWith<KitchenStation> get copyWith =>
      _$KitchenStationCopyWithImpl<KitchenStation>(
          this as KitchenStation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KitchenStation &&
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
    return 'KitchenStation(id: $id, name: $name, type: $type, status: $status, assignedStaffId: $assignedStaffId, assignedStaffName: $assignedStaffName, currentOrderIds: $currentOrderIds, capacity: $capacity, activeOrders: $activeOrders, lastActivityTime: $lastActivityTime, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $KitchenStationCopyWith<$Res> {
  factory $KitchenStationCopyWith(
          KitchenStation value, $Res Function(KitchenStation) _then) =
      _$KitchenStationCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      StationType type,
      StationStatus status,
      String? assignedStaffId,
      String? assignedStaffName,
      List<String>? currentOrderIds,
      int? capacity,
      int? activeOrders,
      DateTime? lastActivityTime,
      String? notes});
}

/// @nodoc
class _$KitchenStationCopyWithImpl<$Res>
    implements $KitchenStationCopyWith<$Res> {
  _$KitchenStationCopyWithImpl(this._self, this._then);

  final KitchenStation _self;
  final $Res Function(KitchenStation) _then;

  /// Create a copy of KitchenStation
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
              as StationType,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StationStatus,
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
              as DateTime?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [KitchenStation].
extension KitchenStationPatterns on KitchenStation {
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
    TResult Function(_KitchenStation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenStation() when $default != null:
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
    TResult Function(_KitchenStation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStation():
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
    TResult? Function(_KitchenStation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStation() when $default != null:
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
            StationType type,
            StationStatus status,
            String? assignedStaffId,
            String? assignedStaffName,
            List<String>? currentOrderIds,
            int? capacity,
            int? activeOrders,
            DateTime? lastActivityTime,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenStation() when $default != null:
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
            StationType type,
            StationStatus status,
            String? assignedStaffId,
            String? assignedStaffName,
            List<String>? currentOrderIds,
            int? capacity,
            int? activeOrders,
            DateTime? lastActivityTime,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStation():
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
            StationType type,
            StationStatus status,
            String? assignedStaffId,
            String? assignedStaffName,
            List<String>? currentOrderIds,
            int? capacity,
            int? activeOrders,
            DateTime? lastActivityTime,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStation() when $default != null:
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

class _KitchenStation extends KitchenStation {
  const _KitchenStation(
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

  @override
  final String id;
  @override
  final String name;
  @override
  final StationType type;
  @override
  final StationStatus status;
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
  final DateTime? lastActivityTime;
  @override
  final String? notes;

  /// Create a copy of KitchenStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KitchenStationCopyWith<_KitchenStation> get copyWith =>
      __$KitchenStationCopyWithImpl<_KitchenStation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KitchenStation &&
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
    return 'KitchenStation(id: $id, name: $name, type: $type, status: $status, assignedStaffId: $assignedStaffId, assignedStaffName: $assignedStaffName, currentOrderIds: $currentOrderIds, capacity: $capacity, activeOrders: $activeOrders, lastActivityTime: $lastActivityTime, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$KitchenStationCopyWith<$Res>
    implements $KitchenStationCopyWith<$Res> {
  factory _$KitchenStationCopyWith(
          _KitchenStation value, $Res Function(_KitchenStation) _then) =
      __$KitchenStationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      StationType type,
      StationStatus status,
      String? assignedStaffId,
      String? assignedStaffName,
      List<String>? currentOrderIds,
      int? capacity,
      int? activeOrders,
      DateTime? lastActivityTime,
      String? notes});
}

/// @nodoc
class __$KitchenStationCopyWithImpl<$Res>
    implements _$KitchenStationCopyWith<$Res> {
  __$KitchenStationCopyWithImpl(this._self, this._then);

  final _KitchenStation _self;
  final $Res Function(_KitchenStation) _then;

  /// Create a copy of KitchenStation
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
    return _then(_KitchenStation(
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
              as StationType,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StationStatus,
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
              as DateTime?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$StationAssignment {
  String get orderId;
  String get stationId;
  String get stationName;
  DateTime get assignedAt;
  DateTime? get startedAt;
  DateTime? get completedAt;
  String? get assignedBy;
  String? get notes;

  /// Create a copy of StationAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StationAssignmentCopyWith<StationAssignment> get copyWith =>
      _$StationAssignmentCopyWithImpl<StationAssignment>(
          this as StationAssignment, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StationAssignment &&
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

  @override
  int get hashCode => Object.hash(runtimeType, orderId, stationId, stationName,
      assignedAt, startedAt, completedAt, assignedBy, notes);

  @override
  String toString() {
    return 'StationAssignment(orderId: $orderId, stationId: $stationId, stationName: $stationName, assignedAt: $assignedAt, startedAt: $startedAt, completedAt: $completedAt, assignedBy: $assignedBy, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $StationAssignmentCopyWith<$Res> {
  factory $StationAssignmentCopyWith(
          StationAssignment value, $Res Function(StationAssignment) _then) =
      _$StationAssignmentCopyWithImpl;
  @useResult
  $Res call(
      {String orderId,
      String stationId,
      String stationName,
      DateTime assignedAt,
      DateTime? startedAt,
      DateTime? completedAt,
      String? assignedBy,
      String? notes});
}

/// @nodoc
class _$StationAssignmentCopyWithImpl<$Res>
    implements $StationAssignmentCopyWith<$Res> {
  _$StationAssignmentCopyWithImpl(this._self, this._then);

  final StationAssignment _self;
  final $Res Function(StationAssignment) _then;

  /// Create a copy of StationAssignment
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
              as DateTime,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

/// Adds pattern-matching-related methods to [StationAssignment].
extension StationAssignmentPatterns on StationAssignment {
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
    TResult Function(_StationAssignment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StationAssignment() when $default != null:
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
    TResult Function(_StationAssignment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StationAssignment():
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
    TResult? Function(_StationAssignment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StationAssignment() when $default != null:
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
            DateTime assignedAt,
            DateTime? startedAt,
            DateTime? completedAt,
            String? assignedBy,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StationAssignment() when $default != null:
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
            DateTime assignedAt,
            DateTime? startedAt,
            DateTime? completedAt,
            String? assignedBy,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StationAssignment():
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
            DateTime assignedAt,
            DateTime? startedAt,
            DateTime? completedAt,
            String? assignedBy,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StationAssignment() when $default != null:
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

class _StationAssignment extends StationAssignment {
  const _StationAssignment(
      {required this.orderId,
      required this.stationId,
      required this.stationName,
      required this.assignedAt,
      this.startedAt,
      this.completedAt,
      this.assignedBy,
      this.notes})
      : super._();

  @override
  final String orderId;
  @override
  final String stationId;
  @override
  final String stationName;
  @override
  final DateTime assignedAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
  @override
  final String? assignedBy;
  @override
  final String? notes;

  /// Create a copy of StationAssignment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StationAssignmentCopyWith<_StationAssignment> get copyWith =>
      __$StationAssignmentCopyWithImpl<_StationAssignment>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StationAssignment &&
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

  @override
  int get hashCode => Object.hash(runtimeType, orderId, stationId, stationName,
      assignedAt, startedAt, completedAt, assignedBy, notes);

  @override
  String toString() {
    return 'StationAssignment(orderId: $orderId, stationId: $stationId, stationName: $stationName, assignedAt: $assignedAt, startedAt: $startedAt, completedAt: $completedAt, assignedBy: $assignedBy, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$StationAssignmentCopyWith<$Res>
    implements $StationAssignmentCopyWith<$Res> {
  factory _$StationAssignmentCopyWith(
          _StationAssignment value, $Res Function(_StationAssignment) _then) =
      __$StationAssignmentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String orderId,
      String stationId,
      String stationName,
      DateTime assignedAt,
      DateTime? startedAt,
      DateTime? completedAt,
      String? assignedBy,
      String? notes});
}

/// @nodoc
class __$StationAssignmentCopyWithImpl<$Res>
    implements _$StationAssignmentCopyWith<$Res> {
  __$StationAssignmentCopyWithImpl(this._self, this._then);

  final _StationAssignment _self;
  final $Res Function(_StationAssignment) _then;

  /// Create a copy of StationAssignment
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
    return _then(_StationAssignment(
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
              as DateTime,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
