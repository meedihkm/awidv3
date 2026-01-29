// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Delivery {
  String get id;
  String get orderId;
  String get orderNumber;
  String get status;
  String get customerName;
  String get customerPhone;
  String get deliveryAddress;
  double get latitude;
  double get longitude;
  double get totalAmount;
  DateTime get scheduledFor;
  String? get deliveryInstructions;
  String? get customerOrganization;
  int? get itemsCount;
  DateTime? get pickedUpAt;
  DateTime? get deliveredAt;
  DateTime? get createdAt;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeliveryCopyWith<Delivery> get copyWith =>
      _$DeliveryCopyWithImpl<Delivery>(this as Delivery, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Delivery &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.customerOrganization, customerOrganization) ||
                other.customerOrganization == customerOrganization) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            (identical(other.pickedUpAt, pickedUpAt) ||
                other.pickedUpAt == pickedUpAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderId,
      orderNumber,
      status,
      customerName,
      customerPhone,
      deliveryAddress,
      latitude,
      longitude,
      totalAmount,
      scheduledFor,
      deliveryInstructions,
      customerOrganization,
      itemsCount,
      pickedUpAt,
      deliveredAt,
      createdAt);

  @override
  String toString() {
    return 'Delivery(id: $id, orderId: $orderId, orderNumber: $orderNumber, status: $status, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, latitude: $latitude, longitude: $longitude, totalAmount: $totalAmount, scheduledFor: $scheduledFor, deliveryInstructions: $deliveryInstructions, customerOrganization: $customerOrganization, itemsCount: $itemsCount, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $DeliveryCopyWith<$Res> {
  factory $DeliveryCopyWith(Delivery value, $Res Function(Delivery) _then) =
      _$DeliveryCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String orderId,
      String orderNumber,
      String status,
      String customerName,
      String customerPhone,
      String deliveryAddress,
      double latitude,
      double longitude,
      double totalAmount,
      DateTime scheduledFor,
      String? deliveryInstructions,
      String? customerOrganization,
      int? itemsCount,
      DateTime? pickedUpAt,
      DateTime? deliveredAt,
      DateTime? createdAt});
}

/// @nodoc
class _$DeliveryCopyWithImpl<$Res> implements $DeliveryCopyWith<$Res> {
  _$DeliveryCopyWithImpl(this._self, this._then);

  final Delivery _self;
  final $Res Function(Delivery) _then;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? deliveryAddress = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? totalAmount = null,
    Object? scheduledFor = null,
    Object? deliveryInstructions = freezed,
    Object? customerOrganization = freezed,
    Object? itemsCount = freezed,
    Object? pickedUpAt = freezed,
    Object? deliveredAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _self.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _self.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scheduledFor: null == scheduledFor
          ? _self.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryInstructions: freezed == deliveryInstructions
          ? _self.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      customerOrganization: freezed == customerOrganization
          ? _self.customerOrganization
          : customerOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsCount: freezed == itemsCount
          ? _self.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pickedUpAt: freezed == pickedUpAt
          ? _self.pickedUpAt
          : pickedUpAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Delivery].
