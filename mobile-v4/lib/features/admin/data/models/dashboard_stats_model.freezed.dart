// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardStatsModel {
  double get totalRevenue;
  int get totalOrders;
  int get pendingOrders;
  int get completedOrders;
  int get activeDeliveries;
  int get activeDeliverers;
  double get averageOrderValue;
  DateTime get updatedAt;

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardStatsModelCopyWith<DashboardStatsModel> get copyWith =>
      _$DashboardStatsModelCopyWithImpl<DashboardStatsModel>(
          this as DashboardStatsModel, _$identity);

  /// Serializes this DashboardStatsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardStatsModel &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.pendingOrders, pendingOrders) ||
                other.pendingOrders == pendingOrders) &&
            (identical(other.completedOrders, completedOrders) ||
                other.completedOrders == completedOrders) &&
            (identical(other.activeDeliveries, activeDeliveries) ||
                other.activeDeliveries == activeDeliveries) &&
            (identical(other.activeDeliverers, activeDeliverers) ||
                other.activeDeliverers == activeDeliverers) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalRevenue,
      totalOrders,
      pendingOrders,
      completedOrders,
      activeDeliveries,
      activeDeliverers,
      averageOrderValue,
      updatedAt);

  @override
  String toString() {
    return 'DashboardStatsModel(totalRevenue: $totalRevenue, totalOrders: $totalOrders, pendingOrders: $pendingOrders, completedOrders: $completedOrders, activeDeliveries: $activeDeliveries, activeDeliverers: $activeDeliverers, averageOrderValue: $averageOrderValue, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $DashboardStatsModelCopyWith<$Res> {
  factory $DashboardStatsModelCopyWith(
          DashboardStatsModel value, $Res Function(DashboardStatsModel) _then) =
      _$DashboardStatsModelCopyWithImpl;
  @useResult
  $Res call(
      {double totalRevenue,
      int totalOrders,
      int pendingOrders,
      int completedOrders,
      int activeDeliveries,
      int activeDeliverers,
      double averageOrderValue,
      DateTime updatedAt});
}

