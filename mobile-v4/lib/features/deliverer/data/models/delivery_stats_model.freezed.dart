// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryStatsModel {
  @JsonKey(name: 'total_deliveries')
  int get totalDeliveries;
  @JsonKey(name: 'completed_today')
  int get completedToday;
  @JsonKey(name: 'pending_deliveries')
  int get pendingDeliveries;
  @JsonKey(name: 'in_progress_deliveries')
  int get inProgressDeliveries;
  @JsonKey(name: 'total_earnings')
  double get totalEarnings;
  @JsonKey(name: 'today_earnings')
  double get todayEarnings;
  @JsonKey(name: 'average_rating')
  double get averageRating;
  @JsonKey(name: 'total_ratings')
  int get totalRatings;
  @JsonKey(name: 'average_delivery_time')
  double? get averageDeliveryTime;
  @JsonKey(name: 'on_time_deliveries')
  int? get onTimeDeliveries;
  @JsonKey(name: 'late_deliveries')
  int? get lateDeliveries;

  /// Create a copy of DeliveryStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeliveryStatsModelCopyWith<DeliveryStatsModel> get copyWith =>
      _$DeliveryStatsModelCopyWithImpl<DeliveryStatsModel>(
          this as DeliveryStatsModel, _$identity);

  /// Serializes this DeliveryStatsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeliveryStatsModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'DeliveryStatsModel(totalDeliveries: $totalDeliveries, completedToday: $completedToday, pendingDeliveries: $pendingDeliveries, inProgressDeliveries: $inProgressDeliveries, totalEarnings: $totalEarnings, todayEarnings: $todayEarnings, averageRating: $averageRating, totalRatings: $totalRatings, averageDeliveryTime: $averageDeliveryTime, onTimeDeliveries: $onTimeDeliveries, lateDeliveries: $lateDeliveries)';
  }
}

/// @nodoc
abstract mixin class $DeliveryStatsModelCopyWith<$Res> {
  factory $DeliveryStatsModelCopyWith(
          DeliveryStatsModel value, $Res Function(DeliveryStatsModel) _then) =
      _$DeliveryStatsModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_deliveries') int totalDeliveries,
      @JsonKey(name: 'completed_today') int completedToday,
      @JsonKey(name: 'pending_deliveries') int pendingDeliveries,
      @JsonKey(name: 'in_progress_deliveries') int inProgressDeliveries,
      @JsonKey(name: 'total_earnings') double totalEarnings,
      @JsonKey(name: 'today_earnings') double todayEarnings,
      @JsonKey(name: 'average_rating') double averageRating,
      @JsonKey(name: 'total_ratings') int totalRatings,
      @JsonKey(name: 'average_delivery_time') double? averageDeliveryTime,
      @JsonKey(name: 'on_time_deliveries') int? onTimeDeliveries,
      @JsonKey(name: 'late_deliveries') int? lateDeliveries});
}

