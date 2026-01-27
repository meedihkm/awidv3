// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deliverer_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DelivererLocationModel _$DelivererLocationModelFromJson(
    Map<String, dynamic> json) {
  return _DelivererLocationModel.fromJson(json);
}

/// @nodoc
mixin _$DelivererLocationModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get activeDeliveries => throw _privateConstructorUsedError;
  DateTime get lastUpdate => throw _privateConstructorUsedError;

  /// Serializes this DelivererLocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DelivererLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DelivererLocationModelCopyWith<DelivererLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DelivererLocationModelCopyWith<$Res> {
  factory $DelivererLocationModelCopyWith(DelivererLocationModel value,
          $Res Function(DelivererLocationModel) then) =
      _$DelivererLocationModelCopyWithImpl<$Res, DelivererLocationModel>;
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
class _$DelivererLocationModelCopyWithImpl<$Res,
        $Val extends DelivererLocationModel>
    implements $DelivererLocationModelCopyWith<$Res> {
  _$DelivererLocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DelivererLocationModel
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
abstract class _$$DelivererLocationModelImplCopyWith<$Res>
    implements $DelivererLocationModelCopyWith<$Res> {
  factory _$$DelivererLocationModelImplCopyWith(
          _$DelivererLocationModelImpl value,
          $Res Function(_$DelivererLocationModelImpl) then) =
      __$$DelivererLocationModelImplCopyWithImpl<$Res>;
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
class __$$DelivererLocationModelImplCopyWithImpl<$Res>
    extends _$DelivererLocationModelCopyWithImpl<$Res,
        _$DelivererLocationModelImpl>
    implements _$$DelivererLocationModelImplCopyWith<$Res> {
  __$$DelivererLocationModelImplCopyWithImpl(
      _$DelivererLocationModelImpl _value,
      $Res Function(_$DelivererLocationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DelivererLocationModel
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
    return _then(_$DelivererLocationModelImpl(
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
@JsonSerializable()
class _$DelivererLocationModelImpl extends _DelivererLocationModel {
  const _$DelivererLocationModelImpl(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude,
      required this.status,
      required this.activeDeliveries,
      required this.lastUpdate})
      : super._();

  factory _$DelivererLocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DelivererLocationModelImplFromJson(json);

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
    return 'DelivererLocationModel(id: $id, name: $name, latitude: $latitude, longitude: $longitude, status: $status, activeDeliveries: $activeDeliveries, lastUpdate: $lastUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DelivererLocationModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, latitude, longitude,
      status, activeDeliveries, lastUpdate);

  /// Create a copy of DelivererLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DelivererLocationModelImplCopyWith<_$DelivererLocationModelImpl>
      get copyWith => __$$DelivererLocationModelImplCopyWithImpl<
          _$DelivererLocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DelivererLocationModelImplToJson(
      this,
    );
  }
}

abstract class _DelivererLocationModel extends DelivererLocationModel {
  const factory _DelivererLocationModel(
      {required final String id,
      required final String name,
      required final double latitude,
      required final double longitude,
      required final String status,
      required final int activeDeliveries,
      required final DateTime lastUpdate}) = _$DelivererLocationModelImpl;
  const _DelivererLocationModel._() : super._();

  factory _DelivererLocationModel.fromJson(Map<String, dynamic> json) =
      _$DelivererLocationModelImpl.fromJson;

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

  /// Create a copy of DelivererLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DelivererLocationModelImplCopyWith<_$DelivererLocationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
