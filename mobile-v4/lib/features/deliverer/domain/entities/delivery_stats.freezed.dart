// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryStats {
  int get totalDeliveries;
  int get completedToday;
  int get pendingDeliveries;
  int get inProgressDeliveries;
  double get totalEarnings;
  double get todayEarnings;
  double get averageRating;
  int get totalRatings;
  double? get averageDeliveryTime;
  int? get onTimeDeliveries;
  int? get lateDeliveries;

  /// Create a copy of DeliveryStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeliveryStatsCopyWith<DeliveryStats> get copyWith =>
      _$DeliveryStatsCopyWithImpl<DeliveryStats>(
          this as DeliveryStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeliveryStats &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.completedToday, completedToday) ||
                other.completedToday == completedToday) &&
            (identical(other.pendingDeliveries, pendingDeliveries) ||
                other.pendingDeliveries == pendingDeliveries) &&
            (identical(other.inProgressDeliveries, inProgressDeliveries) ||
                other.inProgressDeliveries == inProgressDeliveries) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.todayEarnings, todayEarnings) ||
                other.todayEarnings == todayEarnings) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalRatings, totalRatings) ||
                other.totalRatings == totalRatings) &&
            (identical(other.averageDeliveryTime, averageDeliveryTime) ||
                other.averageDeliveryTime == averageDeliveryTime) &&
            (identical(other.onTimeDeliveries, onTimeDeliveries) ||
                other.onTimeDeliveries == onTimeDeliveries) &&
            (identical(other.lateDeliveries, lateDeliveries) ||
                other.lateDeliveries == lateDeliveries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalDeliveries,
      completedToday,
      pendingDeliveries,
      inProgressDeliveries,
      totalEarnings,
      todayEarnings,
      averageRating,
      totalRatings,
      averageDeliveryTime,
      onTimeDeliveries,
      lateDeliveries);

  @override
  String toString() {
    return 'DeliveryStats(totalDeliveries: $totalDeliveries, completedToday: $completedToday, pendingDeliveries: $pendingDeliveries, inProgressDeliveries: $inProgressDeliveries, totalEarnings: $totalEarnings, todayEarnings: $todayEarnings, averageRating: $averageRating, totalRatings: $totalRatings, averageDeliveryTime: $averageDeliveryTime, onTimeDeliveries: $onTimeDeliveries, lateDeliveries: $lateDeliveries)';
  }
}

/// @nodoc
abstract mixin class $DeliveryStatsCopyWith<$Res> {
  factory $DeliveryStatsCopyWith(
          DeliveryStats value, $Res Function(DeliveryStats) _then) =
      _$DeliveryStatsCopyWithImpl;
  @useResult
  $Res call(
      {int totalDeliveries,
      int completedToday,
      int pendingDeliveries,
      int inProgressDeliveries,
      double totalEarnings,
      double todayEarnings,
      double averageRating,
      int totalRatings,
      double? averageDeliveryTime,
      int? onTimeDeliveries,
      int? lateDeliveries});
}

