// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderItem {
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {String productId,
      String productName,
      int quantity,
      double unitPrice,
      double totalPrice,
      String? notes});
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? notes = freezed,
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
          _$OrderItemImpl value, $Res Function(_$OrderItemImpl) then) =
      __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String productName,
      int quantity,
      double unitPrice,
      double totalPrice,
      String? notes});
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
      _$OrderItemImpl _value, $Res Function(_$OrderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? notes = freezed,
  }) {
    return _then(_$OrderItemImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OrderItemImpl implements _OrderItem {
  const _$OrderItemImpl(
      {required this.productId,
      required this.productName,
      required this.quantity,
      required this.unitPrice,
      required this.totalPrice,
      this.notes});

  @override
  final String productId;
  @override
  final String productName;
  @override
  final int quantity;
  @override
  final double unitPrice;
  @override
  final double totalPrice;
  @override
  final String? notes;

  @override
  String toString() {
    return 'OrderItem(productId: $productId, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, productName, quantity,
      unitPrice, totalPrice, notes);

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);
}

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem(
      {required final String productId,
      required final String productName,
      required final int quantity,
      required final double unitPrice,
      required final double totalPrice,
      final String? notes}) = _$OrderItemImpl;

  @override
  String get productId;
  @override
  String get productName;
  @override
  int get quantity;
  @override
  double get unitPrice;
  @override
  double get totalPrice;
  @override
  String? get notes;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderDetail {
  String get id => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get organizationId => throw _privateConstructorUsedError;
  String get organizationName => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get delivererId => throw _privateConstructorUsedError;
  String? get delivererName => throw _privateConstructorUsedError;
  String? get deliveryAddress => throw _privateConstructorUsedError;
  String? get deliveryInstructions => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get paymentStatus => throw _privateConstructorUsedError;
  DateTime? get scheduledFor => throw _privateConstructorUsedError;
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailCopyWith<OrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailCopyWith<$Res> {
  factory $OrderDetailCopyWith(
          OrderDetail value, $Res Function(OrderDetail) then) =
      _$OrderDetailCopyWithImpl<$Res, OrderDetail>;
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String status,
      String customerId,
      String customerName,
      String organizationId,
      String organizationName,
      List<OrderItem> items,
      double subtotal,
      double deliveryFee,
      double totalAmount,
      DateTime createdAt,
      String? delivererId,
      String? delivererName,
      String? deliveryAddress,
      String? deliveryInstructions,
      String? paymentMethod,
      String? paymentStatus,
      DateTime? scheduledFor,
      DateTime? deliveredAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$OrderDetailCopyWithImpl<$Res, $Val extends OrderDetail>
    implements $OrderDetailCopyWith<$Res> {
  _$OrderDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? organizationId = null,
    Object? organizationName = null,
    Object? items = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? totalAmount = null,
    Object? createdAt = null,
    Object? delivererId = freezed,
    Object? delivererName = freezed,
    Object? deliveryAddress = freezed,
    Object? deliveryInstructions = freezed,
    Object? paymentMethod = freezed,
    Object? paymentStatus = freezed,
    Object? scheduledFor = freezed,
    Object? deliveredAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      delivererId: freezed == delivererId
          ? _value.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String?,
      delivererName: freezed == delivererName
          ? _value.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryInstructions: freezed == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledFor: freezed == scheduledFor
          ? _value.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailImplCopyWith<$Res>
    implements $OrderDetailCopyWith<$Res> {
  factory _$$OrderDetailImplCopyWith(
          _$OrderDetailImpl value, $Res Function(_$OrderDetailImpl) then) =
      __$$OrderDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String status,
      String customerId,
      String customerName,
      String organizationId,
      String organizationName,
      List<OrderItem> items,
      double subtotal,
      double deliveryFee,
      double totalAmount,
      DateTime createdAt,
      String? delivererId,
      String? delivererName,
      String? deliveryAddress,
      String? deliveryInstructions,
      String? paymentMethod,
      String? paymentStatus,
      DateTime? scheduledFor,
      DateTime? deliveredAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$OrderDetailImplCopyWithImpl<$Res>
    extends _$OrderDetailCopyWithImpl<$Res, _$OrderDetailImpl>
    implements _$$OrderDetailImplCopyWith<$Res> {
  __$$OrderDetailImplCopyWithImpl(
      _$OrderDetailImpl _value, $Res Function(_$OrderDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? organizationId = null,
    Object? organizationName = null,
    Object? items = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? totalAmount = null,
    Object? createdAt = null,
    Object? delivererId = freezed,
    Object? delivererName = freezed,
    Object? deliveryAddress = freezed,
    Object? deliveryInstructions = freezed,
    Object? paymentMethod = freezed,
    Object? paymentStatus = freezed,
    Object? scheduledFor = freezed,
    Object? deliveredAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$OrderDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      delivererId: freezed == delivererId
          ? _value.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String?,
      delivererName: freezed == delivererName
          ? _value.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryInstructions: freezed == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledFor: freezed == scheduledFor
          ? _value.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$OrderDetailImpl extends _OrderDetail {
  const _$OrderDetailImpl(
      {required this.id,
      required this.orderNumber,
      required this.status,
      required this.customerId,
      required this.customerName,
      required this.organizationId,
      required this.organizationName,
      required final List<OrderItem> items,
      required this.subtotal,
      required this.deliveryFee,
      required this.totalAmount,
      required this.createdAt,
      this.delivererId,
      this.delivererName,
      this.deliveryAddress,
      this.deliveryInstructions,
      this.paymentMethod,
      this.paymentStatus,
      this.scheduledFor,
      this.deliveredAt,
      this.updatedAt})
      : _items = items,
        super._();

  @override
  final String id;
  @override
  final String orderNumber;
  @override
  final String status;
  @override
  final String customerId;
  @override
  final String customerName;
  @override
  final String organizationId;
  @override
  final String organizationName;
  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double subtotal;
  @override
  final double deliveryFee;
  @override
  final double totalAmount;
  @override
  final DateTime createdAt;
  @override
  final String? delivererId;
  @override
  final String? delivererName;
  @override
  final String? deliveryAddress;
  @override
  final String? deliveryInstructions;
  @override
  final String? paymentMethod;
  @override
  final String? paymentStatus;
  @override
  final DateTime? scheduledFor;
  @override
  final DateTime? deliveredAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'OrderDetail(id: $id, orderNumber: $orderNumber, status: $status, customerId: $customerId, customerName: $customerName, organizationId: $organizationId, organizationName: $organizationName, items: $items, subtotal: $subtotal, deliveryFee: $deliveryFee, totalAmount: $totalAmount, createdAt: $createdAt, delivererId: $delivererId, delivererName: $delivererName, deliveryAddress: $deliveryAddress, deliveryInstructions: $deliveryInstructions, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, scheduledFor: $scheduledFor, deliveredAt: $deliveredAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.delivererId, delivererId) ||
                other.delivererId == delivererId) &&
            (identical(other.delivererName, delivererName) ||
                other.delivererName == delivererName) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        orderNumber,
        status,
        customerId,
        customerName,
        organizationId,
        organizationName,
        const DeepCollectionEquality().hash(_items),
        subtotal,
        deliveryFee,
        totalAmount,
        createdAt,
        delivererId,
        delivererName,
        deliveryAddress,
        deliveryInstructions,
        paymentMethod,
        paymentStatus,
        scheduledFor,
        deliveredAt,
        updatedAt
      ]);

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailImplCopyWith<_$OrderDetailImpl> get copyWith =>
      __$$OrderDetailImplCopyWithImpl<_$OrderDetailImpl>(this, _$identity);
}

abstract class _OrderDetail extends OrderDetail {
  const factory _OrderDetail(
      {required final String id,
      required final String orderNumber,
      required final String status,
      required final String customerId,
      required final String customerName,
      required final String organizationId,
      required final String organizationName,
      required final List<OrderItem> items,
      required final double subtotal,
      required final double deliveryFee,
      required final double totalAmount,
      required final DateTime createdAt,
      final String? delivererId,
      final String? delivererName,
      final String? deliveryAddress,
      final String? deliveryInstructions,
      final String? paymentMethod,
      final String? paymentStatus,
      final DateTime? scheduledFor,
      final DateTime? deliveredAt,
      final DateTime? updatedAt}) = _$OrderDetailImpl;
  const _OrderDetail._() : super._();

  @override
  String get id;
  @override
  String get orderNumber;
  @override
  String get status;
  @override
  String get customerId;
  @override
  String get customerName;
  @override
  String get organizationId;
  @override
  String get organizationName;
  @override
  List<OrderItem> get items;
  @override
  double get subtotal;
  @override
  double get deliveryFee;
  @override
  double get totalAmount;
  @override
  DateTime get createdAt;
  @override
  String? get delivererId;
  @override
  String? get delivererName;
  @override
  String? get deliveryAddress;
  @override
  String? get deliveryInstructions;
  @override
  String? get paymentMethod;
  @override
  String? get paymentStatus;
  @override
  DateTime? get scheduledFor;
  @override
  DateTime? get deliveredAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailImplCopyWith<_$OrderDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