/// @nodoc
class _$DeliveryStatsModelCopyWithImpl<$Res>
    implements $DeliveryStatsModelCopyWith<$Res> {
  _$DeliveryStatsModelCopyWithImpl(this._self, this._then);

  final DeliveryStatsModel _self;
  final $Res Function(DeliveryStatsModel) _then;

  /// Create a copy of DeliveryStatsModel
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

/// Adds pattern-matching-related methods to [DeliveryStatsModel].
extension DeliveryStatsModelPatterns on DeliveryStatsModel {
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
    TResult Function(_DeliveryStatsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryStatsModel() when $default != null:
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
    TResult Function(_DeliveryStatsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryStatsModel():
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
    TResult? Function(_DeliveryStatsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryStatsModel() when $default != null:
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
            @JsonKey(name: 'total_deliveries') int totalDeliveries,
            @JsonKey(name: 'completed_today') int completedToday,
            @JsonKey(name: 'pending_deliveries') int pendingDeliveries,
            @JsonKey(name: 'in_progress_deliveries') int inProgressDeliveries,
            @JsonKey(name: 'total_earnings') double totalEarnings,
            @JsonKey(name: 'today_earnings') double todayEarnings,
            @JsonKey(name: 'average_rating') double averageRating,
            @JsonKey(name: 'total_ratings') int totalRatings,
            @JsonKey(name: 'average_delivery_time') double? averageDeliveryTime,
            @JsonKey(name: 'on_time_deliveries') int? onTimeDeliveries,
            @JsonKey(name: 'late_deliveries') int? lateDeliveries)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryStatsModel() when $default != null:
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
            @JsonKey(name: 'total_deliveries') int totalDeliveries,
            @JsonKey(name: 'completed_today') int completedToday,
            @JsonKey(name: 'pending_deliveries') int pendingDeliveries,
            @JsonKey(name: 'in_progress_deliveries') int inProgressDeliveries,
            @JsonKey(name: 'total_earnings') double totalEarnings,
            @JsonKey(name: 'today_earnings') double todayEarnings,
            @JsonKey(name: 'average_rating') double averageRating,
            @JsonKey(name: 'total_ratings') int totalRatings,
            @JsonKey(name: 'average_delivery_time') double? averageDeliveryTime,
            @JsonKey(name: 'on_time_deliveries') int? onTimeDeliveries,
            @JsonKey(name: 'late_deliveries') int? lateDeliveries)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryStatsModel():
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
            @JsonKey(name: 'total_deliveries') int totalDeliveries,
            @JsonKey(name: 'completed_today') int completedToday,
            @JsonKey(name: 'pending_deliveries') int pendingDeliveries,
            @JsonKey(name: 'in_progress_deliveries') int inProgressDeliveries,
            @JsonKey(name: 'total_earnings') double totalEarnings,
            @JsonKey(name: 'today_earnings') double todayEarnings,
            @JsonKey(name: 'average_rating') double averageRating,
            @JsonKey(name: 'total_ratings') int totalRatings,
            @JsonKey(name: 'average_delivery_time') double? averageDeliveryTime,
            @JsonKey(name: 'on_time_deliveries') int? onTimeDeliveries,
            @JsonKey(name: 'late_deliveries') int? lateDeliveries)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryStatsModel() when $default != null:
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
@JsonSerializable()
class _DeliveryStatsModel extends DeliveryStatsModel {
  const _DeliveryStatsModel(
      {@JsonKey(name: 'total_deliveries') required this.totalDeliveries,
      @JsonKey(name: 'completed_today') required this.completedToday,
      @JsonKey(name: 'pending_deliveries') required this.pendingDeliveries,
      @JsonKey(name: 'in_progress_deliveries')
      required this.inProgressDeliveries,
      @JsonKey(name: 'total_earnings') required this.totalEarnings,
      @JsonKey(name: 'today_earnings') required this.todayEarnings,
      @JsonKey(name: 'average_rating') required this.averageRating,
      @JsonKey(name: 'total_ratings') required this.totalRatings,
      @JsonKey(name: 'average_delivery_time') this.averageDeliveryTime,
      @JsonKey(name: 'on_time_deliveries') this.onTimeDeliveries,
      @JsonKey(name: 'late_deliveries') this.lateDeliveries})
      : super._();
  factory _DeliveryStatsModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryStatsModelFromJson(json);

  @override
  @JsonKey(name: 'total_deliveries')
  final int totalDeliveries;
  @override
  @JsonKey(name: 'completed_today')
  final int completedToday;
  @override
  @JsonKey(name: 'pending_deliveries')
  final int pendingDeliveries;
  @override
  @JsonKey(name: 'in_progress_deliveries')
  final int inProgressDeliveries;
  @override
  @JsonKey(name: 'total_earnings')
  final double totalEarnings;
  @override
  @JsonKey(name: 'today_earnings')
  final double todayEarnings;
  @override
  @JsonKey(name: 'average_rating')
  final double averageRating;
  @override
  @JsonKey(name: 'total_ratings')
  final int totalRatings;
  @override
  @JsonKey(name: 'average_delivery_time')
  final double? averageDeliveryTime;
  @override
  @JsonKey(name: 'on_time_deliveries')
  final int? onTimeDeliveries;
  @override
  @JsonKey(name: 'late_deliveries')
  final int? lateDeliveries;

  /// Create a copy of DeliveryStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeliveryStatsModelCopyWith<_DeliveryStatsModel> get copyWith =>
      __$DeliveryStatsModelCopyWithImpl<_DeliveryStatsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeliveryStatsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeliveryStatsModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'DeliveryStatsModel(totalDeliveries: $totalDeliveries, completedToday: $completedToday, pendingDeliveries: $pendingDeliveries, inProgressDeliveries: $inProgressDeliveries, totalEarnings: $totalEarnings, todayEarnings: $todayEarnings, averageRating: $averageRating, totalRatings: $totalRatings, averageDeliveryTime: $averageDeliveryTime, onTimeDeliveries: $onTimeDeliveries, lateDeliveries: $lateDeliveries)';
  }
}

/// @nodoc
abstract mixin class _$DeliveryStatsModelCopyWith<$Res>
    implements $DeliveryStatsModelCopyWith<$Res> {
  factory _$DeliveryStatsModelCopyWith(
          _DeliveryStatsModel value, $Res Function(_DeliveryStatsModel) _then) =
      __$DeliveryStatsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_deliveries') int totalDeliveries,
      @JsonKey(name: 'completed_today') int completedToday,
      @JsonKey(name: 'pending_deliveries') int pendingDeliveries,
      @JsonKey(name: 'in_progress_deliveries') int inProgressDeliveries,
      @JsonKey(name: 'total_earnings') double totalEarnings,
      @JsonKey(name: 'today_earnings') double todayEarnings,
      @JsonKey(name: 'average_rating') double averageRating,
      @JsonKey(name: 'total_ratings') int totalRatings,
      @JsonKey(name: 'average_delivery_time') double? averageDeliveryTime,
      @JsonKey(name: 'on_time_deliveries') int? onTimeDeliveries,
      @JsonKey(name: 'late_deliveries') int? lateDeliveries});
}

/// @nodoc
class __$DeliveryStatsModelCopyWithImpl<$Res>
    implements _$DeliveryStatsModelCopyWith<$Res> {
  __$DeliveryStatsModelCopyWithImpl(this._self, this._then);

  final _DeliveryStatsModel _self;
  final $Res Function(_DeliveryStatsModel) _then;

  /// Create a copy of DeliveryStatsModel
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
    return _then(_DeliveryStatsModel(
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
