// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StockItem {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  double get currentQuantity => throw _privateConstructorUsedError;
  double get minimumQuantity => throw _privateConstructorUsedError;
  double get maximumQuantity => throw _privateConstructorUsedError;
  StockUnit get unit => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get supplier => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  DateTime? get lastRestockDate => throw _privateConstructorUsedError;
  DateTime? get expirationDate => throw _privateConstructorUsedError;
  double? get unitCost => throw _privateConstructorUsedError;
  String? get barcode => throw _privateConstructorUsedError;
  bool get isPerishable => throw _privateConstructorUsedError;
  bool get requiresRefrigeration => throw _privateConstructorUsedError;

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockItemCopyWith<StockItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockItemCopyWith<$Res> {
  factory $StockItemCopyWith(StockItem value, $Res Function(StockItem) then) =
      _$StockItemCopyWithImpl<$Res, StockItem>;
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      double currentQuantity,
      double minimumQuantity,
      double maximumQuantity,
      StockUnit unit,
      String? category,
      String? supplier,
      String? location,
      String? imageUrl,
      DateTime? lastRestockDate,
      DateTime? expirationDate,
      double? unitCost,
      String? barcode,
      bool isPerishable,
      bool requiresRefrigeration});
}

/// @nodoc
class _$StockItemCopyWithImpl<$Res, $Val extends StockItem>
    implements $StockItemCopyWith<$Res> {
  _$StockItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? currentQuantity = null,
    Object? minimumQuantity = null,
    Object? maximumQuantity = null,
    Object? unit = null,
    Object? category = freezed,
    Object? supplier = freezed,
    Object? location = freezed,
    Object? imageUrl = freezed,
    Object? lastRestockDate = freezed,
    Object? expirationDate = freezed,
    Object? unitCost = freezed,
    Object? barcode = freezed,
    Object? isPerishable = null,
    Object? requiresRefrigeration = null,
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
      currentQuantity: null == currentQuantity
          ? _value.currentQuantity
          : currentQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      minimumQuantity: null == minimumQuantity
          ? _value.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      maximumQuantity: null == maximumQuantity
          ? _value.maximumQuantity
          : maximumQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as StockUnit,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastRestockDate: freezed == lastRestockDate
          ? _value.lastRestockDate
          : lastRestockDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unitCost: freezed == unitCost
          ? _value.unitCost
          : unitCost // ignore: cast_nullable_to_non_nullable
              as double?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      isPerishable: null == isPerishable
          ? _value.isPerishable
          : isPerishable // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresRefrigeration: null == requiresRefrigeration
          ? _value.requiresRefrigeration
          : requiresRefrigeration // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockItemImplCopyWith<$Res>
    implements $StockItemCopyWith<$Res> {
  factory _$$StockItemImplCopyWith(
          _$StockItemImpl value, $Res Function(_$StockItemImpl) then) =
      __$$StockItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      double currentQuantity,
      double minimumQuantity,
      double maximumQuantity,
      StockUnit unit,
      String? category,
      String? supplier,
      String? location,
      String? imageUrl,
      DateTime? lastRestockDate,
      DateTime? expirationDate,
      double? unitCost,
      String? barcode,
      bool isPerishable,
      bool requiresRefrigeration});
}

