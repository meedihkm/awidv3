// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KitchenStatsModel {
  String get date;
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
  List<TopProductModel>? get topProducts;
  List<StaffPerformanceModel>? get staffPerformance;

  /// Create a copy of KitchenStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KitchenStatsModelCopyWith<KitchenStatsModel> get copyWith =>
      _$KitchenStatsModelCopyWithImpl<KitchenStatsModel>(
          this as KitchenStatsModel, _$identity);

  /// Serializes this KitchenStatsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KitchenStatsModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'KitchenStatsModel(date: $date, totalOrders: $totalOrders, completedOrders: $completedOrders, pendingOrders: $pendingOrders, cancelledOrders: $cancelledOrders, averagePreparationTime: $averagePreparationTime, onTimeRate: $onTimeRate, delayedOrders: $delayedOrders, ordersByHour: $ordersByHour, ordersByStation: $ordersByStation, averageTimeByStation: $averageTimeByStation, topProducts: $topProducts, staffPerformance: $staffPerformance)';
  }
}

/// @nodoc
abstract mixin class $KitchenStatsModelCopyWith<$Res> {
  factory $KitchenStatsModelCopyWith(
          KitchenStatsModel value, $Res Function(KitchenStatsModel) _then) =
      _$KitchenStatsModelCopyWithImpl;
  @useResult
  $Res call(
      {String date,
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
      List<TopProductModel>? topProducts,
      List<StaffPerformanceModel>? staffPerformance});
}

/// @nodoc
class _$KitchenStatsModelCopyWithImpl<$Res>
    implements $KitchenStatsModelCopyWith<$Res> {
  _$KitchenStatsModelCopyWithImpl(this._self, this._then);

  final KitchenStatsModel _self;
  final $Res Function(KitchenStatsModel) _then;

  /// Create a copy of KitchenStatsModel
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
              as String,
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
              as List<TopProductModel>?,
      staffPerformance: freezed == staffPerformance
          ? _self.staffPerformance
          : staffPerformance // ignore: cast_nullable_to_non_nullable
              as List<StaffPerformanceModel>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [KitchenStatsModel].
extension KitchenStatsModelPatterns on KitchenStatsModel {
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
    TResult Function(_KitchenStatsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenStatsModel() when $default != null:
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
    TResult Function(_KitchenStatsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStatsModel():
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
    TResult? Function(_KitchenStatsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStatsModel() when $default != null:
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
            String date,
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
            List<TopProductModel>? topProducts,
            List<StaffPerformanceModel>? staffPerformance)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenStatsModel() when $default != null:
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
            String date,
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
            List<TopProductModel>? topProducts,
            List<StaffPerformanceModel>? staffPerformance)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStatsModel():
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
            String date,
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
            List<TopProductModel>? topProducts,
            List<StaffPerformanceModel>? staffPerformance)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenStatsModel() when $default != null:
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
@JsonSerializable()
class _KitchenStatsModel extends KitchenStatsModel {
  const _KitchenStatsModel(
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
      final List<TopProductModel>? topProducts,
      final List<StaffPerformanceModel>? staffPerformance})
      : _ordersByHour = ordersByHour,
        _ordersByStation = ordersByStation,
        _averageTimeByStation = averageTimeByStation,
        _topProducts = topProducts,
        _staffPerformance = staffPerformance,
        super._();
  factory _KitchenStatsModel.fromJson(Map<String, dynamic> json) =>
      _$KitchenStatsModelFromJson(json);

  @override
  final String date;
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

  final List<TopProductModel>? _topProducts;
  @override
  List<TopProductModel>? get topProducts {
    final value = _topProducts;
    if (value == null) return null;
    if (_topProducts is EqualUnmodifiableListView) return _topProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StaffPerformanceModel>? _staffPerformance;
  @override
  List<StaffPerformanceModel>? get staffPerformance {
    final value = _staffPerformance;
    if (value == null) return null;
    if (_staffPerformance is EqualUnmodifiableListView)
      return _staffPerformance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of KitchenStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KitchenStatsModelCopyWith<_KitchenStatsModel> get copyWith =>
      __$KitchenStatsModelCopyWithImpl<_KitchenStatsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KitchenStatsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KitchenStatsModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'KitchenStatsModel(date: $date, totalOrders: $totalOrders, completedOrders: $completedOrders, pendingOrders: $pendingOrders, cancelledOrders: $cancelledOrders, averagePreparationTime: $averagePreparationTime, onTimeRate: $onTimeRate, delayedOrders: $delayedOrders, ordersByHour: $ordersByHour, ordersByStation: $ordersByStation, averageTimeByStation: $averageTimeByStation, topProducts: $topProducts, staffPerformance: $staffPerformance)';
  }
}

/// @nodoc
abstract mixin class _$KitchenStatsModelCopyWith<$Res>
    implements $KitchenStatsModelCopyWith<$Res> {
  factory _$KitchenStatsModelCopyWith(
          _KitchenStatsModel value, $Res Function(_KitchenStatsModel) _then) =
      __$KitchenStatsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String date,
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
      List<TopProductModel>? topProducts,
      List<StaffPerformanceModel>? staffPerformance});
}

