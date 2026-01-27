import '../../entities/product.dart';
import '../../repositories/products_repository.dart';

/// Update Product Use Case
/// Met à jour un produit existant
class UpdateProductUseCase {
  const UpdateProductUseCase(this._repository);

  final ProductsRepository _repository;

  Future<Product> call({
    required String id,
    String? name,
    String? description,
    double? price,
    String? category,
    String? unit,
    bool? isAvailable,
    String? imageUrl,
    double? cost,
    int? stockQuantity,
    int? minStockLevel,
  }) async {
    // Validation
    if (name != null && name.trim().isEmpty) {
      throw Exception('Le nom du produit ne peut pas être vide');
    }

    if (price != null && price <= 0) {
      throw Exception('Le prix doit être supérieur à 0');
    }

    if (cost != null && cost < 0) {
      throw Exception('Le coût ne peut pas être négatif');
    }

    if (stockQuantity != null && stockQuantity < 0) {
      throw Exception('La quantité en stock ne peut pas être négative');
    }

    return _repository.updateProduct(
      id: id,
      name: name,
      description: description,
      price: price,
      category: category,
      unit: unit,
      isAvailable: isAvailable,
      imageUrl: imageUrl,
      cost: cost,
      stockQuantity: stockQuantity,
      minStockLevel: minStockLevel,
    );
  }
}
