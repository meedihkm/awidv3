// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deliverer_earnings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DelivererEarnings {
  String get delivererId;
  DateTime get periodStart;
  DateTime get periodEnd;
  double get totalEarnings;
  double get deliveryFees;
  double get tips;
  double get bonuses;
  int get totalDeliveries;
  int get completedDeliveries;
  double? get averageEarningsPerDelivery;
  double? get averageTip;
  List<DailyEarnings>? get dailyBreakdown;

  /// Create a copy of DelivererEarnings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DelivererEarningsCopyWith<DelivererEarnings> get copyWith =>
      _$DelivererEarningsCopyWithImpl<DelivererEarnings>(
          this as DelivererEarnings, _$identity);

  /// Serializes this DelivererEarnings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DelivererEarnings &&
            (identical(other.delivererId, delivererId) ||
                other.delivererId == delivererId) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.deliveryFees, deliveryFees) ||
                other.deliveryFees == deliveryFees) &&
            (identical(other.tips, tips) || other.tips == tips) &&
            (identical(other.bonuses, bonuses) || other.bonuses == bonuses) &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.completedDeliveries, completedDeliveries) ||
                other.completedDeliveries == completedDeliveries) &&
            (identical(other.averageEarningsPerDelivery,
                    averageEarningsPerDelivery) ||
                other.averageEarningsPerDelivery ==
                    averageEarningsPerDelivery) &&
            (identical(other.averageTip, averageTip) ||
                other.averageTip == averageTip) &&
            const DeepCollectionEquality()
                .equals(other.dailyBreakdown, dailyBreakdown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      delivererId,
      periodStart,
      periodEnd,
      totalEarnings,
      deliveryFees,
      tips,
      bonuses,
      totalDeliveries,
      completedDeliveries,
      averageEarningsPerDelivery,
      averageTip,
      const DeepCollectionEquality().hash(dailyBreakdown));

  @override
  String toString() {
    return 'DelivererEarnings(delivererId: $delivererId, periodStart: $periodStart, periodEnd: $periodEnd, totalEarnings: $totalEarnings, deliveryFees: $deliveryFees, tips: $tips, bonuses: $bonuses, totalDeliveries: $totalDeliveries, completedDeliveries: $completedDeliveries, averageEarningsPerDelivery: $averageEarningsPerDelivery, averageTip: $averageTip, dailyBreakdown: $dailyBreakdown)';
  }
}

/// @nodoc
abstract mixin class $DelivererEarningsCopyWith<$Res> {
  factory $DelivererEarningsCopyWith(
          DelivererEarnings value, $Res Function(DelivererEarnings) _then) =
      _$DelivererEarningsCopyWithImpl;
  @useResult
  $Res call(
      {String delivererId,
      DateTime periodStart,
      DateTime periodEnd,
      double totalEarnings,
      double deliveryFees,
      double tips,
      double bonuses,
      int totalDeliveries,
      int completedDeliveries,
      double? averageEarningsPerDelivery,
      double? averageTip,
      List<DailyEarnings>? dailyBreakdown});
}

