// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KitchenOrder {
  String get id;
  String get orderNumber;
  String get customerId;
  String get customerName;
  KitchenOrderStatus get status;
  OrderPriority get priority;
  List<KitchenOrderItem> get items;
  DateTime get orderTime;
  DateTime? get startTime;
  DateTime? get readyTime;
  DateTime? get completedTime;
  String? get assignedStation;
  String? get assignedStaff;
  String? get notes;
  String? get specialInstructions;
  int? get estimatedMinutes;
  bool get isUrgent;
  bool get isDelayed;

  /// Create a copy of KitchenOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KitchenOrderCopyWith<KitchenOrder> get copyWith =>
      _$KitchenOrderCopyWithImpl<KitchenOrder>(
          this as KitchenOrder, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KitchenOrder &&
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
            const DeepCollectionEquality().equals(other.items, items) &&
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
      const DeepCollectionEquality().hash(items),
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

  @override
  String toString() {
    return 'KitchenOrder(id: $id, orderNumber: $orderNumber, customerId: $customerId, customerName: $customerName, status: $status, priority: $priority, items: $items, orderTime: $orderTime, startTime: $startTime, readyTime: $readyTime, completedTime: $completedTime, assignedStation: $assignedStation, assignedStaff: $assignedStaff, notes: $notes, specialInstructions: $specialInstructions, estimatedMinutes: $estimatedMinutes, isUrgent: $isUrgent, isDelayed: $isDelayed)';
  }
}

