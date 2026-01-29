// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deliverer_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DelivererLocationModel {
  String get id;
  String get name;
  double get latitude;
  double get longitude;
  String get status;
  int get activeDeliveries;
  DateTime get lastUpdate;

  /// Create a copy of DelivererLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DelivererLocationModelCopyWith<DelivererLocationModel> get copyWith =>
      _$DelivererLocationModelCopyWithImpl<DelivererLocationModel>(
          this as DelivererLocationModel, _$identity);

  /// Serializes this DelivererLocationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DelivererLocationModel &&
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

  @override
  String toString() {
    return 'DelivererLocationModel(id: $id, name: $name, latitude: $latitude, longitude: $longitude, status: $status, activeDeliveries: $activeDeliveries, lastUpdate: $lastUpdate)';
  }
}

/// @nodoc
abstract mixin class $DelivererLocationModelCopyWith<$Res> {
  factory $DelivererLocationModelCopyWith(DelivererLocationModel value,
          $Res Function(DelivererLocationModel) _then) =
      _$DelivererLocationModelCopyWithImpl;
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
class _$DelivererLocationModelCopyWithImpl<$Res>
    implements $DelivererLocationModelCopyWith<$Res> {
  _$DelivererLocationModelCopyWithImpl(this._self, this._then);

  final DelivererLocationModel _self;
  final $Res Function(DelivererLocationModel) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      activeDeliveries: null == activeDeliveries
          ? _self.activeDeliveries
          : activeDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _self.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [DelivererLocationModel].
extension DelivererLocationModelPatterns on DelivererLocationModel {
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
    TResult Function(_DelivererLocationModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DelivererLocationModel() when $default != null:
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
    TResult Function(_DelivererLocationModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererLocationModel():
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
    TResult? Function(_DelivererLocationModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererLocationModel() when $default != null:
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
    TResult Function(String id, String name, double latitude, double longitude,
            String status, int activeDeliveries, DateTime lastUpdate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DelivererLocationModel() when $default != null:
        return $default(_that.id, _that.name, _that.latitude, _that.longitude,
            _that.status, _that.activeDeliveries, _that.lastUpdate);
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
    TResult Function(String id, String name, double latitude, double longitude,
            String status, int activeDeliveries, DateTime lastUpdate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererLocationModel():
        return $default(_that.id, _that.name, _that.latitude, _that.longitude,
            _that.status, _that.activeDeliveries, _that.lastUpdate);
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
    TResult? Function(String id, String name, double latitude, double longitude,
            String status, int activeDeliveries, DateTime lastUpdate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererLocationModel() when $default != null:
        return $default(_that.id, _that.name, _that.latitude, _that.longitude,
            _that.status, _that.activeDeliveries, _that.lastUpdate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DelivererLocationModel extends DelivererLocationModel {
  const _DelivererLocationModel(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude,
      required this.status,
      required this.activeDeliveries,
      required this.lastUpdate})
      : super._();
  factory _DelivererLocationModel.fromJson(Map<String, dynamic> json) =>
      _$DelivererLocationModelFromJson(json);

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

  /// Create a copy of DelivererLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DelivererLocationModelCopyWith<_DelivererLocationModel> get copyWith =>
      __$DelivererLocationModelCopyWithImpl<_DelivererLocationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DelivererLocationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DelivererLocationModel &&
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

  @override
  String toString() {
    return 'DelivererLocationModel(id: $id, name: $name, latitude: $latitude, longitude: $longitude, status: $status, activeDeliveries: $activeDeliveries, lastUpdate: $lastUpdate)';
  }
}

/// @nodoc
abstract mixin class _$DelivererLocationModelCopyWith<$Res>
    implements $DelivererLocationModelCopyWith<$Res> {
  factory _$DelivererLocationModelCopyWith(_DelivererLocationModel value,
          $Res Function(_DelivererLocationModel) _then) =
      __$DelivererLocationModelCopyWithImpl;
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
class __$DelivererLocationModelCopyWithImpl<$Res>
    implements _$DelivererLocationModelCopyWith<$Res> {
  __$DelivererLocationModelCopyWithImpl(this._self, this._then);

  final _DelivererLocationModel _self;
  final $Res Function(_DelivererLocationModel) _then;

  /// Create a copy of DelivererLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? status = null,
    Object? activeDeliveries = null,
    Object? lastUpdate = null,
  }) {
    return _then(_DelivererLocationModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      activeDeliveries: null == activeDeliveries
          ? _self.activeDeliveries
          : activeDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _self.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