/// @nodoc
class _$DelivererEarningsCopyWithImpl<$Res>
    implements $DelivererEarningsCopyWith<$Res> {
  _$DelivererEarningsCopyWithImpl(this._self, this._then);

  final DelivererEarnings _self;
  final $Res Function(DelivererEarnings) _then;

  /// Create a copy of DelivererEarnings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delivererId = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? totalEarnings = null,
    Object? deliveryFees = null,
    Object? tips = null,
    Object? bonuses = null,
    Object? totalDeliveries = null,
    Object? completedDeliveries = null,
    Object? averageEarningsPerDelivery = freezed,
    Object? averageTip = freezed,
    Object? dailyBreakdown = freezed,
  }) {
    return _then(_self.copyWith(
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      periodStart: null == periodStart
          ? _self.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _self.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalEarnings: null == totalEarnings
          ? _self.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFees: null == deliveryFees
          ? _self.deliveryFees
          : deliveryFees // ignore: cast_nullable_to_non_nullable
              as double,
      tips: null == tips
          ? _self.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as double,
      bonuses: null == bonuses
          ? _self.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as double,
      totalDeliveries: null == totalDeliveries
          ? _self.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      completedDeliveries: null == completedDeliveries
          ? _self.completedDeliveries
          : completedDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      averageEarningsPerDelivery: freezed == averageEarningsPerDelivery
          ? _self.averageEarningsPerDelivery
          : averageEarningsPerDelivery // ignore: cast_nullable_to_non_nullable
              as double?,
      averageTip: freezed == averageTip
          ? _self.averageTip
          : averageTip // ignore: cast_nullable_to_non_nullable
              as double?,
      dailyBreakdown: freezed == dailyBreakdown
          ? _self.dailyBreakdown
          : dailyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<DailyEarnings>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DelivererEarnings].
extension DelivererEarningsPatterns on DelivererEarnings {
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
    TResult Function(_DelivererEarnings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DelivererEarnings() when $default != null:
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
    TResult Function(_DelivererEarnings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererEarnings():
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
    TResult? Function(_DelivererEarnings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererEarnings() when $default != null:
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
            String delivererId,
            DateTime periodStart,
            DateTime periodEnd,
            double totalEarnings,
            double deliveryFees,
            double tips,
            double bonuses,
            int totalDeliveries,
            int completedDeliveries,
            double? averageEarningsPerDelivery,
            double? averageTip,
            List<DailyEarnings>? dailyBreakdown)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DelivererEarnings() when $default != null:
        return $default(
            _that.delivererId,
            _that.periodStart,
            _that.periodEnd,
            _that.totalEarnings,
            _that.deliveryFees,
            _that.tips,
            _that.bonuses,
            _that.totalDeliveries,
            _that.completedDeliveries,
            _that.averageEarningsPerDelivery,
            _that.averageTip,
            _that.dailyBreakdown);
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
            String delivererId,
            DateTime periodStart,
            DateTime periodEnd,
            double totalEarnings,
            double deliveryFees,
            double tips,
            double bonuses,
            int totalDeliveries,
            int completedDeliveries,
            double? averageEarningsPerDelivery,
            double? averageTip,
            List<DailyEarnings>? dailyBreakdown)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererEarnings():
        return $default(
            _that.delivererId,
            _that.periodStart,
            _that.periodEnd,
            _that.totalEarnings,
            _that.deliveryFees,
            _that.tips,
            _that.bonuses,
            _that.totalDeliveries,
            _that.completedDeliveries,
            _that.averageEarningsPerDelivery,
            _that.averageTip,
            _that.dailyBreakdown);
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
            String delivererId,
            DateTime periodStart,
            DateTime periodEnd,
            double totalEarnings,
            double deliveryFees,
            double tips,
            double bonuses,
            int totalDeliveries,
            int completedDeliveries,
            double? averageEarningsPerDelivery,
            double? averageTip,
            List<DailyEarnings>? dailyBreakdown)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererEarnings() when $default != null:
        return $default(
            _that.delivererId,
            _that.periodStart,
            _that.periodEnd,
            _that.totalEarnings,
            _that.deliveryFees,
            _that.tips,
            _that.bonuses,
            _that.totalDeliveries,
            _that.completedDeliveries,
            _that.averageEarningsPerDelivery,
            _that.averageTip,
            _that.dailyBreakdown);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DelivererEarnings extends DelivererEarnings {
  const _DelivererEarnings(
      {required this.delivererId,
      required this.periodStart,
      required this.periodEnd,
      required this.totalEarnings,
      required this.deliveryFees,
      required this.tips,
      required this.bonuses,
      required this.totalDeliveries,
      required this.completedDeliveries,
      this.averageEarningsPerDelivery,
      this.averageTip,
      final List<DailyEarnings>? dailyBreakdown})
      : _dailyBreakdown = dailyBreakdown,
        super._();
  factory _DelivererEarnings.fromJson(Map<String, dynamic> json) =>
      _$DelivererEarningsFromJson(json);

  @override
  final String delivererId;
  @override
  final DateTime periodStart;
  @override
  final DateTime periodEnd;
  @override
  final double totalEarnings;
  @override
  final double deliveryFees;
  @override
  final double tips;
  @override
  final double bonuses;
  @override
  final int totalDeliveries;
  @override
  final int completedDeliveries;
  @override
  final double? averageEarningsPerDelivery;
  @override
  final double? averageTip;
  final List<DailyEarnings>? _dailyBreakdown;
  @override
  List<DailyEarnings>? get dailyBreakdown {
    final value = _dailyBreakdown;
    if (value == null) return null;
    if (_dailyBreakdown is EqualUnmodifiableListView) return _dailyBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of DelivererEarnings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DelivererEarningsCopyWith<_DelivererEarnings> get copyWith =>
      __$DelivererEarningsCopyWithImpl<_DelivererEarnings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DelivererEarningsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DelivererEarnings &&
            (identical(other.delivererId, delivererId) ||
                other.delivererId == delivererId) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.deliveryFees, deliveryFees) ||
                other.deliveryFees == deliveryFees) &&
            (identical(other.tips, tips) || other.tips == tips) &&
            (identical(other.bonuses, bonuses) || other.bonuses == bonuses) &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.completedDeliveries, completedDeliveries) ||
                other.completedDeliveries == completedDeliveries) &&
            (identical(other.averageEarningsPerDelivery,
                    averageEarningsPerDelivery) ||
                other.averageEarningsPerDelivery ==
                    averageEarningsPerDelivery) &&
            (identical(other.averageTip, averageTip) ||
                other.averageTip == averageTip) &&
            const DeepCollectionEquality()
                .equals(other._dailyBreakdown, _dailyBreakdown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      delivererId,
      periodStart,
      periodEnd,
      totalEarnings,
      deliveryFees,
      tips,
      bonuses,
      totalDeliveries,
      completedDeliveries,
      averageEarningsPerDelivery,
      averageTip,
      const DeepCollectionEquality().hash(_dailyBreakdown));

  @override
  String toString() {
    return 'DelivererEarnings(delivererId: $delivererId, periodStart: $periodStart, periodEnd: $periodEnd, totalEarnings: $totalEarnings, deliveryFees: $deliveryFees, tips: $tips, bonuses: $bonuses, totalDeliveries: $totalDeliveries, completedDeliveries: $completedDeliveries, averageEarningsPerDelivery: $averageEarningsPerDelivery, averageTip: $averageTip, dailyBreakdown: $dailyBreakdown)';
  }
}