/// @nodoc
class _$DeliveryStatsCopyWithImpl<$Res>
    implements $DeliveryStatsCopyWith<$Res> {
  _$DeliveryStatsCopyWithImpl(this._self, this._then);

  final DeliveryStats _self;
  final $Res Function(DeliveryStats) _then;

  /// Create a copy of DeliveryStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDeliveries = null,
    Object? completedToday = null,
    Object? pendingDeliveries = null,
    Object? inProgressDeliveries = null,
    Object? totalEarnings = null,
    Object? todayEarnings = null,
    Object? averageRating = null,
    Object? totalRatings = null,
    Object? averageDeliveryTime = freezed,
    Object? onTimeDeliveries = freezed,
    Object? lateDeliveries = freezed,
  }) {
    return _then(_self.copyWith(
      totalDeliveries: null == totalDeliveries
          ? _self.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      completedToday: null == completedToday
          ? _self.completedToday
          : completedToday // ignore: cast_nullable_to_non_nullable
              as int,
      pendingDeliveries: null == pendingDeliveries
          ? _self.pendingDeliveries
          : pendingDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      inProgressDeliveries: null == inProgressDeliveries
          ? _self.inProgressDeliveries
          : inProgressDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      totalEarnings: null == totalEarnings
          ? _self.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      todayEarnings: null == todayEarnings
          ? _self.todayEarnings
          : todayEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalRatings: null == totalRatings
          ? _self.totalRatings
          : totalRatings // ignore: cast_nullable_to_non_nullable
              as int,
      averageDeliveryTime: freezed == averageDeliveryTime
          ? _self.averageDeliveryTime
          : averageDeliveryTime // ignore: cast_nullable_to_non_nullable
              as double?,
      onTimeDeliveries: freezed == onTimeDeliveries
          ? _self.onTimeDeliveries
          : onTimeDeliveries // ignore: cast_nullable_to_non_nullable
              as int?,
      lateDeliveries: freezed == lateDeliveries
          ? _self.lateDeliveries
          : lateDeliveries // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeliveryStats].
extension DeliveryStatsPatterns on DeliveryStats {
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
    TResult Function(_DeliveryStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryStats() when $default != null:
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
    TResult Function(_DeliveryStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryStats():
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
    TResult? Function(_DeliveryStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryStats() when $default != null:
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
            int totalDeliveries,
            int completedToday,
            int pendingDeliveries,
            int inProgressDeliveries,
            double totalEarnings,
            double todayEarnings,
            double averageRating,
            int totalRatings,
            double? averageDeliveryTime,
            int? onTimeDeliveries,
            int? lateDeliveries)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryStats() when $default != null:
        return $default(
            _that.totalDeliveries,
            _that.completedToday,
            _that.pendingDeliveries,
            _that.inProgressDeliveries,
            _that.totalEarnings,
            _that.todayEarnings,
            _that.averageRating,
            _that.totalRatings,
            _that.averageDeliveryTime,
            _that.onTimeDeliveries,
            _that.lateDeliveries);
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
            int totalDeliveries,
            int completedToday,
            int pendingDeliveries,
            int inProgressDeliveries,
            double totalEarnings,
            double todayEarnings,
            double averageRating,
            int totalRatings,
            double? averageDeliveryTime,
            int? onTimeDeliveries,
            int? lateDeliveries)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryStats():
        return $default(
            _that.totalDeliveries,
            _that.completedToday,
            _that.pendingDeliveries,
            _that.inProgressDeliveries,
            _that.totalEarnings,
            _that.todayEarnings,
            _that.averageRating,
            _that.totalRatings,
            _that.averageDeliveryTime,
            _that.onTimeDeliveries,
            _that.lateDeliveries);
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
            int totalDeliveries,
            int completedToday,
            int pendingDeliveries,
            int inProgressDeliveries,
            double totalEarnings,
            double todayEarnings,
            double averageRating,
            int totalRatings,
            double? averageDeliveryTime,
            int? onTimeDeliveries,
            int? lateDeliveries)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryStats() when $default != null:
        return $default(
            _that.totalDeliveries,
            _that.completedToday,
            _that.pendingDeliveries,
            _that.inProgressDeliveries,
            _that.totalEarnings,
            _that.todayEarnings,
            _that.averageRating,
            _that.totalRatings,
            _that.averageDeliveryTime,
            _that.onTimeDeliveries,
            _that.lateDeliveries);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DeliveryStats extends DeliveryStats {
  const _DeliveryStats(
      {required this.totalDeliveries,
      required this.completedToday,
      required this.pendingDeliveries,
      required this.inProgressDeliveries,
      required this.totalEarnings,
      required this.todayEarnings,
      required this.averageRating,
      required this.totalRatings,
      this.averageDeliveryTime,
      this.onTimeDeliveries,
      this.lateDeliveries})
      : super._();

  @override
  final int totalDeliveries;
  @override
  final int completedToday;
  @override
  final int pendingDeliveries;
  @override
  final int inProgressDeliveries;
  @override
  final double totalEarnings;
  @override
  final double todayEarnings;
  @override
  final double averageRating;
  @override
  final int totalRatings;
  @override
  final double? averageDeliveryTime;
  @override
  final int? onTimeDeliveries;
  @override
  final int? lateDeliveries;

  /// Create a copy of DeliveryStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeliveryStatsCopyWith<_DeliveryStats> get copyWith =>
      __$DeliveryStatsCopyWithImpl<_DeliveryStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeliveryStats &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.completedToday, completedToday) ||
                other.completedToday == completedToday) &&
            (identical(other.pendingDeliveries, pendingDeliveries) ||
                other.pendingDeliveries == pendingDeliveries) &&
            (identical(other.inProgressDeliveries, inProgressDeliveries) ||
                other.inProgressDeliveries == inProgressDeliveries) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.todayEarnings, todayEarnings) ||
                other.todayEarnings == todayEarnings) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalRatings, totalRatings) ||
                other.totalRatings == totalRatings) &&
            (identical(other.averageDeliveryTime, averageDeliveryTime) ||
                other.averageDeliveryTime == averageDeliveryTime) &&
            (identical(other.onTimeDeliveries, onTimeDeliveries) ||
                other.onTimeDeliveries == onTimeDeliveries) &&
            (identical(other.lateDeliveries, lateDeliveries) ||
                other.lateDeliveries == lateDeliveries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalDeliveries,
      completedToday,
      pendingDeliveries,
      inProgressDeliveries,
      totalEarnings,
      todayEarnings,
      averageRating,
      totalRatings,
      averageDeliveryTime,
      onTimeDeliveries,
      lateDeliveries);

  @override
  String toString() {
    return 'DeliveryStats(totalDeliveries: $totalDeliveries, completedToday: $completedToday, pendingDeliveries: $pendingDeliveries, inProgressDeliveries: $inProgressDeliveries, totalEarnings: $totalEarnings, todayEarnings: $todayEarnings, averageRating: $averageRating, totalRatings: $totalRatings, averageDeliveryTime: $averageDeliveryTime, onTimeDeliveries: $onTimeDeliveries, lateDeliveries: $lateDeliveries)';
  }
}

