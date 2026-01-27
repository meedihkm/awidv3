// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerOrderModel _$CustomerOrderModelFromJson(Map<String, dynamic> json) {
  return _CustomerOrderModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerOrderModel {
  String get id => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  DateTime get orderDate => throw _privateConstructorUsedError;
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<CustomerOrderItemModel> get items => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get packagingDeposit => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get paidAmount => throw _privateConstructorUsedError;
  double get remainingAmount => throw _privateConstructorUsedError;
  String? get delivererId => throw _privateConstructorUsedError;
  String? get delivererName => throw _privateConstructorUsedError;
  String? get deliveryAddress => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  DateTime? get cancelledAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  bool get hasProofOfDelivery => throw _privateConstructorUsedError;
  String? get proofOfDeliveryId => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CustomerOrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerOrderModelCopyWith<CustomerOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerOrderModelCopyWith<$Res> {
  factory $CustomerOrderModelCopyWith(
          CustomerOrderModel value, $Res Function(CustomerOrderModel) then) =
      _$CustomerOrderModelCopyWithImpl<$Res, CustomerOrderModel>;
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String customerId,
      String customerName,
      DateTime orderDate,
      DateTime? deliveryDate,
      String status,
      List<CustomerOrderItemModel> items,
      double subtotal,
      double deliveryFee,
      double packagingDeposit,
      double totalAmount,
      double paidAmount,
      double remainingAmount,
      String? delivererId,
      String? delivererName,
      String? deliveryAddress,
      String? notes,
      String? cancellationReason,
      DateTime? cancelledAt,
      DateTime? completedAt,
      bool hasProofOfDelivery,
      String? proofOfDeliveryId,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CustomerOrderModelCopyWithImpl<$Res, $Val extends CustomerOrderModel>
    implements $CustomerOrderModelCopyWith<$Res> {
  _$CustomerOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? orderDate = null,
    Object? deliveryDate = freezed,
    Object? status = null,
    Object? items = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? packagingDeposit = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? delivererId = freezed,
    Object? delivererName = freezed,
    Object? deliveryAddress = freezed,
    Object? notes = freezed,
    Object? cancellationReason = freezed,
    Object? cancelledAt = freezed,
    Object? completedAt = freezed,
    Object? hasProofOfDelivery = null,
    Object? proofOfDeliveryId = freezed,
    Object? createdAt = freezed,
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
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerOrderItemModel>,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      packagingDeposit: null == packagingDeposit
          ? _value.packagingDeposit
          : packagingDeposit // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingAmount: null == remainingAmount
          ? _value.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
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
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasProofOfDelivery: null == hasProofOfDelivery
          ? _value.hasProofOfDelivery
          : hasProofOfDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      proofOfDeliveryId: freezed == proofOfDeliveryId
          ? _value.proofOfDeliveryId
          : proofOfDeliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$CustomerOrderModelImplCopyWith<$Res>
    implements $CustomerOrderModelCopyWith<$Res> {
  factory _$$CustomerOrderModelImplCopyWith(_$CustomerOrderModelImpl value,
          $Res Function(_$CustomerOrderModelImpl) then) =
      __$$CustomerOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String customerId,
      String customerName,
      DateTime orderDate,
      DateTime? deliveryDate,
      String status,
      List<CustomerOrderItemModel> items,
      double subtotal,
      double deliveryFee,
      double packagingDeposit,
      double totalAmount,
      double paidAmount,
      double remainingAmount,
      String? delivererId,
      String? delivererName,
      String? deliveryAddress,
      String? notes,
      String? cancellationReason,
      DateTime? cancelledAt,
      DateTime? completedAt,
      bool hasProofOfDelivery,
      String? proofOfDeliveryId,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CustomerOrderModelImplCopyWithImpl<$Res>
    extends _$CustomerOrderModelCopyWithImpl<$Res, _$CustomerOrderModelImpl>
    implements _$$CustomerOrderModelImplCopyWith<$Res> {
  __$$CustomerOrderModelImplCopyWithImpl(_$CustomerOrderModelImpl _value,
      $Res Function(_$CustomerOrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? orderDate = null,
    Object? deliveryDate = freezed,
    Object? status = null,
    Object? items = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? packagingDeposit = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? delivererId = freezed,
    Object? delivererName = freezed,
    Object? deliveryAddress = freezed,
    Object? notes = freezed,
    Object? cancellationReason = freezed,
    Object? cancelledAt = freezed,
    Object? completedAt = freezed,
    Object? hasProofOfDelivery = null,
    Object? proofOfDeliveryId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CustomerOrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerOrderItemModel>,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      packagingDeposit: null == packagingDeposit
          ? _value.packagingDeposit
          : packagingDeposit // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingAmount: null == remainingAmount
          ? _value.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
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
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasProofOfDelivery: null == hasProofOfDelivery
          ? _value.hasProofOfDelivery
          : hasProofOfDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      proofOfDeliveryId: freezed == proofOfDeliveryId
          ? _value.proofOfDeliveryId
          : proofOfDeliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$CustomerOrderModelImpl implements _CustomerOrderModel {
  const _$CustomerOrderModelImpl(
      {required this.id,
      required this.orderNumber,
      required this.customerId,
      required this.customerName,
      required this.orderDate,
      this.deliveryDate,
      required this.status,
      required final List<CustomerOrderItemModel> items,
      required this.subtotal,
      required this.deliveryFee,
      required this.packagingDeposit,
      required this.totalAmount,
      required this.paidAmount,
      required this.remainingAmount,
      this.delivererId,
      this.delivererName,
      this.deliveryAddress,
      this.notes,
      this.cancellationReason,
      this.cancelledAt,
      this.completedAt,
      this.hasProofOfDelivery = false,
      this.proofOfDeliveryId,
      this.createdAt,
      this.updatedAt})
      : _items = items;

  factory _$CustomerOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerOrderModelImplFromJson(json);

  @override
  final String id;
  @override
  final String orderNumber;
  @override
  final String customerId;
  @override
  final String customerName;
  @override
  final DateTime orderDate;
  @override
  final DateTime? deliveryDate;
  @override
  final String status;
  final List<CustomerOrderItemModel> _items;
  @override
  List<CustomerOrderItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double subtotal;
  @override
  final double deliveryFee;
  @override
  final double packagingDeposit;
  @override
  final double totalAmount;
  @override
  final double paidAmount;
  @override
  final double remainingAmount;
  @override
  final String? delivererId;
  @override
  final String? delivererName;
  @override
  final String? deliveryAddress;
  @override
  final String? notes;
  @override
  final String? cancellationReason;
  @override
  final DateTime? cancelledAt;
  @override
  final DateTime? completedAt;
  @override
  @JsonKey()
  final bool hasProofOfDelivery;
  @override
  final String? proofOfDeliveryId;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CustomerOrderModel(id: $id, orderNumber: $orderNumber, customerId: $customerId, customerName: $customerName, orderDate: $orderDate, deliveryDate: $deliveryDate, status: $status, items: $items, subtotal: $subtotal, deliveryFee: $deliveryFee, packagingDeposit: $packagingDeposit, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, delivererId: $delivererId, delivererName: $delivererName, deliveryAddress: $deliveryAddress, notes: $notes, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, completedAt: $completedAt, hasProofOfDelivery: $hasProofOfDelivery, proofOfDeliveryId: $proofOfDeliveryId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerOrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.packagingDeposit, packagingDeposit) ||
                other.packagingDeposit == packagingDeposit) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.delivererId, delivererId) ||
                other.delivererId == delivererId) &&
            (identical(other.delivererName, delivererName) ||
                other.delivererName == delivererName) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.hasProofOfDelivery, hasProofOfDelivery) ||
                other.hasProofOfDelivery == hasProofOfDelivery) &&
            (identical(other.proofOfDeliveryId, proofOfDeliveryId) ||
                other.proofOfDeliveryId == proofOfDeliveryId) &&
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
        orderNumber,
        customerId,
        customerName,
        orderDate,
        deliveryDate,
        status,
        const DeepCollectionEquality().hash(_items),
        subtotal,
        deliveryFee,
        packagingDeposit,
        totalAmount,
        paidAmount,
        remainingAmount,
        delivererId,
        delivererName,
        deliveryAddress,
        notes,
        cancellationReason,
        cancelledAt,
        completedAt,
        hasProofOfDelivery,
        proofOfDeliveryId,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of CustomerOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerOrderModelImplCopyWith<_$CustomerOrderModelImpl> get copyWith =>
      __$$CustomerOrderModelImplCopyWithImpl<_$CustomerOrderModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerOrderModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerOrderModel implements CustomerOrderModel {
  const factory _CustomerOrderModel(
      {required final String id,
      required final String orderNumber,
      required final String customerId,
      required final String customerName,
      required final DateTime orderDate,
      final DateTime? deliveryDate,
      required final String status,
      required final List<CustomerOrderItemModel> items,
      required final double subtotal,
      required final double deliveryFee,
      required final double packagingDeposit,
      required final double totalAmount,
      required final double paidAmount,
      required final double remainingAmount,
      final String? delivererId,
      final String? delivererName,
      final String? deliveryAddress,
      final String? notes,
      final String? cancellationReason,
      final DateTime? cancelledAt,
      final DateTime? completedAt,
      final bool hasProofOfDelivery,
      final String? proofOfDeliveryId,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CustomerOrderModelImpl;

  factory _CustomerOrderModel.fromJson(Map<String, dynamic> json) =
      _$CustomerOrderModelImpl.fromJson;

  @override
  String get id;
  @override
  String get orderNumber;
  @override
  String get customerId;
  @override
  String get customerName;
  @override
  DateTime get orderDate;
  @override
  DateTime? get deliveryDate;
  @override
  String get status;
  @override
  List<CustomerOrderItemModel> get items;
  @override
  double get subtotal;
  @override
  double get deliveryFee;
  @override
  double get packagingDeposit;
  @override
  double get totalAmount;
  @override
  double get paidAmount;
  @override
  double get remainingAmount;
  @override
  String? get delivererId;
  @override
  String? get delivererName;
  @override
  String? get deliveryAddress;
  @override
  String? get notes;
  @override
  String? get cancellationReason;
  @override
  DateTime? get cancelledAt;
  @override
  DateTime? get completedAt;
  @override
  bool get hasProofOfDelivery;
  @override
  String? get proofOfDeliveryId;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CustomerOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerOrderModelImplCopyWith<_$CustomerOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerOrderItemModel _$CustomerOrderItemModelFromJson(
    Map<String, dynamic> json) {
  return _CustomerOrderItemModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerOrderItemModel {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get productCode => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  String? get productImage => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this CustomerOrderItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerOrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerOrderItemModelCopyWith<CustomerOrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerOrderItemModelCopyWith<$Res> {
  factory $CustomerOrderItemModelCopyWith(CustomerOrderItemModel value,
          $Res Function(CustomerOrderItemModel) then) =
      _$CustomerOrderItemModelCopyWithImpl<$Res, CustomerOrderItemModel>;
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      String productCode,
      int quantity,
      double unitPrice,
      double totalPrice,
      String? productImage,
      String? unit,
      String? notes});
}

/// @nodoc
class _$CustomerOrderItemModelCopyWithImpl<$Res,
        $Val extends CustomerOrderItemModel>
    implements $CustomerOrderItemModelCopyWith<$Res> {
  _$CustomerOrderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerOrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? productCode = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? productImage = freezed,
    Object? unit = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productCode: null == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
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
      productImage: freezed == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerOrderItemModelImplCopyWith<$Res>
    implements $CustomerOrderItemModelCopyWith<$Res> {
  factory _$$CustomerOrderItemModelImplCopyWith(
          _$CustomerOrderItemModelImpl value,
          $Res Function(_$CustomerOrderItemModelImpl) then) =
      __$$CustomerOrderItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      String productCode,
      int quantity,
      double unitPrice,
      double totalPrice,
      String? productImage,
      String? unit,
      String? notes});
}

/// @nodoc
class __$$CustomerOrderItemModelImplCopyWithImpl<$Res>
    extends _$CustomerOrderItemModelCopyWithImpl<$Res,
        _$CustomerOrderItemModelImpl>
    implements _$$CustomerOrderItemModelImplCopyWith<$Res> {
  __$$CustomerOrderItemModelImplCopyWithImpl(
      _$CustomerOrderItemModelImpl _value,
      $Res Function(_$CustomerOrderItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerOrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? productCode = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? productImage = freezed,
    Object? unit = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$CustomerOrderItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productCode: null == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
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
      productImage: freezed == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerOrderItemModelImpl implements _CustomerOrderItemModel {
  const _$CustomerOrderItemModelImpl(
      {required this.id,
      required this.productId,
      required this.productName,
      required this.productCode,
      required this.quantity,
      required this.unitPrice,
      required this.totalPrice,
      this.productImage,
      this.unit,
      this.notes});

  factory _$CustomerOrderItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerOrderItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String productId;
  @override
  final String productName;
  @override
  final String productCode;
  @override
  final int quantity;
  @override
  final double unitPrice;
  @override
  final double totalPrice;
  @override
  final String? productImage;
  @override
  final String? unit;
  @override
  final String? notes;

  @override
  String toString() {
    return 'CustomerOrderItemModel(id: $id, productId: $productId, productName: $productName, productCode: $productCode, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, productImage: $productImage, unit: $unit, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerOrderItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, productName,
      productCode, quantity, unitPrice, totalPrice, productImage, unit, notes);

  /// Create a copy of CustomerOrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerOrderItemModelImplCopyWith<_$CustomerOrderItemModelImpl>
      get copyWith => __$$CustomerOrderItemModelImplCopyWithImpl<
          _$CustomerOrderItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerOrderItemModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerOrderItemModel implements CustomerOrderItemModel {
  const factory _CustomerOrderItemModel(
      {required final String id,
      required final String productId,
      required final String productName,
      required final String productCode,
      required final int quantity,
      required final double unitPrice,
      required final double totalPrice,
      final String? productImage,
      final String? unit,
      final String? notes}) = _$CustomerOrderItemModelImpl;

  factory _CustomerOrderItemModel.fromJson(Map<String, dynamic> json) =
      _$CustomerOrderItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get productId;
  @override
  String get productName;
  @override
  String get productCode;
  @override
  int get quantity;
  @override
  double get unitPrice;
  @override
  double get totalPrice;
  @override
  String? get productImage;
  @override
  String? get unit;
  @override
  String? get notes;

  /// Create a copy of CustomerOrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerOrderItemModelImplCopyWith<_$CustomerOrderItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
