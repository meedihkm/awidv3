// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deliverer_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DelivererLocation {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get activeDeliveries => throw _privateConstructorUsedError;
  DateTime get lastUpdate => throw _privateConstructorUsedError;

  /// Create a copy of DelivererLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DelivererLocationCopyWith<DelivererLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DelivererLocationCopyWith<$Res> {
  factory $DelivererLocationCopyWith(
          DelivererLocation value, $Res Function(DelivererLocation) then) =
      _$DelivererLocationCopyWithImpl<$Res, DelivererLocation>;
  @useResult
  $Res call(
      {String id,
      String name,
      double latitude,
      double longitude,
      String status,
      int activeDeliveries,
      DateTime lastUpdate});
}

/// @nodoc
class _$DelivererLocationCopyWithImpl<$Res, $Val extends DelivererLocation>
    implements $DelivererLocationCopyWith<$Res> {
  _$DelivererLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DelivererLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? status = null,
    Object? activeDeliveries = null,
    Object? lastUpdate = null,
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
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      activeDeliveries: null == activeDeliveries
          ? _value.activeDeliveries
          : activeDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DelivererLocationImplCopyWith<$Res>
    implements $DelivererLocationCopyWith<$Res> {
  factory _$$DelivererLocationImplCopyWith(_$DelivererLocationImpl value,
          $Res Function(_$DelivererLocationImpl) then) =
      __$$DelivererLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double latitude,
      double longitude,
      String status,
      int activeDeliveries,
      DateTime lastUpdate});
}

/// @nodoc
class __$$DelivererLocationImplCopyWithImpl<$Res>
    extends _$DelivererLocationCopyWithImpl<$Res, _$DelivererLocationImpl>
    implements _$$DelivererLocationImplCopyWith<$Res> {
  __$$DelivererLocationImplCopyWithImpl(_$DelivererLocationImpl _value,
      $Res Function(_$DelivererLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of DelivererLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? status = null,
    Object? activeDeliveries = null,
    Object? lastUpdate = null,
  }) {
    return _then(_$DelivererLocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      activeDeliveries: null == activeDeliveries
          ? _value.activeDeliveries
          : activeDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DelivererLocationImpl extends _DelivererLocation {
  const _$DelivererLocationImpl(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude,
      required this.status,
      required this.activeDeliveries,
      required this.lastUpdate})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String status;
  @override
  final int activeDeliveries;
  @override
  final DateTime lastUpdate;

  @override
  String toString() {
    return 'DelivererLocation(id: $id, name: $name, latitude: $latitude, longitude: $longitude, status: $status, activeDeliveries: $activeDeliveries, lastUpdate: $lastUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DelivererLocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activeDeliveries, activeDeliveries) ||
                other.activeDeliveries == activeDeliveries) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, latitude, longitude,
      status, activeDeliveries, lastUpdate);

  /// Create a copy of DelivererLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DelivererLocationImplCopyWith<_$DelivererLocationImpl> get copyWith =>
      __$$DelivererLocationImplCopyWithImpl<_$DelivererLocationImpl>(
          this, _$identity);
}

abstract class _DelivererLocation extends DelivererLocation {
  const factory _DelivererLocation(
      {required final String id,
      required final String name,
      required final double latitude,
      required final double longitude,
      required final String status,
      required final int activeDeliveries,
      required final DateTime lastUpdate}) = _$DelivererLocationImpl;
  const _DelivererLocation._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get status;
  @override
  int get activeDeliveries;
  @override
  DateTime get lastUpdate;

  /// Create a copy of DelivererLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DelivererLocationImplCopyWith<_$DelivererLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
