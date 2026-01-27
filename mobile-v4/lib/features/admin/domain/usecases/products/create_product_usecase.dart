import '../../entities/product.dart';
import '../../repositories/products_repository.dart';

/// Create Product Use Case
/// Crée un nouveau produit
class CreateProductUseCase {
  const CreateProductUseCase(this._repository);

  final ProductsRepository _repository;

  Future<Product> call({
    required String name,
    required String description,
    required double price,
    required String category,
    required String unit,
    required String organizationId,
    String? imageUrl,
    double? cost,
    int? stockQuantity,
    int? minStockLevel,
  }) async {
    // Validation
    if (name.trim().isEmpty) {
      throw Exception('Le nom du produit est requis');
    }

    if (price <= 0) {
      throw Exception('Le prix doit être supérieur à 0');
    }

    if (cost != null && cost < 0) {
      throw Exception('Le coût ne peut pas être négatif');
    }

    if (stockQuantity != null && stockQuantity < 0) {
      throw Exception('La quantité en stock ne peut pas être négative');
    }

    return _repository.createProduct(
      name: name,
      description: description,
      price: price,
      category: category,
      unit: unit,
      organizationId: organizationId,
      imageUrl: imageUrl,
      cost: cost,
      stockQuantity: stockQuantity,
      minStockLevel: minStockLevel,
    );
  }
}
