// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockItemModel {
  String get id;
  String get productId;
  String get productName;
  double get currentQuantity;
  double get minimumQuantity;
  double get maximumQuantity;
  String get unit;
  String? get category;
  String? get supplier;
  String? get location;
  String? get imageUrl;
  String? get lastRestockDate;
  String? get expirationDate;
  double? get unitCost;
  String? get barcode;
  bool get isPerishable;
  bool get requiresRefrigeration;

  /// Create a copy of StockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StockItemModelCopyWith<StockItemModel> get copyWith =>
      _$StockItemModelCopyWithImpl<StockItemModel>(
          this as StockItemModel, _$identity);

  /// Serializes this StockItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StockItemModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'StockItemModel(id: $id, productId: $productId, productName: $productName, currentQuantity: $currentQuantity, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity, unit: $unit, category: $category, supplier: $supplier, location: $location, imageUrl: $imageUrl, lastRestockDate: $lastRestockDate, expirationDate: $expirationDate, unitCost: $unitCost, barcode: $barcode, isPerishable: $isPerishable, requiresRefrigeration: $requiresRefrigeration)';
  }
}

/// @nodoc
abstract mixin class $StockItemModelCopyWith<$Res> {
  factory $StockItemModelCopyWith(
          StockItemModel value, $Res Function(StockItemModel) _then) =
      _$StockItemModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      double currentQuantity,
      double minimumQuantity,
      double maximumQuantity,
      String unit,
      String? category,
      String? supplier,
      String? location,
      String? imageUrl,
      String? lastRestockDate,
      String? expirationDate,
      double? unitCost,
      String? barcode,
      bool isPerishable,
      bool requiresRefrigeration});
}

/// @nodoc
class _$StockItemModelCopyWithImpl<$Res>
    implements $StockItemModelCopyWith<$Res> {
  _$StockItemModelCopyWithImpl(this._self, this._then);

  final StockItemModel _self;
  final $Res Function(StockItemModel) _then;

  /// Create a copy of StockItemModel
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
              as String,
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
              as String?,
      expirationDate: freezed == expirationDate
          ? _self.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as String?,
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

/// Adds pattern-matching-related methods to [StockItemModel].
extension StockItemModelPatterns on StockItemModel {
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
    TResult Function(_StockItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockItemModel() when $default != null:
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
    TResult Function(_StockItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockItemModel():
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
    TResult? Function(_StockItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockItemModel() when $default != null:
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
            String unit,
            String? category,
            String? supplier,
            String? location,
            String? imageUrl,
            String? lastRestockDate,
            String? expirationDate,
            double? unitCost,
            String? barcode,
            bool isPerishable,
            bool requiresRefrigeration)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockItemModel() when $default != null:
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
            String unit,
            String? category,
            String? supplier,
            String? location,
            String? imageUrl,
            String? lastRestockDate,
            String? expirationDate,
            double? unitCost,
            String? barcode,
            bool isPerishable,
            bool requiresRefrigeration)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockItemModel():
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
            String unit,
            String? category,
            String? supplier,
            String? location,
            String? imageUrl,
            String? lastRestockDate,
            String? expirationDate,
            double? unitCost,
            String? barcode,
            bool isPerishable,
            bool requiresRefrigeration)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockItemModel() when $default != null:
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
@JsonSerializable()
class _StockItemModel extends StockItemModel {
  const _StockItemModel(
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
  factory _StockItemModel.fromJson(Map<String, dynamic> json) =>
      _$StockItemModelFromJson(json);

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
  final String unit;
  @override
  final String? category;
  @override
  final String? supplier;
  @override
  final String? location;
  @override
  final String? imageUrl;
  @override
  final String? lastRestockDate;
  @override
  final String? expirationDate;
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

  /// Create a copy of StockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StockItemModelCopyWith<_StockItemModel> get copyWith =>
      __$StockItemModelCopyWithImpl<_StockItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StockItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StockItemModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'StockItemModel(id: $id, productId: $productId, productName: $productName, currentQuantity: $currentQuantity, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity, unit: $unit, category: $category, supplier: $supplier, location: $location, imageUrl: $imageUrl, lastRestockDate: $lastRestockDate, expirationDate: $expirationDate, unitCost: $unitCost, barcode: $barcode, isPerishable: $isPerishable, requiresRefrigeration: $requiresRefrigeration)';
  }
}

/// @nodoc
abstract mixin class _$StockItemModelCopyWith<$Res>
    implements $StockItemModelCopyWith<$Res> {
  factory _$StockItemModelCopyWith(
          _StockItemModel value, $Res Function(_StockItemModel) _then) =
      __$StockItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      double currentQuantity,
      double minimumQuantity,
      double maximumQuantity,
      String unit,
      String? category,
      String? supplier,
      String? location,
      String? imageUrl,
      String? lastRestockDate,
      String? expirationDate,
      double? unitCost,
      String? barcode,
      bool isPerishable,
      bool requiresRefrigeration});
}

