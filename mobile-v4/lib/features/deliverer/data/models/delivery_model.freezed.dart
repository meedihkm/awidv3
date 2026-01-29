// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryModel {
  String get id;
  @JsonKey(name: 'order_id')
  String get orderId;
  @JsonKey(name: 'order_number')
  String get orderNumber;
  String get status;
  @JsonKey(name: 'customer_name')
  String get customerName;
  @JsonKey(name: 'customer_phone')
  String get customerPhone;
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress;
  double get latitude;
  double get longitude;
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @JsonKey(name: 'scheduled_for')
  DateTime get scheduledFor;
  @JsonKey(name: 'delivery_instructions')
  String? get deliveryInstructions;
  @JsonKey(name: 'customer_organization')
  String? get customerOrganization;
  @JsonKey(name: 'items_count')
  int? get itemsCount;
  @JsonKey(name: 'picked_up_at')
  DateTime? get pickedUpAt;
  @JsonKey(name: 'delivered_at')
  DateTime? get deliveredAt;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of DeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeliveryModelCopyWith<DeliveryModel> get copyWith =>
      _$DeliveryModelCopyWithImpl<DeliveryModel>(
          this as DeliveryModel, _$identity);

  /// Serializes this DeliveryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeliveryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.customerOrganization, customerOrganization) ||
                other.customerOrganization == customerOrganization) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            (identical(other.pickedUpAt, pickedUpAt) ||
                other.pickedUpAt == pickedUpAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderId,
      orderNumber,
      status,
      customerName,
      customerPhone,
      deliveryAddress,
      latitude,
      longitude,
      totalAmount,
      scheduledFor,
      deliveryInstructions,
      customerOrganization,
      itemsCount,
      pickedUpAt,
      deliveredAt,
      createdAt);

  @override
  String toString() {
    return 'DeliveryModel(id: $id, orderId: $orderId, orderNumber: $orderNumber, status: $status, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, latitude: $latitude, longitude: $longitude, totalAmount: $totalAmount, scheduledFor: $scheduledFor, deliveryInstructions: $deliveryInstructions, customerOrganization: $customerOrganization, itemsCount: $itemsCount, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $DeliveryModelCopyWith<$Res> {
  factory $DeliveryModelCopyWith(
          DeliveryModel value, $Res Function(DeliveryModel) _then) =
      _$DeliveryModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'order_number') String orderNumber,
      String status,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_phone') String customerPhone,
      @JsonKey(name: 'delivery_address') String deliveryAddress,
      double latitude,
      double longitude,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'scheduled_for') DateTime scheduledFor,
      @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
      @JsonKey(name: 'customer_organization') String? customerOrganization,
      @JsonKey(name: 'items_count') int? itemsCount,
      @JsonKey(name: 'picked_up_at') DateTime? pickedUpAt,
      @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$DeliveryModelCopyWithImpl<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  _$DeliveryModelCopyWithImpl(this._self, this._then);

  final DeliveryModel _self;
  final $Res Function(DeliveryModel) _then;

  /// Create a copy of DeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? deliveryAddress = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? totalAmount = null,
    Object? scheduledFor = null,
    Object? deliveryInstructions = freezed,
    Object? customerOrganization = freezed,
    Object? itemsCount = freezed,
    Object? pickedUpAt = freezed,
    Object? deliveredAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _self.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _self.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scheduledFor: null == scheduledFor
          ? _self.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryInstructions: freezed == deliveryInstructions
          ? _self.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      customerOrganization: freezed == customerOrganization
          ? _self.customerOrganization
          : customerOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsCount: freezed == itemsCount
          ? _self.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pickedUpAt: freezed == pickedUpAt
          ? _self.pickedUpAt
          : pickedUpAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeliveryModel].
