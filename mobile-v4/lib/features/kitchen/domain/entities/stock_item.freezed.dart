// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockItem {
  String get id;
  String get productId;
  String get productName;
  double get currentQuantity;
  double get minimumQuantity;
  double get maximumQuantity;
  StockUnit get unit;
  String? get category;
  String? get supplier;
  String? get location;
  String? get imageUrl;
  DateTime? get lastRestockDate;
  DateTime? get expirationDate;
  double? get unitCost;
  String? get barcode;
  bool get isPerishable;
  bool get requiresRefrigeration;

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StockItemCopyWith<StockItem> get copyWith =>
      _$StockItemCopyWithImpl<StockItem>(this as StockItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StockItem &&
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

  @override
  String toString() {
    return 'StockItem(id: $id, productId: $productId, productName: $productName, currentQuantity: $currentQuantity, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity, unit: $unit, category: $category, supplier: $supplier, location: $location, imageUrl: $imageUrl, lastRestockDate: $lastRestockDate, expirationDate: $expirationDate, unitCost: $unitCost, barcode: $barcode, isPerishable: $isPerishable, requiresRefrigeration: $requiresRefrigeration)';
  }
}

/// @nodoc
abstract mixin class $StockItemCopyWith<$Res> {
  factory $StockItemCopyWith(StockItem value, $Res Function(StockItem) _then) =
      _$StockItemCopyWithImpl;
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
class _$StockItemCopyWithImpl<$Res> implements $StockItemCopyWith<$Res> {
  _$StockItemCopyWithImpl(this._self, this._then);

  final StockItem _self;
  final $Res Function(StockItem) _then;

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
      currentQuantity: null == currentQuantity
          ? _self.currentQuantity
          : currentQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      minimumQuantity: null == minimumQuantity
          ? _self.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      maximumQuantity: null == maximumQuantity
          ? _self.maximumQuantity
          : maximumQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as StockUnit,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      supplier: freezed == supplier
          ? _self.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastRestockDate: freezed == lastRestockDate
          ? _self.lastRestockDate
          : lastRestockDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expirationDate: freezed == expirationDate
          ? _self.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unitCost: freezed == unitCost
          ? _self.unitCost
          : unitCost // ignore: cast_nullable_to_non_nullable
              as double?,
      barcode: freezed == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      isPerishable: null == isPerishable
          ? _self.isPerishable
          : isPerishable // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresRefrigeration: null == requiresRefrigeration
          ? _self.requiresRefrigeration
          : requiresRefrigeration // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [StockItem].
extension StockItemPatterns on StockItem {
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
    TResult Function(_StockItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockItem() when $default != null:
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
    TResult Function(_StockItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockItem():
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
    TResult? Function(_StockItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockItem() when $default != null:
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
            bool requiresRefrigeration)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockItem() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.currentQuantity,
            _that.minimumQuantity,
            _that.maximumQuantity,
            _that.unit,
            _that.category,
            _that.supplier,
            _that.location,
            _that.imageUrl,
            _that.lastRestockDate,
            _that.expirationDate,
            _that.unitCost,
            _that.barcode,
            _that.isPerishable,
            _that.requiresRefrigeration);
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
            bool requiresRefrigeration)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockItem():
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.currentQuantity,
            _that.minimumQuantity,
            _that.maximumQuantity,
            _that.unit,
            _that.category,
            _that.supplier,
            _that.location,
            _that.imageUrl,
            _that.lastRestockDate,
            _that.expirationDate,
            _that.unitCost,
            _that.barcode,
            _that.isPerishable,
            _that.requiresRefrigeration);
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
            bool requiresRefrigeration)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockItem() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.currentQuantity,
            _that.minimumQuantity,
            _that.maximumQuantity,
            _that.unit,
            _that.category,
            _that.supplier,
            _that.location,
            _that.imageUrl,
            _that.lastRestockDate,
            _that.expirationDate,
            _that.unitCost,
            _that.barcode,
            _that.isPerishable,
            _that.requiresRefrigeration);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StockItem extends StockItem {
  const _StockItem(
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

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StockItemCopyWith<_StockItem> get copyWith =>
      __$StockItemCopyWithImpl<_StockItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StockItem &&
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

  @override
  String toString() {
    return 'StockItem(id: $id, productId: $productId, productName: $productName, currentQuantity: $currentQuantity, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity, unit: $unit, category: $category, supplier: $supplier, location: $location, imageUrl: $imageUrl, lastRestockDate: $lastRestockDate, expirationDate: $expirationDate, unitCost: $unitCost, barcode: $barcode, isPerishable: $isPerishable, requiresRefrigeration: $requiresRefrigeration)';
  }
}

/// @nodoc
abstract mixin class _$StockItemCopyWith<$Res>
    implements $StockItemCopyWith<$Res> {
  factory _$StockItemCopyWith(
          _StockItem value, $Res Function(_StockItem) _then) =
      __$StockItemCopyWithImpl;
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
class __$StockItemCopyWithImpl<$Res> implements _$StockItemCopyWith<$Res> {
  __$StockItemCopyWithImpl(this._self, this._then);

  final _StockItem _self;
  final $Res Function(_StockItem) _then;

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_StockItem(
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
      currentQuantity: null == currentQuantity
          ? _self.currentQuantity
          : currentQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      minimumQuantity: null == minimumQuantity
          ? _self.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      maximumQuantity: null == maximumQuantity
          ? _self.maximumQuantity
          : maximumQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as StockUnit,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      supplier: freezed == supplier
          ? _self.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastRestockDate: freezed == lastRestockDate
          ? _self.lastRestockDate
          : lastRestockDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expirationDate: freezed == expirationDate
          ? _self.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unitCost: freezed == unitCost
          ? _self.unitCost
          : unitCost // ignore: cast_nullable_to_non_nullable
              as double?,
      barcode: freezed == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      isPerishable: null == isPerishable
          ? _self.isPerishable
          : isPerishable // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresRefrigeration: null == requiresRefrigeration
          ? _self.requiresRefrigeration
          : requiresRefrigeration // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$StockMovement {
  String get id;
  String get stockItemId;
  String get productName;
  StockMovementType get type;
  double get quantity;
  StockUnit get unit;
  DateTime get timestamp;
  String? get orderId;
  String? get userId;
  String? get userName;
  String? get reason;
  String? get notes;

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StockMovementCopyWith<StockMovement> get copyWith =>
      _$StockMovementCopyWithImpl<StockMovement>(
          this as StockMovement, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StockMovement &&
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

  @override
  String toString() {
    return 'StockMovement(id: $id, stockItemId: $stockItemId, productName: $productName, type: $type, quantity: $quantity, unit: $unit, timestamp: $timestamp, orderId: $orderId, userId: $userId, userName: $userName, reason: $reason, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $StockMovementCopyWith<$Res> {
  factory $StockMovementCopyWith(
          StockMovement value, $Res Function(StockMovement) _then) =
      _$StockMovementCopyWithImpl;
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
class _$StockMovementCopyWithImpl<$Res>
    implements $StockMovementCopyWith<$Res> {
  _$StockMovementCopyWithImpl(this._self, this._then);

  final StockMovement _self;
  final $Res Function(StockMovement) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stockItemId: null == stockItemId
          ? _self.stockItemId
          : stockItemId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as StockMovementType,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as StockUnit,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [StockMovement].
extension StockMovementPatterns on StockMovement {
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
    TResult Function(_StockMovement value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockMovement() when $default != null:
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
    TResult Function(_StockMovement value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockMovement():
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
    TResult? Function(_StockMovement value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockMovement() when $default != null:
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
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockMovement() when $default != null:
        return $default(
            _that.id,
            _that.stockItemId,
            _that.productName,
            _that.type,
            _that.quantity,
            _that.unit,
            _that.timestamp,
            _that.orderId,
            _that.userId,
            _that.userName,
            _that.reason,
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
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockMovement():
        return $default(
            _that.id,
            _that.stockItemId,
            _that.productName,
            _that.type,
            _that.quantity,
            _that.unit,
            _that.timestamp,
            _that.orderId,
            _that.userId,
            _that.userName,
            _that.reason,
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
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockMovement() when $default != null:
        return $default(
            _that.id,
            _that.stockItemId,
            _that.productName,
            _that.type,
            _that.quantity,
            _that.unit,
            _that.timestamp,
            _that.orderId,
            _that.userId,
            _that.userName,
            _that.reason,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StockMovement extends StockMovement {
  const _StockMovement(
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

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StockMovementCopyWith<_StockMovement> get copyWith =>
      __$StockMovementCopyWithImpl<_StockMovement>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StockMovement &&
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

  @override
  String toString() {
    return 'StockMovement(id: $id, stockItemId: $stockItemId, productName: $productName, type: $type, quantity: $quantity, unit: $unit, timestamp: $timestamp, orderId: $orderId, userId: $userId, userName: $userName, reason: $reason, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$StockMovementCopyWith<$Res>
    implements $StockMovementCopyWith<$Res> {
  factory _$StockMovementCopyWith(
          _StockMovement value, $Res Function(_StockMovement) _then) =
      __$StockMovementCopyWithImpl;
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
class __$StockMovementCopyWithImpl<$Res>
    implements _$StockMovementCopyWith<$Res> {
  __$StockMovementCopyWithImpl(this._self, this._then);

  final _StockMovement _self;
  final $Res Function(_StockMovement) _then;

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_StockMovement(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stockItemId: null == stockItemId
          ? _self.stockItemId
          : stockItemId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as StockMovementType,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as StockUnit,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$StockAlert {
  String get id;
  String get stockItemId;
  String get productName;
  StockAlertType get type;
  StockAlertSeverity get severity;
  DateTime get createdAt;
  String? get message;
  bool? get isResolved;
  DateTime? get resolvedAt;

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StockAlertCopyWith<StockAlert> get copyWith =>
      _$StockAlertCopyWithImpl<StockAlert>(this as StockAlert, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StockAlert &&
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

  @override
  String toString() {
    return 'StockAlert(id: $id, stockItemId: $stockItemId, productName: $productName, type: $type, severity: $severity, createdAt: $createdAt, message: $message, isResolved: $isResolved, resolvedAt: $resolvedAt)';
  }
}

/// @nodoc
abstract mixin class $StockAlertCopyWith<$Res> {
  factory $StockAlertCopyWith(
          StockAlert value, $Res Function(StockAlert) _then) =
      _$StockAlertCopyWithImpl;
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
class _$StockAlertCopyWithImpl<$Res> implements $StockAlertCopyWith<$Res> {
  _$StockAlertCopyWithImpl(this._self, this._then);

  final StockAlert _self;
  final $Res Function(StockAlert) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stockItemId: null == stockItemId
          ? _self.stockItemId
          : stockItemId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as StockAlertType,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as StockAlertSeverity,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: freezed == isResolved
          ? _self.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool?,
      resolvedAt: freezed == resolvedAt
          ? _self.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [StockAlert].
extension StockAlertPatterns on StockAlert {
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
    TResult Function(_StockAlert value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockAlert() when $default != null:
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
    TResult Function(_StockAlert value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockAlert():
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
    TResult? Function(_StockAlert value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockAlert() when $default != null:
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
            String stockItemId,
            String productName,
            StockAlertType type,
            StockAlertSeverity severity,
            DateTime createdAt,
            String? message,
            bool? isResolved,
            DateTime? resolvedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockAlert() when $default != null:
        return $default(
            _that.id,
            _that.stockItemId,
            _that.productName,
            _that.type,
            _that.severity,
            _that.createdAt,
            _that.message,
            _that.isResolved,
            _that.resolvedAt);
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
            String stockItemId,
            String productName,
            StockAlertType type,
            StockAlertSeverity severity,
            DateTime createdAt,
            String? message,
            bool? isResolved,
            DateTime? resolvedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockAlert():
        return $default(
            _that.id,
            _that.stockItemId,
            _that.productName,
            _that.type,
            _that.severity,
            _that.createdAt,
            _that.message,
            _that.isResolved,
            _that.resolvedAt);
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
            String stockItemId,
            String productName,
            StockAlertType type,
            StockAlertSeverity severity,
            DateTime createdAt,
            String? message,
            bool? isResolved,
            DateTime? resolvedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockAlert() when $default != null:
        return $default(
            _that.id,
            _that.stockItemId,
            _that.productName,
            _that.type,
            _that.severity,
            _that.createdAt,
            _that.message,
            _that.isResolved,
            _that.resolvedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StockAlert extends StockAlert {
  const _StockAlert(
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

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StockAlertCopyWith<_StockAlert> get copyWith =>
      __$StockAlertCopyWithImpl<_StockAlert>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StockAlert &&
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

  @override
  String toString() {
    return 'StockAlert(id: $id, stockItemId: $stockItemId, productName: $productName, type: $type, severity: $severity, createdAt: $createdAt, message: $message, isResolved: $isResolved, resolvedAt: $resolvedAt)';
  }
}

/// @nodoc
abstract mixin class _$StockAlertCopyWith<$Res>
    implements $StockAlertCopyWith<$Res> {
  factory _$StockAlertCopyWith(
          _StockAlert value, $Res Function(_StockAlert) _then) =
      __$StockAlertCopyWithImpl;
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
class __$StockAlertCopyWithImpl<$Res> implements _$StockAlertCopyWith<$Res> {
  __$StockAlertCopyWithImpl(this._self, this._then);

  final _StockAlert _self;
  final $Res Function(_StockAlert) _then;

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_StockAlert(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stockItemId: null == stockItemId
          ? _self.stockItemId
          : stockItemId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as StockAlertType,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as StockAlertSeverity,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: freezed == isResolved
          ? _self.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool?,
      resolvedAt: freezed == resolvedAt
          ? _self.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
