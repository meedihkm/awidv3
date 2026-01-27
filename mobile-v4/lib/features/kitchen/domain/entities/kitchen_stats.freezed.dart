// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KitchenStats {
  DateTime get date => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  int get completedOrders => throw _privateConstructorUsedError;
  int get pendingOrders => throw _privateConstructorUsedError;
  int get cancelledOrders => throw _privateConstructorUsedError;
  double get averagePreparationTime => throw _privateConstructorUsedError;
  double get onTimeRate => throw _privateConstructorUsedError;
  int get delayedOrders => throw _privateConstructorUsedError;
  Map<String, int>? get ordersByHour => throw _privateConstructorUsedError;
  Map<String, int>? get ordersByStation => throw _privateConstructorUsedError;
  Map<String, double>? get averageTimeByStation =>
      throw _privateConstructorUsedError;
  List<TopProduct>? get topProducts => throw _privateConstructorUsedError;
  List<StaffPerformance>? get staffPerformance =>
      throw _privateConstructorUsedError;

  /// Create a copy of KitchenStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KitchenStatsCopyWith<KitchenStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitchenStatsCopyWith<$Res> {
  factory $KitchenStatsCopyWith(
          KitchenStats value, $Res Function(KitchenStats) then) =
      _$KitchenStatsCopyWithImpl<$Res, KitchenStats>;
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
class _$KitchenStatsCopyWithImpl<$Res, $Val extends KitchenStats>
    implements $KitchenStatsCopyWith<$Res> {
  _$KitchenStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      pendingOrders: null == pendingOrders
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledOrders: null == cancelledOrders
          ? _value.cancelledOrders
          : cancelledOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averagePreparationTime: null == averagePreparationTime
          ? _value.averagePreparationTime
          : averagePreparationTime // ignore: cast_nullable_to_non_nullable
              as double,
      onTimeRate: null == onTimeRate
          ? _value.onTimeRate
          : onTimeRate // ignore: cast_nullable_to_non_nullable
              as double,
      delayedOrders: null == delayedOrders
          ? _value.delayedOrders
          : delayedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      ordersByHour: freezed == ordersByHour
          ? _value.ordersByHour
          : ordersByHour // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      ordersByStation: freezed == ordersByStation
          ? _value.ordersByStation
          : ordersByStation // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      averageTimeByStation: freezed == averageTimeByStation
          ? _value.averageTimeByStation
          : averageTimeByStation // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      topProducts: freezed == topProducts
          ? _value.topProducts
          : topProducts // ignore: cast_nullable_to_non_nullable
              as List<TopProduct>?,
      staffPerformance: freezed == staffPerformance
          ? _value.staffPerformance
          : staffPerformance // ignore: cast_nullable_to_non_nullable
              as List<StaffPerformance>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitchenStatsImplCopyWith<$Res>
    implements $KitchenStatsCopyWith<$Res> {
  factory _$$KitchenStatsImplCopyWith(
          _$KitchenStatsImpl value, $Res Function(_$KitchenStatsImpl) then) =
      __$$KitchenStatsImplCopyWithImpl<$Res>;
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
class __$$KitchenStatsImplCopyWithImpl<$Res>
    extends _$KitchenStatsCopyWithImpl<$Res, _$KitchenStatsImpl>
    implements _$$KitchenStatsImplCopyWith<$Res> {
  __$$KitchenStatsImplCopyWithImpl(
      _$KitchenStatsImpl _value, $Res Function(_$KitchenStatsImpl) _then)
      : super(_value, _then);

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
    return _then(_$KitchenStatsImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      pendingOrders: null == pendingOrders
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledOrders: null == cancelledOrders
          ? _value.cancelledOrders
          : cancelledOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averagePreparationTime: null == averagePreparationTime
          ? _value.averagePreparationTime
          : averagePreparationTime // ignore: cast_nullable_to_non_nullable
              as double,
      onTimeRate: null == onTimeRate
          ? _value.onTimeRate
          : onTimeRate // ignore: cast_nullable_to_non_nullable
              as double,
      delayedOrders: null == delayedOrders
          ? _value.delayedOrders
          : delayedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      ordersByHour: freezed == ordersByHour
          ? _value._ordersByHour
          : ordersByHour // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      ordersByStation: freezed == ordersByStation
          ? _value._ordersByStation
          : ordersByStation // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      averageTimeByStation: freezed == averageTimeByStation
          ? _value._averageTimeByStation
          : averageTimeByStation // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      topProducts: freezed == topProducts
          ? _value._topProducts
          : topProducts // ignore: cast_nullable_to_non_nullable
              as List<TopProduct>?,
      staffPerformance: freezed == staffPerformance
          ? _value._staffPerformance
          : staffPerformance // ignore: cast_nullable_to_non_nullable
              as List<StaffPerformance>?,
    ));
  }
}

