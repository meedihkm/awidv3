// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KitchenOrderModel {
  String get id;
  String get orderNumber;
  String get customerId;
  String get customerName;
  String get status;
  String get priority;
  List<KitchenOrderItemModel> get items;
  String get orderTime;
  String? get startTime;
  String? get readyTime;
  String? get completedTime;
  String? get assignedStation;
  String? get assignedStaff;
  String? get notes;
  String? get specialInstructions;
  int? get estimatedMinutes;
  bool get isUrgent;
  bool get isDelayed;

  /// Create a copy of KitchenOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KitchenOrderModelCopyWith<KitchenOrderModel> get copyWith =>
      _$KitchenOrderModelCopyWithImpl<KitchenOrderModel>(
          this as KitchenOrderModel, _$identity);

  /// Serializes this KitchenOrderModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KitchenOrderModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'KitchenOrderModel(id: $id, orderNumber: $orderNumber, customerId: $customerId, customerName: $customerName, status: $status, priority: $priority, items: $items, orderTime: $orderTime, startTime: $startTime, readyTime: $readyTime, completedTime: $completedTime, assignedStation: $assignedStation, assignedStaff: $assignedStaff, notes: $notes, specialInstructions: $specialInstructions, estimatedMinutes: $estimatedMinutes, isUrgent: $isUrgent, isDelayed: $isDelayed)';
  }
}

/// @nodoc
abstract mixin class $KitchenOrderModelCopyWith<$Res> {
  factory $KitchenOrderModelCopyWith(
          KitchenOrderModel value, $Res Function(KitchenOrderModel) _then) =
      _$KitchenOrderModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String customerId,
      String customerName,
      String status,
      String priority,
      List<KitchenOrderItemModel> items,
      String orderTime,
      String? startTime,
      String? readyTime,
      String? completedTime,
      String? assignedStation,
      String? assignedStaff,
      String? notes,
      String? specialInstructions,
      int? estimatedMinutes,
      bool isUrgent,
      bool isDelayed});
}

