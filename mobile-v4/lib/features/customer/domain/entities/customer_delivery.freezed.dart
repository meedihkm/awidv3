// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerDelivery {
  String get id;
  String get deliveryNumber;
  String get customerId;
  String get customerName;
  String get delivererId;
  String get delivererName;
  String? get delivererPhone;
  String? get delivererPhoto;
  List<String> get orderIds;
  int get ordersCount;
  double get totalAmount;
  DeliveryStatus get status;
  DateTime get scheduledDate;
  DateTime? get startedAt;
  DateTime? get estimatedArrival;
  DateTime? get completedAt;
  String get deliveryAddress;
  double? get deliveryLatitude;
  double? get deliveryLongitude;
  double? get currentLatitude;
  double? get currentLongitude;
  double? get distanceRemaining;
  List<DeliveryTrackingPoint>? get trackingPoints;
  String? get notes;
  String? get proofOfDeliveryId;
  bool get hasProofOfDelivery;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of CustomerDelivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerDeliveryCopyWith<CustomerDelivery> get copyWith =>
      _$CustomerDeliveryCopyWithImpl<CustomerDelivery>(
          this as CustomerDelivery, _$identity);

  /// Serializes this CustomerDelivery to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerDelivery &&
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
            const DeepCollectionEquality().equals(other.orderIds, orderIds) &&
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
                .equals(other.trackingPoints, trackingPoints) &&
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
        const DeepCollectionEquality().hash(orderIds),
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
        const DeepCollectionEquality().hash(trackingPoints),
        notes,
        proofOfDeliveryId,
        hasProofOfDelivery,
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'CustomerDelivery(id: $id, deliveryNumber: $deliveryNumber, customerId: $customerId, customerName: $customerName, delivererId: $delivererId, delivererName: $delivererName, delivererPhone: $delivererPhone, delivererPhoto: $delivererPhoto, orderIds: $orderIds, ordersCount: $ordersCount, totalAmount: $totalAmount, status: $status, scheduledDate: $scheduledDate, startedAt: $startedAt, estimatedArrival: $estimatedArrival, completedAt: $completedAt, deliveryAddress: $deliveryAddress, deliveryLatitude: $deliveryLatitude, deliveryLongitude: $deliveryLongitude, currentLatitude: $currentLatitude, currentLongitude: $currentLongitude, distanceRemaining: $distanceRemaining, trackingPoints: $trackingPoints, notes: $notes, proofOfDeliveryId: $proofOfDeliveryId, hasProofOfDelivery: $hasProofOfDelivery, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $CustomerDeliveryCopyWith<$Res> {
  factory $CustomerDeliveryCopyWith(
          CustomerDelivery value, $Res Function(CustomerDelivery) _then) =
      _$CustomerDeliveryCopyWithImpl;
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
class _$CustomerDeliveryCopyWithImpl<$Res>
    implements $CustomerDeliveryCopyWith<$Res> {
  _$CustomerDeliveryCopyWithImpl(this._self, this._then);

  final CustomerDelivery _self;
  final $Res Function(CustomerDelivery) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryNumber: null == deliveryNumber
          ? _self.deliveryNumber
          : deliveryNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      delivererName: null == delivererName
          ? _self.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String,
      delivererPhone: freezed == delivererPhone
          ? _self.delivererPhone
          : delivererPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      delivererPhoto: freezed == delivererPhoto
          ? _self.delivererPhoto
          : delivererPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      orderIds: null == orderIds
          ? _self.orderIds
          : orderIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ordersCount: null == ordersCount
          ? _self.ordersCount
          : ordersCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      scheduledDate: null == scheduledDate
          ? _self.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      estimatedArrival: freezed == estimatedArrival
          ? _self.estimatedArrival
          : estimatedArrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryAddress: null == deliveryAddress
          ? _self.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryLatitude: freezed == deliveryLatitude
          ? _self.deliveryLatitude
          : deliveryLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryLongitude: freezed == deliveryLongitude
          ? _self.deliveryLongitude
          : deliveryLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      currentLatitude: freezed == currentLatitude
          ? _self.currentLatitude
          : currentLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      currentLongitude: freezed == currentLongitude
          ? _self.currentLongitude
          : currentLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceRemaining: freezed == distanceRemaining
          ? _self.distanceRemaining
          : distanceRemaining // ignore: cast_nullable_to_non_nullable
              as double?,
      trackingPoints: freezed == trackingPoints
          ? _self.trackingPoints
          : trackingPoints // ignore: cast_nullable_to_non_nullable
              as List<DeliveryTrackingPoint>?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      proofOfDeliveryId: freezed == proofOfDeliveryId
          ? _self.proofOfDeliveryId
          : proofOfDeliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasProofOfDelivery: null == hasProofOfDelivery
          ? _self.hasProofOfDelivery
          : hasProofOfDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerDelivery].
