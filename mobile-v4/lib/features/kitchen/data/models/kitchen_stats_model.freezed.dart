// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KitchenStatsModel _$KitchenStatsModelFromJson(Map<String, dynamic> json) {
  return _KitchenStatsModel.fromJson(json);
}

/// @nodoc
mixin _$KitchenStatsModel {
  String get date => throw _privateConstructorUsedError;
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
  List<TopProductModel>? get topProducts => throw _privateConstructorUsedError;
  List<StaffPerformanceModel>? get staffPerformance =>
      throw _privateConstructorUsedError;

  /// Serializes this KitchenStatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KitchenStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KitchenStatsModelCopyWith<KitchenStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitchenStatsModelCopyWith<$Res> {
  factory $KitchenStatsModelCopyWith(
          KitchenStatsModel value, $Res Function(KitchenStatsModel) then) =
      _$KitchenStatsModelCopyWithImpl<$Res, KitchenStatsModel>;
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
class _$KitchenStatsModelCopyWithImpl<$Res, $Val extends KitchenStatsModel>
    implements $KitchenStatsModelCopyWith<$Res> {
  _$KitchenStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<TopProductModel>?,
      staffPerformance: freezed == staffPerformance
          ? _value.staffPerformance
          : staffPerformance // ignore: cast_nullable_to_non_nullable
              as List<StaffPerformanceModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitchenStatsModelImplCopyWith<$Res>
    implements $KitchenStatsModelCopyWith<$Res> {
  factory _$$KitchenStatsModelImplCopyWith(_$KitchenStatsModelImpl value,
          $Res Function(_$KitchenStatsModelImpl) then) =
      __$$KitchenStatsModelImplCopyWithImpl<$Res>;
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
class __$$KitchenStatsModelImplCopyWithImpl<$Res>
    extends _$KitchenStatsModelCopyWithImpl<$Res, _$KitchenStatsModelImpl>
    implements _$$KitchenStatsModelImplCopyWith<$Res> {
  __$$KitchenStatsModelImplCopyWithImpl(_$KitchenStatsModelImpl _value,
      $Res Function(_$KitchenStatsModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$KitchenStatsModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<TopProductModel>?,
      staffPerformance: freezed == staffPerformance
          ? _value._staffPerformance
          : staffPerformance // ignore: cast_nullable_to_non_nullable
              as List<StaffPerformanceModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitchenStatsModelImpl extends _KitchenStatsModel {
  const _$KitchenStatsModelImpl(
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

  factory _$KitchenStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitchenStatsModelImplFromJson(json);

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

  @override
  String toString() {
    return 'KitchenStatsModel(date: $date, totalOrders: $totalOrders, completedOrders: $completedOrders, pendingOrders: $pendingOrders, cancelledOrders: $cancelledOrders, averagePreparationTime: $averagePreparationTime, onTimeRate: $onTimeRate, delayedOrders: $delayedOrders, ordersByHour: $ordersByHour, ordersByStation: $ordersByStation, averageTimeByStation: $averageTimeByStation, topProducts: $topProducts, staffPerformance: $staffPerformance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KitchenStatsModelImpl &&
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

  /// Create a copy of KitchenStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KitchenStatsModelImplCopyWith<_$KitchenStatsModelImpl> get copyWith =>
      __$$KitchenStatsModelImplCopyWithImpl<_$KitchenStatsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitchenStatsModelImplToJson(
      this,
    );
  }
}

abstract class _KitchenStatsModel extends KitchenStatsModel {
  const factory _KitchenStatsModel(
          {required final String date,
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
          final List<TopProductModel>? topProducts,
          final List<StaffPerformanceModel>? staffPerformance}) =
      _$KitchenStatsModelImpl;
  const _KitchenStatsModel._() : super._();

  factory _KitchenStatsModel.fromJson(Map<String, dynamic> json) =
      _$KitchenStatsModelImpl.fromJson;

  @override
  String get date;
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
  List<TopProductModel>? get topProducts;
  @override
  List<StaffPerformanceModel>? get staffPerformance;

  /// Create a copy of KitchenStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KitchenStatsModelImplCopyWith<_$KitchenStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopProductModel _$TopProductModelFromJson(Map<String, dynamic> json) {
  return _TopProductModel.fromJson(json);
}

/// @nodoc
mixin _$TopProductModel {
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  int get orderCount => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this TopProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopProductModelCopyWith<TopProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopProductModelCopyWith<$Res> {
  factory $TopProductModelCopyWith(
          TopProductModel value, $Res Function(TopProductModel) then) =
      _$TopProductModelCopyWithImpl<$Res, TopProductModel>;
  @useResult
  $Res call(
      {String productId,
      String productName,
      int orderCount,
      int totalQuantity,
      String? imageUrl});
}

/// @nodoc
class _$TopProductModelCopyWithImpl<$Res, $Val extends TopProductModel>
    implements $TopProductModelCopyWith<$Res> {
  _$TopProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$TopProductModelImplCopyWith<$Res>
    implements $TopProductModelCopyWith<$Res> {
  factory _$$TopProductModelImplCopyWith(_$TopProductModelImpl value,
          $Res Function(_$TopProductModelImpl) then) =
      __$$TopProductModelImplCopyWithImpl<$Res>;
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
class __$$TopProductModelImplCopyWithImpl<$Res>
    extends _$TopProductModelCopyWithImpl<$Res, _$TopProductModelImpl>
    implements _$$TopProductModelImplCopyWith<$Res> {
  __$$TopProductModelImplCopyWithImpl(
      _$TopProductModelImpl _value, $Res Function(_$TopProductModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$TopProductModelImpl(
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
@JsonSerializable()
class _$TopProductModelImpl extends _TopProductModel {
  const _$TopProductModelImpl(
      {required this.productId,
      required this.productName,
      required this.orderCount,
      required this.totalQuantity,
      this.imageUrl})
      : super._();

  factory _$TopProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopProductModelImplFromJson(json);

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
    return 'TopProductModel(productId: $productId, productName: $productName, orderCount: $orderCount, totalQuantity: $totalQuantity, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopProductModelImpl &&
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

  /// Create a copy of TopProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopProductModelImplCopyWith<_$TopProductModelImpl> get copyWith =>
      __$$TopProductModelImplCopyWithImpl<_$TopProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopProductModelImplToJson(
      this,
    );
  }
}

abstract class _TopProductModel extends TopProductModel {
  const factory _TopProductModel(
      {required final String productId,
      required final String productName,
      required final int orderCount,
      required final int totalQuantity,
      final String? imageUrl}) = _$TopProductModelImpl;
  const _TopProductModel._() : super._();

  factory _TopProductModel.fromJson(Map<String, dynamic> json) =
      _$TopProductModelImpl.fromJson;

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

  /// Create a copy of TopProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopProductModelImplCopyWith<_$TopProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StaffPerformanceModel _$StaffPerformanceModelFromJson(
    Map<String, dynamic> json) {
  return _StaffPerformanceModel.fromJson(json);
}

/// @nodoc
mixin _$StaffPerformanceModel {
  String get staffId => throw _privateConstructorUsedError;
  String get staffName => throw _privateConstructorUsedError;
  int get ordersCompleted => throw _privateConstructorUsedError;
  double get averageTime => throw _privateConstructorUsedError;
  double get qualityScore => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this StaffPerformanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StaffPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffPerformanceModelCopyWith<StaffPerformanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffPerformanceModelCopyWith<$Res> {
  factory $StaffPerformanceModelCopyWith(StaffPerformanceModel value,
          $Res Function(StaffPerformanceModel) then) =
      _$StaffPerformanceModelCopyWithImpl<$Res, StaffPerformanceModel>;
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
class _$StaffPerformanceModelCopyWithImpl<$Res,
        $Val extends StaffPerformanceModel>
    implements $StaffPerformanceModelCopyWith<$Res> {
  _$StaffPerformanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$StaffPerformanceModelImplCopyWith<$Res>
    implements $StaffPerformanceModelCopyWith<$Res> {
  factory _$$StaffPerformanceModelImplCopyWith(
          _$StaffPerformanceModelImpl value,
          $Res Function(_$StaffPerformanceModelImpl) then) =
      __$$StaffPerformanceModelImplCopyWithImpl<$Res>;
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
class __$$StaffPerformanceModelImplCopyWithImpl<$Res>
    extends _$StaffPerformanceModelCopyWithImpl<$Res,
        _$StaffPerformanceModelImpl>
    implements _$$StaffPerformanceModelImplCopyWith<$Res> {
  __$$StaffPerformanceModelImplCopyWithImpl(_$StaffPerformanceModelImpl _value,
      $Res Function(_$StaffPerformanceModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$StaffPerformanceModelImpl(
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
@JsonSerializable()
class _$StaffPerformanceModelImpl extends _StaffPerformanceModel {
  const _$StaffPerformanceModelImpl(
      {required this.staffId,
      required this.staffName,
      required this.ordersCompleted,
      required this.averageTime,
      required this.qualityScore,
      this.avatarUrl})
      : super._();

  factory _$StaffPerformanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffPerformanceModelImplFromJson(json);

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
    return 'StaffPerformanceModel(staffId: $staffId, staffName: $staffName, ordersCompleted: $ordersCompleted, averageTime: $averageTime, qualityScore: $qualityScore, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffPerformanceModelImpl &&
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

  /// Create a copy of StaffPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffPerformanceModelImplCopyWith<_$StaffPerformanceModelImpl>
      get copyWith => __$$StaffPerformanceModelImplCopyWithImpl<
          _$StaffPerformanceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffPerformanceModelImplToJson(
      this,
    );
  }
}

abstract class _StaffPerformanceModel extends StaffPerformanceModel {
  const factory _StaffPerformanceModel(
      {required final String staffId,
      required final String staffName,
      required final int ordersCompleted,
      required final double averageTime,
      required final double qualityScore,
      final String? avatarUrl}) = _$StaffPerformanceModelImpl;
  const _StaffPerformanceModel._() : super._();

  factory _StaffPerformanceModel.fromJson(Map<String, dynamic> json) =
      _$StaffPerformanceModelImpl.fromJson;

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

  /// Create a copy of StaffPerformanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffPerformanceModelImplCopyWith<_$StaffPerformanceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PeriodStatsModel _$PeriodStatsModelFromJson(Map<String, dynamic> json) {
  return _PeriodStatsModel.fromJson(json);
}

/// @nodoc
mixin _$PeriodStatsModel {
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  int get completedOrders => throw _privateConstructorUsedError;
  double get averagePreparationTime => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  List<DailyStatsModel>? get dailyStats => throw _privateConstructorUsedError;

  /// Serializes this PeriodStatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PeriodStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PeriodStatsModelCopyWith<PeriodStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeriodStatsModelCopyWith<$Res> {
  factory $PeriodStatsModelCopyWith(
          PeriodStatsModel value, $Res Function(PeriodStatsModel) then) =
      _$PeriodStatsModelCopyWithImpl<$Res, PeriodStatsModel>;
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
class _$PeriodStatsModelCopyWithImpl<$Res, $Val extends PeriodStatsModel>
    implements $PeriodStatsModelCopyWith<$Res> {
  _$PeriodStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<DailyStatsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PeriodStatsModelImplCopyWith<$Res>
    implements $PeriodStatsModelCopyWith<$Res> {
  factory _$$PeriodStatsModelImplCopyWith(_$PeriodStatsModelImpl value,
          $Res Function(_$PeriodStatsModelImpl) then) =
      __$$PeriodStatsModelImplCopyWithImpl<$Res>;
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
class __$$PeriodStatsModelImplCopyWithImpl<$Res>
    extends _$PeriodStatsModelCopyWithImpl<$Res, _$PeriodStatsModelImpl>
    implements _$$PeriodStatsModelImplCopyWith<$Res> {
  __$$PeriodStatsModelImplCopyWithImpl(_$PeriodStatsModelImpl _value,
      $Res Function(_$PeriodStatsModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$PeriodStatsModelImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<DailyStatsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PeriodStatsModelImpl extends _PeriodStatsModel {
  const _$PeriodStatsModelImpl(
      {required this.startDate,
      required this.endDate,
      required this.totalOrders,
      required this.completedOrders,
      required this.averagePreparationTime,
      required this.revenue,
      final List<DailyStatsModel>? dailyStats})
      : _dailyStats = dailyStats,
        super._();

  factory _$PeriodStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PeriodStatsModelImplFromJson(json);

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

  @override
  String toString() {
    return 'PeriodStatsModel(startDate: $startDate, endDate: $endDate, totalOrders: $totalOrders, completedOrders: $completedOrders, averagePreparationTime: $averagePreparationTime, revenue: $revenue, dailyStats: $dailyStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeriodStatsModelImpl &&
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

  /// Create a copy of PeriodStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PeriodStatsModelImplCopyWith<_$PeriodStatsModelImpl> get copyWith =>
      __$$PeriodStatsModelImplCopyWithImpl<_$PeriodStatsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PeriodStatsModelImplToJson(
      this,
    );
  }
}

abstract class _PeriodStatsModel extends PeriodStatsModel {
  const factory _PeriodStatsModel(
      {required final String startDate,
      required final String endDate,
      required final int totalOrders,
      required final int completedOrders,
      required final double averagePreparationTime,
      required final double revenue,
      final List<DailyStatsModel>? dailyStats}) = _$PeriodStatsModelImpl;
  const _PeriodStatsModel._() : super._();

  factory _PeriodStatsModel.fromJson(Map<String, dynamic> json) =
      _$PeriodStatsModelImpl.fromJson;

  @override
  String get startDate;
  @override
  String get endDate;
  @override
  int get totalOrders;
  @override
  int get completedOrders;
  @override
  double get averagePreparationTime;
  @override
  double get revenue;
  @override
  List<DailyStatsModel>? get dailyStats;

  /// Create a copy of PeriodStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PeriodStatsModelImplCopyWith<_$PeriodStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyStatsModel _$DailyStatsModelFromJson(Map<String, dynamic> json) {
  return _DailyStatsModel.fromJson(json);
}

/// @nodoc
mixin _$DailyStatsModel {
  String get date => throw _privateConstructorUsedError;
  int get orderCount => throw _privateConstructorUsedError;
  int get completedCount => throw _privateConstructorUsedError;
  double get averageTime => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;

  /// Serializes this DailyStatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyStatsModelCopyWith<DailyStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyStatsModelCopyWith<$Res> {
  factory $DailyStatsModelCopyWith(
          DailyStatsModel value, $Res Function(DailyStatsModel) then) =
      _$DailyStatsModelCopyWithImpl<$Res, DailyStatsModel>;
  @useResult
  $Res call(
      {String date,
      int orderCount,
      int completedCount,
      double averageTime,
      double revenue});
}

/// @nodoc
class _$DailyStatsModelCopyWithImpl<$Res, $Val extends DailyStatsModel>
    implements $DailyStatsModelCopyWith<$Res> {
  _$DailyStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$DailyStatsModelImplCopyWith<$Res>
    implements $DailyStatsModelCopyWith<$Res> {
  factory _$$DailyStatsModelImplCopyWith(_$DailyStatsModelImpl value,
          $Res Function(_$DailyStatsModelImpl) then) =
      __$$DailyStatsModelImplCopyWithImpl<$Res>;
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
class __$$DailyStatsModelImplCopyWithImpl<$Res>
    extends _$DailyStatsModelCopyWithImpl<$Res, _$DailyStatsModelImpl>
    implements _$$DailyStatsModelImplCopyWith<$Res> {
  __$$DailyStatsModelImplCopyWithImpl(
      _$DailyStatsModelImpl _value, $Res Function(_$DailyStatsModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$DailyStatsModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$DailyStatsModelImpl extends _DailyStatsModel {
  const _$DailyStatsModelImpl(
      {required this.date,
      required this.orderCount,
      required this.completedCount,
      required this.averageTime,
      required this.revenue})
      : super._();

  factory _$DailyStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyStatsModelImplFromJson(json);

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

  @override
  String toString() {
    return 'DailyStatsModel(date: $date, orderCount: $orderCount, completedCount: $completedCount, averageTime: $averageTime, revenue: $revenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyStatsModelImpl &&
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

  /// Create a copy of DailyStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyStatsModelImplCopyWith<_$DailyStatsModelImpl> get copyWith =>
      __$$DailyStatsModelImplCopyWithImpl<_$DailyStatsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyStatsModelImplToJson(
      this,
    );
  }
}

abstract class _DailyStatsModel extends DailyStatsModel {
  const factory _DailyStatsModel(
      {required final String date,
      required final int orderCount,
      required final int completedCount,
      required final double averageTime,
      required final double revenue}) = _$DailyStatsModelImpl;
  const _DailyStatsModel._() : super._();

  factory _DailyStatsModel.fromJson(Map<String, dynamic> json) =
      _$DailyStatsModelImpl.fromJson;

  @override
  String get date;
  @override
  int get orderCount;
  @override
  int get completedCount;
  @override
  double get averageTime;
  @override
  double get revenue;

  /// Create a copy of DailyStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyStatsModelImplCopyWith<_$DailyStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HourlyStatsModel _$HourlyStatsModelFromJson(Map<String, dynamic> json) {
  return _HourlyStatsModel.fromJson(json);
}

/// @nodoc
mixin _$HourlyStatsModel {
  int get hour => throw _privateConstructorUsedError;
  int get orderCount => throw _privateConstructorUsedError;
  double get averageTime => throw _privateConstructorUsedError;
  int get delayedCount => throw _privateConstructorUsedError;

  /// Serializes this HourlyStatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HourlyStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyStatsModelCopyWith<HourlyStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyStatsModelCopyWith<$Res> {
  factory $HourlyStatsModelCopyWith(
          HourlyStatsModel value, $Res Function(HourlyStatsModel) then) =
      _$HourlyStatsModelCopyWithImpl<$Res, HourlyStatsModel>;
  @useResult
  $Res call({int hour, int orderCount, double averageTime, int delayedCount});
}

/// @nodoc
class _$HourlyStatsModelCopyWithImpl<$Res, $Val extends HourlyStatsModel>
    implements $HourlyStatsModelCopyWith<$Res> {
  _$HourlyStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$HourlyStatsModelImplCopyWith<$Res>
    implements $HourlyStatsModelCopyWith<$Res> {
  factory _$$HourlyStatsModelImplCopyWith(_$HourlyStatsModelImpl value,
          $Res Function(_$HourlyStatsModelImpl) then) =
      __$$HourlyStatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int orderCount, double averageTime, int delayedCount});
}

/// @nodoc
class __$$HourlyStatsModelImplCopyWithImpl<$Res>
    extends _$HourlyStatsModelCopyWithImpl<$Res, _$HourlyStatsModelImpl>
    implements _$$HourlyStatsModelImplCopyWith<$Res> {
  __$$HourlyStatsModelImplCopyWithImpl(_$HourlyStatsModelImpl _value,
      $Res Function(_$HourlyStatsModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$HourlyStatsModelImpl(
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
@JsonSerializable()
class _$HourlyStatsModelImpl extends _HourlyStatsModel {
  const _$HourlyStatsModelImpl(
      {required this.hour,
      required this.orderCount,
      required this.averageTime,
      required this.delayedCount})
      : super._();

  factory _$HourlyStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyStatsModelImplFromJson(json);

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
    return 'HourlyStatsModel(hour: $hour, orderCount: $orderCount, averageTime: $averageTime, delayedCount: $delayedCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyStatsModelImpl &&
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

  /// Create a copy of HourlyStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyStatsModelImplCopyWith<_$HourlyStatsModelImpl> get copyWith =>
      __$$HourlyStatsModelImplCopyWithImpl<_$HourlyStatsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyStatsModelImplToJson(
      this,
    );
  }
}

abstract class _HourlyStatsModel extends HourlyStatsModel {
  const factory _HourlyStatsModel(
      {required final int hour,
      required final int orderCount,
      required final double averageTime,
      required final int delayedCount}) = _$HourlyStatsModelImpl;
  const _HourlyStatsModel._() : super._();

  factory _HourlyStatsModel.fromJson(Map<String, dynamic> json) =
      _$HourlyStatsModelImpl.fromJson;

  @override
  int get hour;
  @override
  int get orderCount;
  @override
  double get averageTime;
  @override
  int get delayedCount;

  /// Create a copy of HourlyStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyStatsModelImplCopyWith<_$HourlyStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
