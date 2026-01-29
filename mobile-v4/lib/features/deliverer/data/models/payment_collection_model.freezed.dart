// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentCollectionModel {
  String get id;
  @JsonKey(name: 'deliverer_id')
  String get delivererId;
  @JsonKey(name: 'customer_id')
  String get customerId;
  @JsonKey(name: 'customer_name')
  String get customerName;
  double get amount;
  PaymentMode get mode;
  @JsonKey(name: 'collected_at')
  DateTime get collectedAt;
  List<PaymentAllocationModel> get allocations;
  String? get reference;
  String? get notes;
  @JsonKey(name: 'receipt_image_path')
  String? get receiptImagePath;
  @JsonKey(name: 'is_uploaded')
  bool get isUploaded;
  @JsonKey(name: 'uploaded_at')
  DateTime? get uploadedAt;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of PaymentCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentCollectionModelCopyWith<PaymentCollectionModel> get copyWith =>
      _$PaymentCollectionModelCopyWithImpl<PaymentCollectionModel>(
          this as PaymentCollectionModel, _$identity);

  /// Serializes this PaymentCollectionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentCollectionModel &&
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
                .equals(other.allocations, allocations) &&
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
      const DeepCollectionEquality().hash(allocations),
      reference,
      notes,
      receiptImagePath,
      isUploaded,
      uploadedAt,
      createdAt);

  @override
  String toString() {
    return 'PaymentCollectionModel(id: $id, delivererId: $delivererId, customerId: $customerId, customerName: $customerName, amount: $amount, mode: $mode, collectedAt: $collectedAt, allocations: $allocations, reference: $reference, notes: $notes, receiptImagePath: $receiptImagePath, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $PaymentCollectionModelCopyWith<$Res> {
  factory $PaymentCollectionModelCopyWith(PaymentCollectionModel value,
          $Res Function(PaymentCollectionModel) _then) =
      _$PaymentCollectionModelCopyWithImpl;
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
class _$PaymentCollectionModelCopyWithImpl<$Res>
    implements $PaymentCollectionModelCopyWith<$Res> {
  _$PaymentCollectionModelCopyWithImpl(this._self, this._then);

  final PaymentCollectionModel _self;
  final $Res Function(PaymentCollectionModel) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as PaymentMode,
      collectedAt: null == collectedAt
          ? _self.collectedAt
          : collectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      allocations: null == allocations
          ? _self.allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<PaymentAllocationModel>,
      reference: freezed == reference
          ? _self.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptImagePath: freezed == receiptImagePath
          ? _self.receiptImagePath
          : receiptImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploaded: null == isUploaded
          ? _self.isUploaded
          : isUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadedAt: freezed == uploadedAt
          ? _self.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaymentCollectionModel].
extension PaymentCollectionModelPatterns on PaymentCollectionModel {
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
    TResult Function(_PaymentCollectionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentCollectionModel() when $default != null:
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
    TResult Function(_PaymentCollectionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentCollectionModel():
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
    TResult? Function(_PaymentCollectionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentCollectionModel() when $default != null:
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
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentCollectionModel() when $default != null:
        return $default(
            _that.id,
            _that.delivererId,
            _that.customerId,
            _that.customerName,
            _that.amount,
            _that.mode,
            _that.collectedAt,
            _that.allocations,
            _that.reference,
            _that.notes,
            _that.receiptImagePath,
            _that.isUploaded,
            _that.uploadedAt,
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
            @JsonKey(name: 'created_at') DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentCollectionModel():
        return $default(
            _that.id,
            _that.delivererId,
            _that.customerId,
            _that.customerName,
            _that.amount,
            _that.mode,
            _that.collectedAt,
            _that.allocations,
            _that.reference,
            _that.notes,
            _that.receiptImagePath,
            _that.isUploaded,
            _that.uploadedAt,
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
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentCollectionModel() when $default != null:
        return $default(
            _that.id,
            _that.delivererId,
            _that.customerId,
            _that.customerName,
            _that.amount,
            _that.mode,
            _that.collectedAt,
            _that.allocations,
            _that.reference,
            _that.notes,
            _that.receiptImagePath,
            _that.isUploaded,
            _that.uploadedAt,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentCollectionModel implements PaymentCollectionModel {
  const _PaymentCollectionModel(
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
  factory _PaymentCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentCollectionModelFromJson(json);

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

  /// Create a copy of PaymentCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentCollectionModelCopyWith<_PaymentCollectionModel> get copyWith =>
      __$PaymentCollectionModelCopyWithImpl<_PaymentCollectionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentCollectionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentCollectionModel &&
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

  @override
  String toString() {
    return 'PaymentCollectionModel(id: $id, delivererId: $delivererId, customerId: $customerId, customerName: $customerName, amount: $amount, mode: $mode, collectedAt: $collectedAt, allocations: $allocations, reference: $reference, notes: $notes, receiptImagePath: $receiptImagePath, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$PaymentCollectionModelCopyWith<$Res>
    implements $PaymentCollectionModelCopyWith<$Res> {
  factory _$PaymentCollectionModelCopyWith(_PaymentCollectionModel value,
          $Res Function(_PaymentCollectionModel) _then) =
      __$PaymentCollectionModelCopyWithImpl;
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
class __$PaymentCollectionModelCopyWithImpl<$Res>
    implements _$PaymentCollectionModelCopyWith<$Res> {
  __$PaymentCollectionModelCopyWithImpl(this._self, this._then);

  final _PaymentCollectionModel _self;
  final $Res Function(_PaymentCollectionModel) _then;

  /// Create a copy of PaymentCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_PaymentCollectionModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as PaymentMode,
      collectedAt: null == collectedAt
          ? _self.collectedAt
          : collectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      allocations: null == allocations
          ? _self._allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<PaymentAllocationModel>,
      reference: freezed == reference
          ? _self.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptImagePath: freezed == receiptImagePath
          ? _self.receiptImagePath
          : receiptImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploaded: null == isUploaded
          ? _self.isUploaded
          : isUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadedAt: freezed == uploadedAt
          ? _self.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$PaymentAllocationModel {
  @JsonKey(name: 'order_id')
  String get orderId;
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @JsonKey(name: 'allocated_amount')
  double get allocatedAmount;
  @JsonKey(name: 'order_date')
  DateTime get orderDate;
  @JsonKey(name: 'is_fully_paid')
  bool get isFullyPaid;

  /// Create a copy of PaymentAllocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentAllocationModelCopyWith<PaymentAllocationModel> get copyWith =>
      _$PaymentAllocationModelCopyWithImpl<PaymentAllocationModel>(
          this as PaymentAllocationModel, _$identity);

  /// Serializes this PaymentAllocationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentAllocationModel &&
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

  @override
  String toString() {
    return 'PaymentAllocationModel(orderId: $orderId, orderNumber: $orderNumber, allocatedAmount: $allocatedAmount, orderDate: $orderDate, isFullyPaid: $isFullyPaid)';
  }
}

/// @nodoc
abstract mixin class $PaymentAllocationModelCopyWith<$Res> {
  factory $PaymentAllocationModelCopyWith(PaymentAllocationModel value,
          $Res Function(PaymentAllocationModel) _then) =
      _$PaymentAllocationModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'allocated_amount') double allocatedAmount,
      @JsonKey(name: 'order_date') DateTime orderDate,
      @JsonKey(name: 'is_fully_paid') bool isFullyPaid});
}

/// @nodoc
class _$PaymentAllocationModelCopyWithImpl<$Res>
    implements $PaymentAllocationModelCopyWith<$Res> {
  _$PaymentAllocationModelCopyWithImpl(this._self, this._then);

  final PaymentAllocationModel _self;
  final $Res Function(PaymentAllocationModel) _then;

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
    return _then(_self.copyWith(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      allocatedAmount: null == allocatedAmount
          ? _self.allocatedAmount
          : allocatedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      orderDate: null == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFullyPaid: null == isFullyPaid
          ? _self.isFullyPaid
          : isFullyPaid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaymentAllocationModel].
extension PaymentAllocationModelPatterns on PaymentAllocationModel {
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
    TResult Function(_PaymentAllocationModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentAllocationModel() when $default != null:
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
    TResult Function(_PaymentAllocationModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentAllocationModel():
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
    TResult? Function(_PaymentAllocationModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentAllocationModel() when $default != null:
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
            @JsonKey(name: 'order_id') String orderId,
            @JsonKey(name: 'order_number') String orderNumber,
            @JsonKey(name: 'allocated_amount') double allocatedAmount,
            @JsonKey(name: 'order_date') DateTime orderDate,
            @JsonKey(name: 'is_fully_paid') bool isFullyPaid)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentAllocationModel() when $default != null:
        return $default(_that.orderId, _that.orderNumber, _that.allocatedAmount,
            _that.orderDate, _that.isFullyPaid);
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
            @JsonKey(name: 'order_id') String orderId,
            @JsonKey(name: 'order_number') String orderNumber,
            @JsonKey(name: 'allocated_amount') double allocatedAmount,
            @JsonKey(name: 'order_date') DateTime orderDate,
            @JsonKey(name: 'is_fully_paid') bool isFullyPaid)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentAllocationModel():
        return $default(_that.orderId, _that.orderNumber, _that.allocatedAmount,
            _that.orderDate, _that.isFullyPaid);
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
            @JsonKey(name: 'order_id') String orderId,
            @JsonKey(name: 'order_number') String orderNumber,
            @JsonKey(name: 'allocated_amount') double allocatedAmount,
            @JsonKey(name: 'order_date') DateTime orderDate,
            @JsonKey(name: 'is_fully_paid') bool isFullyPaid)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentAllocationModel() when $default != null:
        return $default(_that.orderId, _that.orderNumber, _that.allocatedAmount,
            _that.orderDate, _that.isFullyPaid);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentAllocationModel implements PaymentAllocationModel {
  const _PaymentAllocationModel(
      {@JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'order_number') required this.orderNumber,
      @JsonKey(name: 'allocated_amount') required this.allocatedAmount,
      @JsonKey(name: 'order_date') required this.orderDate,
      @JsonKey(name: 'is_fully_paid') this.isFullyPaid = false});
  factory _PaymentAllocationModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentAllocationModelFromJson(json);

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

  /// Create a copy of PaymentAllocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentAllocationModelCopyWith<_PaymentAllocationModel> get copyWith =>
      __$PaymentAllocationModelCopyWithImpl<_PaymentAllocationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentAllocationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentAllocationModel &&
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

  @override
  String toString() {
    return 'PaymentAllocationModel(orderId: $orderId, orderNumber: $orderNumber, allocatedAmount: $allocatedAmount, orderDate: $orderDate, isFullyPaid: $isFullyPaid)';
  }
}

/// @nodoc
abstract mixin class _$PaymentAllocationModelCopyWith<$Res>
    implements $PaymentAllocationModelCopyWith<$Res> {
  factory _$PaymentAllocationModelCopyWith(_PaymentAllocationModel value,
          $Res Function(_PaymentAllocationModel) _then) =
      __$PaymentAllocationModelCopyWithImpl;
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
class __$PaymentAllocationModelCopyWithImpl<$Res>
    implements _$PaymentAllocationModelCopyWith<$Res> {
  __$PaymentAllocationModelCopyWithImpl(this._self, this._then);

  final _PaymentAllocationModel _self;
  final $Res Function(_PaymentAllocationModel) _then;

  /// Create a copy of PaymentAllocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orderId = null,
    Object? orderNumber = null,
    Object? allocatedAmount = null,
    Object? orderDate = null,
    Object? isFullyPaid = null,
  }) {
    return _then(_PaymentAllocationModel(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      allocatedAmount: null == allocatedAmount
          ? _self.allocatedAmount
          : allocatedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      orderDate: null == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFullyPaid: null == isFullyPaid
          ? _self.isFullyPaid
          : isFullyPaid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$UploadPaymentRequest {
  @JsonKey(name: 'deliverer_id')
  String get delivererId;
  @JsonKey(name: 'customer_id')
  String get customerId;
  @JsonKey(name: 'customer_name')
  String get customerName;
  double get amount;
  String get mode;
  @JsonKey(name: 'collected_at')
  DateTime get collectedAt;
  List<Map<String, dynamic>> get allocations;
  String? get reference;
  String? get notes;
  @JsonKey(name: 'receipt_image')
  String? get receiptImageBase64;

  /// Create a copy of UploadPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UploadPaymentRequestCopyWith<UploadPaymentRequest> get copyWith =>
      _$UploadPaymentRequestCopyWithImpl<UploadPaymentRequest>(
          this as UploadPaymentRequest, _$identity);

  /// Serializes this UploadPaymentRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UploadPaymentRequest &&
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
                .equals(other.allocations, allocations) &&
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
      const DeepCollectionEquality().hash(allocations),
      reference,
      notes,
      receiptImageBase64);

  @override
  String toString() {
    return 'UploadPaymentRequest(delivererId: $delivererId, customerId: $customerId, customerName: $customerName, amount: $amount, mode: $mode, collectedAt: $collectedAt, allocations: $allocations, reference: $reference, notes: $notes, receiptImageBase64: $receiptImageBase64)';
  }
}

/// @nodoc
abstract mixin class $UploadPaymentRequestCopyWith<$Res> {
  factory $UploadPaymentRequestCopyWith(UploadPaymentRequest value,
          $Res Function(UploadPaymentRequest) _then) =
      _$UploadPaymentRequestCopyWithImpl;
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
class _$UploadPaymentRequestCopyWithImpl<$Res>
    implements $UploadPaymentRequestCopyWith<$Res> {
  _$UploadPaymentRequestCopyWithImpl(this._self, this._then);

  final UploadPaymentRequest _self;
  final $Res Function(UploadPaymentRequest) _then;

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
    return _then(_self.copyWith(
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      collectedAt: null == collectedAt
          ? _self.collectedAt
          : collectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      allocations: null == allocations
          ? _self.allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      reference: freezed == reference
          ? _self.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptImageBase64: freezed == receiptImageBase64
          ? _self.receiptImageBase64
          : receiptImageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UploadPaymentRequest].
extension UploadPaymentRequestPatterns on UploadPaymentRequest {
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
    TResult Function(_UploadPaymentRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadPaymentRequest() when $default != null:
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
    TResult Function(_UploadPaymentRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPaymentRequest():
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
    TResult? Function(_UploadPaymentRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPaymentRequest() when $default != null:
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
            @JsonKey(name: 'deliverer_id') String delivererId,
            @JsonKey(name: 'customer_id') String customerId,
            @JsonKey(name: 'customer_name') String customerName,
            double amount,
            String mode,
            @JsonKey(name: 'collected_at') DateTime collectedAt,
            List<Map<String, dynamic>> allocations,
            String? reference,
            String? notes,
            @JsonKey(name: 'receipt_image') String? receiptImageBase64)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadPaymentRequest() when $default != null:
        return $default(
            _that.delivererId,
            _that.customerId,
            _that.customerName,
            _that.amount,
            _that.mode,
            _that.collectedAt,
            _that.allocations,
            _that.reference,
            _that.notes,
            _that.receiptImageBase64);
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
            @JsonKey(name: 'deliverer_id') String delivererId,
            @JsonKey(name: 'customer_id') String customerId,
            @JsonKey(name: 'customer_name') String customerName,
            double amount,
            String mode,
            @JsonKey(name: 'collected_at') DateTime collectedAt,
            List<Map<String, dynamic>> allocations,
            String? reference,
            String? notes,
            @JsonKey(name: 'receipt_image') String? receiptImageBase64)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPaymentRequest():
        return $default(
            _that.delivererId,
            _that.customerId,
            _that.customerName,
            _that.amount,
            _that.mode,
            _that.collectedAt,
            _that.allocations,
            _that.reference,
            _that.notes,
            _that.receiptImageBase64);
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
            @JsonKey(name: 'deliverer_id') String delivererId,
            @JsonKey(name: 'customer_id') String customerId,
            @JsonKey(name: 'customer_name') String customerName,
            double amount,
            String mode,
            @JsonKey(name: 'collected_at') DateTime collectedAt,
            List<Map<String, dynamic>> allocations,
            String? reference,
            String? notes,
            @JsonKey(name: 'receipt_image') String? receiptImageBase64)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPaymentRequest() when $default != null:
        return $default(
            _that.delivererId,
            _that.customerId,
            _that.customerName,
            _that.amount,
            _that.mode,
            _that.collectedAt,
            _that.allocations,
            _that.reference,
            _that.notes,
            _that.receiptImageBase64);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UploadPaymentRequest implements UploadPaymentRequest {
  const _UploadPaymentRequest(
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
  factory _UploadPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadPaymentRequestFromJson(json);

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

  /// Create a copy of UploadPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UploadPaymentRequestCopyWith<_UploadPaymentRequest> get copyWith =>
      __$UploadPaymentRequestCopyWithImpl<_UploadPaymentRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UploadPaymentRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UploadPaymentRequest &&
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

  @override
  String toString() {
    return 'UploadPaymentRequest(delivererId: $delivererId, customerId: $customerId, customerName: $customerName, amount: $amount, mode: $mode, collectedAt: $collectedAt, allocations: $allocations, reference: $reference, notes: $notes, receiptImageBase64: $receiptImageBase64)';
  }
}

/// @nodoc
abstract mixin class _$UploadPaymentRequestCopyWith<$Res>
    implements $UploadPaymentRequestCopyWith<$Res> {
  factory _$UploadPaymentRequestCopyWith(_UploadPaymentRequest value,
          $Res Function(_UploadPaymentRequest) _then) =
      __$UploadPaymentRequestCopyWithImpl;
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
class __$UploadPaymentRequestCopyWithImpl<$Res>
    implements _$UploadPaymentRequestCopyWith<$Res> {
  __$UploadPaymentRequestCopyWithImpl(this._self, this._then);

  final _UploadPaymentRequest _self;
  final $Res Function(_UploadPaymentRequest) _then;

  /// Create a copy of UploadPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_UploadPaymentRequest(
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      collectedAt: null == collectedAt
          ? _self.collectedAt
          : collectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      allocations: null == allocations
          ? _self._allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      reference: freezed == reference
          ? _self.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptImageBase64: freezed == receiptImageBase64
          ? _self.receiptImageBase64
          : receiptImageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$UploadPaymentResponse {
  String get id;
  String get status;
  String get message;
  @JsonKey(name: 'uploaded_at')
  DateTime get uploadedAt;
  @JsonKey(name: 'receipt_url')
  String? get receiptUrl;
  @JsonKey(name: 'updated_orders')
  List<String>? get updatedOrders;

  /// Create a copy of UploadPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UploadPaymentResponseCopyWith<UploadPaymentResponse> get copyWith =>
      _$UploadPaymentResponseCopyWithImpl<UploadPaymentResponse>(
          this as UploadPaymentResponse, _$identity);

  /// Serializes this UploadPaymentResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UploadPaymentResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.receiptUrl, receiptUrl) ||
                other.receiptUrl == receiptUrl) &&
            const DeepCollectionEquality()
                .equals(other.updatedOrders, updatedOrders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, message, uploadedAt,
      receiptUrl, const DeepCollectionEquality().hash(updatedOrders));

  @override
  String toString() {
    return 'UploadPaymentResponse(id: $id, status: $status, message: $message, uploadedAt: $uploadedAt, receiptUrl: $receiptUrl, updatedOrders: $updatedOrders)';
  }
}

/// @nodoc
abstract mixin class $UploadPaymentResponseCopyWith<$Res> {
  factory $UploadPaymentResponseCopyWith(UploadPaymentResponse value,
          $Res Function(UploadPaymentResponse) _then) =
      _$UploadPaymentResponseCopyWithImpl;
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
class _$UploadPaymentResponseCopyWithImpl<$Res>
    implements $UploadPaymentResponseCopyWith<$Res> {
  _$UploadPaymentResponseCopyWithImpl(this._self, this._then);

  final UploadPaymentResponse _self;
  final $Res Function(UploadPaymentResponse) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _self.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receiptUrl: freezed == receiptUrl
          ? _self.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedOrders: freezed == updatedOrders
          ? _self.updatedOrders
          : updatedOrders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UploadPaymentResponse].
extension UploadPaymentResponsePatterns on UploadPaymentResponse {
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
    TResult Function(_UploadPaymentResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadPaymentResponse() when $default != null:
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
    TResult Function(_UploadPaymentResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPaymentResponse():
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
    TResult? Function(_UploadPaymentResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPaymentResponse() when $default != null:
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
            String status,
            String message,
            @JsonKey(name: 'uploaded_at') DateTime uploadedAt,
            @JsonKey(name: 'receipt_url') String? receiptUrl,
            @JsonKey(name: 'updated_orders') List<String>? updatedOrders)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadPaymentResponse() when $default != null:
        return $default(_that.id, _that.status, _that.message, _that.uploadedAt,
            _that.receiptUrl, _that.updatedOrders);
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
            String status,
            String message,
            @JsonKey(name: 'uploaded_at') DateTime uploadedAt,
            @JsonKey(name: 'receipt_url') String? receiptUrl,
            @JsonKey(name: 'updated_orders') List<String>? updatedOrders)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPaymentResponse():
        return $default(_that.id, _that.status, _that.message, _that.uploadedAt,
            _that.receiptUrl, _that.updatedOrders);
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
            String status,
            String message,
            @JsonKey(name: 'uploaded_at') DateTime uploadedAt,
            @JsonKey(name: 'receipt_url') String? receiptUrl,
            @JsonKey(name: 'updated_orders') List<String>? updatedOrders)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPaymentResponse() when $default != null:
        return $default(_that.id, _that.status, _that.message, _that.uploadedAt,
            _that.receiptUrl, _that.updatedOrders);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UploadPaymentResponse implements UploadPaymentResponse {
  const _UploadPaymentResponse(
      {required this.id,
      required this.status,
      required this.message,
      @JsonKey(name: 'uploaded_at') required this.uploadedAt,
      @JsonKey(name: 'receipt_url') this.receiptUrl,
      @JsonKey(name: 'updated_orders') final List<String>? updatedOrders})
      : _updatedOrders = updatedOrders;
  factory _UploadPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadPaymentResponseFromJson(json);

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

  /// Create a copy of UploadPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UploadPaymentResponseCopyWith<_UploadPaymentResponse> get copyWith =>
      __$UploadPaymentResponseCopyWithImpl<_UploadPaymentResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UploadPaymentResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UploadPaymentResponse &&
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

  @override
  String toString() {
    return 'UploadPaymentResponse(id: $id, status: $status, message: $message, uploadedAt: $uploadedAt, receiptUrl: $receiptUrl, updatedOrders: $updatedOrders)';
  }
}

/// @nodoc
abstract mixin class _$UploadPaymentResponseCopyWith<$Res>
    implements $UploadPaymentResponseCopyWith<$Res> {
  factory _$UploadPaymentResponseCopyWith(_UploadPaymentResponse value,
          $Res Function(_UploadPaymentResponse) _then) =
      __$UploadPaymentResponseCopyWithImpl;
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
class __$UploadPaymentResponseCopyWithImpl<$Res>
    implements _$UploadPaymentResponseCopyWith<$Res> {
  __$UploadPaymentResponseCopyWithImpl(this._self, this._then);

  final _UploadPaymentResponse _self;
  final $Res Function(_UploadPaymentResponse) _then;

  /// Create a copy of UploadPaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? message = null,
    Object? uploadedAt = null,
    Object? receiptUrl = freezed,
    Object? updatedOrders = freezed,
  }) {
    return _then(_UploadPaymentResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _self.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receiptUrl: freezed == receiptUrl
          ? _self.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedOrders: freezed == updatedOrders
          ? _self._updatedOrders
          : updatedOrders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
mixin _$UnpaidOrderModel {
  String get id;
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @JsonKey(name: 'order_date')
  DateTime get orderDate;
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @JsonKey(name: 'paid_amount')
  double get paidAmount;
  @JsonKey(name: 'remaining_amount')
  double get remainingAmount;
  @JsonKey(name: 'days_since_order')
  int get daysSinceOrder;

  /// Create a copy of UnpaidOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnpaidOrderModelCopyWith<UnpaidOrderModel> get copyWith =>
      _$UnpaidOrderModelCopyWithImpl<UnpaidOrderModel>(
          this as UnpaidOrderModel, _$identity);

  /// Serializes this UnpaidOrderModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnpaidOrderModel &&
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

  @override
  String toString() {
    return 'UnpaidOrderModel(id: $id, orderNumber: $orderNumber, orderDate: $orderDate, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, daysSinceOrder: $daysSinceOrder)';
  }
}

/// @nodoc
abstract mixin class $UnpaidOrderModelCopyWith<$Res> {
  factory $UnpaidOrderModelCopyWith(
          UnpaidOrderModel value, $Res Function(UnpaidOrderModel) _then) =
      _$UnpaidOrderModelCopyWithImpl;
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
class _$UnpaidOrderModelCopyWithImpl<$Res>
    implements $UnpaidOrderModelCopyWith<$Res> {
  _$UnpaidOrderModelCopyWithImpl(this._self, this._then);

  final UnpaidOrderModel _self;
  final $Res Function(UnpaidOrderModel) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingAmount: null == remainingAmount
          ? _self.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      daysSinceOrder: null == daysSinceOrder
          ? _self.daysSinceOrder
          : daysSinceOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [UnpaidOrderModel].
extension UnpaidOrderModelPatterns on UnpaidOrderModel {
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
    TResult Function(_UnpaidOrderModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UnpaidOrderModel() when $default != null:
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
    TResult Function(_UnpaidOrderModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnpaidOrderModel():
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
    TResult? Function(_UnpaidOrderModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnpaidOrderModel() when $default != null:
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
            @JsonKey(name: 'order_number') String orderNumber,
            @JsonKey(name: 'order_date') DateTime orderDate,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'paid_amount') double paidAmount,
            @JsonKey(name: 'remaining_amount') double remainingAmount,
            @JsonKey(name: 'days_since_order') int daysSinceOrder)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UnpaidOrderModel() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.orderDate,
            _that.totalAmount,
            _that.paidAmount,
            _that.remainingAmount,
            _that.daysSinceOrder);
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
            @JsonKey(name: 'order_number') String orderNumber,
            @JsonKey(name: 'order_date') DateTime orderDate,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'paid_amount') double paidAmount,
            @JsonKey(name: 'remaining_amount') double remainingAmount,
            @JsonKey(name: 'days_since_order') int daysSinceOrder)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnpaidOrderModel():
        return $default(
            _that.id,
            _that.orderNumber,
            _that.orderDate,
            _that.totalAmount,
            _that.paidAmount,
            _that.remainingAmount,
            _that.daysSinceOrder);
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
            @JsonKey(name: 'order_number') String orderNumber,
            @JsonKey(name: 'order_date') DateTime orderDate,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'paid_amount') double paidAmount,
            @JsonKey(name: 'remaining_amount') double remainingAmount,
            @JsonKey(name: 'days_since_order') int daysSinceOrder)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnpaidOrderModel() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.orderDate,
            _that.totalAmount,
            _that.paidAmount,
            _that.remainingAmount,
            _that.daysSinceOrder);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UnpaidOrderModel implements UnpaidOrderModel {
  const _UnpaidOrderModel(
      {required this.id,
      @JsonKey(name: 'order_number') required this.orderNumber,
      @JsonKey(name: 'order_date') required this.orderDate,
      @JsonKey(name: 'total_amount') required this.totalAmount,
      @JsonKey(name: 'paid_amount') required this.paidAmount,
      @JsonKey(name: 'remaining_amount') required this.remainingAmount,
      @JsonKey(name: 'days_since_order') required this.daysSinceOrder});
  factory _UnpaidOrderModel.fromJson(Map<String, dynamic> json) =>
      _$UnpaidOrderModelFromJson(json);

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

  /// Create a copy of UnpaidOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UnpaidOrderModelCopyWith<_UnpaidOrderModel> get copyWith =>
      __$UnpaidOrderModelCopyWithImpl<_UnpaidOrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UnpaidOrderModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnpaidOrderModel &&
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

  @override
  String toString() {
    return 'UnpaidOrderModel(id: $id, orderNumber: $orderNumber, orderDate: $orderDate, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, daysSinceOrder: $daysSinceOrder)';
  }
}

/// @nodoc
abstract mixin class _$UnpaidOrderModelCopyWith<$Res>
    implements $UnpaidOrderModelCopyWith<$Res> {
  factory _$UnpaidOrderModelCopyWith(
          _UnpaidOrderModel value, $Res Function(_UnpaidOrderModel) _then) =
      __$UnpaidOrderModelCopyWithImpl;
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
class __$UnpaidOrderModelCopyWithImpl<$Res>
    implements _$UnpaidOrderModelCopyWith<$Res> {
  __$UnpaidOrderModelCopyWithImpl(this._self, this._then);

  final _UnpaidOrderModel _self;
  final $Res Function(_UnpaidOrderModel) _then;

  /// Create a copy of UnpaidOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? orderDate = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? daysSinceOrder = null,
  }) {
    return _then(_UnpaidOrderModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingAmount: null == remainingAmount
          ? _self.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      daysSinceOrder: null == daysSinceOrder
          ? _self.daysSinceOrder
          : daysSinceOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