/// @nodoc
abstract mixin class _$DelivererEarningsCopyWith<$Res>
    implements $DelivererEarningsCopyWith<$Res> {
  factory _$DelivererEarningsCopyWith(
          _DelivererEarnings value, $Res Function(_DelivererEarnings) _then) =
      __$DelivererEarningsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String delivererId,
      DateTime periodStart,
      DateTime periodEnd,
      double totalEarnings,
      double deliveryFees,
      double tips,
      double bonuses,
      int totalDeliveries,
      int completedDeliveries,
      double? averageEarningsPerDelivery,
      double? averageTip,
      List<DailyEarnings>? dailyBreakdown});
}

/// @nodoc
class __$DelivererEarningsCopyWithImpl<$Res>
    implements _$DelivererEarningsCopyWith<$Res> {
  __$DelivererEarningsCopyWithImpl(this._self, this._then);

  final _DelivererEarnings _self;
  final $Res Function(_DelivererEarnings) _then;

  /// Create a copy of DelivererEarnings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? delivererId = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? totalEarnings = null,
    Object? deliveryFees = null,
    Object? tips = null,
    Object? bonuses = null,
    Object? totalDeliveries = null,
    Object? completedDeliveries = null,
    Object? averageEarningsPerDelivery = freezed,
    Object? averageTip = freezed,
    Object? dailyBreakdown = freezed,
  }) {
    return _then(_DelivererEarnings(
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      periodStart: null == periodStart
          ? _self.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _self.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalEarnings: null == totalEarnings
          ? _self.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFees: null == deliveryFees
          ? _self.deliveryFees
          : deliveryFees // ignore: cast_nullable_to_non_nullable
              as double,
      tips: null == tips
          ? _self.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as double,
      bonuses: null == bonuses
          ? _self.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as double,
      totalDeliveries: null == totalDeliveries
          ? _self.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      completedDeliveries: null == completedDeliveries
          ? _self.completedDeliveries
          : completedDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      averageEarningsPerDelivery: freezed == averageEarningsPerDelivery
          ? _self.averageEarningsPerDelivery
          : averageEarningsPerDelivery // ignore: cast_nullable_to_non_nullable
              as double?,
      averageTip: freezed == averageTip
          ? _self.averageTip
          : averageTip // ignore: cast_nullable_to_non_nullable
              as double?,
      dailyBreakdown: freezed == dailyBreakdown
          ? _self._dailyBreakdown
          : dailyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<DailyEarnings>?,
    ));
  }
}

