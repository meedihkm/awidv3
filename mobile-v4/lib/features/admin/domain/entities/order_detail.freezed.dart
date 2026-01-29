// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItem {
  String get productId;
  String get productName;
  int get quantity;
  double get unitPrice;
  double get totalPrice;
  String? get notes;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderItemCopyWith<OrderItem> get copyWith =>
      _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderItem &&
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

  @override
  String toString() {
    return 'OrderItem(productId: $productId, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) =
      _$OrderItemCopyWithImpl;
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
class _$OrderItemCopyWithImpl<$Res> implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

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
    return _then(_self.copyWith(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
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
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
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
    TResult Function(_OrderItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderItem() when $default != null:
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
    TResult Function(_OrderItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItem():
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
    TResult? Function(_OrderItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItem() when $default != null:
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
    TResult Function(String productId, String productName, int quantity,
            double unitPrice, double totalPrice, String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderItem() when $default != null:
        return $default(_that.productId, _that.productName, _that.quantity,
            _that.unitPrice, _that.totalPrice, _that.notes);
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
    TResult Function(String productId, String productName, int quantity,
            double unitPrice, double totalPrice, String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItem():
        return $default(_that.productId, _that.productName, _that.quantity,
            _that.unitPrice, _that.totalPrice, _that.notes);
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
    TResult? Function(String productId, String productName, int quantity,
            double unitPrice, double totalPrice, String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItem() when $default != null:
        return $default(_that.productId, _that.productName, _that.quantity,
            _that.unitPrice, _that.totalPrice, _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrderItem implements OrderItem {
  const _OrderItem(
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

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderItemCopyWith<_OrderItem> get copyWith =>
      __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderItem &&
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

  @override
  String toString() {
    return 'OrderItem(productId: $productId, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(
          _OrderItem value, $Res Function(_OrderItem) _then) =
      __$OrderItemCopyWithImpl;
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
class __$OrderItemCopyWithImpl<$Res> implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? notes = freezed,
  }) {
    return _then(_OrderItem(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
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
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$OrderDetail {
  String get id;
  String get orderNumber;
  String get status;
  String get customerId;
  String get customerName;
  String get organizationId;
  String get organizationName;
  List<OrderItem> get items;
  double get subtotal;
  double get deliveryFee;
  double get totalAmount;
  DateTime get createdAt;
  String? get delivererId;
  String? get delivererName;
  String? get deliveryAddress;
  String? get deliveryInstructions;
  String? get paymentMethod;
  String? get paymentStatus;
  DateTime? get scheduledFor;
  DateTime? get deliveredAt;
  DateTime? get updatedAt;

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderDetailCopyWith<OrderDetail> get copyWith =>
      _$OrderDetailCopyWithImpl<OrderDetail>(this as OrderDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderDetail &&
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
            const DeepCollectionEquality().equals(other.items, items) &&
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
        const DeepCollectionEquality().hash(items),
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

  @override
  String toString() {
    return 'OrderDetail(id: $id, orderNumber: $orderNumber, status: $status, customerId: $customerId, customerName: $customerName, organizationId: $organizationId, organizationName: $organizationName, items: $items, subtotal: $subtotal, deliveryFee: $deliveryFee, totalAmount: $totalAmount, createdAt: $createdAt, delivererId: $delivererId, delivererName: $delivererName, deliveryAddress: $deliveryAddress, deliveryInstructions: $deliveryInstructions, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, scheduledFor: $scheduledFor, deliveredAt: $deliveredAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $OrderDetailCopyWith<$Res> {
  factory $OrderDetailCopyWith(
          OrderDetail value, $Res Function(OrderDetail) _then) =
      _$OrderDetailCopyWithImpl;
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
class _$OrderDetailCopyWithImpl<$Res> implements $OrderDetailCopyWith<$Res> {
  _$OrderDetailCopyWithImpl(this._self, this._then);

  final OrderDetail _self;
  final $Res Function(OrderDetail) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _self.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _self.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _self.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      deliveryInstructions: freezed == deliveryInstructions
          ? _self.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledFor: freezed == scheduledFor
          ? _self.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderDetail].
extension OrderDetailPatterns on OrderDetail {
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
    TResult Function(_OrderDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderDetail() when $default != null:
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
    TResult Function(_OrderDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderDetail():
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
    TResult? Function(_OrderDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderDetail() when $default != null:
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
            DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderDetail() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.status,
            _that.customerId,
            _that.customerName,
            _that.organizationId,
            _that.organizationName,
            _that.items,
            _that.subtotal,
            _that.deliveryFee,
            _that.totalAmount,
            _that.createdAt,
            _that.delivererId,
            _that.delivererName,
            _that.deliveryAddress,
            _that.deliveryInstructions,
            _that.paymentMethod,
            _that.paymentStatus,
            _that.scheduledFor,
            _that.deliveredAt,
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
            DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderDetail():
        return $default(
            _that.id,
            _that.orderNumber,
            _that.status,
            _that.customerId,
            _that.customerName,
            _that.organizationId,
            _that.organizationName,
            _that.items,
            _that.subtotal,
            _that.deliveryFee,
            _that.totalAmount,
            _that.createdAt,
            _that.delivererId,
            _that.delivererName,
            _that.deliveryAddress,
            _that.deliveryInstructions,
            _that.paymentMethod,
            _that.paymentStatus,
            _that.scheduledFor,
            _that.deliveredAt,
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
            DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderDetail() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.status,
            _that.customerId,
            _that.customerName,
            _that.organizationId,
            _that.organizationName,
            _that.items,
            _that.subtotal,
            _that.deliveryFee,
            _that.totalAmount,
            _that.createdAt,
            _that.delivererId,
            _that.delivererName,
            _that.deliveryAddress,
            _that.deliveryInstructions,
            _that.paymentMethod,
            _that.paymentStatus,
            _that.scheduledFor,
            _that.deliveredAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrderDetail extends OrderDetail {
  const _OrderDetail(
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

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderDetailCopyWith<_OrderDetail> get copyWith =>
      __$OrderDetailCopyWithImpl<_OrderDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderDetail &&
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

  @override
  String toString() {
    return 'OrderDetail(id: $id, orderNumber: $orderNumber, status: $status, customerId: $customerId, customerName: $customerName, organizationId: $organizationId, organizationName: $organizationName, items: $items, subtotal: $subtotal, deliveryFee: $deliveryFee, totalAmount: $totalAmount, createdAt: $createdAt, delivererId: $delivererId, delivererName: $delivererName, deliveryAddress: $deliveryAddress, deliveryInstructions: $deliveryInstructions, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, scheduledFor: $scheduledFor, deliveredAt: $deliveredAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$OrderDetailCopyWith<$Res>
    implements $OrderDetailCopyWith<$Res> {
  factory _$OrderDetailCopyWith(
          _OrderDetail value, $Res Function(_OrderDetail) _then) =
      __$OrderDetailCopyWithImpl;
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
class __$OrderDetailCopyWithImpl<$Res> implements _$OrderDetailCopyWith<$Res> {
  __$OrderDetailCopyWithImpl(this._self, this._then);

  final _OrderDetail _self;
  final $Res Function(_OrderDetail) _then;

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_OrderDetail(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _self.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _self.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _self.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      deliveryInstructions: freezed == deliveryInstructions
          ? _self.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledFor: freezed == scheduledFor
          ? _self.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
