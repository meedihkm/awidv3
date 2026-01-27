// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) {
  return _OrderItemModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemModel {
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price')
  double get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  double get totalPrice => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
          OrderItemModel value, $Res Function(OrderItemModel) then) =
      _$OrderItemModelCopyWithImpl<$Res, OrderItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      int quantity,
      @JsonKey(name: 'unit_price') double unitPrice,
      @JsonKey(name: 'total_price') double totalPrice,
      String? notes});
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res, $Val extends OrderItemModel>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemModel
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
abstract class _$$OrderItemModelImplCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$$OrderItemModelImplCopyWith(_$OrderItemModelImpl value,
          $Res Function(_$OrderItemModelImpl) then) =
      __$$OrderItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      int quantity,
      @JsonKey(name: 'unit_price') double unitPrice,
      @JsonKey(name: 'total_price') double totalPrice,
      String? notes});
}

/// @nodoc
class __$$OrderItemModelImplCopyWithImpl<$Res>
    extends _$OrderItemModelCopyWithImpl<$Res, _$OrderItemModelImpl>
    implements _$$OrderItemModelImplCopyWith<$Res> {
  __$$OrderItemModelImplCopyWithImpl(
      _$OrderItemModelImpl _value, $Res Function(_$OrderItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItemModel
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
    return _then(_$OrderItemModelImpl(
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
@JsonSerializable()
class _$OrderItemModelImpl extends _OrderItemModel {
  const _$OrderItemModelImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      required this.quantity,
      @JsonKey(name: 'unit_price') required this.unitPrice,
      @JsonKey(name: 'total_price') required this.totalPrice,
      this.notes})
      : super._();

  factory _$OrderItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemModelImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'unit_price')
  final double unitPrice;
  @override
  @JsonKey(name: 'total_price')
  final double totalPrice;
  @override
  final String? notes;

  @override
  String toString() {
    return 'OrderItemModel(productId: $productId, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, productName, quantity,
      unitPrice, totalPrice, notes);

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      __$$OrderItemModelImplCopyWithImpl<_$OrderItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemModelImplToJson(
      this,
    );
  }
}

abstract class _OrderItemModel extends OrderItemModel {
  const factory _OrderItemModel(
      {@JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      required final int quantity,
      @JsonKey(name: 'unit_price') required final double unitPrice,
      @JsonKey(name: 'total_price') required final double totalPrice,
      final String? notes}) = _$OrderItemModelImpl;
  const _OrderItemModel._() : super._();

  factory _OrderItemModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'unit_price')
  double get unitPrice;
  @override
  @JsonKey(name: 'total_price')
  double get totalPrice;
  @override
  String? get notes;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) {
  return _OrderDetailModel.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_id')
  String get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_name')
  String get organizationName => throw _privateConstructorUsedError;
  List<OrderItemModel> get items => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_fee')
  double get deliveryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliverer_id')
  String? get delivererId => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliverer_name')
  String? get delivererName => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address')
  String? get deliveryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_instructions')
  String? get deliveryInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String? get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_for')
  DateTime? get scheduledFor => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivered_at')
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailModelCopyWith<OrderDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailModelCopyWith<$Res> {
  factory $OrderDetailModelCopyWith(
          OrderDetailModel value, $Res Function(OrderDetailModel) then) =
      _$OrderDetailModelCopyWithImpl<$Res, OrderDetailModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_number') String orderNumber,
      String status,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'organization_id') String organizationId,
      @JsonKey(name: 'organization_name') String organizationName,
      List<OrderItemModel> items,
      double subtotal,
      @JsonKey(name: 'delivery_fee') double deliveryFee,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'deliverer_id') String? delivererId,
      @JsonKey(name: 'deliverer_name') String? delivererName,
      @JsonKey(name: 'delivery_address') String? deliveryAddress,
      @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'payment_status') String? paymentStatus,
      @JsonKey(name: 'scheduled_for') DateTime? scheduledFor,
      @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$OrderDetailModelCopyWithImpl<$Res, $Val extends OrderDetailModel>
    implements $OrderDetailModelCopyWith<$Res> {
  _$OrderDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailModel
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
              as List<OrderItemModel>,
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
abstract class _$$OrderDetailModelImplCopyWith<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  factory _$$OrderDetailModelImplCopyWith(_$OrderDetailModelImpl value,
          $Res Function(_$OrderDetailModelImpl) then) =
      __$$OrderDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_number') String orderNumber,
      String status,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'organization_id') String organizationId,
      @JsonKey(name: 'organization_name') String organizationName,
      List<OrderItemModel> items,
      double subtotal,
      @JsonKey(name: 'delivery_fee') double deliveryFee,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'deliverer_id') String? delivererId,
      @JsonKey(name: 'deliverer_name') String? delivererName,
      @JsonKey(name: 'delivery_address') String? deliveryAddress,
      @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'payment_status') String? paymentStatus,
      @JsonKey(name: 'scheduled_for') DateTime? scheduledFor,
      @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$OrderDetailModelImplCopyWithImpl<$Res>
    extends _$OrderDetailModelCopyWithImpl<$Res, _$OrderDetailModelImpl>
    implements _$$OrderDetailModelImplCopyWith<$Res> {
  __$$OrderDetailModelImplCopyWithImpl(_$OrderDetailModelImpl _value,
      $Res Function(_$OrderDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailModel
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
    return _then(_$OrderDetailModelImpl(
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
              as List<OrderItemModel>,
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
@JsonSerializable()
class _$OrderDetailModelImpl extends _OrderDetailModel {
  const _$OrderDetailModelImpl(
      {required this.id,
      @JsonKey(name: 'order_number') required this.orderNumber,
      required this.status,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'organization_id') required this.organizationId,
      @JsonKey(name: 'organization_name') required this.organizationName,
      required final List<OrderItemModel> items,
      required this.subtotal,
      @JsonKey(name: 'delivery_fee') required this.deliveryFee,
      @JsonKey(name: 'total_amount') required this.totalAmount,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'deliverer_id') this.delivererId,
      @JsonKey(name: 'deliverer_name') this.delivererName,
      @JsonKey(name: 'delivery_address') this.deliveryAddress,
      @JsonKey(name: 'delivery_instructions') this.deliveryInstructions,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      @JsonKey(name: 'payment_status') this.paymentStatus,
      @JsonKey(name: 'scheduled_for') this.scheduledFor,
      @JsonKey(name: 'delivered_at') this.deliveredAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _items = items,
        super._();

  factory _$OrderDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  final String status;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'organization_id')
  final String organizationId;
  @override
  @JsonKey(name: 'organization_name')
  final String organizationName;
  final List<OrderItemModel> _items;
  @override
  List<OrderItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double subtotal;
  @override
  @JsonKey(name: 'delivery_fee')
  final double deliveryFee;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'deliverer_id')
  final String? delivererId;
  @override
  @JsonKey(name: 'deliverer_name')
  final String? delivererName;
  @override
  @JsonKey(name: 'delivery_address')
  final String? deliveryAddress;
  @override
  @JsonKey(name: 'delivery_instructions')
  final String? deliveryInstructions;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  @override
  @JsonKey(name: 'scheduled_for')
  final DateTime? scheduledFor;
  @override
  @JsonKey(name: 'delivered_at')
  final DateTime? deliveredAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'OrderDetailModel(id: $id, orderNumber: $orderNumber, status: $status, customerId: $customerId, customerName: $customerName, organizationId: $organizationId, organizationName: $organizationName, items: $items, subtotal: $subtotal, deliveryFee: $deliveryFee, totalAmount: $totalAmount, createdAt: $createdAt, delivererId: $delivererId, delivererName: $delivererName, deliveryAddress: $deliveryAddress, deliveryInstructions: $deliveryInstructions, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, scheduledFor: $scheduledFor, deliveredAt: $deliveredAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailModelImplCopyWith<_$OrderDetailModelImpl> get copyWith =>
      __$$OrderDetailModelImplCopyWithImpl<_$OrderDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailModelImplToJson(
      this,
    );
  }
}

abstract class _OrderDetailModel extends OrderDetailModel {
  const factory _OrderDetailModel(
      {required final String id,
      @JsonKey(name: 'order_number') required final String orderNumber,
      required final String status,
      @JsonKey(name: 'customer_id') required final String customerId,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'organization_id') required final String organizationId,
      @JsonKey(name: 'organization_name')
      required final String organizationName,
      required final List<OrderItemModel> items,
      required final double subtotal,
      @JsonKey(name: 'delivery_fee') required final double deliveryFee,
      @JsonKey(name: 'total_amount') required final double totalAmount,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'deliverer_id') final String? delivererId,
      @JsonKey(name: 'deliverer_name') final String? delivererName,
      @JsonKey(name: 'delivery_address') final String? deliveryAddress,
      @JsonKey(name: 'delivery_instructions')
      final String? deliveryInstructions,
      @JsonKey(name: 'payment_method') final String? paymentMethod,
      @JsonKey(name: 'payment_status') final String? paymentStatus,
      @JsonKey(name: 'scheduled_for') final DateTime? scheduledFor,
      @JsonKey(name: 'delivered_at') final DateTime? deliveredAt,
      @JsonKey(name: 'updated_at')
      final DateTime? updatedAt}) = _$OrderDetailModelImpl;
  const _OrderDetailModel._() : super._();

  factory _OrderDetailModel.fromJson(Map<String, dynamic> json) =
      _$OrderDetailModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  String get status;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'organization_id')
  String get organizationId;
  @override
  @JsonKey(name: 'organization_name')
  String get organizationName;
  @override
  List<OrderItemModel> get items;
  @override
  double get subtotal;
  @override
  @JsonKey(name: 'delivery_fee')
  double get deliveryFee;
  @override
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'deliverer_id')
  String? get delivererId;
  @override
  @JsonKey(name: 'deliverer_name')
  String? get delivererName;
  @override
  @JsonKey(name: 'delivery_address')
  String? get deliveryAddress;
  @override
  @JsonKey(name: 'delivery_instructions')
  String? get deliveryInstructions;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @override
  @JsonKey(name: 'payment_status')
  String? get paymentStatus;
  @override
  @JsonKey(name: 'scheduled_for')
  DateTime? get scheduledFor;
  @override
  @JsonKey(name: 'delivered_at')
  DateTime? get deliveredAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailModelImplCopyWith<_$OrderDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
