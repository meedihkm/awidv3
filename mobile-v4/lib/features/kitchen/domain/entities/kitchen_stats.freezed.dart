// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KitchenStats {
  DateTime get date;
  int get totalOrders;
  int get completedOrders;
  int get pendingOrders;
  int get cancelledOrders;
  double get averagePreparationTime;
  double get onTimeRate;
  int get delayedOrders;
  Map<String, int>? get ordersByHour;
  Map<String, int>? get ordersByStation;
  Map<String, double>? get averageTimeByStation;
  List<TopProduct>? get topProducts;
  List<StaffPerformance>? get staffPerformance;

  /// Create a copy of KitchenStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KitchenStatsCopyWith<KitchenStats> get copyWith =>
      _$KitchenStatsCopyWithImpl<KitchenStats>(
          this as KitchenStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KitchenStats &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.completedOrders, completedOrders) ||
                other.completedOrders == completedOrders) &&
            (identical(other.pendingOrders, pendingOrders) ||
                other.pendingOrders == pendingOrders) &&
            (identical(other.cancelledOrders, cancelledOrders) ||
                other.cancelledOrders == cancelledOrders) &&
            (identical(other.averagePreparationTime, averagePreparationTime) ||
                other.averagePreparationTime == averagePreparationTime) &&
            (identical(other.onTimeRate, onTimeRate) ||
                other.onTimeRate == onTimeRate) &&
            (identical(other.delayedOrders, delayedOrders) ||
                other.delayedOrders == delayedOrders) &&
            const DeepCollectionEquality()
                .equals(other.ordersByHour, ordersByHour) &&
            const DeepCollectionEquality()
                .equals(other.ordersByStation, ordersByStation) &&
            const DeepCollectionEquality()
                .equals(other.averageTimeByStation, averageTimeByStation) &&
            const DeepCollectionEquality()
                .equals(other.topProducts, topProducts) &&
            const DeepCollectionEquality()
                .equals(other.staffPerformance, staffPerformance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      totalOrders,
      completedOrders,
      pendingOrders,
      cancelledOrders,
      averagePreparationTime,
      onTimeRate,
      delayedOrders,
      const DeepCollectionEquality().hash(ordersByHour),
      const DeepCollectionEquality().hash(ordersByStation),
      const DeepCollectionEquality().hash(averageTimeByStation),
      const DeepCollectionEquality().hash(topProducts),
      const DeepCollectionEquality().hash(staffPerformance));

  @override
  String toString() {
    return 'KitchenStats(date: $date, totalOrders: $totalOrders, completedOrders: $completedOrders, pendingOrders: $pendingOrders, cancelledOrders: $cancelledOrders, averagePreparationTime: $averagePreparationTime, onTimeRate: $onTimeRate, delayedOrders: $delayedOrders, ordersByHour: $ordersByHour, ordersByStation: $ordersByStation, averageTimeByStation: $averageTimeByStation, topProducts: $topProducts, staffPerformance: $staffPerformance)';
  }
}

/// @nodoc
abstract mixin class $KitchenStatsCopyWith<$Res> {
  factory $KitchenStatsCopyWith(
          KitchenStats value, $Res Function(KitchenStats) _then) =
      _$KitchenStatsCopyWithImpl;
  @useResult
  $Res call(
      {DateTime date,
      int totalOrders,
      int completedOrders,
      int pendingOrders,
      int cancelledOrders,
      double averagePreparationTime,
      double onTimeRate,
      int delayedOrders,
      Map<String, int>? ordersByHour,
      Map<String, int>? ordersByStation,
      Map<String, double>? averageTimeByStation,
      List<TopProduct>? topProducts,
      List<StaffPerformance>? staffPerformance});
}

/// @nodoc
class _$KitchenStatsCopyWithImpl<$Res> implements $KitchenStatsCopyWith<$Res> {
  _$KitchenStatsCopyWithImpl(this._self, this._then);

  final KitchenStats _self;
  final $Res Function(KitchenStats) _then;

