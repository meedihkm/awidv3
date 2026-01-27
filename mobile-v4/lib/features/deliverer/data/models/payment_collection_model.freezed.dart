// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentCollectionModel _$PaymentCollectionModelFromJson(
    Map<String, dynamic> json) {
  return _PaymentCollectionModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentCollectionModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliverer_id')
  String get delivererId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  PaymentMode get mode => throw _privateConstructorUsedError;
  @JsonKey(name: 'collected_at')
  DateTime get collectedAt => throw _privateConstructorUsedError;
  List<PaymentAllocationModel> get allocations =>
      throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'receipt_image_path')
  String? get receiptImagePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_uploaded')
  bool get isUploaded => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_at')
  DateTime? get uploadedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PaymentCollectionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCollectionModelCopyWith<PaymentCollectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCollectionModelCopyWith<$Res> {
  factory $PaymentCollectionModelCopyWith(PaymentCollectionModel value,
          $Res Function(PaymentCollectionModel) then) =
      _$PaymentCollectionModelCopyWithImpl<$Res, PaymentCollectionModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'deliverer_id') String delivererId,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      double amount,
      PaymentMode mode,
      @JsonKey(name: 'collected_at') DateTime collectedAt,
      List<PaymentAllocationModel> allocations,
      String? reference,
      String? notes,
      @JsonKey(name: 'receipt_image_path') String? receiptImagePath,
      @JsonKey(name: 'is_uploaded') bool isUploaded,
      @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$PaymentCollectionModelCopyWithImpl<$Res,
        $Val extends PaymentCollectionModel>
    implements $PaymentCollectionModelCopyWith<$Res> {
  _$PaymentCollectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentCollectionModel
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
              as List<PaymentAllocationModel>,
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
abstract class _$$PaymentCollectionModelImplCopyWith<$Res>
    implements $PaymentCollectionModelCopyWith<$Res> {
  factory _$$PaymentCollectionModelImplCopyWith(
          _$PaymentCollectionModelImpl value,
          $Res Function(_$PaymentCollectionModelImpl) then) =
      __$$PaymentCollectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'deliverer_id') String delivererId,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      double amount,
      PaymentMode mode,
      @JsonKey(name: 'collected_at') DateTime collectedAt,
      List<PaymentAllocationModel> allocations,
      String? reference,
      String? notes,
      @JsonKey(name: 'receipt_image_path') String? receiptImagePath,
      @JsonKey(name: 'is_uploaded') bool isUploaded,
      @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$PaymentCollectionModelImplCopyWithImpl<$Res>
    extends _$PaymentCollectionModelCopyWithImpl<$Res,
        _$PaymentCollectionModelImpl>
    implements _$$PaymentCollectionModelImplCopyWith<$Res> {
  __$$PaymentCollectionModelImplCopyWithImpl(
      _$PaymentCollectionModelImpl _value,
      $Res Function(_$PaymentCollectionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentCollectionModel
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
    return _then(_$PaymentCollectionModelImpl(
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
              as List<PaymentAllocationModel>,
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
class _$PaymentCollectionModelImpl implements _PaymentCollectionModel {
  const _$PaymentCollectionModelImpl(
      {required this.id,
      @JsonKey(name: 'deliverer_id') required this.delivererId,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName,
      required this.amount,
      required this.mode,
      @JsonKey(name: 'collected_at') required this.collectedAt,
      required final List<PaymentAllocationModel> allocations,
      this.reference,
      this.notes,
      @JsonKey(name: 'receipt_image_path') this.receiptImagePath,
      @JsonKey(name: 'is_uploaded') this.isUploaded = false,
      @JsonKey(name: 'uploaded_at') this.uploadedAt,
      @JsonKey(name: 'created_at') this.createdAt})
      : _allocations = allocations;

  factory _$PaymentCollectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentCollectionModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'deliverer_id')
  final String delivererId;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  final double amount;
  @override
  final PaymentMode mode;
  @override
  @JsonKey(name: 'collected_at')
  final DateTime collectedAt;
  final List<PaymentAllocationModel> _allocations;
  @override
  List<PaymentAllocationModel> get allocations {
    if (_allocations is EqualUnmodifiableListView) return _allocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allocations);
  }

  @override
  final String? reference;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'receipt_image_path')
  final String? receiptImagePath;
  @override
  @JsonKey(name: 'is_uploaded')
  final bool isUploaded;
  @override
  @JsonKey(name: 'uploaded_at')
  final DateTime? uploadedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'PaymentCollectionModel(id: $id, delivererId: $delivererId, customerId: $customerId, customerName: $customerName, amount: $amount, mode: $mode, collectedAt: $collectedAt, allocations: $allocations, reference: $reference, notes: $notes, receiptImagePath: $receiptImagePath, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCollectionModelImpl &&
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

  /// Create a copy of PaymentCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentCollectionModelImplCopyWith<_$PaymentCollectionModelImpl>
      get copyWith => __$$PaymentCollectionModelImplCopyWithImpl<
          _$PaymentCollectionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentCollectionModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentCollectionModel implements PaymentCollectionModel {
  const factory _PaymentCollectionModel(
          {required final String id,
          @JsonKey(name: 'deliverer_id') required final String delivererId,
          @JsonKey(name: 'customer_id') required final String customerId,
          @JsonKey(name: 'customer_name') required final String customerName,
          required final double amount,
          required final PaymentMode mode,
          @JsonKey(name: 'collected_at') required final DateTime collectedAt,
          required final List<PaymentAllocationModel> allocations,
          final String? reference,
          final String? notes,
          @JsonKey(name: 'receipt_image_path') final String? receiptImagePath,
          @JsonKey(name: 'is_uploaded') final bool isUploaded,
          @JsonKey(name: 'uploaded_at') final DateTime? uploadedAt,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$PaymentCollectionModelImpl;

  factory _PaymentCollectionModel.fromJson(Map<String, dynamic> json) =
      _$PaymentCollectionModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'deliverer_id')
  String get delivererId;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  double get amount;
  @override
  PaymentMode get mode;
  @override
  @JsonKey(name: 'collected_at')
  DateTime get collectedAt;
  @override
  List<PaymentAllocationModel> get allocations;
  @override
  String? get reference;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'receipt_image_path')
  String? get receiptImagePath;
  @override
  @JsonKey(name: 'is_uploaded')
  bool get isUploaded;
  @override
  @JsonKey(name: 'uploaded_at')
  DateTime? get uploadedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of PaymentCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentCollectionModelImplCopyWith<_$PaymentCollectionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaymentAllocationModel _$PaymentAllocationModelFromJson(
    Map<String, dynamic> json) {
  return _PaymentAllocationModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentAllocationModel {
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'allocated_amount')
  double get allocatedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_date')
  DateTime get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_fully_paid')
  bool get isFullyPaid => throw _privateConstructorUsedError;

  /// Serializes this PaymentAllocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentAllocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentAllocationModelCopyWith<PaymentAllocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentAllocationModelCopyWith<$Res> {
  factory $PaymentAllocationModelCopyWith(PaymentAllocationModel value,
          $Res Function(PaymentAllocationModel) then) =
      _$PaymentAllocationModelCopyWithImpl<$Res, PaymentAllocationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'allocated_amount') double allocatedAmount,
      @JsonKey(name: 'order_date') DateTime orderDate,
      @JsonKey(name: 'is_fully_paid') bool isFullyPaid});
}

/// @nodoc
class _$PaymentAllocationModelCopyWithImpl<$Res,
        $Val extends PaymentAllocationModel>
    implements $PaymentAllocationModelCopyWith<$Res> {
  _$PaymentAllocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentAllocationModel
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
abstract class _$$PaymentAllocationModelImplCopyWith<$Res>
    implements $PaymentAllocationModelCopyWith<$Res> {
  factory _$$PaymentAllocationModelImplCopyWith(
          _$PaymentAllocationModelImpl value,
          $Res Function(_$PaymentAllocationModelImpl) then) =
      __$$PaymentAllocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'allocated_amount') double allocatedAmount,
      @JsonKey(name: 'order_date') DateTime orderDate,
      @JsonKey(name: 'is_fully_paid') bool isFullyPaid});
}

