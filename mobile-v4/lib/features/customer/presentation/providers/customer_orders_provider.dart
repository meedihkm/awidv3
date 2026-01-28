import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../core/providers/common_providers.dart';
import '../../../../core/storage/local_storage.dart';
import '../../domain/entities/customer_order.dart';
import '../../domain/usecases/get_orders_usecase.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../data/datasources/customer_remote_datasource.dart';
import '../../data/datasources/customer_local_datasource.dart';
import '../../data/repositories/customer_repository_impl.dart';

// ==================== PROVIDERS DE DÉPENDANCES ====================

/// Provider pour le datasource remote
final customerRemoteDatasourceProvider = Provider<CustomerRemoteDatasource>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return CustomerRemoteDatasource(dioClient);
});

/// Provider pour le datasource local
final customerLocalDatasourceProvider = Provider<CustomerLocalDatasource>((ref) {
  return CustomerLocalDatasource();
});

/// Provider pour le repository
final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  final remoteDatasource = ref.watch(customerRemoteDatasourceProvider);
  final localDatasource = ref.watch(customerLocalDatasourceProvider);
  return CustomerRepositoryImpl(remoteDatasource, localDatasource);
});

/// Provider pour le use case
final getOrdersUseCaseProvider = Provider<GetOrdersUseCase>((ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return GetOrdersUseCase(repository);
});

// ==================== PROVIDERS D'ÉTAT ====================

/// Provider pour les commandes du client
final customerOrdersProvider = StateNotifierProvider.family<
    CustomerOrdersNotifier, AsyncValue<List<CustomerOrder>>, String>(
  (ref, customerId) {
    final useCase = ref.watch(getOrdersUseCaseProvider);
    return CustomerOrdersNotifier(useCase, customerId);
  },
);

/// Provider pour une commande spécifique
final customerOrderProvider = FutureProvider.family<CustomerOrder?, String>(
  (ref, orderId) async {
    final useCase = ref.watch(getOrdersUseCaseProvider);
    final result = await useCase.getOrder(orderId);
    
    if (result is GetOrderSuccess) {
      return result.order;
    } else if (result is GetOrderFailure) {
      throw Exception(result.error);
    }
    throw Exception('Unknown result type');
  },
);

/// Provider pour les commandes actives
final activeOrdersProvider = FutureProvider.family<List<CustomerOrder>, String>(
  (ref, customerId) async {
    final useCase = ref.watch(getOrdersUseCaseProvider);
    final result = await useCase.getActiveOrders(customerId);
    
    if (result is GetOrdersSuccess) {
      return result.orders;
    } else if (result is GetOrdersFailure) {
      throw Exception(result.error);
    }
    throw Exception('Unknown result type');
  },
);

/// Provider pour la recherche de commandes
final searchOrdersProvider = FutureProvider.family<List<CustomerOrder>, SearchOrdersParams>(
  (ref, params) async {
    final useCase = ref.watch(getOrdersUseCaseProvider);
    final result = await useCase.searchOrders(params.customerId, params.query);
    
    if (result is GetOrdersSuccess) {
      return result.orders;
    } else if (result is GetOrdersFailure) {
      throw Exception(result.error);
    }
    throw Exception('Unknown result type');
  },
);

// ==================== STATE NOTIFIER ====================

/// Notifier pour les commandes du client
class CustomerOrdersNotifier extends StateNotifier<AsyncValue<List<CustomerOrder>>> {
  final GetOrdersUseCase _useCase;
  final String _customerId;

  CustomerOrdersNotifier(this._useCase, this._customerId) 
      : super(const AsyncValue.loading()) {
    loadOrders();
  }

  /// Charge les commandes
  Future<void> loadOrders({
    OrderStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    String? searchQuery,
    int? limit,
    int? offset,
  }) async {
    try {
      state = const AsyncValue.loading();
      
      final result = await _useCase.execute(GetOrdersParams(
        customerId: _customerId,
        status: status,
        startDate: startDate,
        endDate: endDate,
        searchQuery: searchQuery,
        limit: limit,
        offset: offset,
      ));

      if (result is GetOrdersSuccess) {
        state = AsyncValue.data(result.orders);
      } else if (result is GetOrdersFailure) {
        state = AsyncValue.error(result.error, StackTrace.current);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Rafraîchit les commandes
  Future<void> refresh() async {
    await loadOrders();
  }

  /// Filtre par statut
  Future<void> filterByStatus(OrderStatus status) async {
    await loadOrders(status: status);
  }

  /// Filtre par période
  Future<void> filterByPeriod(DateTime startDate, DateTime endDate) async {
    await loadOrders(startDate: startDate, endDate: endDate);
  }

  /// Recherche
  Future<void> search(String query) async {
    await loadOrders(searchQuery: query);
  }
}

// ==================== CLASSES AUXILIAIRES ====================

/// Paramètres pour la recherche de commandes
class SearchOrdersParams {
  final String customerId;
  final String query;

  const SearchOrdersParams({
    required this.customerId,
    required this.query,
  });
}
