// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentCollection _$PaymentCollectionFromJson(Map<String, dynamic> json) {
  return _PaymentCollection.fromJson(json);
}

/// @nodoc
mixin _$PaymentCollection {
  String get id => throw _privateConstructorUsedError;
  String get delivererId => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  PaymentMode get mode => throw _privateConstructorUsedError;
  DateTime get collectedAt => throw _privateConstructorUsedError;
  List<PaymentAllocation> get allocations => throw _privateConstructorUsedError;
  String? get reference =>
      throw _privateConstructorUsedError; // Numéro chèque, référence virement, etc.
  String? get notes => throw _privateConstructorUsedError;
  String? get receiptImagePath => throw _privateConstructorUsedError;
  bool get isUploaded => throw _privateConstructorUsedError;
  DateTime? get uploadedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PaymentCollection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCollectionCopyWith<PaymentCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCollectionCopyWith<$Res> {
  factory $PaymentCollectionCopyWith(
          PaymentCollection value, $Res Function(PaymentCollection) then) =
      _$PaymentCollectionCopyWithImpl<$Res, PaymentCollection>;
  @useResult
  $Res call(
      {String id,
      String delivererId,
      String customerId,
      String customerName,
      double amount,
      PaymentMode mode,
      DateTime collectedAt,
      List<PaymentAllocation> allocations,
      String? reference,
      String? notes,
      String? receiptImagePath,
      bool isUploaded,
      DateTime? uploadedAt,
      DateTime? createdAt});
}

/// @nodoc
class _$PaymentCollectionCopyWithImpl<$Res, $Val extends PaymentCollection>
    implements $PaymentCollectionCopyWith<$Res> {
  _$PaymentCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? delivererId = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? amount = null,
    Object? mode = null,
    Object? collectedAt = null,
    Object? allocations = null,
    Object? reference = freezed,
    Object? notes = freezed,
    Object? receiptImagePath = freezed,
    Object? isUploaded = null,
    Object? uploadedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _value.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as PaymentMode,
      collectedAt: null == collectedAt
          ? _value.collectedAt
          : collectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      allocations: null == allocations
          ? _value.allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<PaymentAllocation>,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptImagePath: freezed == receiptImagePath
          ? _value.receiptImagePath
          : receiptImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploaded: null == isUploaded
          ? _value.isUploaded
          : isUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentCollectionImplCopyWith<$Res>
    implements $PaymentCollectionCopyWith<$Res> {
  factory _$$PaymentCollectionImplCopyWith(_$PaymentCollectionImpl value,
          $Res Function(_$PaymentCollectionImpl) then) =
      __$$PaymentCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String delivererId,
      String customerId,
      String customerName,
      double amount,
      PaymentMode mode,
      DateTime collectedAt,
      List<PaymentAllocation> allocations,
      String? reference,
      String? notes,
      String? receiptImagePath,
      bool isUploaded,
      DateTime? uploadedAt,
      DateTime? createdAt});
}

