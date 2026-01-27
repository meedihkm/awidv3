import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:awid_mobile/features/kitchen/domain/repositories/kitchen_repository.dart';
import 'package:awid_mobile/features/kitchen/domain/usecases/get_kitchen_orders_usecase.dart';
import 'package:awid_mobile/features/kitchen/domain/usecases/update_order_status_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// État des commandes cuisine
class KitchenOrdersState {
  final List<KitchenOrder> orders;
  final bool isLoading;
  final String? error;
  final KitchenOrderStatus? filterStatus;
  final OrderPriority? filterPriority;

  KitchenOrdersState({
    this.orders = const [],
    this.isLoading = false,
    this.error,
    this.filterStatus,
    this.filterPriority,
  });

  KitchenOrdersState copyWith({
    List<KitchenOrder>? orders,
    bool? isLoading,
    String? error,
    KitchenOrderStatus? filterStatus,
    OrderPriority? filterPriority,
    bool clearError = false,
    bool clearFilterStatus = false,
    bool clearFilterPriority = false,
  }) {
    return KitchenOrdersState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      filterStatus: clearFilterStatus ? null : (filterStatus ?? this.filterStatus),
      filterPriority: clearFilterPriority ? null : (filterPriority ?? this.filterPriority),
    );
  }

  /// Commandes filtrées
  List<KitchenOrder> get filteredOrders {
    var filtered = orders;

    if (filterStatus != null) {
      filtered = filtered.where((o) => o.status == filterStatus).toList();
    }

    if (filterPriority != null) {
      filtered = filtered.where((o) => o.priority == filterPriority).toList();
    }

    return filtered;
  }

  /// Commandes par statut
  List<KitchenOrder> ordersByStatus(KitchenOrderStatus status) {
    return orders.where((o) => o.status == status).toList();
  }

  /// Commandes en attente
  List<KitchenOrder> get pendingOrders => ordersByStatus(KitchenOrderStatus.pending);

  /// Commandes en cours
  List<KitchenOrder> get preparingOrders => ordersByStatus(KitchenOrderStatus.preparing);

  /// Commandes prêtes
  List<KitchenOrder> get readyOrders => ordersByStatus(KitchenOrderStatus.ready);

  /// Commandes urgentes
  List<KitchenOrder> get urgentOrders {
    return orders.where((o) => o.isUrgent || o.priority == OrderPriority.urgent).toList();
  }

  /// Commandes en retard
  List<KitchenOrder> get delayedOrders {
    return orders.where((o) => o.isLate).toList();
  }
}

/// Provider pour les commandes cuisine
class KitchenOrdersNotifier extends StateNotifier<KitchenOrdersState> {
  final GetKitchenOrdersUseCase _getOrdersUseCase;
  final UpdateOrderStatusUseCase _updateStatusUseCase;

  KitchenOrdersNotifier(
    this._getOrdersUseCase,
    this._updateStatusUseCase,
  ) : super(KitchenOrdersState());

  /// Charger les commandes
  Future<void> loadOrders({bool forceRefresh = false}) async {
    state = state.copyWith(isLoading: true, clearError: true);

    final result = await _getOrdersUseCase.execute(
      status: state.filterStatus,
      priority: state.filterPriority,
      forceRefresh: forceRefresh,
    );

    if (result.isSuccess) {
      state = state.copyWith(
        orders: result.data!,
        isLoading: false,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.error,
      );
    }
  }

  /// Rafraîchir les commandes
  Future<void> refresh() async {
    await loadOrders(forceRefresh: true);
  }

  /// Filtrer par statut
  void filterByStatus(KitchenOrderStatus? status) {
    state = state.copyWith(filterStatus: status);
    loadOrders();
  }

  /// Filtrer par priorité
  void filterByPriority(OrderPriority? priority) {
    state = state.copyWith(filterPriority: priority);
    loadOrders();
  }

  /// Réinitialiser les filtres
  void clearFilters() {
    state = state.copyWith(
      clearFilterStatus: true,
      clearFilterPriority: true,
    );
    loadOrders();
  }

  /// Démarrer la préparation
  Future<void> startPreparation(String orderId, {String? stationId, String? staffId}) async {
    final result = await _updateStatusUseCase.startPreparation(
      orderId: orderId,
      stationId: stationId,
      staffId: staffId,
    );

    if (result.isSuccess) {
      _updateOrderInState(result.data!);
    }
  }

  /// Marquer comme prêt
  Future<void> markAsReady(String orderId, {String? notes}) async {
    final result = await _updateStatusUseCase.markAsReady(
      orderId: orderId,
      notes: notes,
    );

    if (result.isSuccess) {
      _updateOrderInState(result.data!);
    }
  }

  /// Compléter la commande
  Future<void> complete(String orderId, {String? notes}) async {
    final result = await _updateStatusUseCase.complete(
      orderId: orderId,
      notes: notes,
    );

    if (result.isSuccess) {
      _updateOrderInState(result.data!);
    }
  }

  /// Annuler la commande
  Future<void> cancel(String orderId, String reason) async {
    final result = await _updateStatusUseCase.cancel(
      orderId: orderId,
      reason: reason,
    );

    if (result.isSuccess) {
      _updateOrderInState(result.data!);
    }
  }

  /// Changer la priorité
  Future<void> changePriority(String orderId, OrderPriority priority) async {
    final result = await _updateStatusUseCase.changePriority(
      orderId: orderId,
      priority: priority,
    );

    if (result.isSuccess) {
      _updateOrderInState(result.data!);
    }
  }

  /// Mettre à jour une commande dans l'état
  void _updateOrderInState(KitchenOrder updatedOrder) {
    final updatedOrders = state.orders.map((order) {
      return order.id == updatedOrder.id ? updatedOrder : order;
    }).toList();

    state = state.copyWith(orders: updatedOrders);
  }
}

/// Provider Riverpod pour les commandes
final kitchenOrdersProvider = StateNotifierProvider<KitchenOrdersNotifier, KitchenOrdersState>((ref) {
  // TODO: Injecter les dépendances réelles
  throw UnimplementedError('Provider dependencies not configured');
});

/// Provider pour une commande spécifique
final kitchenOrderProvider = FutureProvider.family<KitchenOrder, String>((ref, orderId) async {
  // TODO: Implémenter récupération commande par ID
  throw UnimplementedError();
});
