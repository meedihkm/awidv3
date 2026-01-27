import '../../entities/product.dart';
import '../../repositories/products_repository.dart';

/// Get Products Use Case
/// Récupère la liste des produits avec filtres optionnels
class GetProductsUseCase {
  const GetProductsUseCase(this._repository);

  final ProductsRepository _repository;

  Future<List<Product>> call({int? page, int? limit, String? category, bool? isAvailable, String? search}) async {
    return _repository.getProducts(
      page: page,
      limit: limit,
      category: category,
      isAvailable: isAvailable,
      search: search,
    );
  }
}