/// @nodoc
class __$$StockItemImplCopyWithImpl<$Res>
    extends _$StockItemCopyWithImpl<$Res, _$StockItemImpl>
    implements _$$StockItemImplCopyWith<$Res> {
  __$$StockItemImplCopyWithImpl(
      _$StockItemImpl _value, $Res Function(_$StockItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? currentQuantity = null,
    Object? minimumQuantity = null,
    Object? maximumQuantity = null,
    Object? unit = null,
    Object? category = freezed,
    Object? supplier = freezed,
    Object? location = freezed,
    Object? imageUrl = freezed,
    Object? lastRestockDate = freezed,
    Object? expirationDate = freezed,
    Object? unitCost = freezed,
    Object? barcode = freezed,
    Object? isPerishable = null,
    Object? requiresRefrigeration = null,
  }) {
    return _then(_$StockItemImpl(
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
      currentQuantity: null == currentQuantity
          ? _value.currentQuantity
          : currentQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      minimumQuantity: null == minimumQuantity
          ? _value.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      maximumQuantity: null == maximumQuantity
          ? _value.maximumQuantity
          : maximumQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as StockUnit,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastRestockDate: freezed == lastRestockDate
          ? _value.lastRestockDate
          : lastRestockDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unitCost: freezed == unitCost
          ? _value.unitCost
          : unitCost // ignore: cast_nullable_to_non_nullable
              as double?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      isPerishable: null == isPerishable
          ? _value.isPerishable
          : isPerishable // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresRefrigeration: null == requiresRefrigeration
          ? _value.requiresRefrigeration
          : requiresRefrigeration // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StockItemImpl extends _StockItem {
  const _$StockItemImpl(
      {required this.id,
      required this.productId,
      required this.productName,
      required this.currentQuantity,
      required this.minimumQuantity,
      required this.maximumQuantity,
      required this.unit,
      this.category,
      this.supplier,
      this.location,
      this.imageUrl,
      this.lastRestockDate,
      this.expirationDate,
      this.unitCost,
      this.barcode,
      this.isPerishable = false,
      this.requiresRefrigeration = false})
      : super._();

  @override
  final String id;
  @override
  final String productId;
  @override
  final String productName;
  @override
  final double currentQuantity;
  @override
  final double minimumQuantity;
  @override
  final double maximumQuantity;
  @override
  final StockUnit unit;
  @override
  final String? category;
  @override
  final String? supplier;
  @override
  final String? location;
  @override
  final String? imageUrl;
  @override
  final DateTime? lastRestockDate;
  @override
  final DateTime? expirationDate;
  @override
  final double? unitCost;
  @override
  final String? barcode;
  @override
  @JsonKey()
  final bool isPerishable;
  @override
  @JsonKey()
  final bool requiresRefrigeration;

  @override
  String toString() {
    return 'StockItem(id: $id, productId: $productId, productName: $productName, currentQuantity: $currentQuantity, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity, unit: $unit, category: $category, supplier: $supplier, location: $location, imageUrl: $imageUrl, lastRestockDate: $lastRestockDate, expirationDate: $expirationDate, unitCost: $unitCost, barcode: $barcode, isPerishable: $isPerishable, requiresRefrigeration: $requiresRefrigeration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.currentQuantity, currentQuantity) ||
                other.currentQuantity == currentQuantity) &&
            (identical(other.minimumQuantity, minimumQuantity) ||
                other.minimumQuantity == minimumQuantity) &&
            (identical(other.maximumQuantity, maximumQuantity) ||
                other.maximumQuantity == maximumQuantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.lastRestockDate, lastRestockDate) ||
                other.lastRestockDate == lastRestockDate) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.unitCost, unitCost) ||
                other.unitCost == unitCost) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.isPerishable, isPerishable) ||
                other.isPerishable == isPerishable) &&
            (identical(other.requiresRefrigeration, requiresRefrigeration) ||
                other.requiresRefrigeration == requiresRefrigeration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      productId,
      productName,
      currentQuantity,
      minimumQuantity,
      maximumQuantity,
      unit,
      category,
      supplier,
      location,
      imageUrl,
      lastRestockDate,
      expirationDate,
      unitCost,
      barcode,
      isPerishable,
      requiresRefrigeration);

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockItemImplCopyWith<_$StockItemImpl> get copyWith =>
      __$$StockItemImplCopyWithImpl<_$StockItemImpl>(this, _$identity);
}

abstract class _StockItem extends StockItem {
  const factory _StockItem(
      {required final String id,
      required final String productId,
      required final String productName,
      required final double currentQuantity,
      required final double minimumQuantity,
      required final double maximumQuantity,
      required final StockUnit unit,
      final String? category,
      final String? supplier,
      final String? location,
      final String? imageUrl,
      final DateTime? lastRestockDate,
      final DateTime? expirationDate,
      final double? unitCost,
      final String? barcode,
      final bool isPerishable,
      final bool requiresRefrigeration}) = _$StockItemImpl;
  const _StockItem._() : super._();