/// @nodoc
class __$KitchenStatsModelCopyWithImpl<$Res>
    implements _$KitchenStatsModelCopyWith<$Res> {
  __$KitchenStatsModelCopyWithImpl(this._self, this._then);

  final _KitchenStatsModel _self;
  final $Res Function(_KitchenStatsModel) _then;

  /// Create a copy of KitchenStatsModel
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
    return _then(_KitchenStatsModel(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<TopProductModel>?,
      staffPerformance: freezed == staffPerformance
          ? _self._staffPerformance
          : staffPerformance // ignore: cast_nullable_to_non_nullable
              as List<StaffPerformanceModel>?,
    ));
  }
}

/// @nodoc
mixin _$TopProductModel {
  String get productId;
  String get productName;
  int get orderCount;
  int get totalQuantity;
  String? get imageUrl;

  /// Create a copy of TopProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TopProductModelCopyWith<TopProductModel> get copyWith =>
      _$TopProductModelCopyWithImpl<TopProductModel>(
          this as TopProductModel, _$identity);

  /// Serializes this TopProductModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TopProductModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, productName, orderCount, totalQuantity, imageUrl);

  @override
  String toString() {
    return 'TopProductModel(productId: $productId, productName: $productName, orderCount: $orderCount, totalQuantity: $totalQuantity, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $TopProductModelCopyWith<$Res> {
  factory $TopProductModelCopyWith(
          TopProductModel value, $Res Function(TopProductModel) _then) =
      _$TopProductModelCopyWithImpl;
  @useResult
  $Res call(
      {String productId,
      String productName,
      int orderCount,
      int totalQuantity,
      String? imageUrl});
}

/// @nodoc
class _$TopProductModelCopyWithImpl<$Res>
    implements $TopProductModelCopyWith<$Res> {
  _$TopProductModelCopyWithImpl(this._self, this._then);

  final TopProductModel _self;
  final $Res Function(TopProductModel) _then;

  /// Create a copy of TopProductModel
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

/// Adds pattern-matching-related methods to [TopProductModel].
extension TopProductModelPatterns on TopProductModel {
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
    TResult Function(_TopProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopProductModel() when $default != null:
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
    TResult Function(_TopProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopProductModel():
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
    TResult? Function(_TopProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopProductModel() when $default != null:
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
      case _TopProductModel() when $default != null:
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
      case _TopProductModel():
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
      case _TopProductModel() when $default != null:
        return $default(_that.productId, _that.productName, _that.orderCount,
            _that.totalQuantity, _that.imageUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TopProductModel extends TopProductModel {
  const _TopProductModel(
      {required this.productId,
      required this.productName,
      required this.orderCount,
      required this.totalQuantity,
      this.imageUrl})
      : super._();
  factory _TopProductModel.fromJson(Map<String, dynamic> json) =>
      _$TopProductModelFromJson(json);

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

  /// Create a copy of TopProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TopProductModelCopyWith<_TopProductModel> get copyWith =>
      __$TopProductModelCopyWithImpl<_TopProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TopProductModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TopProductModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, productName, orderCount, totalQuantity, imageUrl);

  @override
  String toString() {
    return 'TopProductModel(productId: $productId, productName: $productName, orderCount: $orderCount, totalQuantity: $totalQuantity, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$TopProductModelCopyWith<$Res>
    implements $TopProductModelCopyWith<$Res> {
  factory _$TopProductModelCopyWith(
          _TopProductModel value, $Res Function(_TopProductModel) _then) =
      __$TopProductModelCopyWithImpl;
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
class __$TopProductModelCopyWithImpl<$Res>
    implements _$TopProductModelCopyWith<$Res> {
  __$TopProductModelCopyWithImpl(this._self, this._then);

  final _TopProductModel _self;
  final $Res Function(_TopProductModel) _then;

  /// Create a copy of TopProductModel
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
    return _then(_TopProductModel(
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
mixin _$StaffPerformanceModel {
  String get staffId;
  String get staffName;
  int get ordersCompleted;
  double get averageTime;
  double get qualityScore;
  String? get avatarUrl;

  /// Create a copy of StaffPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StaffPerformanceModelCopyWith<StaffPerformanceModel> get copyWith =>
      _$StaffPerformanceModelCopyWithImpl<StaffPerformanceModel>(
          this as StaffPerformanceModel, _$identity);

  /// Serializes this StaffPerformanceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StaffPerformanceModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, staffId, staffName,
      ordersCompleted, averageTime, qualityScore, avatarUrl);

  @override
  String toString() {
    return 'StaffPerformanceModel(staffId: $staffId, staffName: $staffName, ordersCompleted: $ordersCompleted, averageTime: $averageTime, qualityScore: $qualityScore, avatarUrl: $avatarUrl)';
  }
}

/// @nodoc
abstract mixin class $StaffPerformanceModelCopyWith<$Res> {
  factory $StaffPerformanceModelCopyWith(StaffPerformanceModel value,
          $Res Function(StaffPerformanceModel) _then) =
      _$StaffPerformanceModelCopyWithImpl;
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
class _$StaffPerformanceModelCopyWithImpl<$Res>
    implements $StaffPerformanceModelCopyWith<$Res> {
  _$StaffPerformanceModelCopyWithImpl(this._self, this._then);

  final StaffPerformanceModel _self;
  final $Res Function(StaffPerformanceModel) _then;

  /// Create a copy of StaffPerformanceModel
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

/// Adds pattern-matching-related methods to [StaffPerformanceModel].
extension StaffPerformanceModelPatterns on StaffPerformanceModel {
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
    TResult Function(_StaffPerformanceModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StaffPerformanceModel() when $default != null:
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
    TResult Function(_StaffPerformanceModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StaffPerformanceModel():
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
    TResult? Function(_StaffPerformanceModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StaffPerformanceModel() when $default != null:
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
      case _StaffPerformanceModel() when $default != null:
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
      case _StaffPerformanceModel():
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
      case _StaffPerformanceModel() when $default != null:
        return $default(_that.staffId, _that.staffName, _that.ordersCompleted,
            _that.averageTime, _that.qualityScore, _that.avatarUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StaffPerformanceModel extends StaffPerformanceModel {
  const _StaffPerformanceModel(
      {required this.staffId,
      required this.staffName,
      required this.ordersCompleted,
      required this.averageTime,
      required this.qualityScore,
      this.avatarUrl})
      : super._();
  factory _StaffPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$StaffPerformanceModelFromJson(json);

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

  /// Create a copy of StaffPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StaffPerformanceModelCopyWith<_StaffPerformanceModel> get copyWith =>
      __$StaffPerformanceModelCopyWithImpl<_StaffPerformanceModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StaffPerformanceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StaffPerformanceModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, staffId, staffName,
      ordersCompleted, averageTime, qualityScore, avatarUrl);

  @override
  String toString() {
    return 'StaffPerformanceModel(staffId: $staffId, staffName: $staffName, ordersCompleted: $ordersCompleted, averageTime: $averageTime, qualityScore: $qualityScore, avatarUrl: $avatarUrl)';
  }
}

/// @nodoc
abstract mixin class _$StaffPerformanceModelCopyWith<$Res>
    implements $StaffPerformanceModelCopyWith<$Res> {
  factory _$StaffPerformanceModelCopyWith(_StaffPerformanceModel value,
          $Res Function(_StaffPerformanceModel) _then) =
      __$StaffPerformanceModelCopyWithImpl;
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
class __$StaffPerformanceModelCopyWithImpl<$Res>
    implements _$StaffPerformanceModelCopyWith<$Res> {
  __$StaffPerformanceModelCopyWithImpl(this._self, this._then);

  final _StaffPerformanceModel _self;
  final $Res Function(_StaffPerformanceModel) _then;

  /// Create a copy of StaffPerformanceModel
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
    return _then(_StaffPerformanceModel(
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
mixin _$PeriodStatsModel {
  String get startDate;
  String get endDate;
  int get totalOrders;
  int get completedOrders;
  double get averagePreparationTime;
  double get revenue;
  List<DailyStatsModel>? get dailyStats;

  /// Create a copy of PeriodStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PeriodStatsModelCopyWith<PeriodStatsModel> get copyWith =>
      _$PeriodStatsModelCopyWithImpl<PeriodStatsModel>(
          this as PeriodStatsModel, _$identity);

  /// Serializes this PeriodStatsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PeriodStatsModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PeriodStatsModel(startDate: $startDate, endDate: $endDate, totalOrders: $totalOrders, completedOrders: $completedOrders, averagePreparationTime: $averagePreparationTime, revenue: $revenue, dailyStats: $dailyStats)';
  }
}

/// @nodoc
abstract mixin class $PeriodStatsModelCopyWith<$Res> {
  factory $PeriodStatsModelCopyWith(
          PeriodStatsModel value, $Res Function(PeriodStatsModel) _then) =
      _$PeriodStatsModelCopyWithImpl;
  @useResult
  $Res call(
      {String startDate,
      String endDate,
      int totalOrders,
      int completedOrders,
      double averagePreparationTime,
      double revenue,
      List<DailyStatsModel>? dailyStats});
}

/// @nodoc
class _$PeriodStatsModelCopyWithImpl<$Res>
    implements $PeriodStatsModelCopyWith<$Res> {
  _$PeriodStatsModelCopyWithImpl(this._self, this._then);

  final PeriodStatsModel _self;
  final $Res Function(PeriodStatsModel) _then;

  /// Create a copy of PeriodStatsModel
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
              as String,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<DailyStatsModel>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PeriodStatsModel].
extension PeriodStatsModelPatterns on PeriodStatsModel {
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
    TResult Function(_PeriodStatsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PeriodStatsModel() when $default != null:
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
    TResult Function(_PeriodStatsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PeriodStatsModel():
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
    TResult? Function(_PeriodStatsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PeriodStatsModel() when $default != null:
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
            String startDate,
            String endDate,
            int totalOrders,
            int completedOrders,
            double averagePreparationTime,
            double revenue,
            List<DailyStatsModel>? dailyStats)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PeriodStatsModel() when $default != null:
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
            String startDate,
            String endDate,
            int totalOrders,
            int completedOrders,
            double averagePreparationTime,
            double revenue,
            List<DailyStatsModel>? dailyStats)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PeriodStatsModel():
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
            String startDate,
            String endDate,
            int totalOrders,
            int completedOrders,
            double averagePreparationTime,
            double revenue,
            List<DailyStatsModel>? dailyStats)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PeriodStatsModel() when $default != null:
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
@JsonSerializable()
class _PeriodStatsModel extends PeriodStatsModel {
  const _PeriodStatsModel(
      {required this.startDate,
      required this.endDate,
      required this.totalOrders,
      required this.completedOrders,
      required this.averagePreparationTime,
      required this.revenue,
      final List<DailyStatsModel>? dailyStats})
      : _dailyStats = dailyStats,
        super._();
  factory _PeriodStatsModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodStatsModelFromJson(json);

  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final int totalOrders;
  @override
  final int completedOrders;
  @override
  final double averagePreparationTime;
  @override
  final double revenue;
  final List<DailyStatsModel>? _dailyStats;
  @override
  List<DailyStatsModel>? get dailyStats {
    final value = _dailyStats;
    if (value == null) return null;
    if (_dailyStats is EqualUnmodifiableListView) return _dailyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PeriodStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PeriodStatsModelCopyWith<_PeriodStatsModel> get copyWith =>
      __$PeriodStatsModelCopyWithImpl<_PeriodStatsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PeriodStatsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PeriodStatsModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PeriodStatsModel(startDate: $startDate, endDate: $endDate, totalOrders: $totalOrders, completedOrders: $completedOrders, averagePreparationTime: $averagePreparationTime, revenue: $revenue, dailyStats: $dailyStats)';
  }
}

/// @nodoc
abstract mixin class _$PeriodStatsModelCopyWith<$Res>
    implements $PeriodStatsModelCopyWith<$Res> {
  factory _$PeriodStatsModelCopyWith(
          _PeriodStatsModel value, $Res Function(_PeriodStatsModel) _then) =
      __$PeriodStatsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String startDate,
      String endDate,
      int totalOrders,
      int completedOrders,
      double averagePreparationTime,
      double revenue,
      List<DailyStatsModel>? dailyStats});
}

/// @nodoc
class __$PeriodStatsModelCopyWithImpl<$Res>
    implements _$PeriodStatsModelCopyWith<$Res> {
  __$PeriodStatsModelCopyWithImpl(this._self, this._then);

  final _PeriodStatsModel _self;
  final $Res Function(_PeriodStatsModel) _then;

  /// Create a copy of PeriodStatsModel
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
    return _then(_PeriodStatsModel(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<DailyStatsModel>?,
    ));
  }
}

/// @nodoc
mixin _$DailyStatsModel {
  String get date;
  int get orderCount;
  int get completedCount;
  double get averageTime;
  double get revenue;

  /// Create a copy of DailyStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyStatsModelCopyWith<DailyStatsModel> get copyWith =>
      _$DailyStatsModelCopyWithImpl<DailyStatsModel>(
          this as DailyStatsModel, _$identity);

  /// Serializes this DailyStatsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyStatsModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.averageTime, averageTime) ||
                other.averageTime == averageTime) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, orderCount, completedCount, averageTime, revenue);

  @override
  String toString() {
    return 'DailyStatsModel(date: $date, orderCount: $orderCount, completedCount: $completedCount, averageTime: $averageTime, revenue: $revenue)';
  }
}

/// @nodoc
abstract mixin class $DailyStatsModelCopyWith<$Res> {
  factory $DailyStatsModelCopyWith(
          DailyStatsModel value, $Res Function(DailyStatsModel) _then) =
      _$DailyStatsModelCopyWithImpl;
  @useResult
  $Res call(
      {String date,
      int orderCount,
      int completedCount,
      double averageTime,
      double revenue});
}

/// @nodoc
class _$DailyStatsModelCopyWithImpl<$Res>
    implements $DailyStatsModelCopyWith<$Res> {
  _$DailyStatsModelCopyWithImpl(this._self, this._then);

  final DailyStatsModel _self;
  final $Res Function(DailyStatsModel) _then;

  /// Create a copy of DailyStatsModel
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
              as String,
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

/// Adds pattern-matching-related methods to [DailyStatsModel].
extension DailyStatsModelPatterns on DailyStatsModel {
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
    TResult Function(_DailyStatsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyStatsModel() when $default != null:
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
    TResult Function(_DailyStatsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyStatsModel():
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
    TResult? Function(_DailyStatsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyStatsModel() when $default != null:
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
    TResult Function(String date, int orderCount, int completedCount,
            double averageTime, double revenue)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyStatsModel() when $default != null:
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
    TResult Function(String date, int orderCount, int completedCount,
            double averageTime, double revenue)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyStatsModel():
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
    TResult? Function(String date, int orderCount, int completedCount,
            double averageTime, double revenue)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyStatsModel() when $default != null:
        return $default(_that.date, _that.orderCount, _that.completedCount,
            _that.averageTime, _that.revenue);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DailyStatsModel extends DailyStatsModel {
  const _DailyStatsModel(
      {required this.date,
      required this.orderCount,
      required this.completedCount,
      required this.averageTime,
      required this.revenue})
      : super._();
  factory _DailyStatsModel.fromJson(Map<String, dynamic> json) =>
      _$DailyStatsModelFromJson(json);

  @override
  final String date;
  @override
  final int orderCount;
  @override
  final int completedCount;
  @override
  final double averageTime;
  @override
  final double revenue;

  /// Create a copy of DailyStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyStatsModelCopyWith<_DailyStatsModel> get copyWith =>
      __$DailyStatsModelCopyWithImpl<_DailyStatsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailyStatsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyStatsModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.averageTime, averageTime) ||
                other.averageTime == averageTime) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, orderCount, completedCount, averageTime, revenue);

  @override
  String toString() {
    return 'DailyStatsModel(date: $date, orderCount: $orderCount, completedCount: $completedCount, averageTime: $averageTime, revenue: $revenue)';
  }
}

/// @nodoc
abstract mixin class _$DailyStatsModelCopyWith<$Res>
    implements $DailyStatsModelCopyWith<$Res> {
  factory _$DailyStatsModelCopyWith(
          _DailyStatsModel value, $Res Function(_DailyStatsModel) _then) =
      __$DailyStatsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String date,
      int orderCount,
      int completedCount,
      double averageTime,
      double revenue});
}

/// @nodoc
class __$DailyStatsModelCopyWithImpl<$Res>
    implements _$DailyStatsModelCopyWith<$Res> {
  __$DailyStatsModelCopyWithImpl(this._self, this._then);

  final _DailyStatsModel _self;
  final $Res Function(_DailyStatsModel) _then;

  /// Create a copy of DailyStatsModel
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
    return _then(_DailyStatsModel(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
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

/// @nodoc
mixin _$HourlyStatsModel {
  int get hour;
  int get orderCount;
  double get averageTime;
  int get delayedCount;

  /// Create a copy of HourlyStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HourlyStatsModelCopyWith<HourlyStatsModel> get copyWith =>
      _$HourlyStatsModelCopyWithImpl<HourlyStatsModel>(
          this as HourlyStatsModel, _$identity);

  /// Serializes this HourlyStatsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HourlyStatsModel &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.averageTime, averageTime) ||
                other.averageTime == averageTime) &&
            (identical(other.delayedCount, delayedCount) ||
                other.delayedCount == delayedCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hour, orderCount, averageTime, delayedCount);

  @override
  String toString() {
    return 'HourlyStatsModel(hour: $hour, orderCount: $orderCount, averageTime: $averageTime, delayedCount: $delayedCount)';
  }
}

/// @nodoc
abstract mixin class $HourlyStatsModelCopyWith<$Res> {
  factory $HourlyStatsModelCopyWith(
          HourlyStatsModel value, $Res Function(HourlyStatsModel) _then) =
      _$HourlyStatsModelCopyWithImpl;
  @useResult
  $Res call({int hour, int orderCount, double averageTime, int delayedCount});
}

/// @nodoc
class _$HourlyStatsModelCopyWithImpl<$Res>
    implements $HourlyStatsModelCopyWith<$Res> {
  _$HourlyStatsModelCopyWithImpl(this._self, this._then);

  final HourlyStatsModel _self;
  final $Res Function(HourlyStatsModel) _then;

  /// Create a copy of HourlyStatsModel
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

/// Adds pattern-matching-related methods to [HourlyStatsModel].
extension HourlyStatsModelPatterns on HourlyStatsModel {
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
    TResult Function(_HourlyStatsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HourlyStatsModel() when $default != null:
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
    TResult Function(_HourlyStatsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HourlyStatsModel():
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
    TResult? Function(_HourlyStatsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HourlyStatsModel() when $default != null:
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
      case _HourlyStatsModel() when $default != null:
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
      case _HourlyStatsModel():
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
      case _HourlyStatsModel() when $default != null:
        return $default(_that.hour, _that.orderCount, _that.averageTime,
            _that.delayedCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HourlyStatsModel extends HourlyStatsModel {
  const _HourlyStatsModel(
      {required this.hour,
      required this.orderCount,
      required this.averageTime,
      required this.delayedCount})
      : super._();
  factory _HourlyStatsModel.fromJson(Map<String, dynamic> json) =>
      _$HourlyStatsModelFromJson(json);

  @override
  final int hour;
  @override
  final int orderCount;
  @override
  final double averageTime;
  @override
  final int delayedCount;

  /// Create a copy of HourlyStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HourlyStatsModelCopyWith<_HourlyStatsModel> get copyWith =>
      __$HourlyStatsModelCopyWithImpl<_HourlyStatsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HourlyStatsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HourlyStatsModel &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.averageTime, averageTime) ||
                other.averageTime == averageTime) &&
            (identical(other.delayedCount, delayedCount) ||
                other.delayedCount == delayedCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hour, orderCount, averageTime, delayedCount);

  @override
  String toString() {
    return 'HourlyStatsModel(hour: $hour, orderCount: $orderCount, averageTime: $averageTime, delayedCount: $delayedCount)';
  }
}

/// @nodoc
abstract mixin class _$HourlyStatsModelCopyWith<$Res>
    implements $HourlyStatsModelCopyWith<$Res> {
  factory _$HourlyStatsModelCopyWith(
          _HourlyStatsModel value, $Res Function(_HourlyStatsModel) _then) =
      __$HourlyStatsModelCopyWithImpl;
  @override
  @useResult
  $Res call({int hour, int orderCount, double averageTime, int delayedCount});
}

/// @nodoc
class __$HourlyStatsModelCopyWithImpl<$Res>
    implements _$HourlyStatsModelCopyWith<$Res> {
  __$HourlyStatsModelCopyWithImpl(this._self, this._then);

  final _HourlyStatsModel _self;
  final $Res Function(_HourlyStatsModel) _then;

  /// Create a copy of HourlyStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hour = null,
    Object? orderCount = null,
    Object? averageTime = null,
    Object? delayedCount = null,
  }) {
    return _then(_HourlyStatsModel(
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

// dart format on
