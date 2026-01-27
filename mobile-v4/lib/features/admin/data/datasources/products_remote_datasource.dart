import '../../../../core/network/dio_client.dart';
import '../models/product_model.dart';

/// Products Remote Datasource
/// Gère les appels API pour les produits
class ProductsRemoteDatasource {
  const ProductsRemoteDatasource(this._dioClient);

  final DioClient _dioClient;

  /// Get all products
  Future<List<ProductModel>> getProducts({
    int? page,
    int? limit,
    String? category,
    bool? isAvailable,
    String? search,
  }) async {
    final queryParams = <String, dynamic>{};

    if (page != null) queryParams['page'] = page;
    if (limit != null) queryParams['limit'] = limit;
    if (category != null) queryParams['category'] = category;
    if (isAvailable != null) queryParams['is_available'] = isAvailable;
    if (search != null) queryParams['search'] = search;

    final response = await _dioClient.get('/api/v1/products', queryParameters: queryParams);

    final List<dynamic> data = response.data['data'] ?? response.data;
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }

  /// Get product by ID
  Future<ProductModel> getProductById(String id) async {
    final response = await _dioClient.get('/api/v1/products/$id');

    return ProductModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Create product
  Future<ProductModel> createProduct(Map<String, dynamic> data) async {
    final response = await _dioClient.post('/api/v1/products', data: data);

    return ProductModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Update product
  Future<ProductModel> updateProduct(String id, Map<String, dynamic> data) async {
    final response = await _dioClient.put('/api/v1/products/$id', data: data);

    return ProductModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Delete product
  Future<void> deleteProduct(String id) async {
    await _dioClient.delete('/api/v1/products/$id');
  }

  /// Get categories
  Future<List<String>> getCategories() async {
    final response = await _dioClient.get('/api/v1/products/categories');

    final List<dynamic> data = response.data['data'] ?? response.data;
    return data.map((item) => item.toString()).toList();
  }

  /// Update stock
  Future<ProductModel> updateStock(String id, int quantity) async {
    final response = await _dioClient.patch('/api/v1/products/$id/stock', data: {'quantity': quantity});

    return ProductModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Toggle availability
  Future<ProductModel> toggleAvailability(String id) async {
    final response = await _dioClient.patch('/api/v1/products/$id/availability');

    return ProductModel.fromJson(response.data['data'] ?? response.data);
  }
}
