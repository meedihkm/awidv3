// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_id')
  String get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_quantity')
  int? get stockQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_stock_level')
  int? get minStockLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      String category,
      String unit,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'organization_id') String organizationId,
      @JsonKey(name: 'image_url') String? imageUrl,
      double? cost,
      @JsonKey(name: 'stock_quantity') int? stockQuantity,
      @JsonKey(name: 'min_stock_level') int? minStockLevel,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? category = null,
    Object? unit = null,
    Object? isAvailable = null,
    Object? organizationId = null,
    Object? imageUrl = freezed,
    Object? cost = freezed,
    Object? stockQuantity = freezed,
    Object? minStockLevel = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      stockQuantity: freezed == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      minStockLevel: freezed == minStockLevel
          ? _value.minStockLevel
          : minStockLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      String category,
      String unit,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'organization_id') String organizationId,
      @JsonKey(name: 'image_url') String? imageUrl,
      double? cost,
      @JsonKey(name: 'stock_quantity') int? stockQuantity,
      @JsonKey(name: 'min_stock_level') int? minStockLevel,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? category = null,
    Object? unit = null,
    Object? isAvailable = null,
    Object? organizationId = null,
    Object? imageUrl = freezed,
    Object? cost = freezed,
    Object? stockQuantity = freezed,
    Object? minStockLevel = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      stockQuantity: freezed == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      minStockLevel: freezed == minStockLevel
          ? _value.minStockLevel
          : minStockLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl extends _ProductModel {
  const _$ProductModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.category,
      required this.unit,
      @JsonKey(name: 'is_available') required this.isAvailable,
      @JsonKey(name: 'organization_id') required this.organizationId,
      @JsonKey(name: 'image_url') this.imageUrl,
      this.cost,
      @JsonKey(name: 'stock_quantity') this.stockQuantity,
      @JsonKey(name: 'min_stock_level') this.minStockLevel,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final String category;
  @override
  final String unit;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey(name: 'organization_id')
  final String organizationId;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final double? cost;
  @override
  @JsonKey(name: 'stock_quantity')
  final int? stockQuantity;
  @override
  @JsonKey(name: 'min_stock_level')
  final int? minStockLevel;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, price: $price, category: $category, unit: $unit, isAvailable: $isAvailable, organizationId: $organizationId, imageUrl: $imageUrl, cost: $cost, stockQuantity: $stockQuantity, minStockLevel: $minStockLevel, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity) &&
            (identical(other.minStockLevel, minStockLevel) ||
                other.minStockLevel == minStockLevel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      price,
      category,
      unit,
      isAvailable,
      organizationId,
      imageUrl,
      cost,
      stockQuantity,
      minStockLevel,
      createdAt,
      updatedAt);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel extends ProductModel {
  const factory _ProductModel(
      {required final String id,
      required final String name,
      required final String description,
      required final double price,
      required final String category,
      required final String unit,
      @JsonKey(name: 'is_available') required final bool isAvailable,
      @JsonKey(name: 'organization_id') required final String organizationId,
      @JsonKey(name: 'image_url') final String? imageUrl,
      final double? cost,
      @JsonKey(name: 'stock_quantity') final int? stockQuantity,
      @JsonKey(name: 'min_stock_level') final int? minStockLevel,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      final DateTime? updatedAt}) = _$ProductModelImpl;
  const _ProductModel._() : super._();

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  String get category;
  @override
  String get unit;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'organization_id')
  String get organizationId;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  double? get cost;
  @override
  @JsonKey(name: 'stock_quantity')
  int? get stockQuantity;
  @override
  @JsonKey(name: 'min_stock_level')
  int? get minStockLevel;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