/// @nodoc

class _$KitchenStatsImpl extends _KitchenStats {
  const _$KitchenStatsImpl(
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

  @override
  String toString() {
    return 'KitchenStats(date: $date, totalOrders: $totalOrders, completedOrders: $completedOrders, pendingOrders: $pendingOrders, cancelledOrders: $cancelledOrders, averagePreparationTime: $averagePreparationTime, onTimeRate: $onTimeRate, delayedOrders: $delayedOrders, ordersByHour: $ordersByHour, ordersByStation: $ordersByStation, averageTimeByStation: $averageTimeByStation, topProducts: $topProducts, staffPerformance: $staffPerformance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KitchenStatsImpl &&
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

  /// Create a copy of KitchenStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KitchenStatsImplCopyWith<_$KitchenStatsImpl> get copyWith =>
      __$$KitchenStatsImplCopyWithImpl<_$KitchenStatsImpl>(this, _$identity);
}

abstract class _KitchenStats extends KitchenStats {
  const factory _KitchenStats(
      {required final DateTime date,
      required final int totalOrders,
      required final int completedOrders,
      required final int pendingOrders,
      required final int cancelledOrders,
      required final double averagePreparationTime,
      required final double onTimeRate,
      required final int delayedOrders,
      final Map<String, int>? ordersByHour,
      final Map<String, int>? ordersByStation,
      final Map<String, double>? averageTimeByStation,
      final List<TopProduct>? topProducts,
      final List<StaffPerformance>? staffPerformance}) = _$KitchenStatsImpl;
  const _KitchenStats._() : super._();

  @override
  DateTime get date;
  @override
  int get totalOrders;
  @override
  int get completedOrders;
  @override
  int get pendingOrders;
  @override
  int get cancelledOrders;
  @override
  double get averagePreparationTime;
  @override
  double get onTimeRate;
  @override
  int get delayedOrders;
  @override
  Map<String, int>? get ordersByHour;
  @override
  Map<String, int>? get ordersByStation;
  @override
  Map<String, double>? get averageTimeByStation;
  @override
  List<TopProduct>? get topProducts;
  @override
  List<StaffPerformance>? get staffPerformance;

  /// Create a copy of KitchenStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KitchenStatsImplCopyWith<_$KitchenStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TopProduct {
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  int get orderCount => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Create a copy of TopProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopProductCopyWith<TopProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopProductCopyWith<$Res> {
  factory $TopProductCopyWith(
          TopProduct value, $Res Function(TopProduct) then) =
      _$TopProductCopyWithImpl<$Res, TopProduct>;
  @useResult
  $Res call(
      {String productId,
      String productName,
      int orderCount,
      int totalQuantity,
      String? imageUrl});
}

/// @nodoc
class _$TopProductCopyWithImpl<$Res, $Val extends TopProduct>
    implements $TopProductCopyWith<$Res> {
  _$TopProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopProductImplCopyWith<$Res>
    implements $TopProductCopyWith<$Res> {
  factory _$$TopProductImplCopyWith(
          _$TopProductImpl value, $Res Function(_$TopProductImpl) then) =
      __$$TopProductImplCopyWithImpl<$Res>;
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
class __$$TopProductImplCopyWithImpl<$Res>
    extends _$TopProductCopyWithImpl<$Res, _$TopProductImpl>
    implements _$$TopProductImplCopyWith<$Res> {
  __$$TopProductImplCopyWithImpl(
      _$TopProductImpl _value, $Res Function(_$TopProductImpl) _then)
      : super(_value, _then);

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
    return _then(_$TopProductImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TopProductImpl implements _TopProduct {
  const _$TopProductImpl(
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

  @override
  String toString() {
    return 'TopProduct(productId: $productId, productName: $productName, orderCount: $orderCount, totalQuantity: $totalQuantity, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopProductImpl &&
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

  /// Create a copy of TopProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopProductImplCopyWith<_$TopProductImpl> get copyWith =>
      __$$TopProductImplCopyWithImpl<_$TopProductImpl>(this, _$identity);
}

abstract class _TopProduct implements TopProduct {
  const factory _TopProduct(
      {required final String productId,
      required final String productName,
      required final int orderCount,
      required final int totalQuantity,
      final String? imageUrl}) = _$TopProductImpl;

  @override
  String get productId;
  @override
  String get productName;
  @override
  int get orderCount;
  @override
  int get totalQuantity;
  @override
  String? get imageUrl;

  /// Create a copy of TopProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopProductImplCopyWith<_$TopProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StaffPerformance {
  String get staffId => throw _privateConstructorUsedError;
  String get staffName => throw _privateConstructorUsedError;
  int get ordersCompleted => throw _privateConstructorUsedError;
  double get averageTime => throw _privateConstructorUsedError;
  double get qualityScore => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Create a copy of StaffPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffPerformanceCopyWith<StaffPerformance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffPerformanceCopyWith<$Res> {
  factory $StaffPerformanceCopyWith(
          StaffPerformance value, $Res Function(StaffPerformance) then) =
      _$StaffPerformanceCopyWithImpl<$Res, StaffPerformance>;
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
class _$StaffPerformanceCopyWithImpl<$Res, $Val extends StaffPerformance>
    implements $StaffPerformanceCopyWith<$Res> {
  _$StaffPerformanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      staffName: null == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String,
      ordersCompleted: null == ordersCompleted
          ? _value.ordersCompleted
          : ordersCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      averageTime: null == averageTime
          ? _value.averageTime
          : averageTime // ignore: cast_nullable_to_non_nullable
              as double,
      qualityScore: null == qualityScore
          ? _value.qualityScore
          : qualityScore // ignore: cast_nullable_to_non_nullable
              as double,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StaffPerformanceImplCopyWith<$Res>
    implements $StaffPerformanceCopyWith<$Res> {
  factory _$$StaffPerformanceImplCopyWith(_$StaffPerformanceImpl value,
          $Res Function(_$StaffPerformanceImpl) then) =
      __$$StaffPerformanceImplCopyWithImpl<$Res>;
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
class __$$StaffPerformanceImplCopyWithImpl<$Res>
    extends _$StaffPerformanceCopyWithImpl<$Res, _$StaffPerformanceImpl>
    implements _$$StaffPerformanceImplCopyWith<$Res> {
  __$$StaffPerformanceImplCopyWithImpl(_$StaffPerformanceImpl _value,
      $Res Function(_$StaffPerformanceImpl) _then)
      : super(_value, _then);

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
    return _then(_$StaffPerformanceImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      staffName: null == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String,
      ordersCompleted: null == ordersCompleted
          ? _value.ordersCompleted
          : ordersCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      averageTime: null == averageTime
          ? _value.averageTime
          : averageTime // ignore: cast_nullable_to_non_nullable
              as double,
      qualityScore: null == qualityScore
          ? _value.qualityScore
          : qualityScore // ignore: cast_nullable_to_non_nullable
              as double,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StaffPerformanceImpl extends _StaffPerformance {
  const _$StaffPerformanceImpl(
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

  @override
  String toString() {
    return 'StaffPerformance(staffId: $staffId, staffName: $staffName, ordersCompleted: $ordersCompleted, averageTime: $averageTime, qualityScore: $qualityScore, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffPerformanceImpl &&
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

  /// Create a copy of StaffPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffPerformanceImplCopyWith<_$StaffPerformanceImpl> get copyWith =>
      __$$StaffPerformanceImplCopyWithImpl<_$StaffPerformanceImpl>(
          this, _$identity);
}

abstract class _StaffPerformance extends StaffPerformance {
  const factory _StaffPerformance(
      {required final String staffId,
      required final String staffName,
      required final int ordersCompleted,
      required final double averageTime,
      required final double qualityScore,
      final String? avatarUrl}) = _$StaffPerformanceImpl;
  const _StaffPerformance._() : super._();

  @override
  String get staffId;
  @override
  String get staffName;
  @override
  int get ordersCompleted;
  @override
  double get averageTime;
  @override
  double get qualityScore;
  @override
  String? get avatarUrl;

  /// Create a copy of StaffPerformance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffPerformanceImplCopyWith<_$StaffPerformanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HourlyStats {
  int get hour => throw _privateConstructorUsedError;
  int get orderCount => throw _privateConstructorUsedError;
  double get averageTime => throw _privateConstructorUsedError;
  int get delayedCount => throw _privateConstructorUsedError;

  /// Create a copy of HourlyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyStatsCopyWith<HourlyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyStatsCopyWith<$Res> {
  factory $HourlyStatsCopyWith(
          HourlyStats value, $Res Function(HourlyStats) then) =
      _$HourlyStatsCopyWithImpl<$Res, HourlyStats>;
  @useResult
  $Res call({int hour, int orderCount, double averageTime, int delayedCount});
}

/// @nodoc
class _$HourlyStatsCopyWithImpl<$Res, $Val extends HourlyStats>
    implements $HourlyStatsCopyWith<$Res> {
  _$HourlyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageTime: null == averageTime
          ? _value.averageTime
          : averageTime // ignore: cast_nullable_to_non_nullable
              as double,
      delayedCount: null == delayedCount
          ? _value.delayedCount
          : delayedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HourlyStatsImplCopyWith<$Res>
    implements $HourlyStatsCopyWith<$Res> {
  factory _$$HourlyStatsImplCopyWith(
          _$HourlyStatsImpl value, $Res Function(_$HourlyStatsImpl) then) =
      __$$HourlyStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int orderCount, double averageTime, int delayedCount});
}

/// @nodoc
class __$$HourlyStatsImplCopyWithImpl<$Res>
    extends _$HourlyStatsCopyWithImpl<$Res, _$HourlyStatsImpl>
    implements _$$HourlyStatsImplCopyWith<$Res> {
  __$$HourlyStatsImplCopyWithImpl(
      _$HourlyStatsImpl _value, $Res Function(_$HourlyStatsImpl) _then)
      : super(_value, _then);

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
    return _then(_$HourlyStatsImpl(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageTime: null == averageTime
          ? _value.averageTime
          : averageTime // ignore: cast_nullable_to_non_nullable
              as double,
      delayedCount: null == delayedCount
          ? _value.delayedCount
          : delayedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HourlyStatsImpl extends _HourlyStats {
  const _$HourlyStatsImpl(
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

  @override
  String toString() {
    return 'HourlyStats(hour: $hour, orderCount: $orderCount, averageTime: $averageTime, delayedCount: $delayedCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyStatsImpl &&
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

  /// Create a copy of HourlyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyStatsImplCopyWith<_$HourlyStatsImpl> get copyWith =>
      __$$HourlyStatsImplCopyWithImpl<_$HourlyStatsImpl>(this, _$identity);
}

abstract class _HourlyStats extends HourlyStats {
  const factory _HourlyStats(
      {required final int hour,
      required final int orderCount,
      required final double averageTime,
      required final int delayedCount}) = _$HourlyStatsImpl;
  const _HourlyStats._() : super._();

  @override
  int get hour;
  @override
  int get orderCount;
  @override
  double get averageTime;
  @override
  int get delayedCount;

  /// Create a copy of HourlyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyStatsImplCopyWith<_$HourlyStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PeriodStats {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  int get completedOrders => throw _privateConstructorUsedError;
  double get averagePreparationTime => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  List<DailyStats>? get dailyStats => throw _privateConstructorUsedError;

  /// Create a copy of PeriodStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PeriodStatsCopyWith<PeriodStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeriodStatsCopyWith<$Res> {
  factory $PeriodStatsCopyWith(
          PeriodStats value, $Res Function(PeriodStats) then) =
      _$PeriodStatsCopyWithImpl<$Res, PeriodStats>;
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
class _$PeriodStatsCopyWithImpl<$Res, $Val extends PeriodStats>
    implements $PeriodStatsCopyWith<$Res> {
  _$PeriodStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averagePreparationTime: null == averagePreparationTime
          ? _value.averagePreparationTime
          : averagePreparationTime // ignore: cast_nullable_to_non_nullable
              as double,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      dailyStats: freezed == dailyStats
          ? _value.dailyStats
          : dailyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyStats>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PeriodStatsImplCopyWith<$Res>
    implements $PeriodStatsCopyWith<$Res> {
  factory _$$PeriodStatsImplCopyWith(
          _$PeriodStatsImpl value, $Res Function(_$PeriodStatsImpl) then) =
      __$$PeriodStatsImplCopyWithImpl<$Res>;
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
class __$$PeriodStatsImplCopyWithImpl<$Res>
    extends _$PeriodStatsCopyWithImpl<$Res, _$PeriodStatsImpl>
    implements _$$PeriodStatsImplCopyWith<$Res> {
  __$$PeriodStatsImplCopyWithImpl(
      _$PeriodStatsImpl _value, $Res Function(_$PeriodStatsImpl) _then)
      : super(_value, _then);

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
    return _then(_$PeriodStatsImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averagePreparationTime: null == averagePreparationTime
          ? _value.averagePreparationTime
          : averagePreparationTime // ignore: cast_nullable_to_non_nullable
              as double,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      dailyStats: freezed == dailyStats
          ? _value._dailyStats
          : dailyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyStats>?,
    ));
  }
}

/// @nodoc

class _$PeriodStatsImpl extends _PeriodStats {
  const _$PeriodStatsImpl(
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

  @override
  String toString() {
    return 'PeriodStats(startDate: $startDate, endDate: $endDate, totalOrders: $totalOrders, completedOrders: $completedOrders, averagePreparationTime: $averagePreparationTime, revenue: $revenue, dailyStats: $dailyStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeriodStatsImpl &&
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

  /// Create a copy of PeriodStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PeriodStatsImplCopyWith<_$PeriodStatsImpl> get copyWith =>
      __$$PeriodStatsImplCopyWithImpl<_$PeriodStatsImpl>(this, _$identity);
}

abstract class _PeriodStats extends PeriodStats {
  const factory _PeriodStats(
      {required final DateTime startDate,
      required final DateTime endDate,
      required final int totalOrders,
      required final int completedOrders,
      required final double averagePreparationTime,
      required final double revenue,
      final List<DailyStats>? dailyStats}) = _$PeriodStatsImpl;
  const _PeriodStats._() : super._();

  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  int get totalOrders;
  @override
  int get completedOrders;
  @override
  double get averagePreparationTime;
  @override
  double get revenue;
  @override
  List<DailyStats>? get dailyStats;

  /// Create a copy of PeriodStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PeriodStatsImplCopyWith<_$PeriodStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DailyStats {
  DateTime get date => throw _privateConstructorUsedError;
  int get orderCount => throw _privateConstructorUsedError;
  int get completedCount => throw _privateConstructorUsedError;
  double get averageTime => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyStatsCopyWith<DailyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyStatsCopyWith<$Res> {
  factory $DailyStatsCopyWith(
          DailyStats value, $Res Function(DailyStats) then) =
      _$DailyStatsCopyWithImpl<$Res, DailyStats>;
  @useResult
  $Res call(
      {DateTime date,
      int orderCount,
      int completedCount,
      double averageTime,
      double revenue});
}

/// @nodoc
class _$DailyStatsCopyWithImpl<$Res, $Val extends DailyStats>
    implements $DailyStatsCopyWith<$Res> {
  _$DailyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedCount: null == completedCount
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageTime: null == averageTime
          ? _value.averageTime
          : averageTime // ignore: cast_nullable_to_non_nullable
              as double,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyStatsImplCopyWith<$Res>
    implements $DailyStatsCopyWith<$Res> {
  factory _$$DailyStatsImplCopyWith(
          _$DailyStatsImpl value, $Res Function(_$DailyStatsImpl) then) =
      __$$DailyStatsImplCopyWithImpl<$Res>;
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
class __$$DailyStatsImplCopyWithImpl<$Res>
    extends _$DailyStatsCopyWithImpl<$Res, _$DailyStatsImpl>
    implements _$$DailyStatsImplCopyWith<$Res> {
  __$$DailyStatsImplCopyWithImpl(
      _$DailyStatsImpl _value, $Res Function(_$DailyStatsImpl) _then)
      : super(_value, _then);

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
    return _then(_$DailyStatsImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedCount: null == completedCount
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageTime: null == averageTime
          ? _value.averageTime
          : averageTime // ignore: cast_nullable_to_non_nullable
              as double,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DailyStatsImpl extends _DailyStats {
  const _$DailyStatsImpl(
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

  @override
  String toString() {
    return 'DailyStats(date: $date, orderCount: $orderCount, completedCount: $completedCount, averageTime: $averageTime, revenue: $revenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyStatsImpl &&
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

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyStatsImplCopyWith<_$DailyStatsImpl> get copyWith =>
      __$$DailyStatsImplCopyWithImpl<_$DailyStatsImpl>(this, _$identity);
}

abstract class _DailyStats extends DailyStats {
  const factory _DailyStats(
      {required final DateTime date,
      required final int orderCount,
      required final int completedCount,
      required final double averageTime,
      required final double revenue}) = _$DailyStatsImpl;
  const _DailyStats._() : super._();

  @override
  DateTime get date;
  @override
  int get orderCount;
  @override
  int get completedCount;
  @override
  double get averageTime;
  @override
  double get revenue;

  /// Create a copy of DailyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyStatsImplCopyWith<_$DailyStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