/// @nodoc
class __$StockItemModelCopyWithImpl<$Res>
    implements _$StockItemModelCopyWith<$Res> {
  __$StockItemModelCopyWithImpl(this._self, this._then);

  final _StockItemModel _self;
  final $Res Function(_StockItemModel) _then;

  /// Create a copy of StockItemModel
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
    return _then(_StockItemModel(
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
              as String,
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
              as String?,
      expirationDate: freezed == expirationDate
          ? _self.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as String?,
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
mixin _$StockMovementModel {
  String get id;
  String get stockItemId;
  String get productName;
  String get type;
  double get quantity;
  String get unit;
  String get timestamp;
  String? get orderId;
  String? get userId;
  String? get userName;
  String? get reason;
  String? get notes;

  /// Create a copy of StockMovementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StockMovementModelCopyWith<StockMovementModel> get copyWith =>
      _$StockMovementModelCopyWithImpl<StockMovementModel>(
          this as StockMovementModel, _$identity);

  /// Serializes this StockMovementModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StockMovementModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'StockMovementModel(id: $id, stockItemId: $stockItemId, productName: $productName, type: $type, quantity: $quantity, unit: $unit, timestamp: $timestamp, orderId: $orderId, userId: $userId, userName: $userName, reason: $reason, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $StockMovementModelCopyWith<$Res> {
  factory $StockMovementModelCopyWith(
          StockMovementModel value, $Res Function(StockMovementModel) _then) =
      _$StockMovementModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String stockItemId,
      String productName,
      String type,
      double quantity,
      String unit,
      String timestamp,
      String? orderId,
      String? userId,
      String? userName,
      String? reason,
      String? notes});
}

/// @nodoc
class _$StockMovementModelCopyWithImpl<$Res>
    implements $StockMovementModelCopyWith<$Res> {
  _$StockMovementModelCopyWithImpl(this._self, this._then);

  final StockMovementModel _self;
  final $Res Function(StockMovementModel) _then;

  /// Create a copy of StockMovementModel
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
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
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

/// Adds pattern-matching-related methods to [StockMovementModel].
extension StockMovementModelPatterns on StockMovementModel {
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
    TResult Function(_StockMovementModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockMovementModel() when $default != null:
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
    TResult Function(_StockMovementModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockMovementModel():
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
    TResult? Function(_StockMovementModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockMovementModel() when $default != null:
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
            String type,
            double quantity,
            String unit,
            String timestamp,
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
      case _StockMovementModel() when $default != null:
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
            String type,
            double quantity,
            String unit,
            String timestamp,
            String? orderId,
            String? userId,
            String? userName,
            String? reason,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockMovementModel():
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
            String type,
            double quantity,
            String unit,
            String timestamp,
            String? orderId,
            String? userId,
            String? userName,
            String? reason,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockMovementModel() when $default != null:
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
@JsonSerializable()
class _StockMovementModel extends StockMovementModel {
  const _StockMovementModel(
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
  factory _StockMovementModel.fromJson(Map<String, dynamic> json) =>
      _$StockMovementModelFromJson(json);

  @override
  final String id;
  @override
  final String stockItemId;
  @override
  final String productName;
  @override
  final String type;
  @override
  final double quantity;
  @override
  final String unit;
  @override
  final String timestamp;
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

  /// Create a copy of StockMovementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StockMovementModelCopyWith<_StockMovementModel> get copyWith =>
      __$StockMovementModelCopyWithImpl<_StockMovementModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StockMovementModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StockMovementModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'StockMovementModel(id: $id, stockItemId: $stockItemId, productName: $productName, type: $type, quantity: $quantity, unit: $unit, timestamp: $timestamp, orderId: $orderId, userId: $userId, userName: $userName, reason: $reason, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$StockMovementModelCopyWith<$Res>
    implements $StockMovementModelCopyWith<$Res> {
  factory _$StockMovementModelCopyWith(
          _StockMovementModel value, $Res Function(_StockMovementModel) _then) =
      __$StockMovementModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String stockItemId,
      String productName,
      String type,
      double quantity,
      String unit,
      String timestamp,
      String? orderId,
      String? userId,
      String? userName,
      String? reason,
      String? notes});
}

/// @nodoc
class __$StockMovementModelCopyWithImpl<$Res>
    implements _$StockMovementModelCopyWith<$Res> {
  __$StockMovementModelCopyWithImpl(this._self, this._then);

  final _StockMovementModel _self;
  final $Res Function(_StockMovementModel) _then;

  /// Create a copy of StockMovementModel
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
    return _then(_StockMovementModel(
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
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
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
mixin _$StockAlertModel {
  String get id;
  String get stockItemId;
  String get productName;
  String get type;
  String get severity;
  String get createdAt;
  String? get message;
  bool? get isResolved;
  String? get resolvedAt;

  /// Create a copy of StockAlertModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StockAlertModelCopyWith<StockAlertModel> get copyWith =>
      _$StockAlertModelCopyWithImpl<StockAlertModel>(
          this as StockAlertModel, _$identity);

  /// Serializes this StockAlertModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StockAlertModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stockItemId, productName,
      type, severity, createdAt, message, isResolved, resolvedAt);

  @override
  String toString() {
    return 'StockAlertModel(id: $id, stockItemId: $stockItemId, productName: $productName, type: $type, severity: $severity, createdAt: $createdAt, message: $message, isResolved: $isResolved, resolvedAt: $resolvedAt)';
  }
}

/// @nodoc
abstract mixin class $StockAlertModelCopyWith<$Res> {
  factory $StockAlertModelCopyWith(
          StockAlertModel value, $Res Function(StockAlertModel) _then) =
      _$StockAlertModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String stockItemId,
      String productName,
      String type,
      String severity,
      String createdAt,
      String? message,
      bool? isResolved,
      String? resolvedAt});
}

/// @nodoc
class _$StockAlertModelCopyWithImpl<$Res>
    implements $StockAlertModelCopyWith<$Res> {
  _$StockAlertModelCopyWithImpl(this._self, this._then);

  final StockAlertModel _self;
  final $Res Function(StockAlertModel) _then;

  /// Create a copy of StockAlertModel
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
              as String,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [StockAlertModel].
extension StockAlertModelPatterns on StockAlertModel {
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
    TResult Function(_StockAlertModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockAlertModel() when $default != null:
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
    TResult Function(_StockAlertModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockAlertModel():
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
    TResult? Function(_StockAlertModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockAlertModel() when $default != null:
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
            String type,
            String severity,
            String createdAt,
            String? message,
            bool? isResolved,
            String? resolvedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StockAlertModel() when $default != null:
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
            String type,
            String severity,
            String createdAt,
            String? message,
            bool? isResolved,
            String? resolvedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockAlertModel():
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
            String type,
            String severity,
            String createdAt,
            String? message,
            bool? isResolved,
            String? resolvedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StockAlertModel() when $default != null:
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
@JsonSerializable()
class _StockAlertModel extends StockAlertModel {
  const _StockAlertModel(
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
  factory _StockAlertModel.fromJson(Map<String, dynamic> json) =>
      _$StockAlertModelFromJson(json);

  @override
  final String id;
  @override
  final String stockItemId;
  @override
  final String productName;
  @override
  final String type;
  @override
  final String severity;
  @override
  final String createdAt;
  @override
  final String? message;
  @override
  final bool? isResolved;
  @override
  final String? resolvedAt;

  /// Create a copy of StockAlertModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StockAlertModelCopyWith<_StockAlertModel> get copyWith =>
      __$StockAlertModelCopyWithImpl<_StockAlertModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StockAlertModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StockAlertModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stockItemId, productName,
      type, severity, createdAt, message, isResolved, resolvedAt);

  @override
  String toString() {
    return 'StockAlertModel(id: $id, stockItemId: $stockItemId, productName: $productName, type: $type, severity: $severity, createdAt: $createdAt, message: $message, isResolved: $isResolved, resolvedAt: $resolvedAt)';
  }
}

/// @nodoc
abstract mixin class _$StockAlertModelCopyWith<$Res>
    implements $StockAlertModelCopyWith<$Res> {
  factory _$StockAlertModelCopyWith(
          _StockAlertModel value, $Res Function(_StockAlertModel) _then) =
      __$StockAlertModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String stockItemId,
      String productName,
      String type,
      String severity,
      String createdAt,
      String? message,
      bool? isResolved,
      String? resolvedAt});
}

/// @nodoc
class __$StockAlertModelCopyWithImpl<$Res>
    implements _$StockAlertModelCopyWith<$Res> {
  __$StockAlertModelCopyWithImpl(this._self, this._then);

  final _StockAlertModel _self;
  final $Res Function(_StockAlertModel) _then;

  /// Create a copy of StockAlertModel
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
    return _then(_StockAlertModel(
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
              as String,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String?,
    ));
  }
}

// dart format on
