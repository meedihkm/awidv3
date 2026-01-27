// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Delivery {
  String get id => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get customerPhone => throw _privateConstructorUsedError;
  String get deliveryAddress => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  DateTime get scheduledFor => throw _privateConstructorUsedError;
  String? get deliveryInstructions => throw _privateConstructorUsedError;
  String? get customerOrganization => throw _privateConstructorUsedError;
  int? get itemsCount => throw _privateConstructorUsedError;
  DateTime? get pickedUpAt => throw _privateConstructorUsedError;
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryCopyWith<Delivery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryCopyWith<$Res> {
  factory $DeliveryCopyWith(Delivery value, $Res Function(Delivery) then) =
      _$DeliveryCopyWithImpl<$Res, Delivery>;
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
class _$DeliveryCopyWithImpl<$Res, $Val extends Delivery>
    implements $DeliveryCopyWith<$Res> {
  _$DeliveryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scheduledFor: null == scheduledFor
          ? _value.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryInstructions: freezed == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      customerOrganization: freezed == customerOrganization
          ? _value.customerOrganization
          : customerOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsCount: freezed == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pickedUpAt: freezed == pickedUpAt
          ? _value.pickedUpAt
          : pickedUpAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryImplCopyWith<$Res>
    implements $DeliveryCopyWith<$Res> {
  factory _$$DeliveryImplCopyWith(
          _$DeliveryImpl value, $Res Function(_$DeliveryImpl) then) =
      __$$DeliveryImplCopyWithImpl<$Res>;
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
class __$$DeliveryImplCopyWithImpl<$Res>
    extends _$DeliveryCopyWithImpl<$Res, _$DeliveryImpl>
    implements _$$DeliveryImplCopyWith<$Res> {
  __$$DeliveryImplCopyWithImpl(
      _$DeliveryImpl _value, $Res Function(_$DeliveryImpl) _then)
      : super(_value, _then);

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
    return _then(_$DeliveryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scheduledFor: null == scheduledFor
          ? _value.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryInstructions: freezed == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      customerOrganization: freezed == customerOrganization
          ? _value.customerOrganization
          : customerOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsCount: freezed == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pickedUpAt: freezed == pickedUpAt
          ? _value.pickedUpAt
          : pickedUpAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$DeliveryImpl extends _Delivery {
  const _$DeliveryImpl(
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

  @override
  String toString() {
    return 'Delivery(id: $id, orderId: $orderId, orderNumber: $orderNumber, status: $status, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, latitude: $latitude, longitude: $longitude, totalAmount: $totalAmount, scheduledFor: $scheduledFor, deliveryInstructions: $deliveryInstructions, customerOrganization: $customerOrganization, itemsCount: $itemsCount, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryImpl &&
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

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryImplCopyWith<_$DeliveryImpl> get copyWith =>
      __$$DeliveryImplCopyWithImpl<_$DeliveryImpl>(this, _$identity);
}

abstract class _Delivery extends Delivery {
  const factory _Delivery(
      {required final String id,
      required final String orderId,
      required final String orderNumber,
      required final String status,
      required final String customerName,
      required final String customerPhone,
      required final String deliveryAddress,
      required final double latitude,
      required final double longitude,
      required final double totalAmount,
      required final DateTime scheduledFor,
      final String? deliveryInstructions,
      final String? customerOrganization,
      final int? itemsCount,
      final DateTime? pickedUpAt,
      final DateTime? deliveredAt,
      final DateTime? createdAt}) = _$DeliveryImpl;
  const _Delivery._() : super._();

  @override
  String get id;
  @override
  String get orderId;
  @override
  String get orderNumber;
  @override
  String get status;
  @override
  String get customerName;
  @override
  String get customerPhone;
  @override
  String get deliveryAddress;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get totalAmount;
  @override
  DateTime get scheduledFor;
  @override
  String? get deliveryInstructions;
  @override
  String? get customerOrganization;
  @override
  int? get itemsCount;
  @override
  DateTime? get pickedUpAt;
  @override
  DateTime? get deliveredAt;
  @override
  DateTime? get createdAt;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryImplCopyWith<_$DeliveryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
