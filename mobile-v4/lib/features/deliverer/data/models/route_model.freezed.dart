// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WaypointModel _$WaypointModelFromJson(Map<String, dynamic> json) {
  return _WaypointModel.fromJson(json);
}

/// @nodoc
mixin _$WaypointModel {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;

  /// Serializes this WaypointModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WaypointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaypointModelCopyWith<WaypointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaypointModelCopyWith<$Res> {
  factory $WaypointModelCopyWith(
          WaypointModel value, $Res Function(WaypointModel) then) =
      _$WaypointModelCopyWithImpl<$Res, WaypointModel>;
  @useResult
  $Res call({double latitude, double longitude, int? order});
}

/// @nodoc
class _$WaypointModelCopyWithImpl<$Res, $Val extends WaypointModel>
    implements $WaypointModelCopyWith<$Res> {
  _$WaypointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WaypointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaypointModelImplCopyWith<$Res>
    implements $WaypointModelCopyWith<$Res> {
  factory _$$WaypointModelImplCopyWith(
          _$WaypointModelImpl value, $Res Function(_$WaypointModelImpl) then) =
      __$$WaypointModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude, int? order});
}

/// @nodoc
class __$$WaypointModelImplCopyWithImpl<$Res>
    extends _$WaypointModelCopyWithImpl<$Res, _$WaypointModelImpl>
    implements _$$WaypointModelImplCopyWith<$Res> {
  __$$WaypointModelImplCopyWithImpl(
      _$WaypointModelImpl _value, $Res Function(_$WaypointModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WaypointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? order = freezed,
  }) {
    return _then(_$WaypointModelImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaypointModelImpl extends _WaypointModel {
  const _$WaypointModelImpl(
      {required this.latitude, required this.longitude, this.order})
      : super._();

  factory _$WaypointModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaypointModelImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int? order;

  @override
  String toString() {
    return 'WaypointModel(latitude: $latitude, longitude: $longitude, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaypointModelImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, order);

  /// Create a copy of WaypointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaypointModelImplCopyWith<_$WaypointModelImpl> get copyWith =>
      __$$WaypointModelImplCopyWithImpl<_$WaypointModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaypointModelImplToJson(
      this,
    );
  }
}

abstract class _WaypointModel extends WaypointModel {
  const factory _WaypointModel(
      {required final double latitude,
      required final double longitude,
      final int? order}) = _$WaypointModelImpl;
  const _WaypointModel._() : super._();

  factory _WaypointModel.fromJson(Map<String, dynamic> json) =
      _$WaypointModelImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  int? get order;

  /// Create a copy of WaypointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaypointModelImplCopyWith<_$WaypointModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryRouteModel _$DeliveryRouteModelFromJson(Map<String, dynamic> json) {
  return _DeliveryRouteModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryRouteModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_latitude')
  double get startLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_longitude')
  double get startLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_latitude')
  double get endLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_longitude')
  double get endLongitude => throw _privateConstructorUsedError;
  List<WaypointModel> get waypoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance_km')
  double get distanceKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes => throw _privateConstructorUsedError;
  String? get instructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DeliveryRouteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryRouteModelCopyWith<DeliveryRouteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryRouteModelCopyWith<$Res> {
  factory $DeliveryRouteModelCopyWith(
          DeliveryRouteModel value, $Res Function(DeliveryRouteModel) then) =
      _$DeliveryRouteModelCopyWithImpl<$Res, DeliveryRouteModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'start_latitude') double startLatitude,
      @JsonKey(name: 'start_longitude') double startLongitude,
      @JsonKey(name: 'end_latitude') double endLatitude,
      @JsonKey(name: 'end_longitude') double endLongitude,
      List<WaypointModel> waypoints,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      String? instructions,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$DeliveryRouteModelCopyWithImpl<$Res, $Val extends DeliveryRouteModel>
    implements $DeliveryRouteModelCopyWith<$Res> {
  _$DeliveryRouteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startLatitude = null,
    Object? startLongitude = null,
    Object? endLatitude = null,
    Object? endLongitude = null,
    Object? waypoints = null,
    Object? distanceKm = null,
    Object? durationMinutes = null,
    Object? instructions = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startLatitude: null == startLatitude
          ? _value.startLatitude
          : startLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      startLongitude: null == startLongitude
          ? _value.startLongitude
          : startLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      endLatitude: null == endLatitude
          ? _value.endLatitude
          : endLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      endLongitude: null == endLongitude
          ? _value.endLongitude
          : endLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      waypoints: null == waypoints
          ? _value.waypoints
          : waypoints // ignore: cast_nullable_to_non_nullable
              as List<WaypointModel>,
      distanceKm: null == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryRouteModelImplCopyWith<$Res>
    implements $DeliveryRouteModelCopyWith<$Res> {
  factory _$$DeliveryRouteModelImplCopyWith(_$DeliveryRouteModelImpl value,
          $Res Function(_$DeliveryRouteModelImpl) then) =
      __$$DeliveryRouteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'start_latitude') double startLatitude,
      @JsonKey(name: 'start_longitude') double startLongitude,
      @JsonKey(name: 'end_latitude') double endLatitude,
      @JsonKey(name: 'end_longitude') double endLongitude,
      List<WaypointModel> waypoints,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      String? instructions,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$DeliveryRouteModelImplCopyWithImpl<$Res>
    extends _$DeliveryRouteModelCopyWithImpl<$Res, _$DeliveryRouteModelImpl>
    implements _$$DeliveryRouteModelImplCopyWith<$Res> {
  __$$DeliveryRouteModelImplCopyWithImpl(_$DeliveryRouteModelImpl _value,
      $Res Function(_$DeliveryRouteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startLatitude = null,
    Object? startLongitude = null,
    Object? endLatitude = null,
    Object? endLongitude = null,
    Object? waypoints = null,
    Object? distanceKm = null,
    Object? durationMinutes = null,
    Object? instructions = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$DeliveryRouteModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startLatitude: null == startLatitude
          ? _value.startLatitude
          : startLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      startLongitude: null == startLongitude
          ? _value.startLongitude
          : startLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      endLatitude: null == endLatitude
          ? _value.endLatitude
          : endLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      endLongitude: null == endLongitude
          ? _value.endLongitude
          : endLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      waypoints: null == waypoints
          ? _value._waypoints
          : waypoints // ignore: cast_nullable_to_non_nullable
              as List<WaypointModel>,
      distanceKm: null == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryRouteModelImpl extends _DeliveryRouteModel {
  const _$DeliveryRouteModelImpl(
      {required this.id,
      @JsonKey(name: 'start_latitude') required this.startLatitude,
      @JsonKey(name: 'start_longitude') required this.startLongitude,
      @JsonKey(name: 'end_latitude') required this.endLatitude,
      @JsonKey(name: 'end_longitude') required this.endLongitude,
      required final List<WaypointModel> waypoints,
      @JsonKey(name: 'distance_km') required this.distanceKm,
      @JsonKey(name: 'duration_minutes') required this.durationMinutes,
      this.instructions,
      @JsonKey(name: 'created_at') this.createdAt})
      : _waypoints = waypoints,
        super._();

  factory _$DeliveryRouteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryRouteModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'start_latitude')
  final double startLatitude;
  @override
  @JsonKey(name: 'start_longitude')
  final double startLongitude;
  @override
  @JsonKey(name: 'end_latitude')
  final double endLatitude;
  @override
  @JsonKey(name: 'end_longitude')
  final double endLongitude;
  final List<WaypointModel> _waypoints;
  @override
  List<WaypointModel> get waypoints {
    if (_waypoints is EqualUnmodifiableListView) return _waypoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_waypoints);
  }

  @override
  @JsonKey(name: 'distance_km')
  final double distanceKm;
  @override
  @JsonKey(name: 'duration_minutes')
  final int durationMinutes;
  @override
  final String? instructions;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'DeliveryRouteModel(id: $id, startLatitude: $startLatitude, startLongitude: $startLongitude, endLatitude: $endLatitude, endLongitude: $endLongitude, waypoints: $waypoints, distanceKm: $distanceKm, durationMinutes: $durationMinutes, instructions: $instructions, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryRouteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startLatitude, startLatitude) ||
                other.startLatitude == startLatitude) &&
            (identical(other.startLongitude, startLongitude) ||
                other.startLongitude == startLongitude) &&
            (identical(other.endLatitude, endLatitude) ||
                other.endLatitude == endLatitude) &&
            (identical(other.endLongitude, endLongitude) ||
                other.endLongitude == endLongitude) &&
            const DeepCollectionEquality()
                .equals(other._waypoints, _waypoints) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
      const DeepCollectionEquality().hash(_waypoints),
      distanceKm,
      durationMinutes,
      instructions,
      createdAt);

  /// Create a copy of DeliveryRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryRouteModelImplCopyWith<_$DeliveryRouteModelImpl> get copyWith =>
      __$$DeliveryRouteModelImplCopyWithImpl<_$DeliveryRouteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryRouteModelImplToJson(
      this,
    );
  }
}

abstract class _DeliveryRouteModel extends DeliveryRouteModel {
  const factory _DeliveryRouteModel(
      {required final String id,
      @JsonKey(name: 'start_latitude') required final double startLatitude,
      @JsonKey(name: 'start_longitude') required final double startLongitude,
      @JsonKey(name: 'end_latitude') required final double endLatitude,
      @JsonKey(name: 'end_longitude') required final double endLongitude,
      required final List<WaypointModel> waypoints,
      @JsonKey(name: 'distance_km') required final double distanceKm,
      @JsonKey(name: 'duration_minutes') required final int durationMinutes,
      final String? instructions,
      @JsonKey(name: 'created_at')
      final DateTime? createdAt}) = _$DeliveryRouteModelImpl;
  const _DeliveryRouteModel._() : super._();

  factory _DeliveryRouteModel.fromJson(Map<String, dynamic> json) =
      _$DeliveryRouteModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'start_latitude')
  double get startLatitude;
  @override
  @JsonKey(name: 'start_longitude')
  double get startLongitude;
  @override
  @JsonKey(name: 'end_latitude')
  double get endLatitude;
  @override
  @JsonKey(name: 'end_longitude')
  double get endLongitude;
  @override
  List<WaypointModel> get waypoints;
  @override
  @JsonKey(name: 'distance_km')
  double get distanceKm;
  @override
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes;
  @override
  String? get instructions;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of DeliveryRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryRouteModelImplCopyWith<_$DeliveryRouteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
