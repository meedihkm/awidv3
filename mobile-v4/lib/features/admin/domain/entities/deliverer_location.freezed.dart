// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deliverer_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DelivererLocation {
  String get id;
  String get name;
  double get latitude;
  double get longitude;
  String get status;
  int get activeDeliveries;
  DateTime get lastUpdate;

  /// Create a copy of DelivererLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DelivererLocationCopyWith<DelivererLocation> get copyWith =>
      _$DelivererLocationCopyWithImpl<DelivererLocation>(
          this as DelivererLocation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DelivererLocation &&
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

  @override
  String toString() {
    return 'DelivererLocation(id: $id, name: $name, latitude: $latitude, longitude: $longitude, status: $status, activeDeliveries: $activeDeliveries, lastUpdate: $lastUpdate)';
  }
}

/// @nodoc
abstract mixin class $DelivererLocationCopyWith<$Res> {
  factory $DelivererLocationCopyWith(
          DelivererLocation value, $Res Function(DelivererLocation) _then) =
      _$DelivererLocationCopyWithImpl;
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
class _$DelivererLocationCopyWithImpl<$Res>
    implements $DelivererLocationCopyWith<$Res> {
  _$DelivererLocationCopyWithImpl(this._self, this._then);

  final DelivererLocation _self;
  final $Res Function(DelivererLocation) _then;

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

/// Adds pattern-matching-related methods to [DelivererLocation].
extension DelivererLocationPatterns on DelivererLocation {
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
    TResult Function(_DelivererLocation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DelivererLocation() when $default != null:
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
    TResult Function(_DelivererLocation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererLocation():
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
    TResult? Function(_DelivererLocation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererLocation() when $default != null:
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
      case _DelivererLocation() when $default != null:
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
      case _DelivererLocation():
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
      case _DelivererLocation() when $default != null:
        return $default(_that.id, _that.name, _that.latitude, _that.longitude,
            _that.status, _that.activeDeliveries, _that.lastUpdate);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DelivererLocation extends DelivererLocation {
  const _DelivererLocation(
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

  /// Create a copy of DelivererLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DelivererLocationCopyWith<_DelivererLocation> get copyWith =>
      __$DelivererLocationCopyWithImpl<_DelivererLocation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DelivererLocation &&
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

  @override
  String toString() {
    return 'DelivererLocation(id: $id, name: $name, latitude: $latitude, longitude: $longitude, status: $status, activeDeliveries: $activeDeliveries, lastUpdate: $lastUpdate)';
  }
}

/// @nodoc
abstract mixin class _$DelivererLocationCopyWith<$Res>
    implements $DelivererLocationCopyWith<$Res> {
  factory _$DelivererLocationCopyWith(
          _DelivererLocation value, $Res Function(_DelivererLocation) _then) =
      __$DelivererLocationCopyWithImpl;
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
class __$DelivererLocationCopyWithImpl<$Res>
    implements _$DelivererLocationCopyWith<$Res> {
  __$DelivererLocationCopyWithImpl(this._self, this._then);

  final _DelivererLocation _self;
  final $Res Function(_DelivererLocation) _then;

  /// Create a copy of DelivererLocation
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
    return _then(_DelivererLocation(
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