/// @nodoc
abstract mixin class _$DeliveryStatsCopyWith<$Res>
    implements $DeliveryStatsCopyWith<$Res> {
  factory _$DeliveryStatsCopyWith(
          _DeliveryStats value, $Res Function(_DeliveryStats) _then) =
      __$DeliveryStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalDeliveries,
      int completedToday,
      int pendingDeliveries,
      int inProgressDeliveries,
      double totalEarnings,
      double todayEarnings,
      double averageRating,
      int totalRatings,
      double? averageDeliveryTime,
      int? onTimeDeliveries,
      int? lateDeliveries});
}

/// @nodoc
class __$DeliveryStatsCopyWithImpl<$Res>
    implements _$DeliveryStatsCopyWith<$Res> {
  __$DeliveryStatsCopyWithImpl(this._self, this._then);

  final _DeliveryStats _self;
  final $Res Function(_DeliveryStats) _then;

  /// Create a copy of DeliveryStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalDeliveries = null,
    Object? completedToday = null,
    Object? pendingDeliveries = null,
    Object? inProgressDeliveries = null,
    Object? totalEarnings = null,
    Object? todayEarnings = null,
    Object? averageRating = null,
    Object? totalRatings = null,
    Object? averageDeliveryTime = freezed,
    Object? onTimeDeliveries = freezed,
    Object? lateDeliveries = freezed,
  }) {
    return _then(_DeliveryStats(
      totalDeliveries: null == totalDeliveries
          ? _self.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      completedToday: null == completedToday
          ? _self.completedToday
          : completedToday // ignore: cast_nullable_to_non_nullable
              as int,
      pendingDeliveries: null == pendingDeliveries
          ? _self.pendingDeliveries
          : pendingDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      inProgressDeliveries: null == inProgressDeliveries
          ? _self.inProgressDeliveries
          : inProgressDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      totalEarnings: null == totalEarnings
          ? _self.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      todayEarnings: null == todayEarnings
          ? _self.todayEarnings
          : todayEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalRatings: null == totalRatings
          ? _self.totalRatings
          : totalRatings // ignore: cast_nullable_to_non_nullable
              as int,
      averageDeliveryTime: freezed == averageDeliveryTime
          ? _self.averageDeliveryTime
          : averageDeliveryTime // ignore: cast_nullable_to_non_nullable
              as double?,
      onTimeDeliveries: freezed == onTimeDeliveries
          ? _self.onTimeDeliveries
          : onTimeDeliveries // ignore: cast_nullable_to_non_nullable
              as int?,
      lateDeliveries: freezed == lateDeliveries
          ? _self.lateDeliveries
          : lateDeliveries // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