extension DeliveryModelPatterns on DeliveryModel {
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
    TResult Function(_DeliveryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryModel() when $default != null:
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
    TResult Function(_DeliveryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryModel():
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
    TResult? Function(_DeliveryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryModel() when $default != null:
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
            @JsonKey(name: 'order_id') String orderId,
            @JsonKey(name: 'order_number') String orderNumber,
            String status,
            @JsonKey(name: 'customer_name') String customerName,
            @JsonKey(name: 'customer_phone') String customerPhone,
            @JsonKey(name: 'delivery_address') String deliveryAddress,
            double latitude,
            double longitude,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'scheduled_for') DateTime scheduledFor,
            @JsonKey(name: 'delivery_instructions')
            String? deliveryInstructions,
            @JsonKey(name: 'customer_organization')
            String? customerOrganization,
            @JsonKey(name: 'items_count') int? itemsCount,
            @JsonKey(name: 'picked_up_at') DateTime? pickedUpAt,
            @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryModel() when $default != null:
        return $default(
            _that.id,
            _that.orderId,
            _that.orderNumber,
            _that.status,
            _that.customerName,
            _that.customerPhone,
            _that.deliveryAddress,
            _that.latitude,
            _that.longitude,
            _that.totalAmount,
            _that.scheduledFor,
            _that.deliveryInstructions,
            _that.customerOrganization,
            _that.itemsCount,
            _that.pickedUpAt,
            _that.deliveredAt,
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
            @JsonKey(name: 'order_id') String orderId,
            @JsonKey(name: 'order_number') String orderNumber,
            String status,
            @JsonKey(name: 'customer_name') String customerName,
            @JsonKey(name: 'customer_phone') String customerPhone,
            @JsonKey(name: 'delivery_address') String deliveryAddress,
            double latitude,
            double longitude,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'scheduled_for') DateTime scheduledFor,
            @JsonKey(name: 'delivery_instructions')
            String? deliveryInstructions,
            @JsonKey(name: 'customer_organization')
            String? customerOrganization,
            @JsonKey(name: 'items_count') int? itemsCount,
            @JsonKey(name: 'picked_up_at') DateTime? pickedUpAt,
            @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
            @JsonKey(name: 'created_at') DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryModel():
        return $default(
            _that.id,
            _that.orderId,
            _that.orderNumber,
            _that.status,
            _that.customerName,
            _that.customerPhone,
            _that.deliveryAddress,
            _that.latitude,
            _that.longitude,
            _that.totalAmount,
            _that.scheduledFor,
            _that.deliveryInstructions,
            _that.customerOrganization,
            _that.itemsCount,
            _that.pickedUpAt,
            _that.deliveredAt,
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
            @JsonKey(name: 'order_id') String orderId,
            @JsonKey(name: 'order_number') String orderNumber,
            String status,
            @JsonKey(name: 'customer_name') String customerName,
            @JsonKey(name: 'customer_phone') String customerPhone,
            @JsonKey(name: 'delivery_address') String deliveryAddress,
            double latitude,
            double longitude,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'scheduled_for') DateTime scheduledFor,
            @JsonKey(name: 'delivery_instructions')
            String? deliveryInstructions,
            @JsonKey(name: 'customer_organization')
            String? customerOrganization,
            @JsonKey(name: 'items_count') int? itemsCount,
            @JsonKey(name: 'picked_up_at') DateTime? pickedUpAt,
            @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryModel() when $default != null:
        return $default(
            _that.id,
            _that.orderId,
            _that.orderNumber,
            _that.status,
            _that.customerName,
            _that.customerPhone,
            _that.deliveryAddress,
            _that.latitude,
            _that.longitude,
            _that.totalAmount,
            _that.scheduledFor,
            _that.deliveryInstructions,
            _that.customerOrganization,
            _that.itemsCount,
            _that.pickedUpAt,
            _that.deliveredAt,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeliveryModel extends DeliveryModel {
  const _DeliveryModel(
      {required this.id,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'order_number') required this.orderNumber,
      required this.status,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'customer_phone') required this.customerPhone,
      @JsonKey(name: 'delivery_address') required this.deliveryAddress,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'total_amount') required this.totalAmount,
      @JsonKey(name: 'scheduled_for') required this.scheduledFor,
      @JsonKey(name: 'delivery_instructions') this.deliveryInstructions,
      @JsonKey(name: 'customer_organization') this.customerOrganization,
      @JsonKey(name: 'items_count') this.itemsCount,
      @JsonKey(name: 'picked_up_at') this.pickedUpAt,
      @JsonKey(name: 'delivered_at') this.deliveredAt,
      @JsonKey(name: 'created_at') this.createdAt})
      : super._();
  factory _DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  final String status;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'customer_phone')
  final String customerPhone;
  @override
  @JsonKey(name: 'delivery_address')
  final String deliveryAddress;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  @JsonKey(name: 'scheduled_for')
  final DateTime scheduledFor;
  @override
  @JsonKey(name: 'delivery_instructions')
  final String? deliveryInstructions;
  @override
  @JsonKey(name: 'customer_organization')
  final String? customerOrganization;
  @override
  @JsonKey(name: 'items_count')
  final int? itemsCount;
  @override
  @JsonKey(name: 'picked_up_at')
  final DateTime? pickedUpAt;
  @override
  @JsonKey(name: 'delivered_at')
  final DateTime? deliveredAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  /// Create a copy of DeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeliveryModelCopyWith<_DeliveryModel> get copyWith =>
      __$DeliveryModelCopyWithImpl<_DeliveryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeliveryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeliveryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.customerOrganization, customerOrganization) ||
                other.customerOrganization == customerOrganization) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            (identical(other.pickedUpAt, pickedUpAt) ||
                other.pickedUpAt == pickedUpAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderId,
      orderNumber,
      status,
      customerName,
      customerPhone,
      deliveryAddress,
      latitude,
      longitude,
      totalAmount,
      scheduledFor,
      deliveryInstructions,
      customerOrganization,
      itemsCount,
      pickedUpAt,
      deliveredAt,
      createdAt);

  @override
  String toString() {
    return 'DeliveryModel(id: $id, orderId: $orderId, orderNumber: $orderNumber, status: $status, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, latitude: $latitude, longitude: $longitude, totalAmount: $totalAmount, scheduledFor: $scheduledFor, deliveryInstructions: $deliveryInstructions, customerOrganization: $customerOrganization, itemsCount: $itemsCount, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$DeliveryModelCopyWith<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  factory _$DeliveryModelCopyWith(
          _DeliveryModel value, $Res Function(_DeliveryModel) _then) =
      __$DeliveryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'order_number') String orderNumber,
      String status,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_phone') String customerPhone,
      @JsonKey(name: 'delivery_address') String deliveryAddress,
      double latitude,
      double longitude,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'scheduled_for') DateTime scheduledFor,
      @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
      @JsonKey(name: 'customer_organization') String? customerOrganization,
      @JsonKey(name: 'items_count') int? itemsCount,
      @JsonKey(name: 'picked_up_at') DateTime? pickedUpAt,
      @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$DeliveryModelCopyWithImpl<$Res>
    implements _$DeliveryModelCopyWith<$Res> {
  __$DeliveryModelCopyWithImpl(this._self, this._then);

  final _DeliveryModel _self;
  final $Res Function(_DeliveryModel) _then;

  /// Create a copy of DeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? deliveryAddress = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? totalAmount = null,
    Object? scheduledFor = null,
    Object? deliveryInstructions = freezed,
    Object? customerOrganization = freezed,
    Object? itemsCount = freezed,
    Object? pickedUpAt = freezed,
    Object? deliveredAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_DeliveryModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _self.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _self.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      scheduledFor: null == scheduledFor
          ? _self.scheduledFor
          : scheduledFor // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryInstructions: freezed == deliveryInstructions
          ? _self.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      customerOrganization: freezed == customerOrganization
          ? _self.customerOrganization
          : customerOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsCount: freezed == itemsCount
          ? _self.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pickedUpAt: freezed == pickedUpAt
          ? _self.pickedUpAt
          : pickedUpAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