/// @nodoc
mixin _$DailyEarnings {
  DateTime get date;
  double get earnings;
  int get deliveries;

  /// Create a copy of DailyEarnings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyEarningsCopyWith<DailyEarnings> get copyWith =>
      _$DailyEarningsCopyWithImpl<DailyEarnings>(
          this as DailyEarnings, _$identity);

  /// Serializes this DailyEarnings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyEarnings &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.earnings, earnings) ||
                other.earnings == earnings) &&
            (identical(other.deliveries, deliveries) ||
                other.deliveries == deliveries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, earnings, deliveries);

  @override
  String toString() {
    return 'DailyEarnings(date: $date, earnings: $earnings, deliveries: $deliveries)';
  }
}

/// @nodoc
abstract mixin class $DailyEarningsCopyWith<$Res> {
  factory $DailyEarningsCopyWith(
          DailyEarnings value, $Res Function(DailyEarnings) _then) =
      _$DailyEarningsCopyWithImpl;
  @useResult
  $Res call({DateTime date, double earnings, int deliveries});
}

/// @nodoc
class _$DailyEarningsCopyWithImpl<$Res>
    implements $DailyEarningsCopyWith<$Res> {
  _$DailyEarningsCopyWithImpl(this._self, this._then);

  final DailyEarnings _self;
  final $Res Function(DailyEarnings) _then;

  /// Create a copy of DailyEarnings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? earnings = null,
    Object? deliveries = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      earnings: null == earnings
          ? _self.earnings
          : earnings // ignore: cast_nullable_to_non_nullable
              as double,
      deliveries: null == deliveries
          ? _self.deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DailyEarnings].
extension DailyEarningsPatterns on DailyEarnings {
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
    TResult Function(_DailyEarnings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyEarnings() when $default != null:
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
    TResult Function(_DailyEarnings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyEarnings():
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
    TResult? Function(_DailyEarnings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyEarnings() when $default != null:
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
    TResult Function(DateTime date, double earnings, int deliveries)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyEarnings() when $default != null:
        return $default(_that.date, _that.earnings, _that.deliveries);
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
    TResult Function(DateTime date, double earnings, int deliveries) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyEarnings():
        return $default(_that.date, _that.earnings, _that.deliveries);
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
    TResult? Function(DateTime date, double earnings, int deliveries)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyEarnings() when $default != null:
        return $default(_that.date, _that.earnings, _that.deliveries);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DailyEarnings extends DailyEarnings {
  const _DailyEarnings(
      {required this.date, required this.earnings, required this.deliveries})
      : super._();
  factory _DailyEarnings.fromJson(Map<String, dynamic> json) =>
      _$DailyEarningsFromJson(json);

  @override
  final DateTime date;
  @override
  final double earnings;
  @override
  final int deliveries;

  /// Create a copy of DailyEarnings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyEarningsCopyWith<_DailyEarnings> get copyWith =>
      __$DailyEarningsCopyWithImpl<_DailyEarnings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailyEarningsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyEarnings &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.earnings, earnings) ||
                other.earnings == earnings) &&
            (identical(other.deliveries, deliveries) ||
                other.deliveries == deliveries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, earnings, deliveries);

  @override
  String toString() {
    return 'DailyEarnings(date: $date, earnings: $earnings, deliveries: $deliveries)';
  }
}

/// @nodoc
abstract mixin class _$DailyEarningsCopyWith<$Res>
    implements $DailyEarningsCopyWith<$Res> {
  factory _$DailyEarningsCopyWith(
          _DailyEarnings value, $Res Function(_DailyEarnings) _then) =
      __$DailyEarningsCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date, double earnings, int deliveries});
}

