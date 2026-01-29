// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerOrderModel {
  String get id;
  String get orderNumber;
  String get customerId;
  String get customerName;
  DateTime get orderDate;
  DateTime? get deliveryDate;
  String get status;
  List<CustomerOrderItemModel> get items;
  double get subtotal;
  double get deliveryFee;
  double get packagingDeposit;
  double get totalAmount;
  double get paidAmount;
  double get remainingAmount;
  String? get delivererId;
  String? get delivererName;
  String? get deliveryAddress;
  String? get notes;
  String? get cancellationReason;
  DateTime? get cancelledAt;
  DateTime? get completedAt;
  bool get hasProofOfDelivery;
  String? get proofOfDeliveryId;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of CustomerOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerOrderModelCopyWith<CustomerOrderModel> get copyWith =>
      _$CustomerOrderModelCopyWithImpl<CustomerOrderModel>(
          this as CustomerOrderModel, _$identity);

  /// Serializes this CustomerOrderModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerOrderModel &&
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
            const DeepCollectionEquality().equals(other.items, items) &&
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
        const DeepCollectionEquality().hash(items),
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

  @override
  String toString() {
    return 'CustomerOrderModel(id: $id, orderNumber: $orderNumber, customerId: $customerId, customerName: $customerName, orderDate: $orderDate, deliveryDate: $deliveryDate, status: $status, items: $items, subtotal: $subtotal, deliveryFee: $deliveryFee, packagingDeposit: $packagingDeposit, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, delivererId: $delivererId, delivererName: $delivererName, deliveryAddress: $deliveryAddress, notes: $notes, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, completedAt: $completedAt, hasProofOfDelivery: $hasProofOfDelivery, proofOfDeliveryId: $proofOfDeliveryId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $CustomerOrderModelCopyWith<$Res> {
  factory $CustomerOrderModelCopyWith(
          CustomerOrderModel value, $Res Function(CustomerOrderModel) _then) =
      _$CustomerOrderModelCopyWithImpl;
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
class _$CustomerOrderModelCopyWithImpl<$Res>
    implements $CustomerOrderModelCopyWith<$Res> {
  _$CustomerOrderModelCopyWithImpl(this._self, this._then);

  final CustomerOrderModel _self;
  final $Res Function(CustomerOrderModel) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _self.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerOrderItemModel>,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _self.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      packagingDeposit: null == packagingDeposit
          ? _self.packagingDeposit
          : packagingDeposit // ignore: cast_nullable_to_non_nullable
              as double,
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
      delivererId: freezed == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String?,
      delivererName: freezed == delivererName
          ? _self.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: freezed == deliveryAddress
          ? _self.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _self.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _self.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasProofOfDelivery: null == hasProofOfDelivery
          ? _self.hasProofOfDelivery
          : hasProofOfDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      proofOfDeliveryId: freezed == proofOfDeliveryId
          ? _self.proofOfDeliveryId
          : proofOfDeliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerOrderModel].
extension CustomerOrderModelPatterns on CustomerOrderModel {
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
    TResult Function(_CustomerOrderModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerOrderModel() when $default != null:
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
    TResult Function(_CustomerOrderModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerOrderModel():
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
    TResult? Function(_CustomerOrderModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerOrderModel() when $default != null:
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
            DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerOrderModel() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.customerId,
            _that.customerName,
            _that.orderDate,
            _that.deliveryDate,
            _that.status,
            _that.items,
            _that.subtotal,
            _that.deliveryFee,
            _that.packagingDeposit,
            _that.totalAmount,
            _that.paidAmount,
            _that.remainingAmount,
            _that.delivererId,
            _that.delivererName,
            _that.deliveryAddress,
            _that.notes,
            _that.cancellationReason,
            _that.cancelledAt,
            _that.completedAt,
            _that.hasProofOfDelivery,
            _that.proofOfDeliveryId,
            _that.createdAt,
            _that.updatedAt);
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
            DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerOrderModel():
        return $default(
            _that.id,
            _that.orderNumber,
            _that.customerId,
            _that.customerName,
            _that.orderDate,
            _that.deliveryDate,
            _that.status,
            _that.items,
            _that.subtotal,
            _that.deliveryFee,
            _that.packagingDeposit,
            _that.totalAmount,
            _that.paidAmount,
            _that.remainingAmount,
            _that.delivererId,
            _that.delivererName,
            _that.deliveryAddress,
            _that.notes,
            _that.cancellationReason,
            _that.cancelledAt,
            _that.completedAt,
            _that.hasProofOfDelivery,
            _that.proofOfDeliveryId,
            _that.createdAt,
            _that.updatedAt);
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
            DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerOrderModel() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.customerId,
            _that.customerName,
            _that.orderDate,
            _that.deliveryDate,
            _that.status,
            _that.items,
            _that.subtotal,
            _that.deliveryFee,
            _that.packagingDeposit,
            _that.totalAmount,
            _that.paidAmount,
            _that.remainingAmount,
            _that.delivererId,
            _that.delivererName,
            _that.deliveryAddress,
            _that.notes,
            _that.cancellationReason,
            _that.cancelledAt,
            _that.completedAt,
            _that.hasProofOfDelivery,
            _that.proofOfDeliveryId,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerOrderModel implements CustomerOrderModel {
  const _CustomerOrderModel(
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
  factory _CustomerOrderModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerOrderModelFromJson(json);

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

  /// Create a copy of CustomerOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerOrderModelCopyWith<_CustomerOrderModel> get copyWith =>
      __$CustomerOrderModelCopyWithImpl<_CustomerOrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerOrderModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerOrderModel &&
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

  @override
  String toString() {
    return 'CustomerOrderModel(id: $id, orderNumber: $orderNumber, customerId: $customerId, customerName: $customerName, orderDate: $orderDate, deliveryDate: $deliveryDate, status: $status, items: $items, subtotal: $subtotal, deliveryFee: $deliveryFee, packagingDeposit: $packagingDeposit, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, delivererId: $delivererId, delivererName: $delivererName, deliveryAddress: $deliveryAddress, notes: $notes, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, completedAt: $completedAt, hasProofOfDelivery: $hasProofOfDelivery, proofOfDeliveryId: $proofOfDeliveryId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$CustomerOrderModelCopyWith<$Res>
    implements $CustomerOrderModelCopyWith<$Res> {
  factory _$CustomerOrderModelCopyWith(
          _CustomerOrderModel value, $Res Function(_CustomerOrderModel) _then) =
      __$CustomerOrderModelCopyWithImpl;
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
class __$CustomerOrderModelCopyWithImpl<$Res>
    implements _$CustomerOrderModelCopyWith<$Res> {
  __$CustomerOrderModelCopyWithImpl(this._self, this._then);

  final _CustomerOrderModel _self;
  final $Res Function(_CustomerOrderModel) _then;

  /// Create a copy of CustomerOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_CustomerOrderModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _self.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerOrderItemModel>,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _self.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      packagingDeposit: null == packagingDeposit
          ? _self.packagingDeposit
          : packagingDeposit // ignore: cast_nullable_to_non_nullable
              as double,
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
      delivererId: freezed == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String?,
      delivererName: freezed == delivererName
          ? _self.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: freezed == deliveryAddress
          ? _self.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _self.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _self.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasProofOfDelivery: null == hasProofOfDelivery
          ? _self.hasProofOfDelivery
          : hasProofOfDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      proofOfDeliveryId: freezed == proofOfDeliveryId
          ? _self.proofOfDeliveryId
          : proofOfDeliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$CustomerOrderItemModel {
  String get id;
  String get productId;
  String get productName;
  String get productCode;
  int get quantity;
  double get unitPrice;
  double get totalPrice;
  String? get productImage;
  String? get unit;
  String? get notes;

  /// Create a copy of CustomerOrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerOrderItemModelCopyWith<CustomerOrderItemModel> get copyWith =>
      _$CustomerOrderItemModelCopyWithImpl<CustomerOrderItemModel>(
          this as CustomerOrderItemModel, _$identity);

  /// Serializes this CustomerOrderItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerOrderItemModel &&
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

  @override
  String toString() {
    return 'CustomerOrderItemModel(id: $id, productId: $productId, productName: $productName, productCode: $productCode, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, productImage: $productImage, unit: $unit, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $CustomerOrderItemModelCopyWith<$Res> {
  factory $CustomerOrderItemModelCopyWith(CustomerOrderItemModel value,
          $Res Function(CustomerOrderItemModel) _then) =
      _$CustomerOrderItemModelCopyWithImpl;
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
class _$CustomerOrderItemModelCopyWithImpl<$Res>
    implements $CustomerOrderItemModelCopyWith<$Res> {
  _$CustomerOrderItemModelCopyWithImpl(this._self, this._then);

  final CustomerOrderItemModel _self;
  final $Res Function(CustomerOrderItemModel) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productCode: null == productCode
          ? _self.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productImage: freezed == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerOrderItemModel].
extension CustomerOrderItemModelPatterns on CustomerOrderItemModel {
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
    TResult Function(_CustomerOrderItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerOrderItemModel() when $default != null:
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
    TResult Function(_CustomerOrderItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerOrderItemModel():
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
    TResult? Function(_CustomerOrderItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerOrderItemModel() when $default != null:
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
            String productId,
            String productName,
            String productCode,
            int quantity,
            double unitPrice,
            double totalPrice,
            String? productImage,
            String? unit,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerOrderItemModel() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.productCode,
            _that.quantity,
            _that.unitPrice,
            _that.totalPrice,
            _that.productImage,
            _that.unit,
            _that.notes);
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
            String productId,
            String productName,
            String productCode,
            int quantity,
            double unitPrice,
            double totalPrice,
            String? productImage,
            String? unit,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerOrderItemModel():
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.productCode,
            _that.quantity,
            _that.unitPrice,
            _that.totalPrice,
            _that.productImage,
            _that.unit,
            _that.notes);
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
            String productId,
            String productName,
            String productCode,
            int quantity,
            double unitPrice,
            double totalPrice,
            String? productImage,
            String? unit,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerOrderItemModel() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.productCode,
            _that.quantity,
            _that.unitPrice,
            _that.totalPrice,
            _that.productImage,
            _that.unit,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerOrderItemModel implements CustomerOrderItemModel {
  const _CustomerOrderItemModel(
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
  factory _CustomerOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerOrderItemModelFromJson(json);

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

  /// Create a copy of CustomerOrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerOrderItemModelCopyWith<_CustomerOrderItemModel> get copyWith =>
      __$CustomerOrderItemModelCopyWithImpl<_CustomerOrderItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerOrderItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerOrderItemModel &&
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

  @override
  String toString() {
    return 'CustomerOrderItemModel(id: $id, productId: $productId, productName: $productName, productCode: $productCode, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, productImage: $productImage, unit: $unit, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$CustomerOrderItemModelCopyWith<$Res>
    implements $CustomerOrderItemModelCopyWith<$Res> {
  factory _$CustomerOrderItemModelCopyWith(_CustomerOrderItemModel value,
          $Res Function(_CustomerOrderItemModel) _then) =
      __$CustomerOrderItemModelCopyWithImpl;
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
class __$CustomerOrderItemModelCopyWithImpl<$Res>
    implements _$CustomerOrderItemModelCopyWith<$Res> {
  __$CustomerOrderItemModelCopyWithImpl(this._self, this._then);

  final _CustomerOrderItemModel _self;
  final $Res Function(_CustomerOrderItemModel) _then;

  /// Create a copy of CustomerOrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_CustomerOrderItemModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productCode: null == productCode
          ? _self.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productImage: freezed == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
