// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Waypoint {
  double get latitude;
  double get longitude;
  int? get order;

  /// Create a copy of Waypoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WaypointCopyWith<Waypoint> get copyWith =>
      _$WaypointCopyWithImpl<Waypoint>(this as Waypoint, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Waypoint &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, order);

  @override
  String toString() {
    return 'Waypoint(latitude: $latitude, longitude: $longitude, order: $order)';
  }
}

/// @nodoc
abstract mixin class $WaypointCopyWith<$Res> {
  factory $WaypointCopyWith(Waypoint value, $Res Function(Waypoint) _then) =
      _$WaypointCopyWithImpl;
  @useResult
  $Res call({double latitude, double longitude, int? order});
}

/// @nodoc
class _$WaypointCopyWithImpl<$Res> implements $WaypointCopyWith<$Res> {
  _$WaypointCopyWithImpl(this._self, this._then);

  final Waypoint _self;
  final $Res Function(Waypoint) _then;

  /// Create a copy of Waypoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? order = freezed,
  }) {
    return _then(_self.copyWith(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Waypoint].
extension WaypointPatterns on Waypoint {
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
    TResult Function(_Waypoint value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Waypoint() when $default != null:
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
    TResult Function(_Waypoint value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Waypoint():
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
    TResult? Function(_Waypoint value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Waypoint() when $default != null:
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
    TResult Function(double latitude, double longitude, int? order)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Waypoint() when $default != null:
        return $default(_that.latitude, _that.longitude, _that.order);
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
    TResult Function(double latitude, double longitude, int? order) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Waypoint():
        return $default(_that.latitude, _that.longitude, _that.order);
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
    TResult? Function(double latitude, double longitude, int? order)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Waypoint() when $default != null:
        return $default(_that.latitude, _that.longitude, _that.order);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Waypoint implements Waypoint {
  const _Waypoint(
      {required this.latitude, required this.longitude, this.order});

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int? order;

  /// Create a copy of Waypoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WaypointCopyWith<_Waypoint> get copyWith =>
      __$WaypointCopyWithImpl<_Waypoint>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Waypoint &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, order);

  @override
  String toString() {
    return 'Waypoint(latitude: $latitude, longitude: $longitude, order: $order)';
  }
}

/// @nodoc
abstract mixin class _$WaypointCopyWith<$Res>
    implements $WaypointCopyWith<$Res> {
  factory _$WaypointCopyWith(_Waypoint value, $Res Function(_Waypoint) _then) =
      __$WaypointCopyWithImpl;
  @override
  @useResult
  $Res call({double latitude, double longitude, int? order});
}

/// @nodoc
class __$WaypointCopyWithImpl<$Res> implements _$WaypointCopyWith<$Res> {
  __$WaypointCopyWithImpl(this._self, this._then);

  final _Waypoint _self;
  final $Res Function(_Waypoint) _then;

  /// Create a copy of Waypoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? order = freezed,
  }) {
    return _then(_Waypoint(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$DeliveryRoute {
  String get id;
  double get startLatitude;
  double get startLongitude;
  double get endLatitude;
  double get endLongitude;
  List<Waypoint> get waypoints;
  double get distanceKm;
  int get durationMinutes;
  String? get instructions;
  DateTime? get createdAt;

  /// Create a copy of DeliveryRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeliveryRouteCopyWith<DeliveryRoute> get copyWith =>
      _$DeliveryRouteCopyWithImpl<DeliveryRoute>(
          this as DeliveryRoute, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeliveryRoute &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startLatitude, startLatitude) ||
                other.startLatitude == startLatitude) &&
            (identical(other.startLongitude, startLongitude) ||
                other.startLongitude == startLongitude) &&
            (identical(other.endLatitude, endLatitude) ||
                other.endLatitude == endLatitude) &&
            (identical(other.endLongitude, endLongitude) ||
                other.endLongitude == endLongitude) &&
            const DeepCollectionEquality().equals(other.waypoints, waypoints) &&
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
      const DeepCollectionEquality().hash(waypoints),
      distanceKm,
      durationMinutes,
      instructions,
      createdAt);

  @override
  String toString() {
    return 'DeliveryRoute(id: $id, startLatitude: $startLatitude, startLongitude: $startLongitude, endLatitude: $endLatitude, endLongitude: $endLongitude, waypoints: $waypoints, distanceKm: $distanceKm, durationMinutes: $durationMinutes, instructions: $instructions, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $DeliveryRouteCopyWith<$Res> {
  factory $DeliveryRouteCopyWith(
          DeliveryRoute value, $Res Function(DeliveryRoute) _then) =
      _$DeliveryRouteCopyWithImpl;
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
class _$DeliveryRouteCopyWithImpl<$Res>
    implements $DeliveryRouteCopyWith<$Res> {
  _$DeliveryRouteCopyWithImpl(this._self, this._then);

  final DeliveryRoute _self;
  final $Res Function(DeliveryRoute) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startLatitude: null == startLatitude
          ? _self.startLatitude
          : startLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      startLongitude: null == startLongitude
          ? _self.startLongitude
          : startLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      endLatitude: null == endLatitude
          ? _self.endLatitude
          : endLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      endLongitude: null == endLongitude
          ? _self.endLongitude
          : endLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      waypoints: null == waypoints
          ? _self.waypoints
          : waypoints // ignore: cast_nullable_to_non_nullable
              as List<Waypoint>,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      durationMinutes: null == durationMinutes
          ? _self.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      instructions: freezed == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeliveryRoute].
extension DeliveryRoutePatterns on DeliveryRoute {
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
    TResult Function(_DeliveryRoute value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryRoute() when $default != null:
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
    TResult Function(_DeliveryRoute value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryRoute():
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
    TResult? Function(_DeliveryRoute value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryRoute() when $default != null:
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
            double startLatitude,
            double startLongitude,
            double endLatitude,
            double endLongitude,
            List<Waypoint> waypoints,
            double distanceKm,
            int durationMinutes,
            String? instructions,
            DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryRoute() when $default != null:
        return $default(
            _that.id,
            _that.startLatitude,
            _that.startLongitude,
            _that.endLatitude,
            _that.endLongitude,
            _that.waypoints,
            _that.distanceKm,
            _that.durationMinutes,
            _that.instructions,
            _that.createdAt);
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
            double startLatitude,
            double startLongitude,
            double endLatitude,
            double endLongitude,
            List<Waypoint> waypoints,
            double distanceKm,
            int durationMinutes,
            String? instructions,
            DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryRoute():
        return $default(
            _that.id,
            _that.startLatitude,
            _that.startLongitude,
            _that.endLatitude,
            _that.endLongitude,
            _that.waypoints,
            _that.distanceKm,
            _that.durationMinutes,
            _that.instructions,
            _that.createdAt);
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
            double startLatitude,
            double startLongitude,
            double endLatitude,
            double endLongitude,
            List<Waypoint> waypoints,
            double distanceKm,
            int durationMinutes,
            String? instructions,
            DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryRoute() when $default != null:
        return $default(
            _that.id,
            _that.startLatitude,
            _that.startLongitude,
            _that.endLatitude,
            _that.endLongitude,
            _that.waypoints,
            _that.distanceKm,
            _that.durationMinutes,
            _that.instructions,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DeliveryRoute extends DeliveryRoute {
  const _DeliveryRoute(
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

  /// Create a copy of DeliveryRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeliveryRouteCopyWith<_DeliveryRoute> get copyWith =>
      __$DeliveryRouteCopyWithImpl<_DeliveryRoute>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeliveryRoute &&
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

  @override
  String toString() {
    return 'DeliveryRoute(id: $id, startLatitude: $startLatitude, startLongitude: $startLongitude, endLatitude: $endLatitude, endLongitude: $endLongitude, waypoints: $waypoints, distanceKm: $distanceKm, durationMinutes: $durationMinutes, instructions: $instructions, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$DeliveryRouteCopyWith<$Res>
    implements $DeliveryRouteCopyWith<$Res> {
  factory _$DeliveryRouteCopyWith(
          _DeliveryRoute value, $Res Function(_DeliveryRoute) _then) =
      __$DeliveryRouteCopyWithImpl;
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
class __$DeliveryRouteCopyWithImpl<$Res>
    implements _$DeliveryRouteCopyWith<$Res> {
  __$DeliveryRouteCopyWithImpl(this._self, this._then);

  final _DeliveryRoute _self;
  final $Res Function(_DeliveryRoute) _then;

  /// Create a copy of DeliveryRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_DeliveryRoute(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startLatitude: null == startLatitude
          ? _self.startLatitude
          : startLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      startLongitude: null == startLongitude
          ? _self.startLongitude
          : startLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      endLatitude: null == endLatitude
          ? _self.endLatitude
          : endLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      endLongitude: null == endLongitude
          ? _self.endLongitude
          : endLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      waypoints: null == waypoints
          ? _self._waypoints
          : waypoints // ignore: cast_nullable_to_non_nullable
              as List<Waypoint>,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      durationMinutes: null == durationMinutes
          ? _self.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      instructions: freezed == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