  /// Create a copy of KitchenStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalOrders = null,
    Object? completedOrders = null,
    Object? pendingOrders = null,
    Object? cancelledOrders = null,
    Object? averagePreparationTime = null,
    Object? onTimeRate = null,
    Object? delayedOrders = null,
    Object? ordersByHour = freezed,
    Object? ordersByStation = freezed,
    Object? averageTimeByStation = freezed,
    Object? topProducts = freezed,
    Object? staffPerformance = freezed,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalOrders: null == totalOrders
          ? _self.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _self.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      pendingOrders: null == pendingOrders
          ? _self.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledOrders: null == cancelledOrders
          ? _self.cancelledOrders
          : cancelledOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averagePreparationTime: null == averagePreparationTime
          ? _self.averagePreparationTime
          : averagePreparationTime // ignore: cast_nullable_to_non_nullable
              as double,
      onTimeRate: null == onTimeRate
          ? _self.onTimeRate
          : onTimeRate // ignore: cast_nullable_to_non_nullable
              as double,
      delayedOrders: null == delayedOrders
          ? _self.delayedOrders
          : delayedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      ordersByHour: freezed == ordersByHour
          ? _self.ordersByHour
          : ordersByHour // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      ordersByStation: freezed == ordersByStation
          ? _self.ordersByStation
          : ordersByStation // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      averageTimeByStation: freezed == averageTimeByStation
          ? _self.averageTimeByStation
          : averageTimeByStation // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      topProducts: freezed == topProducts
          ? _self.topProducts
          : topProducts // ignore: cast_nullable_to_non_nullable
              as List<TopProduct>?,
      staffPerformance: freezed == staffPerformance
          ? _self.staffPerformance
          : staffPerformance // ignore: cast_nullable_to_non_nullable
              as List<StaffPerformance>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [KitchenStats].
extension KitchenStatsPatterns on KitchenStats {
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
    TResult Function(_KitchenStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenStats() when $default != null:
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
    TResult Function(_KitchenStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStats():
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
    TResult? Function(_KitchenStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStats() when $default != null:
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
            DateTime date,
            int totalOrders,
            int completedOrders,
            int pendingOrders,
            int cancelledOrders,
            double averagePreparationTime,
            double onTimeRate,
            int delayedOrders,
            Map<String, int>? ordersByHour,
            Map<String, int>? ordersByStation,
            Map<String, double>? averageTimeByStation,
            List<TopProduct>? topProducts,
            List<StaffPerformance>? staffPerformance)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenStats() when $default != null:
        return $default(
            _that.date,
            _that.totalOrders,
            _that.completedOrders,
            _that.pendingOrders,
            _that.cancelledOrders,
            _that.averagePreparationTime,
            _that.onTimeRate,
            _that.delayedOrders,
            _that.ordersByHour,
            _that.ordersByStation,
            _that.averageTimeByStation,
            _that.topProducts,
            _that.staffPerformance);
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
            DateTime date,
            int totalOrders,
            int completedOrders,
            int pendingOrders,
            int cancelledOrders,
            double averagePreparationTime,
            double onTimeRate,
            int delayedOrders,
            Map<String, int>? ordersByHour,
            Map<String, int>? ordersByStation,
            Map<String, double>? averageTimeByStation,
            List<TopProduct>? topProducts,
            List<StaffPerformance>? staffPerformance)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStats():
        return $default(
            _that.date,
            _that.totalOrders,
            _that.completedOrders,
            _that.pendingOrders,
            _that.cancelledOrders,
            _that.averagePreparationTime,
            _that.onTimeRate,
            _that.delayedOrders,
            _that.ordersByHour,
            _that.ordersByStation,
            _that.averageTimeByStation,
            _that.topProducts,
            _that.staffPerformance);
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
            DateTime date,
            int totalOrders,
            int completedOrders,
            int pendingOrders,
            int cancelledOrders,
            double averagePreparationTime,
            double onTimeRate,
            int delayedOrders,
            Map<String, int>? ordersByHour,
            Map<String, int>? ordersByStation,
            Map<String, double>? averageTimeByStation,
            List<TopProduct>? topProducts,
            List<StaffPerformance>? staffPerformance)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStats() when $default != null:
        return $default(
            _that.date,
            _that.totalOrders,
            _that.completedOrders,
            _that.pendingOrders,
            _that.cancelledOrders,
            _that.averagePreparationTime,
            _that.onTimeRate,
            _that.delayedOrders,
            _that.ordersByHour,
            _that.ordersByStation,
            _that.averageTimeByStation,
            _that.topProducts,
            _that.staffPerformance);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _KitchenStats extends KitchenStats {
  const _KitchenStats(
      {required this.date,
      required this.totalOrders,
      required this.completedOrders,
      required this.pendingOrders,
      required this.cancelledOrders,
      required this.averagePreparationTime,
      required this.onTimeRate,
      required this.delayedOrders,
      final Map<String, int>? ordersByHour,
      final Map<String, int>? ordersByStation,
      final Map<String, double>? averageTimeByStation,
      final List<TopProduct>? topProducts,
      final List<StaffPerformance>? staffPerformance})
      : _ordersByHour = ordersByHour,
        _ordersByStation = ordersByStation,
        _averageTimeByStation = averageTimeByStation,
        _topProducts = topProducts,
        _staffPerformance = staffPerformance,
        super._();

  @override
  final DateTime date;
  @override
  final int totalOrders;
  @override
  final int completedOrders;
  @override
  final int pendingOrders;
  @override
  final int cancelledOrders;
  @override
  final double averagePreparationTime;
  @override
  final double onTimeRate;
  @override
  final int delayedOrders;
  final Map<String, int>? _ordersByHour;
  @override
  Map<String, int>? get ordersByHour {
    final value = _ordersByHour;
    if (value == null) return null;
    if (_ordersByHour is EqualUnmodifiableMapView) return _ordersByHour;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, int>? _ordersByStation;
  @override
  Map<String, int>? get ordersByStation {
    final value = _ordersByStation;
    if (value == null) return null;
    if (_ordersByStation is EqualUnmodifiableMapView) return _ordersByStation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, double>? _averageTimeByStation;
  @override
  Map<String, double>? get averageTimeByStation {
    final value = _averageTimeByStation;
    if (value == null) return null;
    if (_averageTimeByStation is EqualUnmodifiableMapView)
      return _averageTimeByStation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<TopProduct>? _topProducts;
  @override
  List<TopProduct>? get topProducts {
    final value = _topProducts;
    if (value == null) return null;
    if (_topProducts is EqualUnmodifiableListView) return _topProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StaffPerformance>? _staffPerformance;
  @override
  List<StaffPerformance>? get staffPerformance {
    final value = _staffPerformance;
    if (value == null) return null;
    if (_staffPerformance is EqualUnmodifiableListView)
      return _staffPerformance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of KitchenStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KitchenStatsCopyWith<_KitchenStats> get copyWith =>
      __$KitchenStatsCopyWithImpl<_KitchenStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KitchenStats &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.completedOrders, completedOrders) ||
                other.completedOrders == completedOrders) &&
            (identical(other.pendingOrders, pendingOrders) ||
                other.pendingOrders == pendingOrders) &&
            (identical(other.cancelledOrders, cancelledOrders) ||
                other.cancelledOrders == cancelledOrders) &&
            (identical(other.averagePreparationTime, averagePreparationTime) ||
                other.averagePreparationTime == averagePreparationTime) &&
            (identical(other.onTimeRate, onTimeRate) ||
                other.onTimeRate == onTimeRate) &&
            (identical(other.delayedOrders, delayedOrders) ||
                other.delayedOrders == delayedOrders) &&
            const DeepCollectionEquality()
                .equals(other._ordersByHour, _ordersByHour) &&
            const DeepCollectionEquality()
                .equals(other._ordersByStation, _ordersByStation) &&
            const DeepCollectionEquality()
                .equals(other._averageTimeByStation, _averageTimeByStation) &&
            const DeepCollectionEquality()
                .equals(other._topProducts, _topProducts) &&
            const DeepCollectionEquality()
                .equals(other._staffPerformance, _staffPerformance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      totalOrders,
      completedOrders,
      pendingOrders,
      cancelledOrders,
      averagePreparationTime,
      onTimeRate,
      delayedOrders,
      const DeepCollectionEquality().hash(_ordersByHour),
      const DeepCollectionEquality().hash(_ordersByStation),
      const DeepCollectionEquality().hash(_averageTimeByStation),
      const DeepCollectionEquality().hash(_topProducts),
      const DeepCollectionEquality().hash(_staffPerformance));

  @override
  String toString() {
    return 'KitchenStats(date: $date, totalOrders: $totalOrders, completedOrders: $completedOrders, pendingOrders: $pendingOrders, cancelledOrders: $cancelledOrders, averagePreparationTime: $averagePreparationTime, onTimeRate: $onTimeRate, delayedOrders: $delayedOrders, ordersByHour: $ordersByHour, ordersByStation: $ordersByStation, averageTimeByStation: $averageTimeByStation, topProducts: $topProducts, staffPerformance: $staffPerformance)';
  }
}

/// @nodoc
abstract mixin class _$KitchenStatsCopyWith<$Res>
    implements $KitchenStatsCopyWith<$Res> {
  factory _$KitchenStatsCopyWith(
          _KitchenStats value, $Res Function(_KitchenStats) _then) =
      __$KitchenStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime date,
      int totalOrders,
      int completedOrders,
      int pendingOrders,
      int cancelledOrders,
      double averagePreparationTime,
      double onTimeRate,
      int delayedOrders,
      Map<String, int>? ordersByHour,
      Map<String, int>? ordersByStation,
      Map<String, double>? averageTimeByStation,
      List<TopProduct>? topProducts,
      List<StaffPerformance>? staffPerformance});
}

/// @nodoc
class __$KitchenStatsCopyWithImpl<$Res>
    implements _$KitchenStatsCopyWith<$Res> {
  __$KitchenStatsCopyWithImpl(this._self, this._then);

  final _KitchenStats _self;
  final $Res Function(_KitchenStats) _then;

  /// Create a copy of KitchenStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? totalOrders = null,
    Object? completedOrders = null,
    Object? pendingOrders = null,
    Object? cancelledOrders = null,
    Object? averagePreparationTime = null,
    Object? onTimeRate = null,
    Object? delayedOrders = null,
    Object? ordersByHour = freezed,
    Object? ordersByStation = freezed,
    Object? averageTimeByStation = freezed,
    Object? topProducts = freezed,
    Object? staffPerformance = freezed,
  }) {
    return _then(_KitchenStats(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalOrders: null == totalOrders
          ? _self.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _self.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      pendingOrders: null == pendingOrders
          ? _self.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledOrders: null == cancelledOrders
          ? _self.cancelledOrders
          : cancelledOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averagePreparationTime: null == averagePreparationTime
          ? _self.averagePreparationTime
          : averagePreparationTime // ignore: cast_nullable_to_non_nullable
              as double,
      onTimeRate: null == onTimeRate
          ? _self.onTimeRate
          : onTimeRate // ignore: cast_nullable_to_non_nullable
              as double,
      delayedOrders: null == delayedOrders
          ? _self.delayedOrders
          : delayedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      ordersByHour: freezed == ordersByHour
          ? _self._ordersByHour
          : ordersByHour // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      ordersByStation: freezed == ordersByStation
          ? _self._ordersByStation
          : ordersByStation // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      averageTimeByStation: freezed == averageTimeByStation
          ? _self._averageTimeByStation
          : averageTimeByStation // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      topProducts: freezed == topProducts
          ? _self._topProducts
          : topProducts // ignore: cast_nullable_to_non_nullable
              as List<TopProduct>?,
      staffPerformance: freezed == staffPerformance
          ? _self._staffPerformance
          : staffPerformance // ignore: cast_nullable_to_non_nullable
              as List<StaffPerformance>?,
    ));
  }
}

/// @nodoc
mixin _$TopProduct {
  String get productId;
  String get productName;
  int get orderCount;
  int get totalQuantity;
  String? get imageUrl;

  /// Create a copy of TopProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TopProductCopyWith<TopProduct> get copyWith =>
      _$TopProductCopyWithImpl<TopProduct>(this as TopProduct, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TopProduct &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, productId, productName, orderCount, totalQuantity, imageUrl);

  @override
  String toString() {
    return 'TopProduct(productId: $productId, productName: $productName, orderCount: $orderCount, totalQuantity: $totalQuantity, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $TopProductCopyWith<$Res> {
  factory $TopProductCopyWith(
          TopProduct value, $Res Function(TopProduct) _then) =
      _$TopProductCopyWithImpl;
  @useResult
  $Res call(
      {String productId,
      String productName,
      int orderCount,
      int totalQuantity,
      String? imageUrl});
}

/// @nodoc
class _$TopProductCopyWithImpl<$Res> implements $TopProductCopyWith<$Res> {
  _$TopProductCopyWithImpl(this._self, this._then);

  final TopProduct _self;
  final $Res Function(TopProduct) _then;

  /// Create a copy of TopProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? orderCount = null,
    Object? totalQuantity = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_self.copyWith(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      orderCount: null == orderCount
          ? _self.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuantity: null == totalQuantity
          ? _self.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TopProduct].
extension TopProductPatterns on TopProduct {
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
    TResult Function(_TopProduct value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopProduct() when $default != null:
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
    TResult Function(_TopProduct value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopProduct():
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
    TResult? Function(_TopProduct value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopProduct() when $default != null:
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
    TResult Function(String productId, String productName, int orderCount,
            int totalQuantity, String? imageUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopProduct() when $default != null:
        return $default(_that.productId, _that.productName, _that.orderCount,
            _that.totalQuantity, _that.imageUrl);
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
    TResult Function(String productId, String productName, int orderCount,
            int totalQuantity, String? imageUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopProduct():
        return $default(_that.productId, _that.productName, _that.orderCount,
            _that.totalQuantity, _that.imageUrl);
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
    TResult? Function(String productId, String productName, int orderCount,
            int totalQuantity, String? imageUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopProduct() when $default != null:
        return $default(_that.productId, _that.productName, _that.orderCount,
            _that.totalQuantity, _that.imageUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TopProduct implements TopProduct {
  const _TopProduct(
      {required this.productId,
      required this.productName,
      required this.orderCount,
      required this.totalQuantity,
      this.imageUrl});

  @override
  final String productId;
  @override
  final String productName;
  @override
  final int orderCount;
  @override
  final int totalQuantity;
  @override
  final String? imageUrl;

  /// Create a copy of TopProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TopProductCopyWith<_TopProduct> get copyWith =>
      __$TopProductCopyWithImpl<_TopProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TopProduct &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, productId, productName, orderCount, totalQuantity, imageUrl);

  @override
  String toString() {
    return 'TopProduct(productId: $productId, productName: $productName, orderCount: $orderCount, totalQuantity: $totalQuantity, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$TopProductCopyWith<$Res>
    implements $TopProductCopyWith<$Res> {
  factory _$TopProductCopyWith(
          _TopProduct value, $Res Function(_TopProduct) _then) =
      __$TopProductCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String productId,
      String productName,
      int orderCount,
      int totalQuantity,
      String? imageUrl});
}

/// @nodoc
class __$TopProductCopyWithImpl<$Res> implements _$TopProductCopyWith<$Res> {
  __$TopProductCopyWithImpl(this._self, this._then);

  final _TopProduct _self;
  final $Res Function(_TopProduct) _then;

  /// Create a copy of TopProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? orderCount = null,
    Object? totalQuantity = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_TopProduct(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      orderCount: null == orderCount
          ? _self.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuantity: null == totalQuantity
          ? _self.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$StaffPerformance {
  String get staffId;
  String get staffName;
  int get ordersCompleted;
  double get averageTime;
  double get qualityScore;
  String? get avatarUrl;

  /// Create a copy of StaffPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StaffPerformanceCopyWith<StaffPerformance> get copyWith =>
      _$StaffPerformanceCopyWithImpl<StaffPerformance>(
          this as StaffPerformance, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StaffPerformance &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.staffName, staffName) ||
                other.staffName == staffName) &&
            (identical(other.ordersCompleted, ordersCompleted) ||
                other.ordersCompleted == ordersCompleted) &&
            (identical(other.averageTime, averageTime) ||
                other.averageTime == averageTime) &&
            (identical(other.qualityScore, qualityScore) ||
                other.qualityScore == qualityScore) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId, staffName,
      ordersCompleted, averageTime, qualityScore, avatarUrl);

  @override
  String toString() {
    return 'StaffPerformance(staffId: $staffId, staffName: $staffName, ordersCompleted: $ordersCompleted, averageTime: $averageTime, qualityScore: $qualityScore, avatarUrl: $avatarUrl)';
  }
}

/// @nodoc
abstract mixin class $StaffPerformanceCopyWith<$Res> {
  factory $StaffPerformanceCopyWith(
          StaffPerformance value, $Res Function(StaffPerformance) _then) =
      _$StaffPerformanceCopyWithImpl;
  @useResult
  $Res call(
      {String staffId,
      String staffName,
      int ordersCompleted,
      double averageTime,
      double qualityScore,
      String? avatarUrl});
}

/// @nodoc
class _$StaffPerformanceCopyWithImpl<$Res>
    implements $StaffPerformanceCopyWith<$Res> {
  _$StaffPerformanceCopyWithImpl(this._self, this._then);

  final StaffPerformance _self;
  final $Res Function(StaffPerformance) _then;

  /// Create a copy of StaffPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? staffName = null,
    Object? ordersCompleted = null,
    Object? averageTime = null,
    Object? qualityScore = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(_self.copyWith(
      staffId: null == staffId
          ? _self.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      staffName: null == staffName
          ? _self.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String,
      ordersCompleted: null == ordersCompleted
          ? _self.ordersCompleted
          : ordersCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      averageTime: null == averageTime
          ? _self.averageTime
          : averageTime // ignore: cast_nullable_to_non_nullable
              as double,
      qualityScore: null == qualityScore
          ? _self.qualityScore
          : qualityScore // ignore: cast_nullable_to_non_nullable
              as double,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [StaffPerformance].
extension StaffPerformancePatterns on StaffPerformance {
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
    TResult Function(_StaffPerformance value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StaffPerformance() when $default != null:
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
    TResult Function(_StaffPerformance value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StaffPerformance():
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
    TResult? Function(_StaffPerformance value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StaffPerformance() when $default != null:
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
    TResult Function(String staffId, String staffName, int ordersCompleted,
            double averageTime, double qualityScore, String? avatarUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StaffPerformance() when $default != null:
        return $default(_that.staffId, _that.staffName, _that.ordersCompleted,
            _that.averageTime, _that.qualityScore, _that.avatarUrl);
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
    TResult Function(String staffId, String staffName, int ordersCompleted,
            double averageTime, double qualityScore, String? avatarUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StaffPerformance():
        return $default(_that.staffId, _that.staffName, _that.ordersCompleted,
            _that.averageTime, _that.qualityScore, _that.avatarUrl);
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
    TResult? Function(String staffId, String staffName, int ordersCompleted,
            double averageTime, double qualityScore, String? avatarUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StaffPerformance() when $default != null:
        return $default(_that.staffId, _that.staffName, _that.ordersCompleted,
            _that.averageTime, _that.qualityScore, _that.avatarUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StaffPerformance extends StaffPerformance {
  const _StaffPerformance(
      {required this.staffId,
      required this.staffName,
      required this.ordersCompleted,
      required this.averageTime,
      required this.qualityScore,
      this.avatarUrl})
      : super._();

  @override
  final String staffId;
  @override
  final String staffName;
  @override
  final int ordersCompleted;
  @override
  final double averageTime;
  @override
  final double qualityScore;
  @override
  final String? avatarUrl;

  /// Create a copy of StaffPerformance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StaffPerformanceCopyWith<_StaffPerformance> get copyWith =>
      __$StaffPerformanceCopyWithImpl<_StaffPerformance>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StaffPerformance &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.staffName, staffName) ||
                other.staffName == staffName) &&
            (identical(other.ordersCompleted, ordersCompleted) ||
                other.ordersCompleted == ordersCompleted) &&
            (identical(other.averageTime, averageTime) ||
                other.averageTime == averageTime) &&
            (identical(other.qualityScore, qualityScore) ||
                other.qualityScore == qualityScore) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId, staffName,
      ordersCompleted, averageTime, qualityScore, avatarUrl);

  @override
  String toString() {
    return 'StaffPerformance(staffId: $staffId, staffName: $staffName, ordersCompleted: $ordersCompleted, averageTime: $averageTime, qualityScore: $qualityScore, avatarUrl: $avatarUrl)';
  }
}

/// @nodoc
abstract mixin class _$StaffPerformanceCopyWith<$Res>
    implements $StaffPerformanceCopyWith<$Res> {
  factory _$StaffPerformanceCopyWith(
          _StaffPerformance value, $Res Function(_StaffPerformance) _then) =
      __$StaffPerformanceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String staffId,
      String staffName,
      int ordersCompleted,
      double averageTime,
      double qualityScore,
      String? avatarUrl});
}

/// @nodoc
class __$StaffPerformanceCopyWithImpl<$Res>
    implements _$StaffPerformanceCopyWith<$Res> {
  __$StaffPerformanceCopyWithImpl(this._self, this._then);

  final _StaffPerformance _self;
  final $Res Function(_StaffPerformance) _then;

  /// Create a copy of StaffPerformance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? staffId = null,
    Object? staffName = null,
    Object? ordersCompleted = null,
    Object? averageTime = null,
    Object? qualityScore = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(_StaffPerformance(
      staffId: null == staffId
          ? _self.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      staffName: null == staffName
          ? _self.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String,
      ordersCompleted: null == ordersCompleted
          ? _self.ordersCompleted
          : ordersCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      averageTime: null == averageTime
          ? _self.averageTime
          : averageTime // ignore: cast_nullable_to_non_nullable
              as double,
      qualityScore: null == qualityScore
          ? _self.qualityScore
          : qualityScore // ignore: cast_nullable_to_non_nullable
              as double,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$HourlyStats {
  int get hour;
  int get orderCount;
  double get averageTime;
  int get delayedCount;

  /// Create a copy of HourlyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HourlyStatsCopyWith<HourlyStats> get copyWith =>
      _$HourlyStatsCopyWithImpl<HourlyStats>(this as HourlyStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HourlyStats &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.averageTime, averageTime) ||
                other.averageTime == averageTime) &&
            (identical(other.delayedCount, delayedCount) ||
                other.delayedCount == delayedCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, hour, orderCount, averageTime, delayedCount);

  @override
  String toString() {
    return 'HourlyStats(hour: $hour, orderCount: $orderCount, averageTime: $averageTime, delayedCount: $delayedCount)';
  }
}

/// @nodoc
abstract mixin class $HourlyStatsCopyWith<$Res> {
  factory $HourlyStatsCopyWith(
          HourlyStats value, $Res Function(HourlyStats) _then) =
      _$HourlyStatsCopyWithImpl;
  @useResult
  $Res call({int hour, int orderCount, double averageTime, int delayedCount});
}

/// @nodoc
class _$HourlyStatsCopyWithImpl<$Res> implements $HourlyStatsCopyWith<$Res> {
  _$HourlyStatsCopyWithImpl(this._self, this._then);

  final HourlyStats _self;
  final $Res Function(HourlyStats) _then;

  /// Create a copy of HourlyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? orderCount = null,
    Object? averageTime = null,
    Object? delayedCount = null,
  }) {
    return _then(_self.copyWith(
      hour: null == hour
          ? _self.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      orderCount: null == orderCount
          ? _self.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageTime: null == averageTime
          ? _self.averageTime
          : averageTime // ignore: cast_nullable_to_non_nullable
              as double,
      delayedCount: null == delayedCount
          ? _self.delayedCount
          : delayedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [HourlyStats].
extension HourlyStatsPatterns on HourlyStats {
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
    TResult Function(_HourlyStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HourlyStats() when $default != null:
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
    TResult Function(_HourlyStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HourlyStats():
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
    TResult? Function(_HourlyStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HourlyStats() when $default != null:
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
            int hour, int orderCount, double averageTime, int delayedCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HourlyStats() when $default != null:
        return $default(_that.hour, _that.orderCount, _that.averageTime,
            _that.delayedCount);
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
            int hour, int orderCount, double averageTime, int delayedCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HourlyStats():
        return $default(_that.hour, _that.orderCount, _that.averageTime,
            _that.delayedCount);
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
            int hour, int orderCount, double averageTime, int delayedCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HourlyStats() when $default != null:
        return $default(_that.hour, _that.orderCount, _that.averageTime,
            _that.delayedCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HourlyStats extends HourlyStats {
  const _HourlyStats(
      {required this.hour,
      required this.orderCount,
      required this.averageTime,
      required this.delayedCount})
      : super._();

  @override
  final int hour;
  @override
  final int orderCount;
  @override
  final double averageTime;
  @override
  final int delayedCount;

  /// Create a copy of HourlyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HourlyStatsCopyWith<_HourlyStats> get copyWith =>
      __$HourlyStatsCopyWithImpl<_HourlyStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HourlyStats &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.averageTime, averageTime) ||
                other.averageTime == averageTime) &&
            (identical(other.delayedCount, delayedCount) ||
                other.delayedCount == delayedCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, hour, orderCount, averageTime, delayedCount);

  @override
  String toString() {
    return 'HourlyStats(hour: $hour, orderCount: $orderCount, averageTime: $averageTime, delayedCount: $delayedCount)';
  }
}

/// @nodoc
abstract mixin class _$HourlyStatsCopyWith<$Res>
    implements $HourlyStatsCopyWith<$Res> {
  factory _$HourlyStatsCopyWith(
          _HourlyStats value, $Res Function(_HourlyStats) _then) =
      __$HourlyStatsCopyWithImpl;
  @override
  @useResult
  $Res call({int hour, int orderCount, double averageTime, int delayedCount});
}

/// @nodoc
class __$HourlyStatsCopyWithImpl<$Res> implements _$HourlyStatsCopyWith<$Res> {
  __$HourlyStatsCopyWithImpl(this._self, this._then);

  final _HourlyStats _self;
  final $Res Function(_HourlyStats) _then;

  /// Create a copy of HourlyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hour = null,
    Object? orderCount = null,
    Object? averageTime = null,
    Object? delayedCount = null,
  }) {
    return _then(_HourlyStats(
      hour: null == hour
          ? _self.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      orderCount: null == orderCount
          ? _self.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageTime: null == averageTime
          ? _self.averageTime
          : averageTime // ignore: cast_nullable_to_non_nullable
              as double,
      delayedCount: null == delayedCount
          ? _self.delayedCount
          : delayedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$PeriodStats {
  DateTime get startDate;
  DateTime get endDate;
  int get totalOrders;
  int get completedOrders;
  double get averagePreparationTime;
  double get revenue;
  List<DailyStats>? get dailyStats;

  /// Create a copy of PeriodStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PeriodStatsCopyWith<PeriodStats> get copyWith =>
      _$PeriodStatsCopyWithImpl<PeriodStats>(this as PeriodStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PeriodStats &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.completedOrders, completedOrders) ||
                other.completedOrders == completedOrders) &&
            (identical(other.averagePreparationTime, averagePreparationTime) ||
                other.averagePreparationTime == averagePreparationTime) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            const DeepCollectionEquality()
                .equals(other.dailyStats, dailyStats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      startDate,
      endDate,
      totalOrders,
      completedOrders,
      averagePreparationTime,
      revenue,
      const DeepCollectionEquality().hash(dailyStats));

  @override
  String toString() {
    return 'PeriodStats(startDate: $startDate, endDate: $endDate, totalOrders: $totalOrders, completedOrders: $completedOrders, averagePreparationTime: $averagePreparationTime, revenue: $revenue, dailyStats: $dailyStats)';
  }
}

/// @nodoc
abstract mixin class $PeriodStatsCopyWith<$Res> {
  factory $PeriodStatsCopyWith(
          PeriodStats value, $Res Function(PeriodStats) _then) =
      _$PeriodStatsCopyWithImpl;
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      int totalOrders,
      int completedOrders,
      double averagePreparationTime,
      double revenue,
      List<DailyStats>? dailyStats});
}

/// @nodoc
class _$PeriodStatsCopyWithImpl<$Res> implements $PeriodStatsCopyWith<$Res> {
  _$PeriodStatsCopyWithImpl(this._self, this._then);

  final PeriodStats _self;
  final $Res Function(PeriodStats) _then;

  /// Create a copy of PeriodStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? totalOrders = null,
    Object? completedOrders = null,
    Object? averagePreparationTime = null,
    Object? revenue = null,
    Object? dailyStats = freezed,
  }) {
    return _then(_self.copyWith(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalOrders: null == totalOrders
          ? _self.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _self.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averagePreparationTime: null == averagePreparationTime
          ? _self.averagePreparationTime
          : averagePreparationTime // ignore: cast_nullable_to_non_nullable
              as double,
      revenue: null == revenue
          ? _self.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      dailyStats: freezed == dailyStats
          ? _self.dailyStats
          : dailyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyStats>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PeriodStats].
extension PeriodStatsPatterns on PeriodStats {
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
    TResult Function(_PeriodStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PeriodStats() when $default != null:
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
    TResult Function(_PeriodStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PeriodStats():
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
    TResult? Function(_PeriodStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PeriodStats() when $default != null:
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
            DateTime startDate,
            DateTime endDate,
            int totalOrders,
            int completedOrders,
            double averagePreparationTime,
            double revenue,
            List<DailyStats>? dailyStats)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PeriodStats() when $default != null:
        return $default(
            _that.startDate,
            _that.endDate,
            _that.totalOrders,
            _that.completedOrders,
            _that.averagePreparationTime,
            _that.revenue,
            _that.dailyStats);
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
            DateTime startDate,
            DateTime endDate,
            int totalOrders,
            int completedOrders,
            double averagePreparationTime,
            double revenue,
            List<DailyStats>? dailyStats)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PeriodStats():
        return $default(
            _that.startDate,
            _that.endDate,
            _that.totalOrders,
            _that.completedOrders,
            _that.averagePreparationTime,
            _that.revenue,
            _that.dailyStats);
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
            DateTime startDate,
            DateTime endDate,
            int totalOrders,
            int completedOrders,
            double averagePreparationTime,
            double revenue,
            List<DailyStats>? dailyStats)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PeriodStats() when $default != null:
        return $default(
            _that.startDate,
            _that.endDate,
            _that.totalOrders,
            _that.completedOrders,
            _that.averagePreparationTime,
            _that.revenue,
            _that.dailyStats);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PeriodStats extends PeriodStats {
  const _PeriodStats(
      {required this.startDate,
      required this.endDate,
      required this.totalOrders,
      required this.completedOrders,
      required this.averagePreparationTime,
      required this.revenue,
      final List<DailyStats>? dailyStats})
      : _dailyStats = dailyStats,
        super._();

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final int totalOrders;
  @override
  final int completedOrders;
  @override
  final double averagePreparationTime;
  @override
  final double revenue;
  final List<DailyStats>? _dailyStats;
  @override
  List<DailyStats>? get dailyStats {
    final value = _dailyStats;
    if (value == null) return null;
    if (_dailyStats is EqualUnmodifiableListView) return _dailyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PeriodStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PeriodStatsCopyWith<_PeriodStats> get copyWith =>
      __$PeriodStatsCopyWithImpl<_PeriodStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PeriodStats &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.completedOrders, completedOrders) ||
                other.completedOrders == completedOrders) &&
            (identical(other.averagePreparationTime, averagePreparationTime) ||
                other.averagePreparationTime == averagePreparationTime) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            const DeepCollectionEquality()
                .equals(other._dailyStats, _dailyStats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      startDate,
      endDate,
      totalOrders,
      completedOrders,
      averagePreparationTime,
      revenue,
      const DeepCollectionEquality().hash(_dailyStats));

  @override
  String toString() {
    return 'PeriodStats(startDate: $startDate, endDate: $endDate, totalOrders: $totalOrders, completedOrders: $completedOrders, averagePreparationTime: $averagePreparationTime, revenue: $revenue, dailyStats: $dailyStats)';
  }
}

/// @nodoc
abstract mixin class _$PeriodStatsCopyWith<$Res>
    implements $PeriodStatsCopyWith<$Res> {
  factory _$PeriodStatsCopyWith(
          _PeriodStats value, $Res Function(_PeriodStats) _then) =
      __$PeriodStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      int totalOrders,
      int completedOrders,
      double averagePreparationTime,
      double revenue,
      List<DailyStats>? dailyStats});
}

/// @nodoc
class __$PeriodStatsCopyWithImpl<$Res> implements _$PeriodStatsCopyWith<$Res> {
  __$PeriodStatsCopyWithImpl(this._self, this._then);

  final _PeriodStats _self;
  final $Res Function(_PeriodStats) _then;

  /// Create a copy of PeriodStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? totalOrders = null,
    Object? completedOrders = null,
    Object? averagePreparationTime = null,
    Object? revenue = null,
    Object? dailyStats = freezed,
  }) {
    return _then(_PeriodStats(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalOrders: null == totalOrders
          ? _self.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _self.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averagePreparationTime: null == averagePreparationTime
          ? _self.averagePreparationTime
          : averagePreparationTime // ignore: cast_nullable_to_non_nullable
              as double,
      revenue: null == revenue
          ? _self.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      dailyStats: freezed == dailyStats
          ? _self._dailyStats
          : dailyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyStats>?,
    ));
  }
}

/// @nodoc
mixin _$DailyStats {
  DateTime get date;
  int get orderCount;
  int get completedCount;
  double get averageTime;
  double get revenue;

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyStatsCopyWith<DailyStats> get copyWith =>
      _$DailyStatsCopyWithImpl<DailyStats>(this as DailyStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyStats &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.averageTime, averageTime) ||
                other.averageTime == averageTime) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, date, orderCount, completedCount, averageTime, revenue);

  @override
  String toString() {
    return 'DailyStats(date: $date, orderCount: $orderCount, completedCount: $completedCount, averageTime: $averageTime, revenue: $revenue)';
  }
}

/// @nodoc
abstract mixin class $DailyStatsCopyWith<$Res> {
  factory $DailyStatsCopyWith(
          DailyStats value, $Res Function(DailyStats) _then) =
      _$DailyStatsCopyWithImpl;
  @useResult
  $Res call(
      {DateTime date,
      int orderCount,
      int completedCount,
      double averageTime,
      double revenue});
}

/// @nodoc
class _$DailyStatsCopyWithImpl<$Res> implements $DailyStatsCopyWith<$Res> {
  _$DailyStatsCopyWithImpl(this._self, this._then);

  final DailyStats _self;
  final $Res Function(DailyStats) _then;

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? orderCount = null,
    Object? completedCount = null,
    Object? averageTime = null,
    Object? revenue = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderCount: null == orderCount
          ? _self.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedCount: null == completedCount
          ? _self.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageTime: null == averageTime
          ? _self.averageTime
          : averageTime // ignore: cast_nullable_to_non_nullable
              as double,
      revenue: null == revenue
          ? _self.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [DailyStats].
extension DailyStatsPatterns on DailyStats {
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
    TResult Function(_DailyStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyStats() when $default != null:
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
    TResult Function(_DailyStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyStats():
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
    TResult? Function(_DailyStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyStats() when $default != null:
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
    TResult Function(DateTime date, int orderCount, int completedCount,
            double averageTime, double revenue)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyStats() when $default != null:
        return $default(_that.date, _that.orderCount, _that.completedCount,
            _that.averageTime, _that.revenue);
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
    TResult Function(DateTime date, int orderCount, int completedCount,
            double averageTime, double revenue)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyStats():
        return $default(_that.date, _that.orderCount, _that.completedCount,
            _that.averageTime, _that.revenue);
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
    TResult? Function(DateTime date, int orderCount, int completedCount,
            double averageTime, double revenue)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyStats() when $default != null:
        return $default(_that.date, _that.orderCount, _that.completedCount,
            _that.averageTime, _that.revenue);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DailyStats extends DailyStats {
  const _DailyStats(
      {required this.date,
      required this.orderCount,
      required this.completedCount,
      required this.averageTime,
      required this.revenue})
      : super._();

  @override
  final DateTime date;
  @override
  final int orderCount;
  @override
  final int completedCount;
  @override
  final double averageTime;
  @override
  final double revenue;

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyStatsCopyWith<_DailyStats> get copyWith =>
      __$DailyStatsCopyWithImpl<_DailyStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyStats &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.averageTime, averageTime) ||
                other.averageTime == averageTime) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, date, orderCount, completedCount, averageTime, revenue);

  @override
  String toString() {
    return 'DailyStats(date: $date, orderCount: $orderCount, completedCount: $completedCount, averageTime: $averageTime, revenue: $revenue)';
  }
}

/// @nodoc
abstract mixin class _$DailyStatsCopyWith<$Res>
    implements $DailyStatsCopyWith<$Res> {
  factory _$DailyStatsCopyWith(
          _DailyStats value, $Res Function(_DailyStats) _then) =
      __$DailyStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime date,
      int orderCount,
      int completedCount,
      double averageTime,
      double revenue});
}

/// @nodoc
class __$DailyStatsCopyWithImpl<$Res> implements _$DailyStatsCopyWith<$Res> {
  __$DailyStatsCopyWithImpl(this._self, this._then);

  final _DailyStats _self;
  final $Res Function(_DailyStats) _then;

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? orderCount = null,
    Object? completedCount = null,
    Object? averageTime = null,
    Object? revenue = null,
  }) {
    return _then(_DailyStats(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderCount: null == orderCount
          ? _self.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedCount: null == completedCount
          ? _self.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageTime: null == averageTime
          ? _self.averageTime
          : averageTime // ignore: cast_nullable_to_non_nullable
              as double,
      revenue: null == revenue
          ? _self.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
