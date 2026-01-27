import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../../../core/network/dio_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/orders_remote_datasource.dart';
import '../../data/repositories/orders_repository_impl.dart';
import '../../domain/entities/order_detail.dart';
import '../../domain/repositories/orders_repository.dart';
import '../../domain/usecases/orders/assign_deliverer_usecase.dart';
import '../../domain/usecases/orders/get_order_detail_usecase.dart';

// Datasource Provider
final ordersRemoteDatasourceProvider = Provider<OrdersRemoteDatasource>((ref) {
  return OrdersRemoteDatasource(ref.watch(dioClientProvider));
});

// Repository Provider
final ordersRepositoryProvider = Provider<OrdersRepository>((ref) {
  return OrdersRepositoryImpl(ref.watch(ordersRemoteDatasourceProvider));
});

// Use Cases Providers
final getOrderDetailUseCaseProvider = Provider<GetOrderDetailUseCase>((ref) {
  return GetOrderDetailUseCase(ref.watch(ordersRepositoryProvider));
});

final assignDelivererUseCaseProvider = Provider<AssignDelivererUseCase>((ref) {
  return AssignDelivererUseCase(ref.watch(ordersRepositoryProvider));
});

// Orders List State Notifier
class OrdersListNotifier extends StateNotifier<AsyncValue<List<OrderDetail>>> {
  OrdersListNotifier(this._repository) : super(const AsyncValue.loading());

  final OrdersRepository _repository;

  String? _currentStatus;
  String? _currentCustomerId;
  String? _currentDelivererId;

  /// Load orders with filters
  Future<void> loadOrders({
    String? status,
    String? customerId,
    String? delivererId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    _currentStatus = status;
    _currentCustomerId = customerId;
    _currentDelivererId = delivererId;

    state = const AsyncValue.loading();

    try {
      final orders = await _repository.getOrders(
        status: status,
        customerId: customerId,
        delivererId: delivererId,
        startDate: startDate,
        endDate: endDate,
      );

      state = AsyncValue.data(orders);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Refresh orders with current filters
  Future<void> refresh() async {
    await loadOrders(status: _currentStatus, customerId: _currentCustomerId, delivererId: _currentDelivererId);
  }

  /// Clear filters
  Future<void> clearFilters() async {
    await loadOrders();
  }
}

// Orders List Provider
final ordersListProvider = StateNotifierProvider<OrdersListNotifier, AsyncValue<List<OrderDetail>>>((ref) {
  return OrdersListNotifier(ref.watch(ordersRepositoryProvider));
});

// Order Detail Provider
final orderDetailProvider = FutureProvider.family<OrderDetail, String>((ref, orderId) async {
  final useCase = ref.watch(getOrderDetailUseCaseProvider);
  return useCase.call(orderId);
});

// Order Actions State
class OrderActionsState {
  OrderActionsState({this.isLoading = false, this.error, this.success = false});
  final bool isLoading;
  final String? error;
  final bool success;

  OrderActionsState copyWith({bool? isLoading, String? error, bool? success}) {
    return OrderActionsState(isLoading: isLoading ?? this.isLoading, error: error, success: success ?? this.success);
  }
}

// Order Actions Notifier
class OrderActionsNotifier extends StateNotifier<OrderActionsState> {
  OrderActionsNotifier(this._repository, this._assignDelivererUseCase) : super(OrderActionsState());

  final OrdersRepository _repository;
  final AssignDelivererUseCase _assignDelivererUseCase;

  /// Update order status
  Future<void> updateStatus({required String orderId, required String status}) async {
    state = state.copyWith(isLoading: true, error: null, success: false);

    try {
      await _repository.updateOrderStatus(id: orderId, status: status);

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Assign deliverer to order
  Future<void> assignDeliverer({required String orderId, required String delivererId}) async {
    state = state.copyWith(isLoading: true, error: null, success: false);

    try {
      await _assignDelivererUseCase.call(orderId: orderId, delivererId: delivererId);

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Cancel order
  Future<void> cancelOrder({required String orderId, required String reason}) async {
    state = state.copyWith(isLoading: true, error: null, success: false);

    try {
      await _repository.cancelOrder(id: orderId, reason: reason);

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Reset state
  void reset() {
    state = OrderActionsState();
  }
}

// Order Actions Provider
final orderActionsProvider = StateNotifierProvider<OrderActionsNotifier, OrderActionsState>((ref) {
  return OrderActionsNotifier(ref.watch(ordersRepositoryProvider), ref.watch(assignDelivererUseCaseProvider));
});
