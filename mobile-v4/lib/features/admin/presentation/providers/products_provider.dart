import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/products_remote_datasource.dart';
import '../../data/repositories/products_repository_impl.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/usecases/products/create_product_usecase.dart';
import '../../domain/usecases/products/delete_product_usecase.dart';
import '../../domain/usecases/products/get_products_usecase.dart';
import '../../domain/usecases/products/update_product_usecase.dart';

// Datasource Provider
final productsRemoteDatasourceProvider = Provider<ProductsRemoteDatasource>((ref) {
  return ProductsRemoteDatasource(ref.watch(dioClientProvider));
});

// Repository Provider
final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  return ProductsRepositoryImpl(ref.watch(productsRemoteDatasourceProvider));
});

// Use Cases Providers
final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  return GetProductsUseCase(ref.watch(productsRepositoryProvider));
});

final createProductUseCaseProvider = Provider<CreateProductUseCase>((ref) {
  return CreateProductUseCase(ref.watch(productsRepositoryProvider));
});

final updateProductUseCaseProvider = Provider<UpdateProductUseCase>((ref) {
  return UpdateProductUseCase(ref.watch(productsRepositoryProvider));
});

final deleteProductUseCaseProvider = Provider<DeleteProductUseCase>((ref) {
  return DeleteProductUseCase(ref.watch(productsRepositoryProvider));
});

// Products State Notifier
class ProductsNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  ProductsNotifier(this._getProductsUseCase) : super(const AsyncValue.loading());

  final GetProductsUseCase _getProductsUseCase;

  String? _currentCategory;
  bool? _currentIsAvailable;
  String? _currentSearch;

  /// Load products with filters
  Future<void> loadProducts({String? category, bool? isAvailable, String? search}) async {
    _currentCategory = category;
    _currentIsAvailable = isAvailable;
    _currentSearch = search;

    state = const AsyncValue.loading();

    try {
      final products = await _getProductsUseCase.call(category: category, isAvailable: isAvailable, search: search);

      state = AsyncValue.data(products);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Refresh products with current filters
  Future<void> refresh() async {
    await loadProducts(category: _currentCategory, isAvailable: _currentIsAvailable, search: _currentSearch);
  }

  /// Clear filters
  Future<void> clearFilters() async {
    await loadProducts();
  }
}

// Products Provider
final productsProvider = StateNotifierProvider<ProductsNotifier, AsyncValue<List<Product>>>((ref) {
  return ProductsNotifier(ref.watch(getProductsUseCaseProvider));
});

// Categories Provider
final categoriesProvider = FutureProvider<List<String>>((ref) async {
  final repository = ref.watch(productsRepositoryProvider);
  return repository.getCategories();
});

// Product Form State
class ProductFormState {
  ProductFormState({this.isLoading = false, this.error, this.success = false});
  final bool isLoading;
  final String? error;
  final bool success;

  ProductFormState copyWith({bool? isLoading, String? error, bool? success}) {
    return ProductFormState(isLoading: isLoading ?? this.isLoading, error: error, success: success ?? this.success);
  }
}

// Product Form Notifier
class ProductFormNotifier extends StateNotifier<ProductFormState> {
  ProductFormNotifier(this._createUseCase, this._updateUseCase, this._deleteUseCase) : super(ProductFormState());

  final CreateProductUseCase _createUseCase;
  final UpdateProductUseCase _updateUseCase;
  final DeleteProductUseCase _deleteUseCase;

  /// Create product
  Future<void> createProduct({
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
    state = state.copyWith(isLoading: true, error: null, success: false);

    try {
      await _createUseCase.call(
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

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Update product
  Future<void> updateProduct({
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
    state = state.copyWith(isLoading: true, error: null, success: false);

    try {
      await _updateUseCase.call(
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

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Delete product
  Future<void> deleteProduct(String id) async {
    state = state.copyWith(isLoading: true, error: null, success: false);

    try {
      await _deleteUseCase.call(id);

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Reset state
  void reset() {
    state = ProductFormState();
  }
}

// Product Form Provider
final productFormProvider = StateNotifierProvider<ProductFormNotifier, ProductFormState>((ref) {
  return ProductFormNotifier(
    ref.watch(createProductUseCaseProvider),
    ref.watch(updateProductUseCaseProvider),
    ref.watch(deleteProductUseCaseProvider),
  );
});
