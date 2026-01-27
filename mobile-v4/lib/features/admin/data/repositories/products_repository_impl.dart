import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_remote_datasource.dart';

/// Products Repository Implementation
/// Implémente le repository des produits
class ProductsRepositoryImpl implements ProductsRepository {
  const ProductsRepositoryImpl(this._remoteDatasource);

  final ProductsRemoteDatasource _remoteDatasource;

  @override
  Future<List<Product>> getProducts({
    int? page,
    int? limit,
    String? category,
    bool? isAvailable,
    String? search,
  }) async {
    try {
      final models = await _remoteDatasource.getProducts(
        page: page,
        limit: limit,
        category: category,
        isAvailable: isAvailable,
        search: search,
      );

      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Erreur lors de la récupération des produits: $e');
    }
  }

  @override
  Future<Product> getProductById(String id) async {
    try {
      final model = await _remoteDatasource.getProductById(id);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la récupération du produit: $e');
    }
  }

  @override
  Future<Product> createProduct({
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
    try {
      final data = {
        'name': name,
        'description': description,
        'price': price,
        'category': category,
        'unit': unit,
        'organization_id': organizationId,
        if (imageUrl != null) 'image_url': imageUrl,
        if (cost != null) 'cost': cost,
        if (stockQuantity != null) 'stock_quantity': stockQuantity,
        if (minStockLevel != null) 'min_stock_level': minStockLevel,
      };

      final model = await _remoteDatasource.createProduct(data);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la création du produit: $e');
    }
  }

  @override
  Future<Product> updateProduct({
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
    try {
      final data = <String, dynamic>{};

      if (name != null) data['name'] = name;
      if (description != null) data['description'] = description;
      if (price != null) data['price'] = price;
      if (category != null) data['category'] = category;
      if (unit != null) data['unit'] = unit;
      if (isAvailable != null) data['is_available'] = isAvailable;
      if (imageUrl != null) data['image_url'] = imageUrl;
      if (cost != null) data['cost'] = cost;
      if (stockQuantity != null) data['stock_quantity'] = stockQuantity;
      if (minStockLevel != null) data['min_stock_level'] = minStockLevel;

      final model = await _remoteDatasource.updateProduct(id, data);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la mise à jour du produit: $e');
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    try {
      await _remoteDatasource.deleteProduct(id);
    } catch (e) {
      throw Exception('Erreur lors de la suppression du produit: $e');
    }
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      return await _remoteDatasource.getCategories();
    } catch (e) {
      throw Exception('Erreur lors de la récupération des catégories: $e');
    }
  }

  @override
  Future<Product> updateStock({required String id, required int quantity}) async {
    try {
      final model = await _remoteDatasource.updateStock(id, quantity);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la mise à jour du stock: $e');
    }
  }

  @override
  Future<Product> toggleAvailability(String id) async {
    try {
      final model = await _remoteDatasource.toggleAvailability(id);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors du changement de disponibilité du produit: $e');
    }
  }
}