extension CustomerDeliveryPatterns on CustomerDelivery {
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
    TResult Function(_CustomerDelivery value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerDelivery() when $default != null:
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
    TResult Function(_CustomerDelivery value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerDelivery():
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
    TResult? Function(_CustomerDelivery value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerDelivery() when $default != null:
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
            DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerDelivery() when $default != null:
        return $default(
            _that.id,
            _that.deliveryNumber,
            _that.customerId,
            _that.customerName,
            _that.delivererId,
            _that.delivererName,
            _that.delivererPhone,
            _that.delivererPhoto,
            _that.orderIds,
            _that.ordersCount,
            _that.totalAmount,
            _that.status,
            _that.scheduledDate,
            _that.startedAt,
            _that.estimatedArrival,
            _that.completedAt,
            _that.deliveryAddress,
            _that.deliveryLatitude,
            _that.deliveryLongitude,
            _that.currentLatitude,
            _that.currentLongitude,
            _that.distanceRemaining,
            _that.trackingPoints,
            _that.notes,
            _that.proofOfDeliveryId,
            _that.hasProofOfDelivery,
            _that.createdAt,
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
            String id,
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
            DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerDelivery():
        return $default(
            _that.id,
            _that.deliveryNumber,
            _that.customerId,
            _that.customerName,
            _that.delivererId,
            _that.delivererName,
            _that.delivererPhone,
            _that.delivererPhoto,
            _that.orderIds,
            _that.ordersCount,
            _that.totalAmount,
            _that.status,
            _that.scheduledDate,
            _that.startedAt,
            _that.estimatedArrival,
            _that.completedAt,
            _that.deliveryAddress,
            _that.deliveryLatitude,
            _that.deliveryLongitude,
            _that.currentLatitude,
            _that.currentLongitude,
            _that.distanceRemaining,
            _that.trackingPoints,
            _that.notes,
            _that.proofOfDeliveryId,
            _that.hasProofOfDelivery,
            _that.createdAt,
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
            String id,
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
            DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerDelivery() when $default != null:
        return $default(
            _that.id,
            _that.deliveryNumber,
            _that.customerId,
            _that.customerName,
            _that.delivererId,
            _that.delivererName,
            _that.delivererPhone,
            _that.delivererPhoto,
            _that.orderIds,
            _that.ordersCount,
            _that.totalAmount,
            _that.status,
            _that.scheduledDate,
            _that.startedAt,
            _that.estimatedArrival,
            _that.completedAt,
            _that.deliveryAddress,
            _that.deliveryLatitude,
            _that.deliveryLongitude,
            _that.currentLatitude,
            _that.currentLongitude,
            _that.distanceRemaining,
            _that.trackingPoints,
            _that.notes,
            _that.proofOfDeliveryId,
            _that.hasProofOfDelivery,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerDelivery implements CustomerDelivery {
  const _CustomerDelivery(
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
  factory _CustomerDelivery.fromJson(Map<String, dynamic> json) =>
      _$CustomerDeliveryFromJson(json);

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

  /// Create a copy of CustomerDelivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerDeliveryCopyWith<_CustomerDelivery> get copyWith =>
      __$CustomerDeliveryCopyWithImpl<_CustomerDelivery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerDeliveryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerDelivery &&
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

  @override
  String toString() {
    return 'CustomerDelivery(id: $id, deliveryNumber: $deliveryNumber, customerId: $customerId, customerName: $customerName, delivererId: $delivererId, delivererName: $delivererName, delivererPhone: $delivererPhone, delivererPhoto: $delivererPhoto, orderIds: $orderIds, ordersCount: $ordersCount, totalAmount: $totalAmount, status: $status, scheduledDate: $scheduledDate, startedAt: $startedAt, estimatedArrival: $estimatedArrival, completedAt: $completedAt, deliveryAddress: $deliveryAddress, deliveryLatitude: $deliveryLatitude, deliveryLongitude: $deliveryLongitude, currentLatitude: $currentLatitude, currentLongitude: $currentLongitude, distanceRemaining: $distanceRemaining, trackingPoints: $trackingPoints, notes: $notes, proofOfDeliveryId: $proofOfDeliveryId, hasProofOfDelivery: $hasProofOfDelivery, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$CustomerDeliveryCopyWith<$Res>
    implements $CustomerDeliveryCopyWith<$Res> {
  factory _$CustomerDeliveryCopyWith(
          _CustomerDelivery value, $Res Function(_CustomerDelivery) _then) =
      __$CustomerDeliveryCopyWithImpl;
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
class __$CustomerDeliveryCopyWithImpl<$Res>
    implements _$CustomerDeliveryCopyWith<$Res> {
  __$CustomerDeliveryCopyWithImpl(this._self, this._then);

  final _CustomerDelivery _self;
  final $Res Function(_CustomerDelivery) _then;

  /// Create a copy of CustomerDelivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_CustomerDelivery(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryNumber: null == deliveryNumber
          ? _self.deliveryNumber
          : deliveryNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      delivererName: null == delivererName
          ? _self.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String,
      delivererPhone: freezed == delivererPhone
          ? _self.delivererPhone
          : delivererPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      delivererPhoto: freezed == delivererPhoto
          ? _self.delivererPhoto
          : delivererPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      orderIds: null == orderIds
          ? _self._orderIds
          : orderIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ordersCount: null == ordersCount
          ? _self.ordersCount
          : ordersCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      scheduledDate: null == scheduledDate
          ? _self.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      estimatedArrival: freezed == estimatedArrival
          ? _self.estimatedArrival
          : estimatedArrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryAddress: null == deliveryAddress
          ? _self.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryLatitude: freezed == deliveryLatitude
          ? _self.deliveryLatitude
          : deliveryLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryLongitude: freezed == deliveryLongitude
          ? _self.deliveryLongitude
          : deliveryLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      currentLatitude: freezed == currentLatitude
          ? _self.currentLatitude
          : currentLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      currentLongitude: freezed == currentLongitude
          ? _self.currentLongitude
          : currentLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceRemaining: freezed == distanceRemaining
          ? _self.distanceRemaining
          : distanceRemaining // ignore: cast_nullable_to_non_nullable
              as double?,
      trackingPoints: freezed == trackingPoints
          ? _self._trackingPoints
          : trackingPoints // ignore: cast_nullable_to_non_nullable
              as List<DeliveryTrackingPoint>?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      proofOfDeliveryId: freezed == proofOfDeliveryId
          ? _self.proofOfDeliveryId
          : proofOfDeliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasProofOfDelivery: null == hasProofOfDelivery
          ? _self.hasProofOfDelivery
          : hasProofOfDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$DeliveryTrackingPoint {
  String get id;
  double get latitude;
  double get longitude;
  DateTime get timestamp;
  double? get speed;
  double? get accuracy;

  /// Create a copy of DeliveryTrackingPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeliveryTrackingPointCopyWith<DeliveryTrackingPoint> get copyWith =>
      _$DeliveryTrackingPointCopyWithImpl<DeliveryTrackingPoint>(
          this as DeliveryTrackingPoint, _$identity);

  /// Serializes this DeliveryTrackingPoint to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeliveryTrackingPoint &&
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

  @override
  String toString() {
    return 'DeliveryTrackingPoint(id: $id, latitude: $latitude, longitude: $longitude, timestamp: $timestamp, speed: $speed, accuracy: $accuracy)';
  }
}

/// @nodoc
abstract mixin class $DeliveryTrackingPointCopyWith<$Res> {
  factory $DeliveryTrackingPointCopyWith(DeliveryTrackingPoint value,
          $Res Function(DeliveryTrackingPoint) _then) =
      _$DeliveryTrackingPointCopyWithImpl;
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
class _$DeliveryTrackingPointCopyWithImpl<$Res>
    implements $DeliveryTrackingPointCopyWith<$Res> {
  _$DeliveryTrackingPointCopyWithImpl(this._self, this._then);

  final DeliveryTrackingPoint _self;
  final $Res Function(DeliveryTrackingPoint) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      speed: freezed == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeliveryTrackingPoint].
extension DeliveryTrackingPointPatterns on DeliveryTrackingPoint {
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
    TResult Function(_DeliveryTrackingPoint value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryTrackingPoint() when $default != null:
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
    TResult Function(_DeliveryTrackingPoint value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryTrackingPoint():
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
    TResult? Function(_DeliveryTrackingPoint value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryTrackingPoint() when $default != null:
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
    TResult Function(String id, double latitude, double longitude,
            DateTime timestamp, double? speed, double? accuracy)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryTrackingPoint() when $default != null:
        return $default(_that.id, _that.latitude, _that.longitude,
            _that.timestamp, _that.speed, _that.accuracy);
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
    TResult Function(String id, double latitude, double longitude,
            DateTime timestamp, double? speed, double? accuracy)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryTrackingPoint():
        return $default(_that.id, _that.latitude, _that.longitude,
            _that.timestamp, _that.speed, _that.accuracy);
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
    TResult? Function(String id, double latitude, double longitude,
            DateTime timestamp, double? speed, double? accuracy)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryTrackingPoint() when $default != null:
        return $default(_that.id, _that.latitude, _that.longitude,
            _that.timestamp, _that.speed, _that.accuracy);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeliveryTrackingPoint implements DeliveryTrackingPoint {
  const _DeliveryTrackingPoint(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.timestamp,
      this.speed,
      this.accuracy});
  factory _DeliveryTrackingPoint.fromJson(Map<String, dynamic> json) =>
      _$DeliveryTrackingPointFromJson(json);

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

  /// Create a copy of DeliveryTrackingPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeliveryTrackingPointCopyWith<_DeliveryTrackingPoint> get copyWith =>
      __$DeliveryTrackingPointCopyWithImpl<_DeliveryTrackingPoint>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeliveryTrackingPointToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeliveryTrackingPoint &&
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

  @override
  String toString() {
    return 'DeliveryTrackingPoint(id: $id, latitude: $latitude, longitude: $longitude, timestamp: $timestamp, speed: $speed, accuracy: $accuracy)';
  }
}

/// @nodoc
abstract mixin class _$DeliveryTrackingPointCopyWith<$Res>
    implements $DeliveryTrackingPointCopyWith<$Res> {
  factory _$DeliveryTrackingPointCopyWith(_DeliveryTrackingPoint value,
          $Res Function(_DeliveryTrackingPoint) _then) =
      __$DeliveryTrackingPointCopyWithImpl;
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
class __$DeliveryTrackingPointCopyWithImpl<$Res>
    implements _$DeliveryTrackingPointCopyWith<$Res> {
  __$DeliveryTrackingPointCopyWithImpl(this._self, this._then);

  final _DeliveryTrackingPoint _self;
  final $Res Function(_DeliveryTrackingPoint) _then;

  /// Create a copy of DeliveryTrackingPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? speed = freezed,
    Object? accuracy = freezed,
  }) {
    return _then(_DeliveryTrackingPoint(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      speed: freezed == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
