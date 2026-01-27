// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_station_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KitchenStationModel _$KitchenStationModelFromJson(Map<String, dynamic> json) {
  return _KitchenStationModel.fromJson(json);
}

/// @nodoc
mixin _$KitchenStationModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get assignedStaffId => throw _privateConstructorUsedError;
  String? get assignedStaffName => throw _privateConstructorUsedError;
  List<String>? get currentOrderIds => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  int? get activeOrders => throw _privateConstructorUsedError;
  String? get lastActivityTime => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this KitchenStationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KitchenStationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KitchenStationModelCopyWith<KitchenStationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitchenStationModelCopyWith<$Res> {
  factory $KitchenStationModelCopyWith(
          KitchenStationModel value, $Res Function(KitchenStationModel) then) =
      _$KitchenStationModelCopyWithImpl<$Res, KitchenStationModel>;
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
class _$KitchenStationModelCopyWithImpl<$Res, $Val extends KitchenStationModel>
    implements $KitchenStationModelCopyWith<$Res> {
  _$KitchenStationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      assignedStaffId: freezed == assignedStaffId
          ? _value.assignedStaffId
          : assignedStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaffName: freezed == assignedStaffName
          ? _value.assignedStaffName
          : assignedStaffName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentOrderIds: freezed == currentOrderIds
          ? _value.currentOrderIds
          : currentOrderIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      activeOrders: freezed == activeOrders
          ? _value.activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      lastActivityTime: freezed == lastActivityTime
          ? _value.lastActivityTime
          : lastActivityTime // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitchenStationModelImplCopyWith<$Res>
    implements $KitchenStationModelCopyWith<$Res> {
  factory _$$KitchenStationModelImplCopyWith(_$KitchenStationModelImpl value,
          $Res Function(_$KitchenStationModelImpl) then) =
      __$$KitchenStationModelImplCopyWithImpl<$Res>;
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
class __$$KitchenStationModelImplCopyWithImpl<$Res>
    extends _$KitchenStationModelCopyWithImpl<$Res, _$KitchenStationModelImpl>
    implements _$$KitchenStationModelImplCopyWith<$Res> {
  __$$KitchenStationModelImplCopyWithImpl(_$KitchenStationModelImpl _value,
      $Res Function(_$KitchenStationModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$KitchenStationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      assignedStaffId: freezed == assignedStaffId
          ? _value.assignedStaffId
          : assignedStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaffName: freezed == assignedStaffName
          ? _value.assignedStaffName
          : assignedStaffName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentOrderIds: freezed == currentOrderIds
          ? _value._currentOrderIds
          : currentOrderIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      activeOrders: freezed == activeOrders
          ? _value.activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      lastActivityTime: freezed == lastActivityTime
          ? _value.lastActivityTime
          : lastActivityTime // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitchenStationModelImpl extends _KitchenStationModel {
  const _$KitchenStationModelImpl(
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

  factory _$KitchenStationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitchenStationModelImplFromJson(json);

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

  @override
  String toString() {
    return 'KitchenStationModel(id: $id, name: $name, type: $type, status: $status, assignedStaffId: $assignedStaffId, assignedStaffName: $assignedStaffName, currentOrderIds: $currentOrderIds, capacity: $capacity, activeOrders: $activeOrders, lastActivityTime: $lastActivityTime, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KitchenStationModelImpl &&
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

  /// Create a copy of KitchenStationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KitchenStationModelImplCopyWith<_$KitchenStationModelImpl> get copyWith =>
      __$$KitchenStationModelImplCopyWithImpl<_$KitchenStationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitchenStationModelImplToJson(
      this,
    );
  }
}

abstract class _KitchenStationModel extends KitchenStationModel {
  const factory _KitchenStationModel(
      {required final String id,
      required final String name,
      required final String type,
      required final String status,
      final String? assignedStaffId,
      final String? assignedStaffName,
      final List<String>? currentOrderIds,
      final int? capacity,
      final int? activeOrders,
      final String? lastActivityTime,
      final String? notes}) = _$KitchenStationModelImpl;
  const _KitchenStationModel._() : super._();

  factory _KitchenStationModel.fromJson(Map<String, dynamic> json) =
      _$KitchenStationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String get status;
  @override
  String? get assignedStaffId;
  @override
  String? get assignedStaffName;
  @override
  List<String>? get currentOrderIds;
  @override
  int? get capacity;
  @override
  int? get activeOrders;
  @override
  String? get lastActivityTime;
  @override
  String? get notes;

  /// Create a copy of KitchenStationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KitchenStationModelImplCopyWith<_$KitchenStationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StationAssignmentModel _$StationAssignmentModelFromJson(
    Map<String, dynamic> json) {
  return _StationAssignmentModel.fromJson(json);
}

/// @nodoc
mixin _$StationAssignmentModel {
  String get orderId => throw _privateConstructorUsedError;
  String get stationId => throw _privateConstructorUsedError;
  String get stationName => throw _privateConstructorUsedError;
  String get assignedAt => throw _privateConstructorUsedError;
  String? get startedAt => throw _privateConstructorUsedError;
  String? get completedAt => throw _privateConstructorUsedError;
  String? get assignedBy => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this StationAssignmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StationAssignmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationAssignmentModelCopyWith<StationAssignmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationAssignmentModelCopyWith<$Res> {
  factory $StationAssignmentModelCopyWith(StationAssignmentModel value,
          $Res Function(StationAssignmentModel) then) =
      _$StationAssignmentModelCopyWithImpl<$Res, StationAssignmentModel>;
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
class _$StationAssignmentModelCopyWithImpl<$Res,
        $Val extends StationAssignmentModel>
    implements $StationAssignmentModelCopyWith<$Res> {
  _$StationAssignmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      stationName: null == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String,
      assignedAt: null == assignedAt
          ? _value.assignedAt
          : assignedAt // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedBy: freezed == assignedBy
          ? _value.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationAssignmentModelImplCopyWith<$Res>
    implements $StationAssignmentModelCopyWith<$Res> {
  factory _$$StationAssignmentModelImplCopyWith(
          _$StationAssignmentModelImpl value,
          $Res Function(_$StationAssignmentModelImpl) then) =
      __$$StationAssignmentModelImplCopyWithImpl<$Res>;
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
class __$$StationAssignmentModelImplCopyWithImpl<$Res>
    extends _$StationAssignmentModelCopyWithImpl<$Res,
        _$StationAssignmentModelImpl>
    implements _$$StationAssignmentModelImplCopyWith<$Res> {
  __$$StationAssignmentModelImplCopyWithImpl(
      _$StationAssignmentModelImpl _value,
      $Res Function(_$StationAssignmentModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$StationAssignmentModelImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      stationName: null == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String,
      assignedAt: null == assignedAt
          ? _value.assignedAt
          : assignedAt // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedBy: freezed == assignedBy
          ? _value.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationAssignmentModelImpl extends _StationAssignmentModel {
  const _$StationAssignmentModelImpl(
      {required this.orderId,
      required this.stationId,
      required this.stationName,
      required this.assignedAt,
      this.startedAt,
      this.completedAt,
      this.assignedBy,
      this.notes})
      : super._();

  factory _$StationAssignmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationAssignmentModelImplFromJson(json);

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

  @override
  String toString() {
    return 'StationAssignmentModel(orderId: $orderId, stationId: $stationId, stationName: $stationName, assignedAt: $assignedAt, startedAt: $startedAt, completedAt: $completedAt, assignedBy: $assignedBy, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationAssignmentModelImpl &&
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

  /// Create a copy of StationAssignmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationAssignmentModelImplCopyWith<_$StationAssignmentModelImpl>
      get copyWith => __$$StationAssignmentModelImplCopyWithImpl<
          _$StationAssignmentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationAssignmentModelImplToJson(
      this,
    );
  }
}

abstract class _StationAssignmentModel extends StationAssignmentModel {
  const factory _StationAssignmentModel(
      {required final String orderId,
      required final String stationId,
      required final String stationName,
      required final String assignedAt,
      final String? startedAt,
      final String? completedAt,
      final String? assignedBy,
      final String? notes}) = _$StationAssignmentModelImpl;
  const _StationAssignmentModel._() : super._();

  factory _StationAssignmentModel.fromJson(Map<String, dynamic> json) =
      _$StationAssignmentModelImpl.fromJson;

  @override
  String get orderId;
  @override
  String get stationId;
  @override
  String get stationName;
  @override
  String get assignedAt;
  @override
  String? get startedAt;
  @override
  String? get completedAt;
  @override
  String? get assignedBy;
  @override
  String? get notes;

  /// Create a copy of StationAssignmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationAssignmentModelImplCopyWith<_$StationAssignmentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
