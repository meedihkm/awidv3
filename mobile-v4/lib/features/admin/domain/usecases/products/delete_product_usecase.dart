import '../../repositories/products_repository.dart';

/// Delete Product Use Case
/// Supprime un produit
class DeleteProductUseCase {
  const DeleteProductUseCase(this._repository);

  final ProductsRepository _repository;

  Future<void> call(String id) async {
    if (id.trim().isEmpty) {
      throw Exception('ID du produit invalide');
    }

    return _repository.deleteProduct(id);
  }
}