/// @nodoc
class __$DailyEarningsCopyWithImpl<$Res>
    implements _$DailyEarningsCopyWith<$Res> {
  __$DailyEarningsCopyWithImpl(this._self, this._then);

  final _DailyEarnings _self;
  final $Res Function(_DailyEarnings) _then;

  /// Create a copy of DailyEarnings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? earnings = null,
    Object? deliveries = null,
  }) {
    return _then(_DailyEarnings(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      earnings: null == earnings
          ? _self.earnings
          : earnings // ignore: cast_nullable_to_non_nullable
              as double,
      deliveries: null == deliveries
          ? _self.deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$DelivererDetailedStats {
  int get totalDeliveries;
  int get completedDeliveries;
  int get cancelledDeliveries;
  int get failedDeliveries;
  double get averageRating;
  int get totalRatings;
  double get onTimePercentage;
  double get averageDeliveryTime;
  int get totalCustomers;
  int get repeatCustomers;
  double? get bestDayEarnings;
  DateTime? get bestDayDate;
  int? get longestStreak;
  int? get currentStreak;

  /// Create a copy of DelivererDetailedStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DelivererDetailedStatsCopyWith<DelivererDetailedStats> get copyWith =>
      _$DelivererDetailedStatsCopyWithImpl<DelivererDetailedStats>(
          this as DelivererDetailedStats, _$identity);

  /// Serializes this DelivererDetailedStats to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DelivererDetailedStats &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.completedDeliveries, completedDeliveries) ||
                other.completedDeliveries == completedDeliveries) &&
            (identical(other.cancelledDeliveries, cancelledDeliveries) ||
                other.cancelledDeliveries == cancelledDeliveries) &&
            (identical(other.failedDeliveries, failedDeliveries) ||
                other.failedDeliveries == failedDeliveries) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalRatings, totalRatings) ||
                other.totalRatings == totalRatings) &&
            (identical(other.onTimePercentage, onTimePercentage) ||
                other.onTimePercentage == onTimePercentage) &&
            (identical(other.averageDeliveryTime, averageDeliveryTime) ||
                other.averageDeliveryTime == averageDeliveryTime) &&
            (identical(other.totalCustomers, totalCustomers) ||
                other.totalCustomers == totalCustomers) &&
            (identical(other.repeatCustomers, repeatCustomers) ||
                other.repeatCustomers == repeatCustomers) &&
            (identical(other.bestDayEarnings, bestDayEarnings) ||
                other.bestDayEarnings == bestDayEarnings) &&
            (identical(other.bestDayDate, bestDayDate) ||
                other.bestDayDate == bestDayDate) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalDeliveries,
      completedDeliveries,
      cancelledDeliveries,
      failedDeliveries,
      averageRating,
      totalRatings,
      onTimePercentage,
      averageDeliveryTime,
      totalCustomers,
      repeatCustomers,
      bestDayEarnings,
      bestDayDate,
      longestStreak,
      currentStreak);

  @override
  String toString() {
    return 'DelivererDetailedStats(totalDeliveries: $totalDeliveries, completedDeliveries: $completedDeliveries, cancelledDeliveries: $cancelledDeliveries, failedDeliveries: $failedDeliveries, averageRating: $averageRating, totalRatings: $totalRatings, onTimePercentage: $onTimePercentage, averageDeliveryTime: $averageDeliveryTime, totalCustomers: $totalCustomers, repeatCustomers: $repeatCustomers, bestDayEarnings: $bestDayEarnings, bestDayDate: $bestDayDate, longestStreak: $longestStreak, currentStreak: $currentStreak)';
  }
}

/// @nodoc
abstract mixin class $DelivererDetailedStatsCopyWith<$Res> {
  factory $DelivererDetailedStatsCopyWith(DelivererDetailedStats value,
          $Res Function(DelivererDetailedStats) _then) =
      _$DelivererDetailedStatsCopyWithImpl;
  @useResult
  $Res call(
      {int totalDeliveries,
      int completedDeliveries,
      int cancelledDeliveries,
      int failedDeliveries,
      double averageRating,
      int totalRatings,
      double onTimePercentage,
      double averageDeliveryTime,
      int totalCustomers,
      int repeatCustomers,
      double? bestDayEarnings,
      DateTime? bestDayDate,
      int? longestStreak,
      int? currentStreak});
}

