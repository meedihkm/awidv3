// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WaypointModel {
  double get latitude;
  double get longitude;
  int? get order;

  /// Create a copy of WaypointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WaypointModelCopyWith<WaypointModel> get copyWith =>
      _$WaypointModelCopyWithImpl<WaypointModel>(
          this as WaypointModel, _$identity);

  /// Serializes this WaypointModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WaypointModel &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, order);

  @override
  String toString() {
    return 'WaypointModel(latitude: $latitude, longitude: $longitude, order: $order)';
  }
}

/// @nodoc
abstract mixin class $WaypointModelCopyWith<$Res> {
  factory $WaypointModelCopyWith(
          WaypointModel value, $Res Function(WaypointModel) _then) =
      _$WaypointModelCopyWithImpl;
  @useResult
  $Res call({double latitude, double longitude, int? order});
}

/// @nodoc
class _$WaypointModelCopyWithImpl<$Res>
    implements $WaypointModelCopyWith<$Res> {
  _$WaypointModelCopyWithImpl(this._self, this._then);

  final WaypointModel _self;
  final $Res Function(WaypointModel) _then;

  /// Create a copy of WaypointModel
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

/// Adds pattern-matching-related methods to [WaypointModel].
extension WaypointModelPatterns on WaypointModel {
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
    TResult Function(_WaypointModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WaypointModel() when $default != null:
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
    TResult Function(_WaypointModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WaypointModel():
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
    TResult? Function(_WaypointModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WaypointModel() when $default != null:
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
      case _WaypointModel() when $default != null:
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
      case _WaypointModel():
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
      case _WaypointModel() when $default != null:
        return $default(_that.latitude, _that.longitude, _that.order);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WaypointModel extends WaypointModel {
  const _WaypointModel(
      {required this.latitude, required this.longitude, this.order})
      : super._();
  factory _WaypointModel.fromJson(Map<String, dynamic> json) =>
      _$WaypointModelFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int? order;

  /// Create a copy of WaypointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WaypointModelCopyWith<_WaypointModel> get copyWith =>
      __$WaypointModelCopyWithImpl<_WaypointModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WaypointModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WaypointModel &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, order);

  @override
  String toString() {
    return 'WaypointModel(latitude: $latitude, longitude: $longitude, order: $order)';
  }
}

/// @nodoc
abstract mixin class _$WaypointModelCopyWith<$Res>
    implements $WaypointModelCopyWith<$Res> {
  factory _$WaypointModelCopyWith(
          _WaypointModel value, $Res Function(_WaypointModel) _then) =
      __$WaypointModelCopyWithImpl;
  @override
  @useResult
  $Res call({double latitude, double longitude, int? order});
}

/// @nodoc
class __$WaypointModelCopyWithImpl<$Res>
    implements _$WaypointModelCopyWith<$Res> {
  __$WaypointModelCopyWithImpl(this._self, this._then);

  final _WaypointModel _self;
  final $Res Function(_WaypointModel) _then;

  /// Create a copy of WaypointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? order = freezed,
  }) {
    return _then(_WaypointModel(
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
mixin _$DeliveryRouteModel {
  String get id;
  @JsonKey(name: 'start_latitude')
  double get startLatitude;
  @JsonKey(name: 'start_longitude')
  double get startLongitude;
  @JsonKey(name: 'end_latitude')
  double get endLatitude;
  @JsonKey(name: 'end_longitude')
  double get endLongitude;
  List<WaypointModel> get waypoints;
  @JsonKey(name: 'distance_km')
  double get distanceKm;
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes;
  String? get instructions;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of DeliveryRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeliveryRouteModelCopyWith<DeliveryRouteModel> get copyWith =>
      _$DeliveryRouteModelCopyWithImpl<DeliveryRouteModel>(
          this as DeliveryRouteModel, _$identity);

  /// Serializes this DeliveryRouteModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeliveryRouteModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'DeliveryRouteModel(id: $id, startLatitude: $startLatitude, startLongitude: $startLongitude, endLatitude: $endLatitude, endLongitude: $endLongitude, waypoints: $waypoints, distanceKm: $distanceKm, durationMinutes: $durationMinutes, instructions: $instructions, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $DeliveryRouteModelCopyWith<$Res> {
  factory $DeliveryRouteModelCopyWith(
          DeliveryRouteModel value, $Res Function(DeliveryRouteModel) _then) =
      _$DeliveryRouteModelCopyWithImpl;
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
class _$DeliveryRouteModelCopyWithImpl<$Res>
    implements $DeliveryRouteModelCopyWith<$Res> {
  _$DeliveryRouteModelCopyWithImpl(this._self, this._then);

  final DeliveryRouteModel _self;
  final $Res Function(DeliveryRouteModel) _then;

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
              as List<WaypointModel>,
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

/// Adds pattern-matching-related methods to [DeliveryRouteModel].
extension DeliveryRouteModelPatterns on DeliveryRouteModel {
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
    TResult Function(_DeliveryRouteModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryRouteModel() when $default != null:
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
    TResult Function(_DeliveryRouteModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryRouteModel():
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
    TResult? Function(_DeliveryRouteModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryRouteModel() when $default != null:
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
            @JsonKey(name: 'start_latitude') double startLatitude,
            @JsonKey(name: 'start_longitude') double startLongitude,
            @JsonKey(name: 'end_latitude') double endLatitude,
            @JsonKey(name: 'end_longitude') double endLongitude,
            List<WaypointModel> waypoints,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'duration_minutes') int durationMinutes,
            String? instructions,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryRouteModel() when $default != null:
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
            @JsonKey(name: 'start_latitude') double startLatitude,
            @JsonKey(name: 'start_longitude') double startLongitude,
            @JsonKey(name: 'end_latitude') double endLatitude,
            @JsonKey(name: 'end_longitude') double endLongitude,
            List<WaypointModel> waypoints,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'duration_minutes') int durationMinutes,
            String? instructions,
            @JsonKey(name: 'created_at') DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryRouteModel():
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
            @JsonKey(name: 'start_latitude') double startLatitude,
            @JsonKey(name: 'start_longitude') double startLongitude,
            @JsonKey(name: 'end_latitude') double endLatitude,
            @JsonKey(name: 'end_longitude') double endLongitude,
            List<WaypointModel> waypoints,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'duration_minutes') int durationMinutes,
            String? instructions,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryRouteModel() when $default != null:
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
@JsonSerializable()
class _DeliveryRouteModel extends DeliveryRouteModel {
  const _DeliveryRouteModel(
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
  factory _DeliveryRouteModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryRouteModelFromJson(json);

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

  /// Create a copy of DeliveryRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeliveryRouteModelCopyWith<_DeliveryRouteModel> get copyWith =>
      __$DeliveryRouteModelCopyWithImpl<_DeliveryRouteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeliveryRouteModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeliveryRouteModel &&
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

  @override
  String toString() {
    return 'DeliveryRouteModel(id: $id, startLatitude: $startLatitude, startLongitude: $startLongitude, endLatitude: $endLatitude, endLongitude: $endLongitude, waypoints: $waypoints, distanceKm: $distanceKm, durationMinutes: $durationMinutes, instructions: $instructions, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$DeliveryRouteModelCopyWith<$Res>
    implements $DeliveryRouteModelCopyWith<$Res> {
  factory _$DeliveryRouteModelCopyWith(
          _DeliveryRouteModel value, $Res Function(_DeliveryRouteModel) _then) =
      __$DeliveryRouteModelCopyWithImpl;
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
class __$DeliveryRouteModelCopyWithImpl<$Res>
    implements _$DeliveryRouteModelCopyWith<$Res> {
  __$DeliveryRouteModelCopyWithImpl(this._self, this._then);

  final _DeliveryRouteModel _self;
  final $Res Function(_DeliveryRouteModel) _then;

  /// Create a copy of DeliveryRouteModel
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
    return _then(_DeliveryRouteModel(
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
              as List<WaypointModel>,
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