/// @nodoc
class __$$PaymentCollectionImplCopyWithImpl<$Res>
    extends _$PaymentCollectionCopyWithImpl<$Res, _$PaymentCollectionImpl>
    implements _$$PaymentCollectionImplCopyWith<$Res> {
  __$$PaymentCollectionImplCopyWithImpl(_$PaymentCollectionImpl _value,
      $Res Function(_$PaymentCollectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? delivererId = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? amount = null,
    Object? mode = null,
    Object? collectedAt = null,
    Object? allocations = null,
    Object? reference = freezed,
    Object? notes = freezed,
    Object? receiptImagePath = freezed,
    Object? isUploaded = null,
    Object? uploadedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$PaymentCollectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _value.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as PaymentMode,
      collectedAt: null == collectedAt
          ? _value.collectedAt
          : collectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      allocations: null == allocations
          ? _value._allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<PaymentAllocation>,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptImagePath: freezed == receiptImagePath
          ? _value.receiptImagePath
          : receiptImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploaded: null == isUploaded
          ? _value.isUploaded
          : isUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
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
class _$PaymentCollectionImpl implements _PaymentCollection {
  const _$PaymentCollectionImpl(
      {required this.id,
      required this.delivererId,
      required this.customerId,
      required this.customerName,
      required this.amount,
      required this.mode,
      required this.collectedAt,
      required final List<PaymentAllocation> allocations,
      this.reference,
      this.notes,
      this.receiptImagePath,
      this.isUploaded = false,
      this.uploadedAt,
      this.createdAt})
      : _allocations = allocations;

  factory _$PaymentCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentCollectionImplFromJson(json);

  @override
  final String id;
  @override
  final String delivererId;
  @override
  final String customerId;
  @override
  final String customerName;
  @override
  final double amount;
  @override
  final PaymentMode mode;
  @override
  final DateTime collectedAt;
  final List<PaymentAllocation> _allocations;
  @override
  List<PaymentAllocation> get allocations {
    if (_allocations is EqualUnmodifiableListView) return _allocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allocations);
  }

  @override
  final String? reference;
// Numéro chèque, référence virement, etc.
  @override
  final String? notes;
  @override
  final String? receiptImagePath;
  @override
  @JsonKey()
  final bool isUploaded;
  @override
  final DateTime? uploadedAt;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'PaymentCollection(id: $id, delivererId: $delivererId, customerId: $customerId, customerName: $customerName, amount: $amount, mode: $mode, collectedAt: $collectedAt, allocations: $allocations, reference: $reference, notes: $notes, receiptImagePath: $receiptImagePath, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCollectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.delivererId, delivererId) ||
                other.delivererId == delivererId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.collectedAt, collectedAt) ||
                other.collectedAt == collectedAt) &&
            const DeepCollectionEquality()
                .equals(other._allocations, _allocations) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.receiptImagePath, receiptImagePath) ||
                other.receiptImagePath == receiptImagePath) &&
            (identical(other.isUploaded, isUploaded) ||
                other.isUploaded == isUploaded) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      delivererId,
      customerId,
      customerName,
      amount,
      mode,
      collectedAt,
      const DeepCollectionEquality().hash(_allocations),
      reference,
      notes,
      receiptImagePath,
      isUploaded,
      uploadedAt,
      createdAt);

  /// Create a copy of PaymentCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentCollectionImplCopyWith<_$PaymentCollectionImpl> get copyWith =>
      __$$PaymentCollectionImplCopyWithImpl<_$PaymentCollectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentCollectionImplToJson(
      this,
    );
  }
}

abstract class _PaymentCollection implements PaymentCollection {
  const factory _PaymentCollection(
      {required final String id,
      required final String delivererId,
      required final String customerId,
      required final String customerName,
      required final double amount,
      required final PaymentMode mode,
      required final DateTime collectedAt,
      required final List<PaymentAllocation> allocations,
      final String? reference,
      final String? notes,
      final String? receiptImagePath,
      final bool isUploaded,
      final DateTime? uploadedAt,
      final DateTime? createdAt}) = _$PaymentCollectionImpl;

  factory _PaymentCollection.fromJson(Map<String, dynamic> json) =
      _$PaymentCollectionImpl.fromJson;

  @override
  String get id;
  @override
  String get delivererId;
  @override
  String get customerId;
  @override
  String get customerName;
  @override
  double get amount;
  @override
  PaymentMode get mode;
  @override
  DateTime get collectedAt;
  @override
  List<PaymentAllocation> get allocations;
  @override
  String? get reference; // Numéro chèque, référence virement, etc.
  @override
  String? get notes;
  @override
  String? get receiptImagePath;
  @override
  bool get isUploaded;
  @override
  DateTime? get uploadedAt;
  @override
  DateTime? get createdAt;

  /// Create a copy of PaymentCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentCollectionImplCopyWith<_$PaymentCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentAllocation _$PaymentAllocationFromJson(Map<String, dynamic> json) {
  return _PaymentAllocation.fromJson(json);
}

/// @nodoc
mixin _$PaymentAllocation {
  String get orderId => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  double get allocatedAmount => throw _privateConstructorUsedError;
  DateTime get orderDate => throw _privateConstructorUsedError;
  bool get isFullyPaid => throw _privateConstructorUsedError;

  /// Serializes this PaymentAllocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentAllocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentAllocationCopyWith<PaymentAllocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentAllocationCopyWith<$Res> {
  factory $PaymentAllocationCopyWith(
          PaymentAllocation value, $Res Function(PaymentAllocation) then) =
      _$PaymentAllocationCopyWithImpl<$Res, PaymentAllocation>;
  @useResult
  $Res call(
      {String orderId,
      String orderNumber,
      double allocatedAmount,
      DateTime orderDate,
      bool isFullyPaid});
}

