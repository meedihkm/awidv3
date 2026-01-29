// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemModel {
  @JsonKey(name: 'product_id')
  String get productId;
  @JsonKey(name: 'product_name')
  String get productName;
  int get quantity;
  @JsonKey(name: 'unit_price')
  double get unitPrice;
  @JsonKey(name: 'total_price')
  double get totalPrice;
  String? get notes;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      _$OrderItemModelCopyWithImpl<OrderItemModel>(
          this as OrderItemModel, _$identity);

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderItemModel &&
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

  @override
  String toString() {
    return 'OrderItemModel(productId: $productId, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
          OrderItemModel value, $Res Function(OrderItemModel) _then) =
      _$OrderItemModelCopyWithImpl;
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
class _$OrderItemModelCopyWithImpl<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._self, this._then);

  final OrderItemModel _self;
  final $Res Function(OrderItemModel) _then;

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

/// Adds pattern-matching-related methods to [OrderItemModel].
extension OrderItemModelPatterns on OrderItemModel {
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
    TResult Function(_OrderItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel() when $default != null:
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
    TResult Function(_OrderItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel():
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
    TResult? Function(_OrderItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel() when $default != null:
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
            @JsonKey(name: 'product_id') String productId,
            @JsonKey(name: 'product_name') String productName,
            int quantity,
            @JsonKey(name: 'unit_price') double unitPrice,
            @JsonKey(name: 'total_price') double totalPrice,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'product_id') String productId,
            @JsonKey(name: 'product_name') String productName,
            int quantity,
            @JsonKey(name: 'unit_price') double unitPrice,
            @JsonKey(name: 'total_price') double totalPrice,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel():
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
    TResult? Function(
            @JsonKey(name: 'product_id') String productId,
            @JsonKey(name: 'product_name') String productName,
            int quantity,
            @JsonKey(name: 'unit_price') double unitPrice,
            @JsonKey(name: 'total_price') double totalPrice,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel() when $default != null:
        return $default(_that.productId, _that.productName, _that.quantity,
            _that.unitPrice, _that.totalPrice, _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrderItemModel extends OrderItemModel {
  const _OrderItemModel(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      required this.quantity,
      @JsonKey(name: 'unit_price') required this.unitPrice,
      @JsonKey(name: 'total_price') required this.totalPrice,
      this.notes})
      : super._();
  factory _OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

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

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderItemModelCopyWith<_OrderItemModel> get copyWith =>
      __$OrderItemModelCopyWithImpl<_OrderItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderItemModel &&
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

  @override
  String toString() {
    return 'OrderItemModel(productId: $productId, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$OrderItemModelCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$OrderItemModelCopyWith(
          _OrderItemModel value, $Res Function(_OrderItemModel) _then) =
      __$OrderItemModelCopyWithImpl;
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
class __$OrderItemModelCopyWithImpl<$Res>
    implements _$OrderItemModelCopyWith<$Res> {
  __$OrderItemModelCopyWithImpl(this._self, this._then);

  final _OrderItemModel _self;
  final $Res Function(_OrderItemModel) _then;

  /// Create a copy of OrderItemModel
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
    return _then(_OrderItemModel(
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
mixin _$OrderDetailModel {
  String get id;
  @JsonKey(name: 'order_number')
  String get orderNumber;
  String get status;
  @JsonKey(name: 'customer_id')
  String get customerId;
  @JsonKey(name: 'customer_name')
  String get customerName;
  @JsonKey(name: 'organization_id')
  String get organizationId;
  @JsonKey(name: 'organization_name')
  String get organizationName;
  List<OrderItemModel> get items;
  double get subtotal;
  @JsonKey(name: 'delivery_fee')
  double get deliveryFee;
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'deliverer_id')
  String? get delivererId;
  @JsonKey(name: 'deliverer_name')
  String? get delivererName;
  @JsonKey(name: 'delivery_address')
  String? get deliveryAddress;
  @JsonKey(name: 'delivery_instructions')
  String? get deliveryInstructions;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @JsonKey(name: 'payment_status')
  String? get paymentStatus;
  @JsonKey(name: 'scheduled_for')
  DateTime? get scheduledFor;
  @JsonKey(name: 'delivered_at')
  DateTime? get deliveredAt;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderDetailModelCopyWith<OrderDetailModel> get copyWith =>
      _$OrderDetailModelCopyWithImpl<OrderDetailModel>(
          this as OrderDetailModel, _$identity);

  /// Serializes this OrderDetailModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderDetailModel &&
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
    return 'OrderDetailModel(id: $id, orderNumber: $orderNumber, status: $status, customerId: $customerId, customerName: $customerName, organizationId: $organizationId, organizationName: $organizationName, items: $items, subtotal: $subtotal, deliveryFee: $deliveryFee, totalAmount: $totalAmount, createdAt: $createdAt, delivererId: $delivererId, delivererName: $delivererName, deliveryAddress: $deliveryAddress, deliveryInstructions: $deliveryInstructions, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, scheduledFor: $scheduledFor, deliveredAt: $deliveredAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $OrderDetailModelCopyWith<$Res> {
  factory $OrderDetailModelCopyWith(
          OrderDetailModel value, $Res Function(OrderDetailModel) _then) =
      _$OrderDetailModelCopyWithImpl;
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
class _$OrderDetailModelCopyWithImpl<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  _$OrderDetailModelCopyWithImpl(this._self, this._then);

  final OrderDetailModel _self;
  final $Res Function(OrderDetailModel) _then;

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
              as List<OrderItemModel>,
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

/// Adds pattern-matching-related methods to [OrderDetailModel].
extension OrderDetailModelPatterns on OrderDetailModel {
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
    TResult Function(_OrderDetailModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderDetailModel() when $default != null:
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
    TResult Function(_OrderDetailModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderDetailModel():
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
    TResult? Function(_OrderDetailModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderDetailModel() when $default != null:
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
            @JsonKey(name: 'delivery_instructions')
            String? deliveryInstructions,
            @JsonKey(name: 'payment_method') String? paymentMethod,
            @JsonKey(name: 'payment_status') String? paymentStatus,
            @JsonKey(name: 'scheduled_for') DateTime? scheduledFor,
            @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderDetailModel() when $default != null:
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
            @JsonKey(name: 'delivery_instructions')
            String? deliveryInstructions,
            @JsonKey(name: 'payment_method') String? paymentMethod,
            @JsonKey(name: 'payment_status') String? paymentStatus,
            @JsonKey(name: 'scheduled_for') DateTime? scheduledFor,
            @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderDetailModel():
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
            @JsonKey(name: 'delivery_instructions')
            String? deliveryInstructions,
            @JsonKey(name: 'payment_method') String? paymentMethod,
            @JsonKey(name: 'payment_status') String? paymentStatus,
            @JsonKey(name: 'scheduled_for') DateTime? scheduledFor,
            @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderDetailModel() when $default != null:
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
@JsonSerializable()
class _OrderDetailModel extends OrderDetailModel {
  const _OrderDetailModel(
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
  factory _OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);

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

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderDetailModelCopyWith<_OrderDetailModel> get copyWith =>
      __$OrderDetailModelCopyWithImpl<_OrderDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderDetailModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderDetailModel &&
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

  @override
  String toString() {
    return 'OrderDetailModel(id: $id, orderNumber: $orderNumber, status: $status, customerId: $customerId, customerName: $customerName, organizationId: $organizationId, organizationName: $organizationName, items: $items, subtotal: $subtotal, deliveryFee: $deliveryFee, totalAmount: $totalAmount, createdAt: $createdAt, delivererId: $delivererId, delivererName: $delivererName, deliveryAddress: $deliveryAddress, deliveryInstructions: $deliveryInstructions, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, scheduledFor: $scheduledFor, deliveredAt: $deliveredAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$OrderDetailModelCopyWith<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  factory _$OrderDetailModelCopyWith(
          _OrderDetailModel value, $Res Function(_OrderDetailModel) _then) =
      __$OrderDetailModelCopyWithImpl;
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
class __$OrderDetailModelCopyWithImpl<$Res>
    implements _$OrderDetailModelCopyWith<$Res> {
  __$OrderDetailModelCopyWithImpl(this._self, this._then);

  final _OrderDetailModel _self;
  final $Res Function(_OrderDetailModel) _then;

  /// Create a copy of OrderDetailModel
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
    return _then(_OrderDetailModel(
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
              as List<OrderItemModel>,
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
