import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

/// Product Entity
/// Représente un produit dans le domaine
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String description,
    required double price,
    required String category,
    required String unit,
    required bool isAvailable,
    required String organizationId,
    String? imageUrl,
    double? cost,
    int? stockQuantity,
    int? minStockLevel,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Product;

  const Product._();

  /// Check if product is in stock
  bool get isInStock => stockQuantity != null && stockQuantity! > 0;

  /// Check if stock is low
  bool get isLowStock => stockQuantity != null && minStockLevel != null && stockQuantity! <= minStockLevel!;

  /// Get profit margin
  double? get profitMargin {
    if (cost == null || cost == 0) return null;
    return ((price - cost!) / cost!) * 100;
  }

  /// Get stock status
  String get stockStatus {
    if (stockQuantity == null) return 'Non géré';
    if (stockQuantity! == 0) return 'Rupture';
    if (isLowStock) return 'Stock faible';
    return 'En stock';
  }

  /// Get availability badge color
  String get availabilityColor {
    if (!isAvailable) return 'grey';
    if (stockQuantity == null) return 'green';
    if (stockQuantity! == 0) return 'red';
    if (isLowStock) return 'orange';
    return 'green';
  }
}