/// @nodoc
class _$PaymentAllocationCopyWithImpl<$Res, $Val extends PaymentAllocation>
    implements $PaymentAllocationCopyWith<$Res> {
  _$PaymentAllocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentAllocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderNumber = null,
    Object? allocatedAmount = null,
    Object? orderDate = null,
    Object? isFullyPaid = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      allocatedAmount: null == allocatedAmount
          ? _value.allocatedAmount
          : allocatedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFullyPaid: null == isFullyPaid
          ? _value.isFullyPaid
          : isFullyPaid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentAllocationImplCopyWith<$Res>
    implements $PaymentAllocationCopyWith<$Res> {
  factory _$$PaymentAllocationImplCopyWith(_$PaymentAllocationImpl value,
          $Res Function(_$PaymentAllocationImpl) then) =
      __$$PaymentAllocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      String orderNumber,
      double allocatedAmount,
      DateTime orderDate,
      bool isFullyPaid});
}

/// @nodoc
class __$$PaymentAllocationImplCopyWithImpl<$Res>
    extends _$PaymentAllocationCopyWithImpl<$Res, _$PaymentAllocationImpl>
    implements _$$PaymentAllocationImplCopyWith<$Res> {
  __$$PaymentAllocationImplCopyWithImpl(_$PaymentAllocationImpl _value,
      $Res Function(_$PaymentAllocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentAllocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderNumber = null,
    Object? allocatedAmount = null,
    Object? orderDate = null,
    Object? isFullyPaid = null,
  }) {
    return _then(_$PaymentAllocationImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      allocatedAmount: null == allocatedAmount
          ? _value.allocatedAmount
          : allocatedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFullyPaid: null == isFullyPaid
          ? _value.isFullyPaid
          : isFullyPaid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentAllocationImpl implements _PaymentAllocation {
  const _$PaymentAllocationImpl(
      {required this.orderId,
      required this.orderNumber,
      required this.allocatedAmount,
      required this.orderDate,
      this.isFullyPaid = false});

  factory _$PaymentAllocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentAllocationImplFromJson(json);

  @override
  final String orderId;
  @override
  final String orderNumber;
  @override
  final double allocatedAmount;
  @override
  final DateTime orderDate;
  @override
  @JsonKey()
  final bool isFullyPaid;

  @override
  String toString() {
    return 'PaymentAllocation(orderId: $orderId, orderNumber: $orderNumber, allocatedAmount: $allocatedAmount, orderDate: $orderDate, isFullyPaid: $isFullyPaid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentAllocationImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.allocatedAmount, allocatedAmount) ||
                other.allocatedAmount == allocatedAmount) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.isFullyPaid, isFullyPaid) ||
                other.isFullyPaid == isFullyPaid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, orderNumber,
      allocatedAmount, orderDate, isFullyPaid);

  /// Create a copy of PaymentAllocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentAllocationImplCopyWith<_$PaymentAllocationImpl> get copyWith =>
      __$$PaymentAllocationImplCopyWithImpl<_$PaymentAllocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentAllocationImplToJson(
      this,
    );
  }
}

abstract class _PaymentAllocation implements PaymentAllocation {
  const factory _PaymentAllocation(
      {required final String orderId,
      required final String orderNumber,
      required final double allocatedAmount,
      required final DateTime orderDate,
      final bool isFullyPaid}) = _$PaymentAllocationImpl;

  factory _PaymentAllocation.fromJson(Map<String, dynamic> json) =
      _$PaymentAllocationImpl.fromJson;

  @override
  String get orderId;
  @override
  String get orderNumber;
  @override
  double get allocatedAmount;
  @override
  DateTime get orderDate;
  @override
  bool get isFullyPaid;

  /// Create a copy of PaymentAllocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentAllocationImplCopyWith<_$PaymentAllocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
