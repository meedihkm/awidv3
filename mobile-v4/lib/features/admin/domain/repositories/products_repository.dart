import '../entities/product.dart';

/// Products Repository Interface
/// Définit les opérations CRUD pour les produits
abstract class ProductsRepository {
  /// Get all products with optional filters
  Future<List<Product>> getProducts({int? page, int? limit, String? category, bool? isAvailable, String? search});

  /// Get product by ID
  Future<Product> getProductById(String id);

  /// Create new product
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
  });

  /// Update existing product
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
  });

  /// Delete product
  Future<void> deleteProduct(String id);

  /// Get product categories
  Future<List<String>> getCategories();

  /// Update product stock
  Future<Product> updateStock({required String id, required int quantity});

  /// Toggle product availability
  Future<Product> toggleAvailability(String id);
}
