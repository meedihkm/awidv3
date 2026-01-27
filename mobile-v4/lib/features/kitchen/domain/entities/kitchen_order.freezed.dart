// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KitchenOrder {
  String get id => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  KitchenOrderStatus get status => throw _privateConstructorUsedError;
  OrderPriority get priority => throw _privateConstructorUsedError;
  List<KitchenOrderItem> get items => throw _privateConstructorUsedError;
  DateTime get orderTime => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get readyTime => throw _privateConstructorUsedError;
  DateTime? get completedTime => throw _privateConstructorUsedError;
  String? get assignedStation => throw _privateConstructorUsedError;
  String? get assignedStaff => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get specialInstructions => throw _privateConstructorUsedError;
  int? get estimatedMinutes => throw _privateConstructorUsedError;
  bool get isUrgent => throw _privateConstructorUsedError;
  bool get isDelayed => throw _privateConstructorUsedError;

  /// Create a copy of KitchenOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KitchenOrderCopyWith<KitchenOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitchenOrderCopyWith<$Res> {
  factory $KitchenOrderCopyWith(
          KitchenOrder value, $Res Function(KitchenOrder) then) =
      _$KitchenOrderCopyWithImpl<$Res, KitchenOrder>;
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String customerId,
      String customerName,
      KitchenOrderStatus status,
      OrderPriority priority,
      List<KitchenOrderItem> items,
      DateTime orderTime,
      DateTime? startTime,
      DateTime? readyTime,
      DateTime? completedTime,
      String? assignedStation,
      String? assignedStaff,
      String? notes,
      String? specialInstructions,
      int? estimatedMinutes,
      bool isUrgent,
      bool isDelayed});
}

/// @nodoc
class _$KitchenOrderCopyWithImpl<$Res, $Val extends KitchenOrder>
    implements $KitchenOrderCopyWith<$Res> {
  _$KitchenOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KitchenOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? status = null,
    Object? priority = null,
    Object? items = null,
    Object? orderTime = null,
    Object? startTime = freezed,
    Object? readyTime = freezed,
    Object? completedTime = freezed,
    Object? assignedStation = freezed,
    Object? assignedStaff = freezed,
    Object? notes = freezed,
    Object? specialInstructions = freezed,
    Object? estimatedMinutes = freezed,
    Object? isUrgent = null,
    Object? isDelayed = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as KitchenOrderStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as OrderPriority,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<KitchenOrderItem>,
      orderTime: null == orderTime
          ? _value.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readyTime: freezed == readyTime
          ? _value.readyTime
          : readyTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedTime: freezed == completedTime
          ? _value.completedTime
          : completedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedStation: freezed == assignedStation
          ? _value.assignedStation
          : assignedStation // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaff: freezed == assignedStaff
          ? _value.assignedStaff
          : assignedStaff // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedMinutes: freezed == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      isUrgent: null == isUrgent
          ? _value.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
      isDelayed: null == isDelayed
          ? _value.isDelayed
          : isDelayed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitchenOrderImplCopyWith<$Res>
    implements $KitchenOrderCopyWith<$Res> {
  factory _$$KitchenOrderImplCopyWith(
          _$KitchenOrderImpl value, $Res Function(_$KitchenOrderImpl) then) =
      __$$KitchenOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String customerId,
      String customerName,
      KitchenOrderStatus status,
      OrderPriority priority,
      List<KitchenOrderItem> items,
      DateTime orderTime,
      DateTime? startTime,
      DateTime? readyTime,
      DateTime? completedTime,
      String? assignedStation,
      String? assignedStaff,
      String? notes,
      String? specialInstructions,
      int? estimatedMinutes,
      bool isUrgent,
      bool isDelayed});
}