/// @nodoc
class _$DelivererDetailedStatsCopyWithImpl<$Res>
    implements $DelivererDetailedStatsCopyWith<$Res> {
  _$DelivererDetailedStatsCopyWithImpl(this._self, this._then);

  final DelivererDetailedStats _self;
  final $Res Function(DelivererDetailedStats) _then;

  /// Create a copy of DelivererDetailedStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDeliveries = null,
    Object? completedDeliveries = null,
    Object? cancelledDeliveries = null,
    Object? failedDeliveries = null,
    Object? averageRating = null,
    Object? totalRatings = null,
    Object? onTimePercentage = null,
    Object? averageDeliveryTime = null,
    Object? totalCustomers = null,
    Object? repeatCustomers = null,
    Object? bestDayEarnings = freezed,
    Object? bestDayDate = freezed,
    Object? longestStreak = freezed,
    Object? currentStreak = freezed,
  }) {
    return _then(_self.copyWith(
      totalDeliveries: null == totalDeliveries
          ? _self.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      completedDeliveries: null == completedDeliveries
          ? _self.completedDeliveries
          : completedDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledDeliveries: null == cancelledDeliveries
          ? _self.cancelledDeliveries
          : cancelledDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      failedDeliveries: null == failedDeliveries
          ? _self.failedDeliveries
          : failedDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalRatings: null == totalRatings
          ? _self.totalRatings
          : totalRatings // ignore: cast_nullable_to_non_nullable
              as int,
      onTimePercentage: null == onTimePercentage
          ? _self.onTimePercentage
          : onTimePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      averageDeliveryTime: null == averageDeliveryTime
          ? _self.averageDeliveryTime
          : averageDeliveryTime // ignore: cast_nullable_to_non_nullable
              as double,
      totalCustomers: null == totalCustomers
          ? _self.totalCustomers
          : totalCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      repeatCustomers: null == repeatCustomers
          ? _self.repeatCustomers
          : repeatCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      bestDayEarnings: freezed == bestDayEarnings
          ? _self.bestDayEarnings
          : bestDayEarnings // ignore: cast_nullable_to_non_nullable
              as double?,
      bestDayDate: freezed == bestDayDate
          ? _self.bestDayDate
          : bestDayDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      longestStreak: freezed == longestStreak
          ? _self.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int?,
      currentStreak: freezed == currentStreak
          ? _self.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DelivererDetailedStats].
extension DelivererDetailedStatsPatterns on DelivererDetailedStats {
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
    TResult Function(_DelivererDetailedStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DelivererDetailedStats() when $default != null:
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
    TResult Function(_DelivererDetailedStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererDetailedStats():
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
    TResult? Function(_DelivererDetailedStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererDetailedStats() when $default != null:
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
            int completedDeliveries,
            int cancelledDeliveries,
            int failedDeliveries,
            double averageRating,
            int totalRatings,
            double onTimePercentage,
            double averageDeliveryTime,
            int totalCustomers,
            int repeatCustomers,
            double? bestDayEarnings,
            DateTime? bestDayDate,
            int? longestStreak,
            int? currentStreak)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DelivererDetailedStats() when $default != null:
        return $default(
            _that.totalDeliveries,
            _that.completedDeliveries,
            _that.cancelledDeliveries,
            _that.failedDeliveries,
            _that.averageRating,
            _that.totalRatings,
            _that.onTimePercentage,
            _that.averageDeliveryTime,
            _that.totalCustomers,
            _that.repeatCustomers,
            _that.bestDayEarnings,
            _that.bestDayDate,
            _that.longestStreak,
            _that.currentStreak);
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
            int completedDeliveries,
            int cancelledDeliveries,
            int failedDeliveries,
            double averageRating,
            int totalRatings,
            double onTimePercentage,
            double averageDeliveryTime,
            int totalCustomers,
            int repeatCustomers,
            double? bestDayEarnings,
            DateTime? bestDayDate,
            int? longestStreak,
            int? currentStreak)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererDetailedStats():
        return $default(
            _that.totalDeliveries,
            _that.completedDeliveries,
            _that.cancelledDeliveries,
            _that.failedDeliveries,
            _that.averageRating,
            _that.totalRatings,
            _that.onTimePercentage,
            _that.averageDeliveryTime,
            _that.totalCustomers,
            _that.repeatCustomers,
            _that.bestDayEarnings,
            _that.bestDayDate,
            _that.longestStreak,
            _that.currentStreak);
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
            int completedDeliveries,
            int cancelledDeliveries,
            int failedDeliveries,
            double averageRating,
            int totalRatings,
            double onTimePercentage,
            double averageDeliveryTime,
            int totalCustomers,
            int repeatCustomers,
            double? bestDayEarnings,
            DateTime? bestDayDate,
            int? longestStreak,
            int? currentStreak)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DelivererDetailedStats() when $default != null:
        return $default(
            _that.totalDeliveries,
            _that.completedDeliveries,
            _that.cancelledDeliveries,
            _that.failedDeliveries,
            _that.averageRating,
            _that.totalRatings,
            _that.onTimePercentage,
            _that.averageDeliveryTime,
            _that.totalCustomers,
            _that.repeatCustomers,
            _that.bestDayEarnings,
            _that.bestDayDate,
            _that.longestStreak,
            _that.currentStreak);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DelivererDetailedStats extends DelivererDetailedStats {
  const _DelivererDetailedStats(
      {required this.totalDeliveries,
      required this.completedDeliveries,
      required this.cancelledDeliveries,
      required this.failedDeliveries,
      required this.averageRating,
      required this.totalRatings,
      required this.onTimePercentage,
      required this.averageDeliveryTime,
      required this.totalCustomers,
      required this.repeatCustomers,
      this.bestDayEarnings,
      this.bestDayDate,
      this.longestStreak,
      this.currentStreak})
      : super._();
  factory _DelivererDetailedStats.fromJson(Map<String, dynamic> json) =>
      _$DelivererDetailedStatsFromJson(json);

  @override
  final int totalDeliveries;
  @override
  final int completedDeliveries;
  @override
  final int cancelledDeliveries;
  @override
  final int failedDeliveries;
  @override
  final double averageRating;
  @override
  final int totalRatings;
  @override
  final double onTimePercentage;
  @override
  final double averageDeliveryTime;
  @override
  final int totalCustomers;
  @override
  final int repeatCustomers;
  @override
  final double? bestDayEarnings;
  @override
  final DateTime? bestDayDate;
  @override
  final int? longestStreak;
  @override
  final int? currentStreak;

  /// Create a copy of DelivererDetailedStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DelivererDetailedStatsCopyWith<_DelivererDetailedStats> get copyWith =>
      __$DelivererDetailedStatsCopyWithImpl<_DelivererDetailedStats>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DelivererDetailedStatsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DelivererDetailedStats &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.completedDeliveries, completedDeliveries) ||
                other.completedDeliveries == completedDeliveries) &&
            (identical(other.cancelledDeliveries, cancelledDeliveries) ||
                other.cancelledDeliveries == cancelledDeliveries) &&
            (identical(other.failedDeliveries, failedDeliveries) ||
                other.failedDeliveries == failedDeliveries) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalRatings, totalRatings) ||
                other.totalRatings == totalRatings) &&
            (identical(other.onTimePercentage, onTimePercentage) ||
                other.onTimePercentage == onTimePercentage) &&
            (identical(other.averageDeliveryTime, averageDeliveryTime) ||
                other.averageDeliveryTime == averageDeliveryTime) &&
            (identical(other.totalCustomers, totalCustomers) ||
                other.totalCustomers == totalCustomers) &&
            (identical(other.repeatCustomers, repeatCustomers) ||
                other.repeatCustomers == repeatCustomers) &&
            (identical(other.bestDayEarnings, bestDayEarnings) ||
                other.bestDayEarnings == bestDayEarnings) &&
            (identical(other.bestDayDate, bestDayDate) ||
                other.bestDayDate == bestDayDate) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalDeliveries,
      completedDeliveries,
      cancelledDeliveries,
      failedDeliveries,
      averageRating,
      totalRatings,
      onTimePercentage,
      averageDeliveryTime,
      totalCustomers,
      repeatCustomers,
      bestDayEarnings,
      bestDayDate,
      longestStreak,
      currentStreak);

  @override
  String toString() {
    return 'DelivererDetailedStats(totalDeliveries: $totalDeliveries, completedDeliveries: $completedDeliveries, cancelledDeliveries: $cancelledDeliveries, failedDeliveries: $failedDeliveries, averageRating: $averageRating, totalRatings: $totalRatings, onTimePercentage: $onTimePercentage, averageDeliveryTime: $averageDeliveryTime, totalCustomers: $totalCustomers, repeatCustomers: $repeatCustomers, bestDayEarnings: $bestDayEarnings, bestDayDate: $bestDayDate, longestStreak: $longestStreak, currentStreak: $currentStreak)';
  }
}