extension DeliveryPatterns on Delivery {
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
    TResult Function(_Delivery value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Delivery() when $default != null:
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
    TResult Function(_Delivery value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Delivery():
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
    TResult? Function(_Delivery value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Delivery() when $default != null:
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
            String orderId,
            String orderNumber,
            String status,
            String customerName,
            String customerPhone,
            String deliveryAddress,
            double latitude,
            double longitude,
            double totalAmount,
            DateTime scheduledFor,
            String? deliveryInstructions,
            String? customerOrganization,
            int? itemsCount,
            DateTime? pickedUpAt,
            DateTime? deliveredAt,
            DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Delivery() when $default != null:
        return $default(
            _that.id,
            _that.orderId,
            _that.orderNumber,
            _that.status,
            _that.customerName,
            _that.customerPhone,
            _that.deliveryAddress,
            _that.latitude,
            _that.longitude,
            _that.totalAmount,
            _that.scheduledFor,
            _that.deliveryInstructions,
            _that.customerOrganization,
            _that.itemsCount,
            _that.pickedUpAt,
            _that.deliveredAt,
            _that.createdAt);
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
            String orderId,
            String orderNumber,
            String status,
            String customerName,
            String customerPhone,
            String deliveryAddress,
            double latitude,
            double longitude,
            double totalAmount,
            DateTime scheduledFor,
            String? deliveryInstructions,
            String? customerOrganization,
            int? itemsCount,
            DateTime? pickedUpAt,
            DateTime? deliveredAt,
            DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Delivery():
        return $default(
            _that.id,
            _that.orderId,
            _that.orderNumber,
            _that.status,
            _that.customerName,
            _that.customerPhone,
            _that.deliveryAddress,
            _that.latitude,
            _that.longitude,
            _that.totalAmount,
            _that.scheduledFor,
            _that.deliveryInstructions,
            _that.customerOrganization,
            _that.itemsCount,
            _that.pickedUpAt,
            _that.deliveredAt,
            _that.createdAt);
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
            String orderId,
            String orderNumber,
            String status,
            String customerName,
            String customerPhone,
            String deliveryAddress,
            double latitude,
            double longitude,
            double totalAmount,
            DateTime scheduledFor,
            String? deliveryInstructions,
            String? customerOrganization,
            int? itemsCount,
            DateTime? pickedUpAt,
            DateTime? deliveredAt,
            DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Delivery() when $default != null:
        return $default(
            _that.id,
            _that.orderId,
            _that.orderNumber,
            _that.status,
            _that.customerName,
            _that.customerPhone,
            _that.deliveryAddress,
            _that.latitude,
            _that.longitude,
            _that.totalAmount,
            _that.scheduledFor,
            _that.deliveryInstructions,
            _that.customerOrganization,
            _that.itemsCount,
            _that.pickedUpAt,
            _that.deliveredAt,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Delivery extends Delivery {
  const _Delivery(
      {required this.id,
      required this.orderId,
      required this.orderNumber,
      required this.status,
      required this.customerName,
      required this.customerPhone,
      required this.deliveryAddress,
      required this.latitude,
      required this.longitude,
      required this.totalAmount,
      required this.scheduledFor,
      this.deliveryInstructions,
      this.customerOrganization,
      this.itemsCount,
      this.pickedUpAt,
      this.deliveredAt,
      this.createdAt})
      : super._();

  @override
  final String id;
  @override
  final String orderId;
  @override
  final String orderNumber;
  @override
  final String status;
  @override
  final String customerName;
  @override
  final String customerPhone;
  @override
  final String deliveryAddress;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double totalAmount;
  @override
  final DateTime scheduledFor;
  @override
  final String? deliveryInstructions;
  @override
  final String? customerOrganization;
  @override
  final int? itemsCount;
  @override
  final DateTime? pickedUpAt;
  @override
  final DateTime? deliveredAt;
  @override
  final DateTime? createdAt;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeliveryCopyWith<_Delivery> get copyWith =>
      __$DeliveryCopyWithImpl<_Delivery>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Delivery &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.customerOrganization, customerOrganization) ||
                other.customerOrganization == customerOrganization) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            (identical(other.pickedUpAt, pickedUpAt) ||
                other.pickedUpAt == pickedUpAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderId,
      orderNumber,
      status,
      customerName,
      customerPhone,
      deliveryAddress,
      latitude,
      longitude,
      totalAmount,
      scheduledFor,
      deliveryInstructions,
      customerOrganization,
      itemsCount,
      pickedUpAt,
      deliveredAt,
      createdAt);

  @override
  String toString() {
    return 'Delivery(id: $id, orderId: $orderId, orderNumber: $orderNumber, status: $status, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, latitude: $latitude, longitude: $longitude, totalAmount: $totalAmount, scheduledFor: $scheduledFor, deliveryInstructions: $deliveryInstructions, customerOrganization: $customerOrganization, itemsCount: $itemsCount, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$DeliveryCopyWith<$Res>
    implements $DeliveryCopyWith<$Res> {
  factory _$DeliveryCopyWith(_Delivery value, $Res Function(_Delivery) _then) =
      __$DeliveryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String orderId,
      String orderNumber,
      String status,
      String customerName,
      String customerPhone,
      String deliveryAddress,
      double latitude,
      double longitude,
      double totalAmount,
      DateTime scheduledFor,
      String? deliveryInstructions,
      String? customerOrganization,
      int? itemsCount,
      DateTime? pickedUpAt,
      DateTime? deliveredAt,
      DateTime? createdAt});
}

/// @nodoc
class __$DeliveryCopyWithImpl<$Res> implements _$DeliveryCopyWith<$Res> {
  __$DeliveryCopyWithImpl(this._self, this._then);

  final _Delivery _self;
  final $Res Function(_Delivery) _then;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? deliveryAddress = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? totalAmount = null,
    Object? scheduledFor = null,
    Object? deliveryInstructions = freezed,
    Object? customerOrganization = freezed,
    Object? itemsCount = freezed,
    Object? pickedUpAt = freezed,
    Object? deliveredAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Delivery(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _self.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _self.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scheduledFor: null == scheduledFor
          ? _self.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryInstructions: freezed == deliveryInstructions
          ? _self.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      customerOrganization: freezed == customerOrganization
          ? _self.customerOrganization
          : customerOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsCount: freezed == itemsCount
          ? _self.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pickedUpAt: freezed == pickedUpAt
          ? _self.pickedUpAt
          : pickedUpAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