/// @nodoc
class _$KitchenOrderModelCopyWithImpl<$Res>
    implements $KitchenOrderModelCopyWith<$Res> {
  _$KitchenOrderModelCopyWithImpl(this._self, this._then);

  final KitchenOrderModel _self;
  final $Res Function(KitchenOrderModel) _then;

  /// Create a copy of KitchenOrderModel
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
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<KitchenOrderItemModel>,
      orderTime: null == orderTime
          ? _self.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      readyTime: freezed == readyTime
          ? _self.readyTime
          : readyTime // ignore: cast_nullable_to_non_nullable
              as String?,
      completedTime: freezed == completedTime
          ? _self.completedTime
          : completedTime // ignore: cast_nullable_to_non_nullable
              as String?,
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

/// Adds pattern-matching-related methods to [KitchenOrderModel].
extension KitchenOrderModelPatterns on KitchenOrderModel {
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
    TResult Function(_KitchenOrderModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenOrderModel() when $default != null:
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
    TResult Function(_KitchenOrderModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenOrderModel():
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
    TResult? Function(_KitchenOrderModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenOrderModel() when $default != null:
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
            String status,
            String priority,
            List<KitchenOrderItemModel> items,
            String orderTime,
            String? startTime,
            String? readyTime,
            String? completedTime,
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
      case _KitchenOrderModel() when $default != null:
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
            String status,
            String priority,
            List<KitchenOrderItemModel> items,
            String orderTime,
            String? startTime,
            String? readyTime,
            String? completedTime,
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
      case _KitchenOrderModel():
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
            String status,
            String priority,
            List<KitchenOrderItemModel> items,
            String orderTime,
            String? startTime,
            String? readyTime,
            String? completedTime,
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
      case _KitchenOrderModel() when $default != null:
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
@JsonSerializable()
class _KitchenOrderModel extends KitchenOrderModel {
  const _KitchenOrderModel(
      {required this.id,
      required this.orderNumber,
      required this.customerId,
      required this.customerName,
      required this.status,
      required this.priority,
      required final List<KitchenOrderItemModel> items,
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
  factory _KitchenOrderModel.fromJson(Map<String, dynamic> json) =>
      _$KitchenOrderModelFromJson(json);

  @override
  final String id;
  @override
  final String orderNumber;
  @override
  final String customerId;
  @override
  final String customerName;
  @override
  final String status;
  @override
  final String priority;
  final List<KitchenOrderItemModel> _items;
  @override
  List<KitchenOrderItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String orderTime;
  @override
  final String? startTime;
  @override
  final String? readyTime;
  @override
  final String? completedTime;
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

  /// Create a copy of KitchenOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KitchenOrderModelCopyWith<_KitchenOrderModel> get copyWith =>
      __$KitchenOrderModelCopyWithImpl<_KitchenOrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KitchenOrderModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KitchenOrderModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'KitchenOrderModel(id: $id, orderNumber: $orderNumber, customerId: $customerId, customerName: $customerName, status: $status, priority: $priority, items: $items, orderTime: $orderTime, startTime: $startTime, readyTime: $readyTime, completedTime: $completedTime, assignedStation: $assignedStation, assignedStaff: $assignedStaff, notes: $notes, specialInstructions: $specialInstructions, estimatedMinutes: $estimatedMinutes, isUrgent: $isUrgent, isDelayed: $isDelayed)';
  }
}

/// @nodoc
abstract mixin class _$KitchenOrderModelCopyWith<$Res>
    implements $KitchenOrderModelCopyWith<$Res> {
  factory _$KitchenOrderModelCopyWith(
          _KitchenOrderModel value, $Res Function(_KitchenOrderModel) _then) =
      __$KitchenOrderModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String customerId,
      String customerName,
      String status,
      String priority,
      List<KitchenOrderItemModel> items,
      String orderTime,
      String? startTime,
      String? readyTime,
      String? completedTime,
      String? assignedStation,
      String? assignedStaff,
      String? notes,
      String? specialInstructions,
      int? estimatedMinutes,
      bool isUrgent,
      bool isDelayed});
}

/// @nodoc
class __$KitchenOrderModelCopyWithImpl<$Res>
    implements _$KitchenOrderModelCopyWith<$Res> {
  __$KitchenOrderModelCopyWithImpl(this._self, this._then);

  final _KitchenOrderModel _self;
  final $Res Function(_KitchenOrderModel) _then;

  /// Create a copy of KitchenOrderModel
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
    return _then(_KitchenOrderModel(
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
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<KitchenOrderItemModel>,
      orderTime: null == orderTime
          ? _self.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      readyTime: freezed == readyTime
          ? _self.readyTime
          : readyTime // ignore: cast_nullable_to_non_nullable
              as String?,
      completedTime: freezed == completedTime
          ? _self.completedTime
          : completedTime // ignore: cast_nullable_to_non_nullable
              as String?,
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
mixin _$KitchenOrderItemModel {
  String get id;
  String get productId;
  String get productName;
  int get quantity;
  String? get unit;
  String? get notes;
  String? get imageUrl;
  bool get isPrepared;
  bool get requiresSpecialPreparation;

  /// Create a copy of KitchenOrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KitchenOrderItemModelCopyWith<KitchenOrderItemModel> get copyWith =>
      _$KitchenOrderItemModelCopyWithImpl<KitchenOrderItemModel>(
          this as KitchenOrderItemModel, _$identity);

  /// Serializes this KitchenOrderItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KitchenOrderItemModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, productName,
      quantity, unit, notes, imageUrl, isPrepared, requiresSpecialPreparation);

  @override
  String toString() {
    return 'KitchenOrderItemModel(id: $id, productId: $productId, productName: $productName, quantity: $quantity, unit: $unit, notes: $notes, imageUrl: $imageUrl, isPrepared: $isPrepared, requiresSpecialPreparation: $requiresSpecialPreparation)';
  }
}

/// @nodoc
abstract mixin class $KitchenOrderItemModelCopyWith<$Res> {
  factory $KitchenOrderItemModelCopyWith(KitchenOrderItemModel value,
          $Res Function(KitchenOrderItemModel) _then) =
      _$KitchenOrderItemModelCopyWithImpl;
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
class _$KitchenOrderItemModelCopyWithImpl<$Res>
    implements $KitchenOrderItemModelCopyWith<$Res> {
  _$KitchenOrderItemModelCopyWithImpl(this._self, this._then);

  final KitchenOrderItemModel _self;
  final $Res Function(KitchenOrderItemModel) _then;

  /// Create a copy of KitchenOrderItemModel
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

/// Adds pattern-matching-related methods to [KitchenOrderItemModel].
extension KitchenOrderItemModelPatterns on KitchenOrderItemModel {
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
    TResult Function(_KitchenOrderItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KitchenOrderItemModel() when $default != null:
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
    TResult Function(_KitchenOrderItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenOrderItemModel():
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
    TResult? Function(_KitchenOrderItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KitchenOrderItemModel() when $default != null:
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
      case _KitchenOrderItemModel() when $default != null:
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
      case _KitchenOrderItemModel():
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
      case _KitchenOrderItemModel() when $default != null:
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
@JsonSerializable()
class _KitchenOrderItemModel extends KitchenOrderItemModel {
  const _KitchenOrderItemModel(
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
  factory _KitchenOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$KitchenOrderItemModelFromJson(json);

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

  /// Create a copy of KitchenOrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KitchenOrderItemModelCopyWith<_KitchenOrderItemModel> get copyWith =>
      __$KitchenOrderItemModelCopyWithImpl<_KitchenOrderItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KitchenOrderItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KitchenOrderItemModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, productName,
      quantity, unit, notes, imageUrl, isPrepared, requiresSpecialPreparation);

  @override
  String toString() {
    return 'KitchenOrderItemModel(id: $id, productId: $productId, productName: $productName, quantity: $quantity, unit: $unit, notes: $notes, imageUrl: $imageUrl, isPrepared: $isPrepared, requiresSpecialPreparation: $requiresSpecialPreparation)';
  }
}

/// @nodoc
abstract mixin class _$KitchenOrderItemModelCopyWith<$Res>
    implements $KitchenOrderItemModelCopyWith<$Res> {
  factory _$KitchenOrderItemModelCopyWith(_KitchenOrderItemModel value,
          $Res Function(_KitchenOrderItemModel) _then) =
      __$KitchenOrderItemModelCopyWithImpl;
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
class __$KitchenOrderItemModelCopyWithImpl<$Res>
    implements _$KitchenOrderItemModelCopyWith<$Res> {
  __$KitchenOrderItemModelCopyWithImpl(this._self, this._then);

  final _KitchenOrderItemModel _self;
  final $Res Function(_KitchenOrderItemModel) _then;

  /// Create a copy of KitchenOrderItemModel
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
    return _then(_KitchenOrderItemModel(
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
