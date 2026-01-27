// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Waypoint {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;

  /// Create a copy of Waypoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaypointCopyWith<Waypoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaypointCopyWith<$Res> {
  factory $WaypointCopyWith(Waypoint value, $Res Function(Waypoint) then) =
      _$WaypointCopyWithImpl<$Res, Waypoint>;
  @useResult
  $Res call({double latitude, double longitude, int? order});
}

/// @nodoc
class _$WaypointCopyWithImpl<$Res, $Val extends Waypoint>
    implements $WaypointCopyWith<$Res> {
  _$WaypointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Waypoint
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
abstract class _$$WaypointImplCopyWith<$Res>
    implements $WaypointCopyWith<$Res> {
  factory _$$WaypointImplCopyWith(
          _$WaypointImpl value, $Res Function(_$WaypointImpl) then) =
      __$$WaypointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude, int? order});
}

/// @nodoc
class __$$WaypointImplCopyWithImpl<$Res>
    extends _$WaypointCopyWithImpl<$Res, _$WaypointImpl>
    implements _$$WaypointImplCopyWith<$Res> {
  __$$WaypointImplCopyWithImpl(
      _$WaypointImpl _value, $Res Function(_$WaypointImpl) _then)
      : super(_value, _then);

  /// Create a copy of Waypoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? order = freezed,
  }) {
    return _then(_$WaypointImpl(
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

class _$WaypointImpl implements _Waypoint {
  const _$WaypointImpl(
      {required this.latitude, required this.longitude, this.order});

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int? order;

  @override
  String toString() {
    return 'Waypoint(latitude: $latitude, longitude: $longitude, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaypointImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, order);

  /// Create a copy of Waypoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaypointImplCopyWith<_$WaypointImpl> get copyWith =>
      __$$WaypointImplCopyWithImpl<_$WaypointImpl>(this, _$identity);
}

abstract class _Waypoint implements Waypoint {
  const factory _Waypoint(
      {required final double latitude,
      required final double longitude,
      final int? order}) = _$WaypointImpl;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  int? get order;

  /// Create a copy of Waypoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaypointImplCopyWith<_$WaypointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeliveryRoute {
  String get id => throw _privateConstructorUsedError;
  double get startLatitude => throw _privateConstructorUsedError;
  double get startLongitude => throw _privateConstructorUsedError;
  double get endLatitude => throw _privateConstructorUsedError;
  double get endLongitude => throw _privateConstructorUsedError;
  List<Waypoint> get waypoints => throw _privateConstructorUsedError;
  double get distanceKm => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  String? get instructions => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryRouteCopyWith<DeliveryRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryRouteCopyWith<$Res> {
  factory $DeliveryRouteCopyWith(
          DeliveryRoute value, $Res Function(DeliveryRoute) then) =
      _$DeliveryRouteCopyWithImpl<$Res, DeliveryRoute>;
  @useResult
  $Res call(
      {String id,
      double startLatitude,
      double startLongitude,
      double endLatitude,
      double endLongitude,
      List<Waypoint> waypoints,
      double distanceKm,
      int durationMinutes,
      String? instructions,
      DateTime? createdAt});
}

/// @nodoc
class _$DeliveryRouteCopyWithImpl<$Res, $Val extends DeliveryRoute>
    implements $DeliveryRouteCopyWith<$Res> {
  _$DeliveryRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryRoute
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
              as List<Waypoint>,
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
abstract class _$$DeliveryRouteImplCopyWith<$Res>
    implements $DeliveryRouteCopyWith<$Res> {
  factory _$$DeliveryRouteImplCopyWith(
          _$DeliveryRouteImpl value, $Res Function(_$DeliveryRouteImpl) then) =
      __$$DeliveryRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double startLatitude,
      double startLongitude,
      double endLatitude,
      double endLongitude,
      List<Waypoint> waypoints,
      double distanceKm,
      int durationMinutes,
      String? instructions,
      DateTime? createdAt});
}

/// @nodoc
class __$$DeliveryRouteImplCopyWithImpl<$Res>
    extends _$DeliveryRouteCopyWithImpl<$Res, _$DeliveryRouteImpl>
    implements _$$DeliveryRouteImplCopyWith<$Res> {
  __$$DeliveryRouteImplCopyWithImpl(
      _$DeliveryRouteImpl _value, $Res Function(_$DeliveryRouteImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryRoute
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
    return _then(_$DeliveryRouteImpl(
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
              as List<Waypoint>,
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

class _$DeliveryRouteImpl extends _DeliveryRoute {
  const _$DeliveryRouteImpl(
      {required this.id,
      required this.startLatitude,
      required this.startLongitude,
      required this.endLatitude,
      required this.endLongitude,
      required final List<Waypoint> waypoints,
      required this.distanceKm,
      required this.durationMinutes,
      this.instructions,
      this.createdAt})
      : _waypoints = waypoints,
        super._();

  @override
  final String id;
  @override
  final double startLatitude;
  @override
  final double startLongitude;
  @override
  final double endLatitude;
  @override
  final double endLongitude;
  final List<Waypoint> _waypoints;
  @override
  List<Waypoint> get waypoints {
    if (_waypoints is EqualUnmodifiableListView) return _waypoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_waypoints);
  }

  @override
  final double distanceKm;
  @override
  final int durationMinutes;
  @override
  final String? instructions;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'DeliveryRoute(id: $id, startLatitude: $startLatitude, startLongitude: $startLongitude, endLatitude: $endLatitude, endLongitude: $endLongitude, waypoints: $waypoints, distanceKm: $distanceKm, durationMinutes: $durationMinutes, instructions: $instructions, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryRouteImpl &&
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

  /// Create a copy of DeliveryRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryRouteImplCopyWith<_$DeliveryRouteImpl> get copyWith =>
      __$$DeliveryRouteImplCopyWithImpl<_$DeliveryRouteImpl>(this, _$identity);
}

abstract class _DeliveryRoute extends DeliveryRoute {
  const factory _DeliveryRoute(
      {required final String id,
      required final double startLatitude,
      required final double startLongitude,
      required final double endLatitude,
      required final double endLongitude,
      required final List<Waypoint> waypoints,
      required final double distanceKm,
      required final int durationMinutes,
      final String? instructions,
      final DateTime? createdAt}) = _$DeliveryRouteImpl;
  const _DeliveryRoute._() : super._();

  @override
  String get id;
  @override
  double get startLatitude;
  @override
  double get startLongitude;
  @override
  double get endLatitude;
  @override
  double get endLongitude;
  @override
  List<Waypoint> get waypoints;
  @override
  double get distanceKm;
  @override
  int get durationMinutes;
  @override
  String? get instructions;
  @override
  DateTime? get createdAt;

  /// Create a copy of DeliveryRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryRouteImplCopyWith<_$DeliveryRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
