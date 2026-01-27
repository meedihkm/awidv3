// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryModel _$DeliveryModelFromJson(Map<String, dynamic> json) {
  return _DeliveryModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_phone')
  String get customerPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_for')
  DateTime get scheduledFor => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_instructions')
  String? get deliveryInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_organization')
  String? get customerOrganization => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count')
  int? get itemsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'picked_up_at')
  DateTime? get pickedUpAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivered_at')
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DeliveryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryModelCopyWith<DeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryModelCopyWith<$Res> {
  factory $DeliveryModelCopyWith(
          DeliveryModel value, $Res Function(DeliveryModel) then) =
      _$DeliveryModelCopyWithImpl<$Res, DeliveryModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'order_number') String orderNumber,
      String status,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_phone') String customerPhone,
      @JsonKey(name: 'delivery_address') String deliveryAddress,
      double latitude,
      double longitude,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'scheduled_for') DateTime scheduledFor,
      @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
      @JsonKey(name: 'customer_organization') String? customerOrganization,
      @JsonKey(name: 'items_count') int? itemsCount,
      @JsonKey(name: 'picked_up_at') DateTime? pickedUpAt,
      @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$DeliveryModelCopyWithImpl<$Res, $Val extends DeliveryModel>
    implements $DeliveryModelCopyWith<$Res> {
  _$DeliveryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryModel
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
abstract class _$$DeliveryModelImplCopyWith<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  factory _$$DeliveryModelImplCopyWith(
          _$DeliveryModelImpl value, $Res Function(_$DeliveryModelImpl) then) =
      __$$DeliveryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'order_number') String orderNumber,
      String status,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_phone') String customerPhone,
      @JsonKey(name: 'delivery_address') String deliveryAddress,
      double latitude,
      double longitude,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'scheduled_for') DateTime scheduledFor,
      @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
      @JsonKey(name: 'customer_organization') String? customerOrganization,
      @JsonKey(name: 'items_count') int? itemsCount,
      @JsonKey(name: 'picked_up_at') DateTime? pickedUpAt,
      @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$DeliveryModelImplCopyWithImpl<$Res>
    extends _$DeliveryModelCopyWithImpl<$Res, _$DeliveryModelImpl>
    implements _$$DeliveryModelImplCopyWith<$Res> {
  __$$DeliveryModelImplCopyWithImpl(
      _$DeliveryModelImpl _value, $Res Function(_$DeliveryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryModel
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
    return _then(_$DeliveryModelImpl(
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
@JsonSerializable()
class _$DeliveryModelImpl extends _DeliveryModel {
  const _$DeliveryModelImpl(
      {required this.id,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'order_number') required this.orderNumber,
      required this.status,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'customer_phone') required this.customerPhone,
      @JsonKey(name: 'delivery_address') required this.deliveryAddress,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'total_amount') required this.totalAmount,
      @JsonKey(name: 'scheduled_for') required this.scheduledFor,
      @JsonKey(name: 'delivery_instructions') this.deliveryInstructions,
      @JsonKey(name: 'customer_organization') this.customerOrganization,
      @JsonKey(name: 'items_count') this.itemsCount,
      @JsonKey(name: 'picked_up_at') this.pickedUpAt,
      @JsonKey(name: 'delivered_at') this.deliveredAt,
      @JsonKey(name: 'created_at') this.createdAt})
      : super._();

  factory _$DeliveryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  final String status;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'customer_phone')
  final String customerPhone;
  @override
  @JsonKey(name: 'delivery_address')
  final String deliveryAddress;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  @JsonKey(name: 'scheduled_for')
  final DateTime scheduledFor;
  @override
  @JsonKey(name: 'delivery_instructions')
  final String? deliveryInstructions;
  @override
  @JsonKey(name: 'customer_organization')
  final String? customerOrganization;
  @override
  @JsonKey(name: 'items_count')
  final int? itemsCount;
  @override
  @JsonKey(name: 'picked_up_at')
  final DateTime? pickedUpAt;
  @override
  @JsonKey(name: 'delivered_at')
  final DateTime? deliveredAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'DeliveryModel(id: $id, orderId: $orderId, orderNumber: $orderNumber, status: $status, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, latitude: $latitude, longitude: $longitude, totalAmount: $totalAmount, scheduledFor: $scheduledFor, deliveryInstructions: $deliveryInstructions, customerOrganization: $customerOrganization, itemsCount: $itemsCount, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of DeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryModelImplCopyWith<_$DeliveryModelImpl> get copyWith =>
      __$$DeliveryModelImplCopyWithImpl<_$DeliveryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryModelImplToJson(
      this,
    );
  }
}

abstract class _DeliveryModel extends DeliveryModel {
  const factory _DeliveryModel(
      {required final String id,
      @JsonKey(name: 'order_id') required final String orderId,
      @JsonKey(name: 'order_number') required final String orderNumber,
      required final String status,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'customer_phone') required final String customerPhone,
      @JsonKey(name: 'delivery_address') required final String deliveryAddress,
      required final double latitude,
      required final double longitude,
      @JsonKey(name: 'total_amount') required final double totalAmount,
      @JsonKey(name: 'scheduled_for') required final DateTime scheduledFor,
      @JsonKey(name: 'delivery_instructions')
      final String? deliveryInstructions,
      @JsonKey(name: 'customer_organization')
      final String? customerOrganization,
      @JsonKey(name: 'items_count') final int? itemsCount,
      @JsonKey(name: 'picked_up_at') final DateTime? pickedUpAt,
      @JsonKey(name: 'delivered_at') final DateTime? deliveredAt,
      @JsonKey(name: 'created_at')
      final DateTime? createdAt}) = _$DeliveryModelImpl;
  const _DeliveryModel._() : super._();

  factory _DeliveryModel.fromJson(Map<String, dynamic> json) =
      _$DeliveryModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  String get status;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'customer_phone')
  String get customerPhone;
  @override
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @override
  @JsonKey(name: 'scheduled_for')
  DateTime get scheduledFor;
  @override
  @JsonKey(name: 'delivery_instructions')
  String? get deliveryInstructions;
  @override
  @JsonKey(name: 'customer_organization')
  String? get customerOrganization;
  @override
  @JsonKey(name: 'items_count')
  int? get itemsCount;
  @override
  @JsonKey(name: 'picked_up_at')
  DateTime? get pickedUpAt;
  @override
  @JsonKey(name: 'delivered_at')
  DateTime? get deliveredAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of DeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryModelImplCopyWith<_$DeliveryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