/// @nodoc
abstract mixin class _$DelivererDetailedStatsCopyWith<$Res>
    implements $DelivererDetailedStatsCopyWith<$Res> {
  factory _$DelivererDetailedStatsCopyWith(_DelivererDetailedStats value,
          $Res Function(_DelivererDetailedStats) _then) =
      __$DelivererDetailedStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalDeliveries,
      int completedDeliveries,
      int cancelledDeliveries,
      int failedDeliveries,
      double averageRating,
      int totalRatings,
      double onTimePercentage,
      double averageDeliveryTime,
      int totalCustomers,
      int repeatCustomers,
      double? bestDayEarnings,
      DateTime? bestDayDate,
      int? longestStreak,
      int? currentStreak});
}

/// @nodoc
class __$DelivererDetailedStatsCopyWithImpl<$Res>
    implements _$DelivererDetailedStatsCopyWith<$Res> {
  __$DelivererDetailedStatsCopyWithImpl(this._self, this._then);

  final _DelivererDetailedStats _self;
  final $Res Function(_DelivererDetailedStats) _then;

  /// Create a copy of DelivererDetailedStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalDeliveries = null,
    Object? completedDeliveries = null,
    Object? cancelledDeliveries = null,
    Object? failedDeliveries = null,
    Object? averageRating = null,
    Object? totalRatings = null,
    Object? onTimePercentage = null,
    Object? averageDeliveryTime = null,
    Object? totalCustomers = null,
    Object? repeatCustomers = null,
    Object? bestDayEarnings = freezed,
    Object? bestDayDate = freezed,
    Object? longestStreak = freezed,
    Object? currentStreak = freezed,
  }) {
    return _then(_DelivererDetailedStats(
      totalDeliveries: null == totalDeliveries
          ? _self.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      completedDeliveries: null == completedDeliveries
          ? _self.completedDeliveries
          : completedDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledDeliveries: null == cancelledDeliveries
          ? _self.cancelledDeliveries
          : cancelledDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      failedDeliveries: null == failedDeliveries
          ? _self.failedDeliveries
          : failedDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalRatings: null == totalRatings
          ? _self.totalRatings
          : totalRatings // ignore: cast_nullable_to_non_nullable
              as int,
      onTimePercentage: null == onTimePercentage
          ? _self.onTimePercentage
          : onTimePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      averageDeliveryTime: null == averageDeliveryTime
          ? _self.averageDeliveryTime
          : averageDeliveryTime // ignore: cast_nullable_to_non_nullable
              as double,
      totalCustomers: null == totalCustomers
          ? _self.totalCustomers
          : totalCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      repeatCustomers: null == repeatCustomers
          ? _self.repeatCustomers
          : repeatCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      bestDayEarnings: freezed == bestDayEarnings
          ? _self.bestDayEarnings
          : bestDayEarnings // ignore: cast_nullable_to_non_nullable
              as double?,
      bestDayDate: freezed == bestDayDate
          ? _self.bestDayDate
          : bestDayDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      longestStreak: freezed == longestStreak
          ? _self.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int?,
      currentStreak: freezed == currentStreak
          ? _self.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
