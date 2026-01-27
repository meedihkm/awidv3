// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerDelivery _$CustomerDeliveryFromJson(Map<String, dynamic> json) {
  return _CustomerDelivery.fromJson(json);
}

/// @nodoc
mixin _$CustomerDelivery {
  String get id => throw _privateConstructorUsedError;
  String get deliveryNumber => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get delivererId => throw _privateConstructorUsedError;
  String get delivererName => throw _privateConstructorUsedError;
  String? get delivererPhone => throw _privateConstructorUsedError;
  String? get delivererPhoto => throw _privateConstructorUsedError;
  List<String> get orderIds => throw _privateConstructorUsedError;
  int get ordersCount => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  DeliveryStatus get status => throw _privateConstructorUsedError;
  DateTime get scheduledDate => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get estimatedArrival => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String get deliveryAddress => throw _privateConstructorUsedError;
  double? get deliveryLatitude => throw _privateConstructorUsedError;
  double? get deliveryLongitude => throw _privateConstructorUsedError;
  double? get currentLatitude => throw _privateConstructorUsedError;
  double? get currentLongitude => throw _privateConstructorUsedError;
  double? get distanceRemaining => throw _privateConstructorUsedError;
  List<DeliveryTrackingPoint>? get trackingPoints =>
      throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get proofOfDeliveryId => throw _privateConstructorUsedError;
  bool get hasProofOfDelivery => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CustomerDelivery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerDelivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerDeliveryCopyWith<CustomerDelivery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDeliveryCopyWith<$Res> {
  factory $CustomerDeliveryCopyWith(
          CustomerDelivery value, $Res Function(CustomerDelivery) then) =
      _$CustomerDeliveryCopyWithImpl<$Res, CustomerDelivery>;
  @useResult
  $Res call(
      {String id,
      String deliveryNumber,
      String customerId,
      String customerName,
      String delivererId,
      String delivererName,
      String? delivererPhone,
      String? delivererPhoto,
      List<String> orderIds,
      int ordersCount,
      double totalAmount,
      DeliveryStatus status,
      DateTime scheduledDate,
      DateTime? startedAt,
      DateTime? estimatedArrival,
      DateTime? completedAt,
      String deliveryAddress,
      double? deliveryLatitude,
      double? deliveryLongitude,
      double? currentLatitude,
      double? currentLongitude,
      double? distanceRemaining,
      List<DeliveryTrackingPoint>? trackingPoints,
      String? notes,
      String? proofOfDeliveryId,
      bool hasProofOfDelivery,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CustomerDeliveryCopyWithImpl<$Res, $Val extends CustomerDelivery>
    implements $CustomerDeliveryCopyWith<$Res> {
  _$CustomerDeliveryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerDelivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deliveryNumber = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? delivererId = null,
    Object? delivererName = null,
    Object? delivererPhone = freezed,
    Object? delivererPhoto = freezed,
    Object? orderIds = null,
    Object? ordersCount = null,
    Object? totalAmount = null,
    Object? status = null,
    Object? scheduledDate = null,
    Object? startedAt = freezed,
    Object? estimatedArrival = freezed,
    Object? completedAt = freezed,
    Object? deliveryAddress = null,
    Object? deliveryLatitude = freezed,
    Object? deliveryLongitude = freezed,
    Object? currentLatitude = freezed,
    Object? currentLongitude = freezed,
    Object? distanceRemaining = freezed,
    Object? trackingPoints = freezed,
    Object? notes = freezed,
    Object? proofOfDeliveryId = freezed,
    Object? hasProofOfDelivery = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryNumber: null == deliveryNumber
          ? _value.deliveryNumber
          : deliveryNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _value.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      delivererName: null == delivererName
          ? _value.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String,
      delivererPhone: freezed == delivererPhone
          ? _value.delivererPhone
          : delivererPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      delivererPhoto: freezed == delivererPhoto
          ? _value.delivererPhoto
          : delivererPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      orderIds: null == orderIds
          ? _value.orderIds
          : orderIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ordersCount: null == ordersCount
          ? _value.ordersCount
          : ordersCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      scheduledDate: null == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      estimatedArrival: freezed == estimatedArrival
          ? _value.estimatedArrival
          : estimatedArrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryLatitude: freezed == deliveryLatitude
          ? _value.deliveryLatitude
          : deliveryLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryLongitude: freezed == deliveryLongitude
          ? _value.deliveryLongitude
          : deliveryLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      currentLatitude: freezed == currentLatitude
          ? _value.currentLatitude
          : currentLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      currentLongitude: freezed == currentLongitude
          ? _value.currentLongitude
          : currentLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceRemaining: freezed == distanceRemaining
          ? _value.distanceRemaining
          : distanceRemaining // ignore: cast_nullable_to_non_nullable
              as double?,
      trackingPoints: freezed == trackingPoints
          ? _value.trackingPoints
          : trackingPoints // ignore: cast_nullable_to_non_nullable
              as List<DeliveryTrackingPoint>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      proofOfDeliveryId: freezed == proofOfDeliveryId
          ? _value.proofOfDeliveryId
          : proofOfDeliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasProofOfDelivery: null == hasProofOfDelivery
          ? _value.hasProofOfDelivery
          : hasProofOfDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerDeliveryImplCopyWith<$Res>
    implements $CustomerDeliveryCopyWith<$Res> {
  factory _$$CustomerDeliveryImplCopyWith(_$CustomerDeliveryImpl value,
          $Res Function(_$CustomerDeliveryImpl) then) =
      __$$CustomerDeliveryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String deliveryNumber,
      String customerId,
      String customerName,
      String delivererId,
      String delivererName,
      String? delivererPhone,
      String? delivererPhoto,
      List<String> orderIds,
      int ordersCount,
      double totalAmount,
      DeliveryStatus status,
      DateTime scheduledDate,
      DateTime? startedAt,
      DateTime? estimatedArrival,
      DateTime? completedAt,
      String deliveryAddress,
      double? deliveryLatitude,
      double? deliveryLongitude,
      double? currentLatitude,
      double? currentLongitude,
      double? distanceRemaining,
      List<DeliveryTrackingPoint>? trackingPoints,
      String? notes,
      String? proofOfDeliveryId,
      bool hasProofOfDelivery,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CustomerDeliveryImplCopyWithImpl<$Res>
    extends _$CustomerDeliveryCopyWithImpl<$Res, _$CustomerDeliveryImpl>
    implements _$$CustomerDeliveryImplCopyWith<$Res> {
  __$$CustomerDeliveryImplCopyWithImpl(_$CustomerDeliveryImpl _value,
      $Res Function(_$CustomerDeliveryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerDelivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deliveryNumber = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? delivererId = null,
    Object? delivererName = null,
    Object? delivererPhone = freezed,
    Object? delivererPhoto = freezed,
    Object? orderIds = null,
    Object? ordersCount = null,
    Object? totalAmount = null,
    Object? status = null,
    Object? scheduledDate = null,
    Object? startedAt = freezed,
    Object? estimatedArrival = freezed,
    Object? completedAt = freezed,
    Object? deliveryAddress = null,
    Object? deliveryLatitude = freezed,
    Object? deliveryLongitude = freezed,
    Object? currentLatitude = freezed,
    Object? currentLongitude = freezed,
    Object? distanceRemaining = freezed,
    Object? trackingPoints = freezed,
    Object? notes = freezed,
    Object? proofOfDeliveryId = freezed,
    Object? hasProofOfDelivery = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CustomerDeliveryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryNumber: null == deliveryNumber
          ? _value.deliveryNumber
          : deliveryNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _value.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      delivererName: null == delivererName
          ? _value.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String,
      delivererPhone: freezed == delivererPhone
          ? _value.delivererPhone
          : delivererPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      delivererPhoto: freezed == delivererPhoto
          ? _value.delivererPhoto
          : delivererPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      orderIds: null == orderIds
          ? _value._orderIds
          : orderIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ordersCount: null == ordersCount
          ? _value.ordersCount
          : ordersCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      scheduledDate: null == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      estimatedArrival: freezed == estimatedArrival
          ? _value.estimatedArrival
          : estimatedArrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryLatitude: freezed == deliveryLatitude
          ? _value.deliveryLatitude
          : deliveryLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryLongitude: freezed == deliveryLongitude
          ? _value.deliveryLongitude
          : deliveryLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      currentLatitude: freezed == currentLatitude
          ? _value.currentLatitude
          : currentLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      currentLongitude: freezed == currentLongitude
          ? _value.currentLongitude
          : currentLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceRemaining: freezed == distanceRemaining
          ? _value.distanceRemaining
          : distanceRemaining // ignore: cast_nullable_to_non_nullable
              as double?,
      trackingPoints: freezed == trackingPoints
          ? _value._trackingPoints
          : trackingPoints // ignore: cast_nullable_to_non_nullable
              as List<DeliveryTrackingPoint>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      proofOfDeliveryId: freezed == proofOfDeliveryId
          ? _value.proofOfDeliveryId
          : proofOfDeliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasProofOfDelivery: null == hasProofOfDelivery
          ? _value.hasProofOfDelivery
          : hasProofOfDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerDeliveryImpl implements _CustomerDelivery {
  const _$CustomerDeliveryImpl(
      {required this.id,
      required this.deliveryNumber,
      required this.customerId,
      required this.customerName,
      required this.delivererId,
      required this.delivererName,
      this.delivererPhone,
      this.delivererPhoto,
      required final List<String> orderIds,
      required this.ordersCount,
      required this.totalAmount,
      required this.status,
      required this.scheduledDate,
      this.startedAt,
      this.estimatedArrival,
      this.completedAt,
      required this.deliveryAddress,
      this.deliveryLatitude,
      this.deliveryLongitude,
      this.currentLatitude,
      this.currentLongitude,
      this.distanceRemaining,
      final List<DeliveryTrackingPoint>? trackingPoints,
      this.notes,
      this.proofOfDeliveryId,
      this.hasProofOfDelivery = false,
      this.createdAt,
      this.updatedAt})
      : _orderIds = orderIds,
        _trackingPoints = trackingPoints;

  factory _$CustomerDeliveryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerDeliveryImplFromJson(json);

  @override
  final String id;
  @override
  final String deliveryNumber;
  @override
  final String customerId;
  @override
  final String customerName;
  @override
  final String delivererId;
  @override
  final String delivererName;
  @override
  final String? delivererPhone;
  @override
  final String? delivererPhoto;
  final List<String> _orderIds;
  @override
  List<String> get orderIds {
    if (_orderIds is EqualUnmodifiableListView) return _orderIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderIds);
  }

  @override
  final int ordersCount;
  @override
  final double totalAmount;
  @override
  final DeliveryStatus status;
  @override
  final DateTime scheduledDate;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? estimatedArrival;
  @override
  final DateTime? completedAt;
  @override
  final String deliveryAddress;
  @override
  final double? deliveryLatitude;
  @override
  final double? deliveryLongitude;
  @override
  final double? currentLatitude;
  @override
  final double? currentLongitude;
  @override
  final double? distanceRemaining;
  final List<DeliveryTrackingPoint>? _trackingPoints;
  @override
  List<DeliveryTrackingPoint>? get trackingPoints {
    final value = _trackingPoints;
    if (value == null) return null;
    if (_trackingPoints is EqualUnmodifiableListView) return _trackingPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? notes;
  @override
  final String? proofOfDeliveryId;
  @override
  @JsonKey()
  final bool hasProofOfDelivery;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CustomerDelivery(id: $id, deliveryNumber: $deliveryNumber, customerId: $customerId, customerName: $customerName, delivererId: $delivererId, delivererName: $delivererName, delivererPhone: $delivererPhone, delivererPhoto: $delivererPhoto, orderIds: $orderIds, ordersCount: $ordersCount, totalAmount: $totalAmount, status: $status, scheduledDate: $scheduledDate, startedAt: $startedAt, estimatedArrival: $estimatedArrival, completedAt: $completedAt, deliveryAddress: $deliveryAddress, deliveryLatitude: $deliveryLatitude, deliveryLongitude: $deliveryLongitude, currentLatitude: $currentLatitude, currentLongitude: $currentLongitude, distanceRemaining: $distanceRemaining, trackingPoints: $trackingPoints, notes: $notes, proofOfDeliveryId: $proofOfDeliveryId, hasProofOfDelivery: $hasProofOfDelivery, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerDeliveryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deliveryNumber, deliveryNumber) ||
                other.deliveryNumber == deliveryNumber) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.delivererId, delivererId) ||
                other.delivererId == delivererId) &&
            (identical(other.delivererName, delivererName) ||
                other.delivererName == delivererName) &&
            (identical(other.delivererPhone, delivererPhone) ||
                other.delivererPhone == delivererPhone) &&
            (identical(other.delivererPhoto, delivererPhoto) ||
                other.delivererPhoto == delivererPhoto) &&
            const DeepCollectionEquality().equals(other._orderIds, _orderIds) &&
            (identical(other.ordersCount, ordersCount) ||
                other.ordersCount == ordersCount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.estimatedArrival, estimatedArrival) ||
                other.estimatedArrival == estimatedArrival) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.deliveryLatitude, deliveryLatitude) ||
                other.deliveryLatitude == deliveryLatitude) &&
            (identical(other.deliveryLongitude, deliveryLongitude) ||
                other.deliveryLongitude == deliveryLongitude) &&
            (identical(other.currentLatitude, currentLatitude) ||
                other.currentLatitude == currentLatitude) &&
            (identical(other.currentLongitude, currentLongitude) ||
                other.currentLongitude == currentLongitude) &&
            (identical(other.distanceRemaining, distanceRemaining) ||
                other.distanceRemaining == distanceRemaining) &&
            const DeepCollectionEquality()
                .equals(other._trackingPoints, _trackingPoints) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.proofOfDeliveryId, proofOfDeliveryId) ||
                other.proofOfDeliveryId == proofOfDeliveryId) &&
            (identical(other.hasProofOfDelivery, hasProofOfDelivery) ||
                other.hasProofOfDelivery == hasProofOfDelivery) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        deliveryNumber,
        customerId,
        customerName,
        delivererId,
        delivererName,
        delivererPhone,
        delivererPhoto,
        const DeepCollectionEquality().hash(_orderIds),
        ordersCount,
        totalAmount,
        status,
        scheduledDate,
        startedAt,
        estimatedArrival,
        completedAt,
        deliveryAddress,
        deliveryLatitude,
        deliveryLongitude,
        currentLatitude,
        currentLongitude,
        distanceRemaining,
        const DeepCollectionEquality().hash(_trackingPoints),
        notes,
        proofOfDeliveryId,
        hasProofOfDelivery,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of CustomerDelivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerDeliveryImplCopyWith<_$CustomerDeliveryImpl> get copyWith =>
      __$$CustomerDeliveryImplCopyWithImpl<_$CustomerDeliveryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerDeliveryImplToJson(
      this,
    );
  }
}

