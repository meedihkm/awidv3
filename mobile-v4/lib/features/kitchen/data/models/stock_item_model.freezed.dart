// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StockItemModel _$StockItemModelFromJson(Map<String, dynamic> json) {
  return _StockItemModel.fromJson(json);
}

/// @nodoc
mixin _$StockItemModel {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  double get currentQuantity => throw _privateConstructorUsedError;
  double get minimumQuantity => throw _privateConstructorUsedError;
  double get maximumQuantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get supplier => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get lastRestockDate => throw _privateConstructorUsedError;
  String? get expirationDate => throw _privateConstructorUsedError;
  double? get unitCost => throw _privateConstructorUsedError;
  String? get barcode => throw _privateConstructorUsedError;
  bool get isPerishable => throw _privateConstructorUsedError;
  bool get requiresRefrigeration => throw _privateConstructorUsedError;

  /// Serializes this StockItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockItemModelCopyWith<StockItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockItemModelCopyWith<$Res> {
  factory $StockItemModelCopyWith(
          StockItemModel value, $Res Function(StockItemModel) then) =
      _$StockItemModelCopyWithImpl<$Res, StockItemModel>;
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
class _$StockItemModelCopyWithImpl<$Res, $Val extends StockItemModel>
    implements $StockItemModelCopyWith<$Res> {
  _$StockItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as String,
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
              as String?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$StockItemModelImplCopyWith<$Res>
    implements $StockItemModelCopyWith<$Res> {
  factory _$$StockItemModelImplCopyWith(_$StockItemModelImpl value,
          $Res Function(_$StockItemModelImpl) then) =
      __$$StockItemModelImplCopyWithImpl<$Res>;
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
class __$$StockItemModelImplCopyWithImpl<$Res>
    extends _$StockItemModelCopyWithImpl<$Res, _$StockItemModelImpl>
    implements _$$StockItemModelImplCopyWith<$Res> {
  __$$StockItemModelImplCopyWithImpl(
      _$StockItemModelImpl _value, $Res Function(_$StockItemModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$StockItemModelImpl(
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
              as String,
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
              as String?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as String?,
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
@JsonSerializable()
class _$StockItemModelImpl extends _StockItemModel {
  const _$StockItemModelImpl(
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

  factory _$StockItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockItemModelImplFromJson(json);

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

  @override
  String toString() {
    return 'StockItemModel(id: $id, productId: $productId, productName: $productName, currentQuantity: $currentQuantity, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity, unit: $unit, category: $category, supplier: $supplier, location: $location, imageUrl: $imageUrl, lastRestockDate: $lastRestockDate, expirationDate: $expirationDate, unitCost: $unitCost, barcode: $barcode, isPerishable: $isPerishable, requiresRefrigeration: $requiresRefrigeration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockItemModelImpl &&
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

  /// Create a copy of StockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockItemModelImplCopyWith<_$StockItemModelImpl> get copyWith =>
      __$$StockItemModelImplCopyWithImpl<_$StockItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockItemModelImplToJson(
      this,
    );
  }
}

abstract class _StockItemModel extends StockItemModel {
  const factory _StockItemModel(
      {required final String id,
      required final String productId,
      required final String productName,
      required final double currentQuantity,
      required final double minimumQuantity,
      required final double maximumQuantity,
      required final String unit,
      final String? category,
      final String? supplier,
      final String? location,
      final String? imageUrl,
      final String? lastRestockDate,
      final String? expirationDate,
      final double? unitCost,
      final String? barcode,
      final bool isPerishable,
      final bool requiresRefrigeration}) = _$StockItemModelImpl;
  const _StockItemModel._() : super._();

  factory _StockItemModel.fromJson(Map<String, dynamic> json) =
      _$StockItemModelImpl.fromJson;

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
  String get unit;
  @override
  String? get category;
  @override
  String? get supplier;
  @override
  String? get location;
  @override
  String? get imageUrl;
  @override
  String? get lastRestockDate;
  @override
  String? get expirationDate;
  @override
  double? get unitCost;
  @override
  String? get barcode;
  @override
  bool get isPerishable;
  @override
  bool get requiresRefrigeration;

  /// Create a copy of StockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockItemModelImplCopyWith<_$StockItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockMovementModel _$StockMovementModelFromJson(Map<String, dynamic> json) {
  return _StockMovementModel.fromJson(json);
}

/// @nodoc
mixin _$StockMovementModel {
  String get id => throw _privateConstructorUsedError;
  String get stockItemId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this StockMovementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockMovementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockMovementModelCopyWith<StockMovementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockMovementModelCopyWith<$Res> {
  factory $StockMovementModelCopyWith(
          StockMovementModel value, $Res Function(StockMovementModel) then) =
      _$StockMovementModelCopyWithImpl<$Res, StockMovementModel>;
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
class _$StockMovementModelCopyWithImpl<$Res, $Val extends StockMovementModel>
    implements $StockMovementModelCopyWith<$Res> {
  _$StockMovementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$StockMovementModelImplCopyWith<$Res>
    implements $StockMovementModelCopyWith<$Res> {
  factory _$$StockMovementModelImplCopyWith(_$StockMovementModelImpl value,
          $Res Function(_$StockMovementModelImpl) then) =
      __$$StockMovementModelImplCopyWithImpl<$Res>;
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
class __$$StockMovementModelImplCopyWithImpl<$Res>
    extends _$StockMovementModelCopyWithImpl<$Res, _$StockMovementModelImpl>
    implements _$$StockMovementModelImplCopyWith<$Res> {
  __$$StockMovementModelImplCopyWithImpl(_$StockMovementModelImpl _value,
      $Res Function(_$StockMovementModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$StockMovementModelImpl(
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
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$StockMovementModelImpl extends _StockMovementModel {
  const _$StockMovementModelImpl(
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

  factory _$StockMovementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockMovementModelImplFromJson(json);

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

  @override
  String toString() {
    return 'StockMovementModel(id: $id, stockItemId: $stockItemId, productName: $productName, type: $type, quantity: $quantity, unit: $unit, timestamp: $timestamp, orderId: $orderId, userId: $userId, userName: $userName, reason: $reason, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockMovementModelImpl &&
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

  /// Create a copy of StockMovementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockMovementModelImplCopyWith<_$StockMovementModelImpl> get copyWith =>
      __$$StockMovementModelImplCopyWithImpl<_$StockMovementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockMovementModelImplToJson(
      this,
    );
  }
}

abstract class _StockMovementModel extends StockMovementModel {
  const factory _StockMovementModel(
      {required final String id,
      required final String stockItemId,
      required final String productName,
      required final String type,
      required final double quantity,
      required final String unit,
      required final String timestamp,
      final String? orderId,
      final String? userId,
      final String? userName,
      final String? reason,
      final String? notes}) = _$StockMovementModelImpl;
  const _StockMovementModel._() : super._();

  factory _StockMovementModel.fromJson(Map<String, dynamic> json) =
      _$StockMovementModelImpl.fromJson;

  @override
  String get id;
  @override
  String get stockItemId;
  @override
  String get productName;
  @override
  String get type;
  @override
  double get quantity;
  @override
  String get unit;
  @override
  String get timestamp;
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

  /// Create a copy of StockMovementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockMovementModelImplCopyWith<_$StockMovementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockAlertModel _$StockAlertModelFromJson(Map<String, dynamic> json) {
  return _StockAlertModel.fromJson(json);
}

/// @nodoc
mixin _$StockAlertModel {
  String get id => throw _privateConstructorUsedError;
  String get stockItemId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get isResolved => throw _privateConstructorUsedError;
  String? get resolvedAt => throw _privateConstructorUsedError;

  /// Serializes this StockAlertModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockAlertModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockAlertModelCopyWith<StockAlertModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockAlertModelCopyWith<$Res> {
  factory $StockAlertModelCopyWith(
          StockAlertModel value, $Res Function(StockAlertModel) then) =
      _$StockAlertModelCopyWithImpl<$Res, StockAlertModel>;
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
class _$StockAlertModelCopyWithImpl<$Res, $Val extends StockAlertModel>
    implements $StockAlertModelCopyWith<$Res> {
  _$StockAlertModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockAlertModelImplCopyWith<$Res>
    implements $StockAlertModelCopyWith<$Res> {
  factory _$$StockAlertModelImplCopyWith(_$StockAlertModelImpl value,
          $Res Function(_$StockAlertModelImpl) then) =
      __$$StockAlertModelImplCopyWithImpl<$Res>;
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
class __$$StockAlertModelImplCopyWithImpl<$Res>
    extends _$StockAlertModelCopyWithImpl<$Res, _$StockAlertModelImpl>
    implements _$$StockAlertModelImplCopyWith<$Res> {
  __$$StockAlertModelImplCopyWithImpl(
      _$StockAlertModelImpl _value, $Res Function(_$StockAlertModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$StockAlertModelImpl(
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
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockAlertModelImpl extends _StockAlertModel {
  const _$StockAlertModelImpl(
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

  factory _$StockAlertModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockAlertModelImplFromJson(json);

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

  @override
  String toString() {
    return 'StockAlertModel(id: $id, stockItemId: $stockItemId, productName: $productName, type: $type, severity: $severity, createdAt: $createdAt, message: $message, isResolved: $isResolved, resolvedAt: $resolvedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockAlertModelImpl &&
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

  /// Create a copy of StockAlertModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockAlertModelImplCopyWith<_$StockAlertModelImpl> get copyWith =>
      __$$StockAlertModelImplCopyWithImpl<_$StockAlertModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockAlertModelImplToJson(
      this,
    );
  }
}

abstract class _StockAlertModel extends StockAlertModel {
  const factory _StockAlertModel(
      {required final String id,
      required final String stockItemId,
      required final String productName,
      required final String type,
      required final String severity,
      required final String createdAt,
      final String? message,
      final bool? isResolved,
      final String? resolvedAt}) = _$StockAlertModelImpl;
  const _StockAlertModel._() : super._();

  factory _StockAlertModel.fromJson(Map<String, dynamic> json) =
      _$StockAlertModelImpl.fromJson;

  @override
  String get id;
  @override
  String get stockItemId;
  @override
  String get productName;
  @override
  String get type;
  @override
  String get severity;
  @override
  String get createdAt;
  @override
  String? get message;
  @override
  bool? get isResolved;
  @override
  String? get resolvedAt;

  /// Create a copy of StockAlertModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockAlertModelImplCopyWith<_$StockAlertModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