/// @nodoc
class __$$PaymentAllocationModelImplCopyWithImpl<$Res>
    extends _$PaymentAllocationModelCopyWithImpl<$Res,
        _$PaymentAllocationModelImpl>
    implements _$$PaymentAllocationModelImplCopyWith<$Res> {
  __$$PaymentAllocationModelImplCopyWithImpl(
      _$PaymentAllocationModelImpl _value,
      $Res Function(_$PaymentAllocationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentAllocationModel
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
    return _then(_$PaymentAllocationModelImpl(
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
class _$PaymentAllocationModelImpl implements _PaymentAllocationModel {
  const _$PaymentAllocationModelImpl(
      {@JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'order_number') required this.orderNumber,
      @JsonKey(name: 'allocated_amount') required this.allocatedAmount,
      @JsonKey(name: 'order_date') required this.orderDate,
      @JsonKey(name: 'is_fully_paid') this.isFullyPaid = false});

  factory _$PaymentAllocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentAllocationModelImplFromJson(json);

  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  @JsonKey(name: 'allocated_amount')
  final double allocatedAmount;
  @override
  @JsonKey(name: 'order_date')
  final DateTime orderDate;
  @override
  @JsonKey(name: 'is_fully_paid')
  final bool isFullyPaid;

  @override
  String toString() {
    return 'PaymentAllocationModel(orderId: $orderId, orderNumber: $orderNumber, allocatedAmount: $allocatedAmount, orderDate: $orderDate, isFullyPaid: $isFullyPaid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentAllocationModelImpl &&
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

  /// Create a copy of PaymentAllocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentAllocationModelImplCopyWith<_$PaymentAllocationModelImpl>
      get copyWith => __$$PaymentAllocationModelImplCopyWithImpl<
          _$PaymentAllocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentAllocationModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentAllocationModel implements PaymentAllocationModel {
  const factory _PaymentAllocationModel(
      {@JsonKey(name: 'order_id') required final String orderId,
      @JsonKey(name: 'order_number') required final String orderNumber,
      @JsonKey(name: 'allocated_amount') required final double allocatedAmount,
      @JsonKey(name: 'order_date') required final DateTime orderDate,
      @JsonKey(name: 'is_fully_paid')
      final bool isFullyPaid}) = _$PaymentAllocationModelImpl;

  factory _PaymentAllocationModel.fromJson(Map<String, dynamic> json) =
      _$PaymentAllocationModelImpl.fromJson;

  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  @JsonKey(name: 'allocated_amount')
  double get allocatedAmount;
  @override
  @JsonKey(name: 'order_date')
  DateTime get orderDate;
  @override
  @JsonKey(name: 'is_fully_paid')
  bool get isFullyPaid;

  /// Create a copy of PaymentAllocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentAllocationModelImplCopyWith<_$PaymentAllocationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UploadPaymentRequest _$UploadPaymentRequestFromJson(Map<String, dynamic> json) {
  return _UploadPaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadPaymentRequest {
  @JsonKey(name: 'deliverer_id')
  String get delivererId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get mode => throw _privateConstructorUsedError;
  @JsonKey(name: 'collected_at')
  DateTime get collectedAt => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get allocations =>
      throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'receipt_image')
  String? get receiptImageBase64 => throw _privateConstructorUsedError;

  /// Serializes this UploadPaymentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadPaymentRequestCopyWith<UploadPaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadPaymentRequestCopyWith<$Res> {
  factory $UploadPaymentRequestCopyWith(UploadPaymentRequest value,
          $Res Function(UploadPaymentRequest) then) =
      _$UploadPaymentRequestCopyWithImpl<$Res, UploadPaymentRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'deliverer_id') String delivererId,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      double amount,
      String mode,
      @JsonKey(name: 'collected_at') DateTime collectedAt,
      List<Map<String, dynamic>> allocations,
      String? reference,
      String? notes,
      @JsonKey(name: 'receipt_image') String? receiptImageBase64});
}

/// @nodoc
class _$UploadPaymentRequestCopyWithImpl<$Res,
        $Val extends UploadPaymentRequest>
    implements $UploadPaymentRequestCopyWith<$Res> {
  _$UploadPaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delivererId = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? amount = null,
    Object? mode = null,
    Object? collectedAt = null,
    Object? allocations = null,
    Object? reference = freezed,
    Object? notes = freezed,
    Object? receiptImageBase64 = freezed,
  }) {
    return _then(_value.copyWith(
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
              as String,
      collectedAt: null == collectedAt
          ? _value.collectedAt
          : collectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      allocations: null == allocations
          ? _value.allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptImageBase64: freezed == receiptImageBase64
          ? _value.receiptImageBase64
          : receiptImageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadPaymentRequestImplCopyWith<$Res>
    implements $UploadPaymentRequestCopyWith<$Res> {
  factory _$$UploadPaymentRequestImplCopyWith(_$UploadPaymentRequestImpl value,
          $Res Function(_$UploadPaymentRequestImpl) then) =
      __$$UploadPaymentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'deliverer_id') String delivererId,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      double amount,
      String mode,
      @JsonKey(name: 'collected_at') DateTime collectedAt,
      List<Map<String, dynamic>> allocations,
      String? reference,
      String? notes,
      @JsonKey(name: 'receipt_image') String? receiptImageBase64});
}

/// @nodoc
class __$$UploadPaymentRequestImplCopyWithImpl<$Res>
    extends _$UploadPaymentRequestCopyWithImpl<$Res, _$UploadPaymentRequestImpl>
    implements _$$UploadPaymentRequestImplCopyWith<$Res> {
  __$$UploadPaymentRequestImplCopyWithImpl(_$UploadPaymentRequestImpl _value,
      $Res Function(_$UploadPaymentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delivererId = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? amount = null,
    Object? mode = null,
    Object? collectedAt = null,
    Object? allocations = null,
    Object? reference = freezed,
    Object? notes = freezed,
    Object? receiptImageBase64 = freezed,
  }) {
    return _then(_$UploadPaymentRequestImpl(
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
              as String,
      collectedAt: null == collectedAt
          ? _value.collectedAt
          : collectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      allocations: null == allocations
          ? _value._allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptImageBase64: freezed == receiptImageBase64
          ? _value.receiptImageBase64
          : receiptImageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadPaymentRequestImpl implements _UploadPaymentRequest {
  const _$UploadPaymentRequestImpl(
      {@JsonKey(name: 'deliverer_id') required this.delivererId,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName,
      required this.amount,
      required this.mode,
      @JsonKey(name: 'collected_at') required this.collectedAt,
      required final List<Map<String, dynamic>> allocations,
      this.reference,
      this.notes,
      @JsonKey(name: 'receipt_image') this.receiptImageBase64})
      : _allocations = allocations;

  factory _$UploadPaymentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadPaymentRequestImplFromJson(json);

  @override
  @JsonKey(name: 'deliverer_id')
  final String delivererId;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  final double amount;
  @override
  final String mode;
  @override
  @JsonKey(name: 'collected_at')
  final DateTime collectedAt;
  final List<Map<String, dynamic>> _allocations;
  @override
  List<Map<String, dynamic>> get allocations {
    if (_allocations is EqualUnmodifiableListView) return _allocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allocations);
  }

  @override
  final String? reference;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'receipt_image')
  final String? receiptImageBase64;

  @override
  String toString() {
    return 'UploadPaymentRequest(delivererId: $delivererId, customerId: $customerId, customerName: $customerName, amount: $amount, mode: $mode, collectedAt: $collectedAt, allocations: $allocations, reference: $reference, notes: $notes, receiptImageBase64: $receiptImageBase64)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadPaymentRequestImpl &&
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
            (identical(other.receiptImageBase64, receiptImageBase64) ||
                other.receiptImageBase64 == receiptImageBase64));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      delivererId,
      customerId,
      customerName,
      amount,
      mode,
      collectedAt,
      const DeepCollectionEquality().hash(_allocations),
      reference,
      notes,
      receiptImageBase64);

  /// Create a copy of UploadPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadPaymentRequestImplCopyWith<_$UploadPaymentRequestImpl>
      get copyWith =>
          __$$UploadPaymentRequestImplCopyWithImpl<_$UploadPaymentRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadPaymentRequestImplToJson(
      this,
    );
  }
}

abstract class _UploadPaymentRequest implements UploadPaymentRequest {
  const factory _UploadPaymentRequest(
          {@JsonKey(name: 'deliverer_id') required final String delivererId,
          @JsonKey(name: 'customer_id') required final String customerId,
          @JsonKey(name: 'customer_name') required final String customerName,
          required final double amount,
          required final String mode,
          @JsonKey(name: 'collected_at') required final DateTime collectedAt,
          required final List<Map<String, dynamic>> allocations,
          final String? reference,
          final String? notes,
          @JsonKey(name: 'receipt_image') final String? receiptImageBase64}) =
      _$UploadPaymentRequestImpl;

  factory _UploadPaymentRequest.fromJson(Map<String, dynamic> json) =
      _$UploadPaymentRequestImpl.fromJson;

  @override
  @JsonKey(name: 'deliverer_id')
  String get delivererId;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  double get amount;
  @override
  String get mode;
  @override
  @JsonKey(name: 'collected_at')
  DateTime get collectedAt;
  @override
  List<Map<String, dynamic>> get allocations;
  @override
  String? get reference;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'receipt_image')
  String? get receiptImageBase64;

  /// Create a copy of UploadPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadPaymentRequestImplCopyWith<_$UploadPaymentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UploadPaymentResponse _$UploadPaymentResponseFromJson(
    Map<String, dynamic> json) {
  return _UploadPaymentResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadPaymentResponse {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_at')
  DateTime get uploadedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'receipt_url')
  String? get receiptUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_orders')
  List<String>? get updatedOrders => throw _privateConstructorUsedError;

  /// Serializes this UploadPaymentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadPaymentResponseCopyWith<UploadPaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadPaymentResponseCopyWith<$Res> {
  factory $UploadPaymentResponseCopyWith(UploadPaymentResponse value,
          $Res Function(UploadPaymentResponse) then) =
      _$UploadPaymentResponseCopyWithImpl<$Res, UploadPaymentResponse>;
  @useResult
  $Res call(
      {String id,
      String status,
      String message,
      @JsonKey(name: 'uploaded_at') DateTime uploadedAt,
      @JsonKey(name: 'receipt_url') String? receiptUrl,
      @JsonKey(name: 'updated_orders') List<String>? updatedOrders});
}

/// @nodoc
class _$UploadPaymentResponseCopyWithImpl<$Res,
        $Val extends UploadPaymentResponse>
    implements $UploadPaymentResponseCopyWith<$Res> {
  _$UploadPaymentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? message = null,
    Object? uploadedAt = null,
    Object? receiptUrl = freezed,
    Object? updatedOrders = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receiptUrl: freezed == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedOrders: freezed == updatedOrders
          ? _value.updatedOrders
          : updatedOrders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadPaymentResponseImplCopyWith<$Res>
    implements $UploadPaymentResponseCopyWith<$Res> {
  factory _$$UploadPaymentResponseImplCopyWith(
          _$UploadPaymentResponseImpl value,
          $Res Function(_$UploadPaymentResponseImpl) then) =
      __$$UploadPaymentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String status,
      String message,
      @JsonKey(name: 'uploaded_at') DateTime uploadedAt,
      @JsonKey(name: 'receipt_url') String? receiptUrl,
      @JsonKey(name: 'updated_orders') List<String>? updatedOrders});
}

