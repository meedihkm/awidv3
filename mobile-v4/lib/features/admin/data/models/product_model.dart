import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

/// Product Model
/// Model pour la sérialisation JSON du produit
@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    required String description,
    required double price,
    required String category,
    required String unit,
    @JsonKey(name: 'is_available') required bool isAvailable,
    @JsonKey(name: 'organization_id') required String organizationId,
    @JsonKey(name: 'image_url') String? imageUrl,
    double? cost,
    @JsonKey(name: 'stock_quantity') int? stockQuantity,
    @JsonKey(name: 'min_stock_level') int? minStockLevel,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ProductModel;

  /// From Entity
  factory ProductModel.fromEntity(Product entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      category: entity.category,
      unit: entity.unit,
      isAvailable: entity.isAvailable,
      organizationId: entity.organizationId,
      imageUrl: entity.imageUrl,
      cost: entity.cost,
      stockQuantity: entity.stockQuantity,
      minStockLevel: entity.minStockLevel,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  const ProductModel._();

  /// From JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  /// To Entity
  Product toEntity() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      category: category,
      unit: unit,
      isAvailable: isAvailable,
      organizationId: organizationId,
      imageUrl: imageUrl,
      cost: cost,
      stockQuantity: stockQuantity,
      minStockLevel: minStockLevel,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