/// @nodoc
class __$$KitchenOrderImplCopyWithImpl<$Res>
    extends _$KitchenOrderCopyWithImpl<$Res, _$KitchenOrderImpl>
    implements _$$KitchenOrderImplCopyWith<$Res> {
  __$$KitchenOrderImplCopyWithImpl(
      _$KitchenOrderImpl _value, $Res Function(_$KitchenOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of KitchenOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? status = null,
    Object? priority = null,
    Object? items = null,
    Object? orderTime = null,
    Object? startTime = freezed,
    Object? readyTime = freezed,
    Object? completedTime = freezed,
    Object? assignedStation = freezed,
    Object? assignedStaff = freezed,
    Object? notes = freezed,
    Object? specialInstructions = freezed,
    Object? estimatedMinutes = freezed,
    Object? isUrgent = null,
    Object? isDelayed = null,
  }) {
    return _then(_$KitchenOrderImpl(
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as KitchenOrderStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as OrderPriority,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<KitchenOrderItem>,
      orderTime: null == orderTime
          ? _value.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readyTime: freezed == readyTime
          ? _value.readyTime
          : readyTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedTime: freezed == completedTime
          ? _value.completedTime
          : completedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedStation: freezed == assignedStation
          ? _value.assignedStation
          : assignedStation // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaff: freezed == assignedStaff
          ? _value.assignedStaff
          : assignedStaff // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedMinutes: freezed == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      isUrgent: null == isUrgent
          ? _value.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
      isDelayed: null == isDelayed
          ? _value.isDelayed
          : isDelayed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$KitchenOrderImpl extends _KitchenOrder {
  const _$KitchenOrderImpl(
      {required this.id,
      required this.orderNumber,
      required this.customerId,
      required this.customerName,
      required this.status,
      required this.priority,
      required final List<KitchenOrderItem> items,
      required this.orderTime,
      this.startTime,
      this.readyTime,
      this.completedTime,
      this.assignedStation,
      this.assignedStaff,
      this.notes,
      this.specialInstructions,
      this.estimatedMinutes,
      this.isUrgent = false,
      this.isDelayed = false})
      : _items = items,
        super._();

  @override
  final String id;
  @override
  final String orderNumber;
  @override
  final String customerId;
  @override
  final String customerName;
  @override
  final KitchenOrderStatus status;
  @override
  final OrderPriority priority;
  final List<KitchenOrderItem> _items;
  @override
  List<KitchenOrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime orderTime;
  @override
  final DateTime? startTime;
  @override
  final DateTime? readyTime;
  @override
  final DateTime? completedTime;
  @override
  final String? assignedStation;
  @override
  final String? assignedStaff;
  @override
  final String? notes;
  @override
  final String? specialInstructions;
  @override
  final int? estimatedMinutes;
  @override
  @JsonKey()
  final bool isUrgent;
  @override
  @JsonKey()
  final bool isDelayed;

  @override
  String toString() {
    return 'KitchenOrder(id: $id, orderNumber: $orderNumber, customerId: $customerId, customerName: $customerName, status: $status, priority: $priority, items: $items, orderTime: $orderTime, startTime: $startTime, readyTime: $readyTime, completedTime: $completedTime, assignedStation: $assignedStation, assignedStaff: $assignedStaff, notes: $notes, specialInstructions: $specialInstructions, estimatedMinutes: $estimatedMinutes, isUrgent: $isUrgent, isDelayed: $isDelayed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KitchenOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.orderTime, orderTime) ||
                other.orderTime == orderTime) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.readyTime, readyTime) ||
                other.readyTime == readyTime) &&
            (identical(other.completedTime, completedTime) ||
                other.completedTime == completedTime) &&
            (identical(other.assignedStation, assignedStation) ||
                other.assignedStation == assignedStation) &&
            (identical(other.assignedStaff, assignedStaff) ||
                other.assignedStaff == assignedStaff) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.estimatedMinutes, estimatedMinutes) ||
                other.estimatedMinutes == estimatedMinutes) &&
            (identical(other.isUrgent, isUrgent) ||
                other.isUrgent == isUrgent) &&
            (identical(other.isDelayed, isDelayed) ||
                other.isDelayed == isDelayed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderNumber,
      customerId,
      customerName,
      status,
      priority,
      const DeepCollectionEquality().hash(_items),
      orderTime,
      startTime,
      readyTime,
      completedTime,
      assignedStation,
      assignedStaff,
      notes,
      specialInstructions,
      estimatedMinutes,
      isUrgent,
      isDelayed);

  /// Create a copy of KitchenOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KitchenOrderImplCopyWith<_$KitchenOrderImpl> get copyWith =>
      __$$KitchenOrderImplCopyWithImpl<_$KitchenOrderImpl>(this, _$identity);
}

abstract class _KitchenOrder extends KitchenOrder {
  const factory _KitchenOrder(
      {required final String id,
      required final String orderNumber,
      required final String customerId,
      required final String customerName,
      required final KitchenOrderStatus status,
      required final OrderPriority priority,
      required final List<KitchenOrderItem> items,
      required final DateTime orderTime,
      final DateTime? startTime,
      final DateTime? readyTime,
      final DateTime? completedTime,
      final String? assignedStation,
      final String? assignedStaff,
      final String? notes,
      final String? specialInstructions,
      final int? estimatedMinutes,
      final bool isUrgent,
      final bool isDelayed}) = _$KitchenOrderImpl;
  const _KitchenOrder._() : super._();

  @override
  String get id;
  @override
  String get orderNumber;
  @override
  String get customerId;
  @override
  String get customerName;
  @override
  KitchenOrderStatus get status;
  @override
  OrderPriority get priority;
  @override
  List<KitchenOrderItem> get items;
  @override
  DateTime get orderTime;
  @override
  DateTime? get startTime;
  @override
  DateTime? get readyTime;
  @override
  DateTime? get completedTime;
  @override
  String? get assignedStation;
  @override
  String? get assignedStaff;
  @override
  String? get notes;
  @override
  String? get specialInstructions;
  @override
  int? get estimatedMinutes;
  @override
  bool get isUrgent;
  @override
  bool get isDelayed;

  /// Create a copy of KitchenOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KitchenOrderImplCopyWith<_$KitchenOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$KitchenOrderItem {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get isPrepared => throw _privateConstructorUsedError;
  bool get requiresSpecialPreparation => throw _privateConstructorUsedError;