/// @nodoc
class _$DashboardStatsModelCopyWithImpl<$Res>
    implements $DashboardStatsModelCopyWith<$Res> {
  _$DashboardStatsModelCopyWithImpl(this._self, this._then);

  final DashboardStatsModel _self;
  final $Res Function(DashboardStatsModel) _then;

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRevenue = null,
    Object? totalOrders = null,
    Object? pendingOrders = null,
    Object? completedOrders = null,
    Object? activeDeliveries = null,
    Object? activeDeliverers = null,
    Object? averageOrderValue = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      totalRevenue: null == totalRevenue
          ? _self.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      totalOrders: null == totalOrders
          ? _self.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      pendingOrders: null == pendingOrders
          ? _self.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _self.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      activeDeliveries: null == activeDeliveries
          ? _self.activeDeliveries
          : activeDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      activeDeliverers: null == activeDeliverers
          ? _self.activeDeliverers
          : activeDeliverers // ignore: cast_nullable_to_non_nullable
              as int,
      averageOrderValue: null == averageOrderValue
          ? _self.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [DashboardStatsModel].
extension DashboardStatsModelPatterns on DashboardStatsModel {
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
    TResult Function(_DashboardStatsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardStatsModel() when $default != null:
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
    TResult Function(_DashboardStatsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardStatsModel():
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
    TResult? Function(_DashboardStatsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardStatsModel() when $default != null:
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
            double totalRevenue,
            int totalOrders,
            int pendingOrders,
            int completedOrders,
            int activeDeliveries,
            int activeDeliverers,
            double averageOrderValue,
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardStatsModel() when $default != null:
        return $default(
            _that.totalRevenue,
            _that.totalOrders,
            _that.pendingOrders,
            _that.completedOrders,
            _that.activeDeliveries,
            _that.activeDeliverers,
            _that.averageOrderValue,
            _that.updatedAt);
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
            double totalRevenue,
            int totalOrders,
            int pendingOrders,
            int completedOrders,
            int activeDeliveries,
            int activeDeliverers,
            double averageOrderValue,
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardStatsModel():
        return $default(
            _that.totalRevenue,
            _that.totalOrders,
            _that.pendingOrders,
            _that.completedOrders,
            _that.activeDeliveries,
            _that.activeDeliverers,
            _that.averageOrderValue,
            _that.updatedAt);
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
            double totalRevenue,
            int totalOrders,
            int pendingOrders,
            int completedOrders,
            int activeDeliveries,
            int activeDeliverers,
            double averageOrderValue,
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardStatsModel() when $default != null:
        return $default(
            _that.totalRevenue,
            _that.totalOrders,
            _that.pendingOrders,
            _that.completedOrders,
            _that.activeDeliveries,
            _that.activeDeliverers,
            _that.averageOrderValue,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DashboardStatsModel extends DashboardStatsModel {
  const _DashboardStatsModel(
      {required this.totalRevenue,
      required this.totalOrders,
      required this.pendingOrders,
      required this.completedOrders,
      required this.activeDeliveries,
      required this.activeDeliverers,
      required this.averageOrderValue,
      required this.updatedAt})
      : super._();
  factory _DashboardStatsModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsModelFromJson(json);

  @override
  final double totalRevenue;
  @override
  final int totalOrders;
  @override
  final int pendingOrders;
  @override
  final int completedOrders;
  @override
  final int activeDeliveries;
  @override
  final int activeDeliverers;
  @override
  final double averageOrderValue;
  @override
  final DateTime updatedAt;

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardStatsModelCopyWith<_DashboardStatsModel> get copyWith =>
      __$DashboardStatsModelCopyWithImpl<_DashboardStatsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardStatsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardStatsModel &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.pendingOrders, pendingOrders) ||
                other.pendingOrders == pendingOrders) &&
            (identical(other.completedOrders, completedOrders) ||
                other.completedOrders == completedOrders) &&
            (identical(other.activeDeliveries, activeDeliveries) ||
                other.activeDeliveries == activeDeliveries) &&
            (identical(other.activeDeliverers, activeDeliverers) ||
                other.activeDeliverers == activeDeliverers) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalRevenue,
      totalOrders,
      pendingOrders,
      completedOrders,
      activeDeliveries,
      activeDeliverers,
      averageOrderValue,
      updatedAt);

  @override
  String toString() {
    return 'DashboardStatsModel(totalRevenue: $totalRevenue, totalOrders: $totalOrders, pendingOrders: $pendingOrders, completedOrders: $completedOrders, activeDeliveries: $activeDeliveries, activeDeliverers: $activeDeliverers, averageOrderValue: $averageOrderValue, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$DashboardStatsModelCopyWith<$Res>
    implements $DashboardStatsModelCopyWith<$Res> {
  factory _$DashboardStatsModelCopyWith(_DashboardStatsModel value,
          $Res Function(_DashboardStatsModel) _then) =
      __$DashboardStatsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double totalRevenue,
      int totalOrders,
      int pendingOrders,
      int completedOrders,
      int activeDeliveries,
      int activeDeliverers,
      double averageOrderValue,
      DateTime updatedAt});
}

/// @nodoc
class __$DashboardStatsModelCopyWithImpl<$Res>
    implements _$DashboardStatsModelCopyWith<$Res> {
  __$DashboardStatsModelCopyWithImpl(this._self, this._then);

  final _DashboardStatsModel _self;
  final $Res Function(_DashboardStatsModel) _then;

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalRevenue = null,
    Object? totalOrders = null,
    Object? pendingOrders = null,
    Object? completedOrders = null,
    Object? activeDeliveries = null,
    Object? activeDeliverers = null,
    Object? averageOrderValue = null,
    Object? updatedAt = null,
  }) {
    return _then(_DashboardStatsModel(
      totalRevenue: null == totalRevenue
          ? _self.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      totalOrders: null == totalOrders
          ? _self.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      pendingOrders: null == pendingOrders
          ? _self.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _self.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      activeDeliveries: null == activeDeliveries
          ? _self.activeDeliveries
          : activeDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      activeDeliverers: null == activeDeliverers
          ? _self.activeDeliverers
          : activeDeliverers // ignore: cast_nullable_to_non_nullable
              as int,
      averageOrderValue: null == averageOrderValue
          ? _self.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
