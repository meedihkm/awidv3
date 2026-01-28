import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/deliverer_remote_datasource.dart';
import '../../data/repositories/deliverer_repository_impl.dart';
import '../../domain/entities/delivery.dart';
import '../../domain/entities/delivery_stats.dart';
import '../../domain/repositories/deliverer_repository.dart';
import '../../domain/usecases/get_deliveries_usecase.dart';

// Datasource Provider
final delivererRemoteDatasourceProvider = Provider<DelivererRemoteDatasource>((ref) {
  return DelivererRemoteDatasource(ref.watch(dioClientProvider));
});

// Repository Provider
final delivererRepositoryProvider = Provider<DelivererRepository>((ref) {
  return DelivererRepositoryImpl(ref.watch(delivererRemoteDatasourceProvider));
});

// Use Cases Providers
final getDeliveriesUseCaseProvider = Provider<GetDeliveriesUseCase>((ref) {
  return GetDeliveriesUseCase(ref.watch(delivererRepositoryProvider));
});

// Deliveries State Notifier
class DeliveriesNotifier extends StateNotifier<AsyncValue<List<Delivery>>> {
  DeliveriesNotifier(this._getDeliveriesUseCase) : super(const AsyncValue.loading());

  final GetDeliveriesUseCase _getDeliveriesUseCase;

  String? _currentStatus;
  DateTime? _currentDate;

  /// Load deliveries with filters
  Future<void> loadDeliveries({
    String? status,
    DateTime? date,
  }) async {
    _currentStatus = status;
    _currentDate = date;

    state = const AsyncValue.loading();

    try {
      final deliveries = await _getDeliveriesUseCase.call(
        status: status,
        date: date,
      );

      state = AsyncValue.data(deliveries);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Refresh deliveries with current filters
  Future<void> refresh() async {
    await loadDeliveries(
      status: _currentStatus,
      date: _currentDate,
    );
  }

  /// Clear filters
  Future<void> clearFilters() async {
    await loadDeliveries();
  }
}

// Deliveries Provider
final deliveriesProvider = StateNotifierProvider<DeliveriesNotifier, AsyncValue<List<Delivery>>>(
  (ref) {
    return DeliveriesNotifier(ref.watch(getDeliveriesUseCaseProvider));
  },
);

// Delivery Stats Provider
final deliveryStatsProvider = FutureProvider<DeliveryStats>((ref) async {
  final repository = ref.watch(delivererRepositoryProvider);
  return repository.getStats();
});

// Active Delivery Provider
final activeDeliveryProvider = FutureProvider<Delivery?>((ref) async {
  final repository = ref.watch(delivererRepositoryProvider);
  return repository.getActiveDelivery();
});

// Delivery Actions State
class DeliveryActionsState {
  DeliveryActionsState({
    this.isLoading = false,
    this.error,
    this.success = false,
  });
  final bool isLoading;
  final String? error;
  final bool success;

  DeliveryActionsState copyWith({
    bool? isLoading,
    String? error,
    bool? success,
  }) {
    return DeliveryActionsState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      success: success ?? this.success,
    );
  }
}

// Delivery Actions Notifier
class DeliveryActionsNotifier extends StateNotifier<DeliveryActionsState> {
  DeliveryActionsNotifier(this._repository) : super(DeliveryActionsState());

  final DelivererRepository _repository;

  /// Start delivery
  Future<void> startDelivery(String deliveryId) async {
    state = state.copyWith(isLoading: true, success: false);

    try {
      await _repository.startDelivery(deliveryId);

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Complete delivery
  Future<void> completeDelivery({
    required String deliveryId,
    String? notes,
    String? signatureUrl,
    String? photoUrl,
  }) async {
    state = state.copyWith(isLoading: true, success: false);

    try {
      await _repository.completeDelivery(
        deliveryId: deliveryId,
        notes: notes,
        signatureUrl: signatureUrl,
        photoUrl: photoUrl,
      );

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Update status
  Future<void> updateStatus({
    required String deliveryId,
    required String status,
  }) async {
    state = state.copyWith(isLoading: true, success: false);

    try {
      await _repository.updateDeliveryStatus(
        deliveryId: deliveryId,
        status: status,
      );

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Reset state
  void reset() {
    state = DeliveryActionsState();
  }
}

// Delivery Actions Provider
final deliveryActionsProvider = StateNotifierProvider<DeliveryActionsNotifier, DeliveryActionsState>(
  (ref) {
    return DeliveryActionsNotifier(ref.watch(delivererRepositoryProvider));
  },
);