  /// Create a copy of KitchenOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KitchenOrderItemCopyWith<KitchenOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitchenOrderItemCopyWith<$Res> {
  factory $KitchenOrderItemCopyWith(
          KitchenOrderItem value, $Res Function(KitchenOrderItem) then) =
      _$KitchenOrderItemCopyWithImpl<$Res, KitchenOrderItem>;
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      int quantity,
      String? unit,
      String? notes,
      String? imageUrl,
      bool isPrepared,
      bool requiresSpecialPreparation});
}

/// @nodoc
class _$KitchenOrderItemCopyWithImpl<$Res, $Val extends KitchenOrderItem>
    implements $KitchenOrderItemCopyWith<$Res> {
  _$KitchenOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KitchenOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unit = freezed,
    Object? notes = freezed,
    Object? imageUrl = freezed,
    Object? isPrepared = null,
    Object? requiresSpecialPreparation = null,
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrepared: null == isPrepared
          ? _value.isPrepared
          : isPrepared // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresSpecialPreparation: null == requiresSpecialPreparation
          ? _value.requiresSpecialPreparation
          : requiresSpecialPreparation // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitchenOrderItemImplCopyWith<$Res>
    implements $KitchenOrderItemCopyWith<$Res> {
  factory _$$KitchenOrderItemImplCopyWith(_$KitchenOrderItemImpl value,
          $Res Function(_$KitchenOrderItemImpl) then) =
      __$$KitchenOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      int quantity,
      String? unit,
      String? notes,
      String? imageUrl,
      bool isPrepared,
      bool requiresSpecialPreparation});
}

/// @nodoc
class __$$KitchenOrderItemImplCopyWithImpl<$Res>
    extends _$KitchenOrderItemCopyWithImpl<$Res, _$KitchenOrderItemImpl>
    implements _$$KitchenOrderItemImplCopyWith<$Res> {
  __$$KitchenOrderItemImplCopyWithImpl(_$KitchenOrderItemImpl _value,
      $Res Function(_$KitchenOrderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of KitchenOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unit = freezed,
    Object? notes = freezed,
    Object? imageUrl = freezed,
    Object? isPrepared = null,
    Object? requiresSpecialPreparation = null,
  }) {
    return _then(_$KitchenOrderItemImpl(
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrepared: null == isPrepared
          ? _value.isPrepared
          : isPrepared // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresSpecialPreparation: null == requiresSpecialPreparation
          ? _value.requiresSpecialPreparation
          : requiresSpecialPreparation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$KitchenOrderItemImpl extends _KitchenOrderItem {
  const _$KitchenOrderItemImpl(
      {required this.id,
      required this.productId,
      required this.productName,
      required this.quantity,
      this.unit,
      this.notes,
      this.imageUrl,
      this.isPrepared = false,
      this.requiresSpecialPreparation = false})
      : super._();

  @override
  final String id;
  @override
  final String productId;
  @override
  final String productName;
  @override
  final int quantity;
  @override
  final String? unit;
  @override
  final String? notes;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final bool isPrepared;
  @override
  @JsonKey()
  final bool requiresSpecialPreparation;

  @override
  String toString() {
    return 'KitchenOrderItem(id: $id, productId: $productId, productName: $productName, quantity: $quantity, unit: $unit, notes: $notes, imageUrl: $imageUrl, isPrepared: $isPrepared, requiresSpecialPreparation: $requiresSpecialPreparation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KitchenOrderItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isPrepared, isPrepared) ||
                other.isPrepared == isPrepared) &&
            (identical(other.requiresSpecialPreparation,
                    requiresSpecialPreparation) ||
                other.requiresSpecialPreparation ==
                    requiresSpecialPreparation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, productId, productName,
      quantity, unit, notes, imageUrl, isPrepared, requiresSpecialPreparation);

  /// Create a copy of KitchenOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KitchenOrderItemImplCopyWith<_$KitchenOrderItemImpl> get copyWith =>
      __$$KitchenOrderItemImplCopyWithImpl<_$KitchenOrderItemImpl>(
          this, _$identity);
}

abstract class _KitchenOrderItem extends KitchenOrderItem {
  const factory _KitchenOrderItem(
      {required final String id,
      required final String productId,
      required final String productName,
      required final int quantity,
      final String? unit,
      final String? notes,
      final String? imageUrl,
      final bool isPrepared,
      final bool requiresSpecialPreparation}) = _$KitchenOrderItemImpl;
  const _KitchenOrderItem._() : super._();

  @override
  String get id;
  @override
  String get productId;
  @override
  String get productName;
  @override
  int get quantity;
  @override
  String? get unit;
  @override
  String? get notes;
  @override
  String? get imageUrl;
  @override
  bool get isPrepared;
  @override
  bool get requiresSpecialPreparation;

  /// Create a copy of KitchenOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KitchenOrderItemImplCopyWith<_$KitchenOrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