/// @nodoc
class __$$UploadPaymentResponseImplCopyWithImpl<$Res>
    extends _$UploadPaymentResponseCopyWithImpl<$Res,
        _$UploadPaymentResponseImpl>
    implements _$$UploadPaymentResponseImplCopyWith<$Res> {
  __$$UploadPaymentResponseImplCopyWithImpl(_$UploadPaymentResponseImpl _value,
      $Res Function(_$UploadPaymentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? message = null,
    Object? uploadedAt = null,
    Object? receiptUrl = freezed,
    Object? updatedOrders = freezed,
  }) {
    return _then(_$UploadPaymentResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receiptUrl: freezed == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedOrders: freezed == updatedOrders
          ? _value._updatedOrders
          : updatedOrders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadPaymentResponseImpl implements _UploadPaymentResponse {
  const _$UploadPaymentResponseImpl(
      {required this.id,
      required this.status,
      required this.message,
      @JsonKey(name: 'uploaded_at') required this.uploadedAt,
      @JsonKey(name: 'receipt_url') this.receiptUrl,
      @JsonKey(name: 'updated_orders') final List<String>? updatedOrders})
      : _updatedOrders = updatedOrders;

  factory _$UploadPaymentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadPaymentResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final String message;
  @override
  @JsonKey(name: 'uploaded_at')
  final DateTime uploadedAt;
  @override
  @JsonKey(name: 'receipt_url')
  final String? receiptUrl;
  final List<String>? _updatedOrders;
  @override
  @JsonKey(name: 'updated_orders')
  List<String>? get updatedOrders {
    final value = _updatedOrders;
    if (value == null) return null;
    if (_updatedOrders is EqualUnmodifiableListView) return _updatedOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UploadPaymentResponse(id: $id, status: $status, message: $message, uploadedAt: $uploadedAt, receiptUrl: $receiptUrl, updatedOrders: $updatedOrders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadPaymentResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.receiptUrl, receiptUrl) ||
                other.receiptUrl == receiptUrl) &&
            const DeepCollectionEquality()
                .equals(other._updatedOrders, _updatedOrders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, message, uploadedAt,
      receiptUrl, const DeepCollectionEquality().hash(_updatedOrders));

  /// Create a copy of UploadPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadPaymentResponseImplCopyWith<_$UploadPaymentResponseImpl>
      get copyWith => __$$UploadPaymentResponseImplCopyWithImpl<
          _$UploadPaymentResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadPaymentResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadPaymentResponse implements UploadPaymentResponse {
  const factory _UploadPaymentResponse(
          {required final String id,
          required final String status,
          required final String message,
          @JsonKey(name: 'uploaded_at') required final DateTime uploadedAt,
          @JsonKey(name: 'receipt_url') final String? receiptUrl,
          @JsonKey(name: 'updated_orders') final List<String>? updatedOrders}) =
      _$UploadPaymentResponseImpl;

  factory _UploadPaymentResponse.fromJson(Map<String, dynamic> json) =
      _$UploadPaymentResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String get message;
  @override
  @JsonKey(name: 'uploaded_at')
  DateTime get uploadedAt;
  @override
  @JsonKey(name: 'receipt_url')
  String? get receiptUrl;
  @override
  @JsonKey(name: 'updated_orders')
  List<String>? get updatedOrders;

  /// Create a copy of UploadPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadPaymentResponseImplCopyWith<_$UploadPaymentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UnpaidOrderModel _$UnpaidOrderModelFromJson(Map<String, dynamic> json) {
  return _UnpaidOrderModel.fromJson(json);
}

/// @nodoc
mixin _$UnpaidOrderModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_date')
  DateTime get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_amount')
  double get paidAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_amount')
  double get remainingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_since_order')
  int get daysSinceOrder => throw _privateConstructorUsedError;

  /// Serializes this UnpaidOrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnpaidOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnpaidOrderModelCopyWith<UnpaidOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnpaidOrderModelCopyWith<$Res> {
  factory $UnpaidOrderModelCopyWith(
          UnpaidOrderModel value, $Res Function(UnpaidOrderModel) then) =
      _$UnpaidOrderModelCopyWithImpl<$Res, UnpaidOrderModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'order_date') DateTime orderDate,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'paid_amount') double paidAmount,
      @JsonKey(name: 'remaining_amount') double remainingAmount,
      @JsonKey(name: 'days_since_order') int daysSinceOrder});
}