abstract class _CustomerDelivery implements CustomerDelivery {
  const factory _CustomerDelivery(
      {required final String id,
      required final String deliveryNumber,
      required final String customerId,
      required final String customerName,
      required final String delivererId,
      required final String delivererName,
      final String? delivererPhone,
      final String? delivererPhoto,
      required final List<String> orderIds,
      required final int ordersCount,
      required final double totalAmount,
      required final DeliveryStatus status,
      required final DateTime scheduledDate,
      final DateTime? startedAt,
      final DateTime? estimatedArrival,
      final DateTime? completedAt,
      required final String deliveryAddress,
      final double? deliveryLatitude,
      final double? deliveryLongitude,
      final double? currentLatitude,
      final double? currentLongitude,
      final double? distanceRemaining,
      final List<DeliveryTrackingPoint>? trackingPoints,
      final String? notes,
      final String? proofOfDeliveryId,
      final bool hasProofOfDelivery,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CustomerDeliveryImpl;

  factory _CustomerDelivery.fromJson(Map<String, dynamic> json) =
      _$CustomerDeliveryImpl.fromJson;

  @override
  String get id;
  @override
  String get deliveryNumber;
  @override
  String get customerId;
  @override
  String get customerName;
  @override
  String get delivererId;
  @override
  String get delivererName;
  @override
  String? get delivererPhone;
  @override
  String? get delivererPhoto;
  @override
  List<String> get orderIds;
  @override
  int get ordersCount;
  @override
  double get totalAmount;
  @override
  DeliveryStatus get status;
  @override
  DateTime get scheduledDate;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get estimatedArrival;
  @override
  DateTime? get completedAt;
  @override
  String get deliveryAddress;
  @override
  double? get deliveryLatitude;
  @override
  double? get deliveryLongitude;
  @override
  double? get currentLatitude;
  @override
  double? get currentLongitude;
  @override
  double? get distanceRemaining;
  @override
  List<DeliveryTrackingPoint>? get trackingPoints;
  @override
  String? get notes;
  @override
  String? get proofOfDeliveryId;
  @override
  bool get hasProofOfDelivery;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CustomerDelivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerDeliveryImplCopyWith<_$CustomerDeliveryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryTrackingPoint _$DeliveryTrackingPointFromJson(
    Map<String, dynamic> json) {
  return _DeliveryTrackingPoint.fromJson(json);
}

/// @nodoc
mixin _$DeliveryTrackingPoint {
  String get id => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double? get speed => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;

  /// Serializes this DeliveryTrackingPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryTrackingPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryTrackingPointCopyWith<DeliveryTrackingPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryTrackingPointCopyWith<$Res> {
  factory $DeliveryTrackingPointCopyWith(DeliveryTrackingPoint value,
          $Res Function(DeliveryTrackingPoint) then) =
      _$DeliveryTrackingPointCopyWithImpl<$Res, DeliveryTrackingPoint>;
  @useResult
  $Res call(
      {String id,
      double latitude,
      double longitude,
      DateTime timestamp,
      double? speed,
      double? accuracy});
}

/// @nodoc
class _$DeliveryTrackingPointCopyWithImpl<$Res,
        $Val extends DeliveryTrackingPoint>
    implements $DeliveryTrackingPointCopyWith<$Res> {
  _$DeliveryTrackingPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryTrackingPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? speed = freezed,
    Object? accuracy = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryTrackingPointImplCopyWith<$Res>
    implements $DeliveryTrackingPointCopyWith<$Res> {
  factory _$$DeliveryTrackingPointImplCopyWith(
          _$DeliveryTrackingPointImpl value,
          $Res Function(_$DeliveryTrackingPointImpl) then) =
      __$$DeliveryTrackingPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double latitude,
      double longitude,
      DateTime timestamp,
      double? speed,
      double? accuracy});
}

/// @nodoc
class __$$DeliveryTrackingPointImplCopyWithImpl<$Res>
    extends _$DeliveryTrackingPointCopyWithImpl<$Res,
        _$DeliveryTrackingPointImpl>
    implements _$$DeliveryTrackingPointImplCopyWith<$Res> {
  __$$DeliveryTrackingPointImplCopyWithImpl(_$DeliveryTrackingPointImpl _value,
      $Res Function(_$DeliveryTrackingPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryTrackingPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? speed = freezed,
    Object? accuracy = freezed,
  }) {
    return _then(_$DeliveryTrackingPointImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryTrackingPointImpl implements _DeliveryTrackingPoint {
  const _$DeliveryTrackingPointImpl(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.timestamp,
      this.speed,
      this.accuracy});

  factory _$DeliveryTrackingPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryTrackingPointImplFromJson(json);

  @override
  final String id;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final DateTime timestamp;
  @override
  final double? speed;
  @override
  final double? accuracy;

  @override
  String toString() {
    return 'DeliveryTrackingPoint(id: $id, latitude: $latitude, longitude: $longitude, timestamp: $timestamp, speed: $speed, accuracy: $accuracy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryTrackingPointImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, latitude, longitude, timestamp, speed, accuracy);

  /// Create a copy of DeliveryTrackingPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryTrackingPointImplCopyWith<_$DeliveryTrackingPointImpl>
      get copyWith => __$$DeliveryTrackingPointImplCopyWithImpl<
          _$DeliveryTrackingPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryTrackingPointImplToJson(
      this,
    );
  }
}

abstract class _DeliveryTrackingPoint implements DeliveryTrackingPoint {
  const factory _DeliveryTrackingPoint(
      {required final String id,
      required final double latitude,
      required final double longitude,
      required final DateTime timestamp,
      final double? speed,
      final double? accuracy}) = _$DeliveryTrackingPointImpl;

  factory _DeliveryTrackingPoint.fromJson(Map<String, dynamic> json) =
      _$DeliveryTrackingPointImpl.fromJson;

  @override
  String get id;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  DateTime get timestamp;
  @override
  double? get speed;
  @override
  double? get accuracy;

  /// Create a copy of DeliveryTrackingPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryTrackingPointImplCopyWith<_$DeliveryTrackingPointImpl>
      get copyWith => throw _privateConstructorUsedError;
}