  @override
  String get id;
  @override
  String get productId;
  @override
  String get productName;
  @override
  double get currentQuantity;
  @override
  double get minimumQuantity;
  @override
  double get maximumQuantity;
  @override
  StockUnit get unit;
  @override
  String? get category;
  @override
  String? get supplier;
  @override
  String? get location;
  @override
  String? get imageUrl;
  @override
  DateTime? get lastRestockDate;
  @override
  DateTime? get expirationDate;
  @override
  double? get unitCost;
  @override
  String? get barcode;
  @override
  bool get isPerishable;
  @override
  bool get requiresRefrigeration;

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockItemImplCopyWith<_$StockItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockMovement {
  String get id => throw _privateConstructorUsedError;
  String get stockItemId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  StockMovementType get type => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  StockUnit get unit => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockMovementCopyWith<StockMovement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockMovementCopyWith<$Res> {
  factory $StockMovementCopyWith(
          StockMovement value, $Res Function(StockMovement) then) =
      _$StockMovementCopyWithImpl<$Res, StockMovement>;
  @useResult
  $Res call(
      {String id,
      String stockItemId,
      String productName,
      StockMovementType type,
      double quantity,
      StockUnit unit,
      DateTime timestamp,
      String? orderId,
      String? userId,
      String? userName,
      String? reason,
      String? notes});
}

/// @nodoc
class _$StockMovementCopyWithImpl<$Res, $Val extends StockMovement>
    implements $StockMovementCopyWith<$Res> {
  _$StockMovementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stockItemId = null,
    Object? productName = null,
    Object? type = null,
    Object? quantity = null,
    Object? unit = null,
    Object? timestamp = null,
    Object? orderId = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
    Object? reason = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stockItemId: null == stockItemId
          ? _value.stockItemId
          : stockItemId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StockMovementType,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as StockUnit,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockMovementImplCopyWith<$Res>
    implements $StockMovementCopyWith<$Res> {
  factory _$$StockMovementImplCopyWith(
          _$StockMovementImpl value, $Res Function(_$StockMovementImpl) then) =
      __$$StockMovementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String stockItemId,
      String productName,
      StockMovementType type,
      double quantity,
      StockUnit unit,
      DateTime timestamp,
      String? orderId,
      String? userId,
      String? userName,
      String? reason,
      String? notes});
}

/// @nodoc
class __$$StockMovementImplCopyWithImpl<$Res>
    extends _$StockMovementCopyWithImpl<$Res, _$StockMovementImpl>
    implements _$$StockMovementImplCopyWith<$Res> {
  __$$StockMovementImplCopyWithImpl(
      _$StockMovementImpl _value, $Res Function(_$StockMovementImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stockItemId = null,
    Object? productName = null,
    Object? type = null,
    Object? quantity = null,
    Object? unit = null,
    Object? timestamp = null,
    Object? orderId = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
    Object? reason = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$StockMovementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stockItemId: null == stockItemId
          ? _value.stockItemId
          : stockItemId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StockMovementType,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as StockUnit,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StockMovementImpl extends _StockMovement {
  const _$StockMovementImpl(
      {required this.id,
      required this.stockItemId,
      required this.productName,
      required this.type,
      required this.quantity,
      required this.unit,
      required this.timestamp,
      this.orderId,
      this.userId,
      this.userName,
      this.reason,
      this.notes})
      : super._();

  @override
  final String id;
  @override
  final String stockItemId;
  @override
  final String productName;
  @override
  final StockMovementType type;
  @override
  final double quantity;
  @override
  final StockUnit unit;
  @override
  final DateTime timestamp;
  @override
  final String? orderId;
  @override
  final String? userId;
  @override
  final String? userName;
  @override
  final String? reason;
  @override
  final String? notes;

  @override
  String toString() {
    return 'StockMovement(id: $id, stockItemId: $stockItemId, productName: $productName, type: $type, quantity: $quantity, unit: $unit, timestamp: $timestamp, orderId: $orderId, userId: $userId, userName: $userName, reason: $reason, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockMovementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stockItemId, stockItemId) ||
                other.stockItemId == stockItemId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      stockItemId,
      productName,
      type,
      quantity,
      unit,
      timestamp,
      orderId,
      userId,
      userName,
      reason,
      notes);

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockMovementImplCopyWith<_$StockMovementImpl> get copyWith =>
      __$$StockMovementImplCopyWithImpl<_$StockMovementImpl>(this, _$identity);
}

abstract class _StockMovement extends StockMovement {
  const factory _StockMovement(
      {required final String id,
      required final String stockItemId,
      required final String productName,
      required final StockMovementType type,
      required final double quantity,
      required final StockUnit unit,
      required final DateTime timestamp,
      final String? orderId,
      final String? userId,
      final String? userName,
      final String? reason,
      final String? notes}) = _$StockMovementImpl;
  const _StockMovement._() : super._();

  @override
  String get id;
  @override
  String get stockItemId;
  @override
  String get productName;
  @override
  StockMovementType get type;
  @override
  double get quantity;
  @override
  StockUnit get unit;
  @override
  DateTime get timestamp;
  @override
  String? get orderId;
  @override
  String? get userId;
  @override
  String? get userName;
  @override
  String? get reason;
  @override
  String? get notes;

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockMovementImplCopyWith<_$StockMovementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockAlert {
  String get id => throw _privateConstructorUsedError;
  String get stockItemId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  StockAlertType get type => throw _privateConstructorUsedError;
  StockAlertSeverity get severity => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get isResolved => throw _privateConstructorUsedError;
  DateTime? get resolvedAt => throw _privateConstructorUsedError;

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockAlertCopyWith<StockAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockAlertCopyWith<$Res> {
  factory $StockAlertCopyWith(
          StockAlert value, $Res Function(StockAlert) then) =
      _$StockAlertCopyWithImpl<$Res, StockAlert>;
  @useResult
  $Res call(
      {String id,
      String stockItemId,
      String productName,
      StockAlertType type,
      StockAlertSeverity severity,
      DateTime createdAt,
      String? message,
      bool? isResolved,
      DateTime? resolvedAt});
}

/// @nodoc
class _$StockAlertCopyWithImpl<$Res, $Val extends StockAlert>
    implements $StockAlertCopyWith<$Res> {
  _$StockAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stockItemId = null,
    Object? productName = null,
    Object? type = null,
    Object? severity = null,
    Object? createdAt = null,
    Object? message = freezed,
    Object? isResolved = freezed,
    Object? resolvedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stockItemId: null == stockItemId
          ? _value.stockItemId
          : stockItemId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StockAlertType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as StockAlertSeverity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: freezed == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool?,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockAlertImplCopyWith<$Res>
    implements $StockAlertCopyWith<$Res> {
  factory _$$StockAlertImplCopyWith(
          _$StockAlertImpl value, $Res Function(_$StockAlertImpl) then) =
      __$$StockAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String stockItemId,
      String productName,
      StockAlertType type,
      StockAlertSeverity severity,
      DateTime createdAt,
      String? message,
      bool? isResolved,
      DateTime? resolvedAt});
}

/// @nodoc
class __$$StockAlertImplCopyWithImpl<$Res>
    extends _$StockAlertCopyWithImpl<$Res, _$StockAlertImpl>
    implements _$$StockAlertImplCopyWith<$Res> {
  __$$StockAlertImplCopyWithImpl(
      _$StockAlertImpl _value, $Res Function(_$StockAlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stockItemId = null,
    Object? productName = null,
    Object? type = null,
    Object? severity = null,
    Object? createdAt = null,
    Object? message = freezed,
    Object? isResolved = freezed,
    Object? resolvedAt = freezed,
  }) {
    return _then(_$StockAlertImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stockItemId: null == stockItemId
          ? _value.stockItemId
          : stockItemId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StockAlertType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as StockAlertSeverity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: freezed == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool?,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$StockAlertImpl extends _StockAlert {
  const _$StockAlertImpl(
      {required this.id,
      required this.stockItemId,
      required this.productName,
      required this.type,
      required this.severity,
      required this.createdAt,
      this.message,
      this.isResolved,
      this.resolvedAt})
      : super._();

  @override
  final String id;
  @override
  final String stockItemId;
  @override
  final String productName;
  @override
  final StockAlertType type;
  @override
  final StockAlertSeverity severity;
  @override
  final DateTime createdAt;
  @override
  final String? message;
  @override
  final bool? isResolved;
  @override
  final DateTime? resolvedAt;

  @override
  String toString() {
    return 'StockAlert(id: $id, stockItemId: $stockItemId, productName: $productName, type: $type, severity: $severity, createdAt: $createdAt, message: $message, isResolved: $isResolved, resolvedAt: $resolvedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stockItemId, stockItemId) ||
                other.stockItemId == stockItemId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, stockItemId, productName,
      type, severity, createdAt, message, isResolved, resolvedAt);

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockAlertImplCopyWith<_$StockAlertImpl> get copyWith =>
      __$$StockAlertImplCopyWithImpl<_$StockAlertImpl>(this, _$identity);
}

abstract class _StockAlert extends StockAlert {
  const factory _StockAlert(
      {required final String id,
      required final String stockItemId,
      required final String productName,
      required final StockAlertType type,
      required final StockAlertSeverity severity,
      required final DateTime createdAt,
      final String? message,
      final bool? isResolved,
      final DateTime? resolvedAt}) = _$StockAlertImpl;
  const _StockAlert._() : super._();

  @override
  String get id;
  @override
  String get stockItemId;
  @override
  String get productName;
  @override
  StockAlertType get type;
  @override
  StockAlertSeverity get severity;
  @override
  DateTime get createdAt;
  @override
  String? get message;
  @override
  bool? get isResolved;
  @override
  DateTime? get resolvedAt;

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockAlertImplCopyWith<_$StockAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
