// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentCollection {
  String get id;
  String get delivererId;
  String get customerId;
  String get customerName;
  double get amount;
  PaymentMode get mode;
  DateTime get collectedAt;
  List<PaymentAllocation> get allocations;
  String? get reference; // Numéro chèque, référence virement, etc.
  String? get notes;
  String? get receiptImagePath;
  bool get isUploaded;
  DateTime? get uploadedAt;
  DateTime? get createdAt;

  /// Create a copy of PaymentCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentCollectionCopyWith<PaymentCollection> get copyWith =>
      _$PaymentCollectionCopyWithImpl<PaymentCollection>(
          this as PaymentCollection, _$identity);

  /// Serializes this PaymentCollection to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentCollection &&
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
    return 'PaymentCollection(id: $id, delivererId: $delivererId, customerId: $customerId, customerName: $customerName, amount: $amount, mode: $mode, collectedAt: $collectedAt, allocations: $allocations, reference: $reference, notes: $notes, receiptImagePath: $receiptImagePath, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $PaymentCollectionCopyWith<$Res> {
  factory $PaymentCollectionCopyWith(
          PaymentCollection value, $Res Function(PaymentCollection) _then) =
      _$PaymentCollectionCopyWithImpl;
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
class _$PaymentCollectionCopyWithImpl<$Res>
    implements $PaymentCollectionCopyWith<$Res> {
  _$PaymentCollectionCopyWithImpl(this._self, this._then);

  final PaymentCollection _self;
  final $Res Function(PaymentCollection) _then;

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
              as List<PaymentAllocation>,
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

/// Adds pattern-matching-related methods to [PaymentCollection].
extension PaymentCollectionPatterns on PaymentCollection {
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
    TResult Function(_PaymentCollection value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentCollection() when $default != null:
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
    TResult Function(_PaymentCollection value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentCollection():
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
    TResult? Function(_PaymentCollection value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentCollection() when $default != null:
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
            DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentCollection() when $default != null:
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
            DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentCollection():
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
            DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentCollection() when $default != null:
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
class _PaymentCollection implements PaymentCollection {
  const _PaymentCollection(
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
  factory _PaymentCollection.fromJson(Map<String, dynamic> json) =>
      _$PaymentCollectionFromJson(json);

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

  /// Create a copy of PaymentCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentCollectionCopyWith<_PaymentCollection> get copyWith =>
      __$PaymentCollectionCopyWithImpl<_PaymentCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentCollectionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentCollection &&
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
    return 'PaymentCollection(id: $id, delivererId: $delivererId, customerId: $customerId, customerName: $customerName, amount: $amount, mode: $mode, collectedAt: $collectedAt, allocations: $allocations, reference: $reference, notes: $notes, receiptImagePath: $receiptImagePath, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$PaymentCollectionCopyWith<$Res>
    implements $PaymentCollectionCopyWith<$Res> {
  factory _$PaymentCollectionCopyWith(
          _PaymentCollection value, $Res Function(_PaymentCollection) _then) =
      __$PaymentCollectionCopyWithImpl;
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
class __$PaymentCollectionCopyWithImpl<$Res>
    implements _$PaymentCollectionCopyWith<$Res> {
  __$PaymentCollectionCopyWithImpl(this._self, this._then);

  final _PaymentCollection _self;
  final $Res Function(_PaymentCollection) _then;

  /// Create a copy of PaymentCollection
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
    return _then(_PaymentCollection(
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
              as List<PaymentAllocation>,
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
mixin _$PaymentAllocation {
  String get orderId;
  String get orderNumber;
  double get allocatedAmount;
  DateTime get orderDate;
  bool get isFullyPaid;

  /// Create a copy of PaymentAllocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentAllocationCopyWith<PaymentAllocation> get copyWith =>
      _$PaymentAllocationCopyWithImpl<PaymentAllocation>(
          this as PaymentAllocation, _$identity);

  /// Serializes this PaymentAllocation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentAllocation &&
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
    return 'PaymentAllocation(orderId: $orderId, orderNumber: $orderNumber, allocatedAmount: $allocatedAmount, orderDate: $orderDate, isFullyPaid: $isFullyPaid)';
  }
}

/// @nodoc
abstract mixin class $PaymentAllocationCopyWith<$Res> {
  factory $PaymentAllocationCopyWith(
          PaymentAllocation value, $Res Function(PaymentAllocation) _then) =
      _$PaymentAllocationCopyWithImpl;
  @useResult
  $Res call(
      {String orderId,
      String orderNumber,
      double allocatedAmount,
      DateTime orderDate,
      bool isFullyPaid});
}

/// @nodoc
class _$PaymentAllocationCopyWithImpl<$Res>
    implements $PaymentAllocationCopyWith<$Res> {
  _$PaymentAllocationCopyWithImpl(this._self, this._then);

  final PaymentAllocation _self;
  final $Res Function(PaymentAllocation) _then;

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

/// Adds pattern-matching-related methods to [PaymentAllocation].
extension PaymentAllocationPatterns on PaymentAllocation {
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
    TResult Function(_PaymentAllocation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentAllocation() when $default != null:
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
    TResult Function(_PaymentAllocation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentAllocation():
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
    TResult? Function(_PaymentAllocation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentAllocation() when $default != null:
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
    TResult Function(String orderId, String orderNumber, double allocatedAmount,
            DateTime orderDate, bool isFullyPaid)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentAllocation() when $default != null:
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
    TResult Function(String orderId, String orderNumber, double allocatedAmount,
            DateTime orderDate, bool isFullyPaid)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentAllocation():
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
    TResult? Function(String orderId, String orderNumber,
            double allocatedAmount, DateTime orderDate, bool isFullyPaid)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentAllocation() when $default != null:
        return $default(_that.orderId, _that.orderNumber, _that.allocatedAmount,
            _that.orderDate, _that.isFullyPaid);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentAllocation implements PaymentAllocation {
  const _PaymentAllocation(
      {required this.orderId,
      required this.orderNumber,
      required this.allocatedAmount,
      required this.orderDate,
      this.isFullyPaid = false});
  factory _PaymentAllocation.fromJson(Map<String, dynamic> json) =>
      _$PaymentAllocationFromJson(json);

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

  /// Create a copy of PaymentAllocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentAllocationCopyWith<_PaymentAllocation> get copyWith =>
      __$PaymentAllocationCopyWithImpl<_PaymentAllocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentAllocationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentAllocation &&
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
    return 'PaymentAllocation(orderId: $orderId, orderNumber: $orderNumber, allocatedAmount: $allocatedAmount, orderDate: $orderDate, isFullyPaid: $isFullyPaid)';
  }
}

/// @nodoc
abstract mixin class _$PaymentAllocationCopyWith<$Res>
    implements $PaymentAllocationCopyWith<$Res> {
  factory _$PaymentAllocationCopyWith(
          _PaymentAllocation value, $Res Function(_PaymentAllocation) _then) =
      __$PaymentAllocationCopyWithImpl;
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
class __$PaymentAllocationCopyWithImpl<$Res>
    implements _$PaymentAllocationCopyWith<$Res> {
  __$PaymentAllocationCopyWithImpl(this._self, this._then);

  final _PaymentAllocation _self;
  final $Res Function(_PaymentAllocation) _then;

  /// Create a copy of PaymentAllocation
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
    return _then(_PaymentAllocation(
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

// dart format on