/// @nodoc
class _$UnpaidOrderModelCopyWithImpl<$Res, $Val extends UnpaidOrderModel>
    implements $UnpaidOrderModelCopyWith<$Res> {
  _$UnpaidOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnpaidOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? orderDate = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? daysSinceOrder = null,
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
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      daysSinceOrder: null == daysSinceOrder
          ? _value.daysSinceOrder
          : daysSinceOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnpaidOrderModelImplCopyWith<$Res>
    implements $UnpaidOrderModelCopyWith<$Res> {
  factory _$$UnpaidOrderModelImplCopyWith(_$UnpaidOrderModelImpl value,
          $Res Function(_$UnpaidOrderModelImpl) then) =
      __$$UnpaidOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'order_date') DateTime orderDate,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'paid_amount') double paidAmount,
      @JsonKey(name: 'remaining_amount') double remainingAmount,
      @JsonKey(name: 'days_since_order') int daysSinceOrder});
}

/// @nodoc
class __$$UnpaidOrderModelImplCopyWithImpl<$Res>
    extends _$UnpaidOrderModelCopyWithImpl<$Res, _$UnpaidOrderModelImpl>
    implements _$$UnpaidOrderModelImplCopyWith<$Res> {
  __$$UnpaidOrderModelImplCopyWithImpl(_$UnpaidOrderModelImpl _value,
      $Res Function(_$UnpaidOrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnpaidOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? orderDate = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? daysSinceOrder = null,
  }) {
    return _then(_$UnpaidOrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      daysSinceOrder: null == daysSinceOrder
          ? _value.daysSinceOrder
          : daysSinceOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnpaidOrderModelImpl implements _UnpaidOrderModel {
  const _$UnpaidOrderModelImpl(
      {required this.id,
      @JsonKey(name: 'order_number') required this.orderNumber,
      @JsonKey(name: 'order_date') required this.orderDate,
      @JsonKey(name: 'total_amount') required this.totalAmount,
      @JsonKey(name: 'paid_amount') required this.paidAmount,
      @JsonKey(name: 'remaining_amount') required this.remainingAmount,
      @JsonKey(name: 'days_since_order') required this.daysSinceOrder});

  factory _$UnpaidOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnpaidOrderModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  @JsonKey(name: 'order_date')
  final DateTime orderDate;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  @JsonKey(name: 'paid_amount')
  final double paidAmount;
  @override
  @JsonKey(name: 'remaining_amount')
  final double remainingAmount;
  @override
  @JsonKey(name: 'days_since_order')
  final int daysSinceOrder;

  @override
  String toString() {
    return 'UnpaidOrderModel(id: $id, orderNumber: $orderNumber, orderDate: $orderDate, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, daysSinceOrder: $daysSinceOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnpaidOrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.daysSinceOrder, daysSinceOrder) ||
                other.daysSinceOrder == daysSinceOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, orderNumber, orderDate,
      totalAmount, paidAmount, remainingAmount, daysSinceOrder);

  /// Create a copy of UnpaidOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnpaidOrderModelImplCopyWith<_$UnpaidOrderModelImpl> get copyWith =>
      __$$UnpaidOrderModelImplCopyWithImpl<_$UnpaidOrderModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnpaidOrderModelImplToJson(
      this,
    );
  }
}

abstract class _UnpaidOrderModel implements UnpaidOrderModel {
  const factory _UnpaidOrderModel(
      {required final String id,
      @JsonKey(name: 'order_number') required final String orderNumber,
      @JsonKey(name: 'order_date') required final DateTime orderDate,
      @JsonKey(name: 'total_amount') required final double totalAmount,
      @JsonKey(name: 'paid_amount') required final double paidAmount,
      @JsonKey(name: 'remaining_amount') required final double remainingAmount,
      @JsonKey(name: 'days_since_order')
      required final int daysSinceOrder}) = _$UnpaidOrderModelImpl;

  factory _UnpaidOrderModel.fromJson(Map<String, dynamic> json) =
      _$UnpaidOrderModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  @JsonKey(name: 'order_date')
  DateTime get orderDate;
  @override
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @override
  @JsonKey(name: 'paid_amount')
  double get paidAmount;
  @override
  @JsonKey(name: 'remaining_amount')
  double get remainingAmount;
  @override
  @JsonKey(name: 'days_since_order')
  int get daysSinceOrder;

  /// Create a copy of UnpaidOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnpaidOrderModelImplCopyWith<_$UnpaidOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