/// @nodoc
abstract mixin class $KitchenOrderCopyWith<$Res> {
  factory $KitchenOrderCopyWith(
          KitchenOrder value, $Res Function(KitchenOrder) _then) =
      _$KitchenOrderCopyWithImpl;
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
class _$KitchenOrderCopyWithImpl<$Res> implements $KitchenOrderCopyWith<$Res> {
  _$KitchenOrderCopyWithImpl(this._self, this._then);

  final KitchenOrder _self;
  final $Res Function(KitchenOrder) _then;

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
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as KitchenOrderStatus,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as OrderPriority,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<KitchenOrderItem>,
      orderTime: null == orderTime
          ? _self.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readyTime: freezed == readyTime
          ? _self.readyTime
          : readyTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedTime: freezed == completedTime
          ? _self.completedTime
          : completedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedStation: freezed == assignedStation
          ? _self.assignedStation
          : assignedStation // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaff: freezed == assignedStaff
          ? _self.assignedStaff
          : assignedStaff // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      specialInstructions: freezed == specialInstructions
          ? _self.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedMinutes: freezed == estimatedMinutes
          ? _self.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      isUrgent: null == isUrgent
          ? _self.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
      isDelayed: null == isDelayed
          ? _self.isDelayed
          : isDelayed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [KitchenOrder].
extension KitchenOrderPatterns on KitchenOrder {
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
    TResult Function(_KitchenOrder value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenOrder() when $default != null:
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
    TResult Function(_KitchenOrder value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenOrder():
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
    TResult? Function(_KitchenOrder value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenOrder() when $default != null:
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
            bool isDelayed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenOrder() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.customerId,
            _that.customerName,
            _that.status,
            _that.priority,
            _that.items,
            _that.orderTime,
            _that.startTime,
            _that.readyTime,
            _that.completedTime,
            _that.assignedStation,
            _that.assignedStaff,
            _that.notes,
            _that.specialInstructions,
            _that.estimatedMinutes,
            _that.isUrgent,
            _that.isDelayed);
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
            bool isDelayed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenOrder():
        return $default(
            _that.id,
            _that.orderNumber,
            _that.customerId,
            _that.customerName,
            _that.status,
            _that.priority,
            _that.items,
            _that.orderTime,
            _that.startTime,
            _that.readyTime,
            _that.completedTime,
            _that.assignedStation,
            _that.assignedStaff,
            _that.notes,
            _that.specialInstructions,
            _that.estimatedMinutes,
            _that.isUrgent,
            _that.isDelayed);
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
            bool isDelayed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenOrder() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.customerId,
            _that.customerName,
            _that.status,
            _that.priority,
            _that.items,
            _that.orderTime,
            _that.startTime,
            _that.readyTime,
            _that.completedTime,
            _that.assignedStation,
            _that.assignedStaff,
            _that.notes,
            _that.specialInstructions,
            _that.estimatedMinutes,
            _that.isUrgent,
            _that.isDelayed);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _KitchenOrder extends KitchenOrder {
  const _KitchenOrder(
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

  /// Create a copy of KitchenOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KitchenOrderCopyWith<_KitchenOrder> get copyWith =>
      __$KitchenOrderCopyWithImpl<_KitchenOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KitchenOrder &&
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

  @override
  String toString() {
    return 'KitchenOrder(id: $id, orderNumber: $orderNumber, customerId: $customerId, customerName: $customerName, status: $status, priority: $priority, items: $items, orderTime: $orderTime, startTime: $startTime, readyTime: $readyTime, completedTime: $completedTime, assignedStation: $assignedStation, assignedStaff: $assignedStaff, notes: $notes, specialInstructions: $specialInstructions, estimatedMinutes: $estimatedMinutes, isUrgent: $isUrgent, isDelayed: $isDelayed)';
  }
}

/// @nodoc
abstract mixin class _$KitchenOrderCopyWith<$Res>
    implements $KitchenOrderCopyWith<$Res> {
  factory _$KitchenOrderCopyWith(
          _KitchenOrder value, $Res Function(_KitchenOrder) _then) =
      __$KitchenOrderCopyWithImpl;
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
class __$KitchenOrderCopyWithImpl<$Res>
    implements _$KitchenOrderCopyWith<$Res> {
  __$KitchenOrderCopyWithImpl(this._self, this._then);

  final _KitchenOrder _self;
  final $Res Function(_KitchenOrder) _then;

  /// Create a copy of KitchenOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_KitchenOrder(
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
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as KitchenOrderStatus,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as OrderPriority,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<KitchenOrderItem>,
      orderTime: null == orderTime
          ? _self.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readyTime: freezed == readyTime
          ? _self.readyTime
          : readyTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedTime: freezed == completedTime
          ? _self.completedTime
          : completedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedStation: freezed == assignedStation
          ? _self.assignedStation
          : assignedStation // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedStaff: freezed == assignedStaff
          ? _self.assignedStaff
          : assignedStaff // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      specialInstructions: freezed == specialInstructions
          ? _self.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedMinutes: freezed == estimatedMinutes
          ? _self.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      isUrgent: null == isUrgent
          ? _self.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
      isDelayed: null == isDelayed
          ? _self.isDelayed
          : isDelayed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$KitchenOrderItem {
  String get id;
  String get productId;
  String get productName;
  int get quantity;
  String? get unit;
  String? get notes;
  String? get imageUrl;
  bool get isPrepared;
  bool get requiresSpecialPreparation;

  /// Create a copy of KitchenOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KitchenOrderItemCopyWith<KitchenOrderItem> get copyWith =>
      _$KitchenOrderItemCopyWithImpl<KitchenOrderItem>(
          this as KitchenOrderItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KitchenOrderItem &&
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

  @override
  String toString() {
    return 'KitchenOrderItem(id: $id, productId: $productId, productName: $productName, quantity: $quantity, unit: $unit, notes: $notes, imageUrl: $imageUrl, isPrepared: $isPrepared, requiresSpecialPreparation: $requiresSpecialPreparation)';
  }
}

/// @nodoc
abstract mixin class $KitchenOrderItemCopyWith<$Res> {
  factory $KitchenOrderItemCopyWith(
          KitchenOrderItem value, $Res Function(KitchenOrderItem) _then) =
      _$KitchenOrderItemCopyWithImpl;
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
class _$KitchenOrderItemCopyWithImpl<$Res>
    implements $KitchenOrderItemCopyWith<$Res> {
  _$KitchenOrderItemCopyWithImpl(this._self, this._then);

  final KitchenOrderItem _self;
  final $Res Function(KitchenOrderItem) _then;

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
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: freezed == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrepared: null == isPrepared
          ? _self.isPrepared
          : isPrepared // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresSpecialPreparation: null == requiresSpecialPreparation
          ? _self.requiresSpecialPreparation
          : requiresSpecialPreparation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [KitchenOrderItem].
extension KitchenOrderItemPatterns on KitchenOrderItem {
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
    TResult Function(_KitchenOrderItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenOrderItem() when $default != null:
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
    TResult Function(_KitchenOrderItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenOrderItem():
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
    TResult? Function(_KitchenOrderItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenOrderItem() when $default != null:
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
            int quantity,
            String? unit,
            String? notes,
            String? imageUrl,
            bool isPrepared,
            bool requiresSpecialPreparation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenOrderItem() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.quantity,
            _that.unit,
            _that.notes,
            _that.imageUrl,
            _that.isPrepared,
            _that.requiresSpecialPreparation);
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
            int quantity,
            String? unit,
            String? notes,
            String? imageUrl,
            bool isPrepared,
            bool requiresSpecialPreparation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenOrderItem():
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.quantity,
            _that.unit,
            _that.notes,
            _that.imageUrl,
            _that.isPrepared,
            _that.requiresSpecialPreparation);
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
            int quantity,
            String? unit,
            String? notes,
            String? imageUrl,
            bool isPrepared,
            bool requiresSpecialPreparation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenOrderItem() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.quantity,
            _that.unit,
            _that.notes,
            _that.imageUrl,
            _that.isPrepared,
            _that.requiresSpecialPreparation);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _KitchenOrderItem extends KitchenOrderItem {
  const _KitchenOrderItem(
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

  /// Create a copy of KitchenOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KitchenOrderItemCopyWith<_KitchenOrderItem> get copyWith =>
      __$KitchenOrderItemCopyWithImpl<_KitchenOrderItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KitchenOrderItem &&
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

  @override
  String toString() {
    return 'KitchenOrderItem(id: $id, productId: $productId, productName: $productName, quantity: $quantity, unit: $unit, notes: $notes, imageUrl: $imageUrl, isPrepared: $isPrepared, requiresSpecialPreparation: $requiresSpecialPreparation)';
  }
}

/// @nodoc
abstract mixin class _$KitchenOrderItemCopyWith<$Res>
    implements $KitchenOrderItemCopyWith<$Res> {
  factory _$KitchenOrderItemCopyWith(
          _KitchenOrderItem value, $Res Function(_KitchenOrderItem) _then) =
      __$KitchenOrderItemCopyWithImpl;
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
class __$KitchenOrderItemCopyWithImpl<$Res>
    implements _$KitchenOrderItemCopyWith<$Res> {
  __$KitchenOrderItemCopyWithImpl(this._self, this._then);

  final _KitchenOrderItem _self;
  final $Res Function(_KitchenOrderItem) _then;

  /// Create a copy of KitchenOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_KitchenOrderItem(
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
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: freezed == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrepared: null == isPrepared
          ? _self.isPrepared
          : isPrepared // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresSpecialPreparation: null == requiresSpecialPreparation
          ? _self.requiresSpecialPreparation
          : requiresSpecialPreparation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
