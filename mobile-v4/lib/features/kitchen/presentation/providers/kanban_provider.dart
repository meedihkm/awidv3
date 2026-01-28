import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// État du Kanban
class KanbanState {
  final Map<KitchenOrderStatus, List<KitchenOrder>> columns;
  final bool isLoading;
  final String? error;

  KanbanState({
    Map<KitchenOrderStatus, List<KitchenOrder>>? columns,
    this.isLoading = false,
    this.error,
  }) : columns = columns ?? {
          KitchenOrderStatus.pending: [],
          KitchenOrderStatus.preparing: [],
          KitchenOrderStatus.ready: [],
          KitchenOrderStatus.completed: [],
        };

  KanbanState copyWith({
    Map<KitchenOrderStatus, List<KitchenOrder>>? columns,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return KanbanState(
      columns: columns ?? this.columns,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }

  /// Nombre total de commandes
  int get totalOrders {
    return columns.values.fold(0, (sum, orders) => sum + orders.length);
  }

  /// Commandes par colonne
  List<KitchenOrder> ordersInColumn(KitchenOrderStatus status) {
    return columns[status] ?? [];
  }
}

/// Notifier pour le Kanban
class KanbanNotifier extends StateNotifier<KanbanState> {
  KanbanNotifier() : super(KanbanState());

  /// Charger les commandes dans le Kanban
  void loadOrders(List<KitchenOrder> orders) {
    final columns = <KitchenOrderStatus, List<KitchenOrder>>{
      KitchenOrderStatus.pending: [],
      KitchenOrderStatus.preparing: [],
      KitchenOrderStatus.ready: [],
      KitchenOrderStatus.completed: [],
    };

    for (final order in orders) {
      if (columns.containsKey(order.status)) {
        columns[order.status]!.add(order);
      }
    }

    // Trier par priorité et heure
    for (final status in columns.keys) {
      columns[status]!.sort((a, b) {
        // Priorité d'abord
        final priorityCompare = b.priority.index.compareTo(a.priority.index);
        if (priorityCompare != 0) return priorityCompare;
        
        // Puis par heure de commande
        return a.orderTime.compareTo(b.orderTime);
      });
    }

    state = state.copyWith(columns: columns);
  }

  /// Déplacer une commande entre colonnes
  void moveOrder(
    KitchenOrder order,
    KitchenOrderStatus fromStatus,
    KitchenOrderStatus toStatus,
  ) {
    final newColumns = Map<KitchenOrderStatus, List<KitchenOrder>>.from(state.columns);

    // Retirer de l'ancienne colonne
    newColumns[fromStatus] = newColumns[fromStatus]!.where((o) => o.id != order.id).toList();

    // Ajouter à la nouvelle colonne
    final updatedOrder = order.copyWith(status: toStatus);
    newColumns[toStatus] = [...newColumns[toStatus]!, updatedOrder];

    state = state.copyWith(columns: newColumns);
  }

  /// Mettre à jour une commande
  void updateOrder(KitchenOrder updatedOrder) {
    final newColumns = Map<KitchenOrderStatus, List<KitchenOrder>>.from(state.columns);

    for (final status in newColumns.keys) {
      newColumns[status] = newColumns[status]!.map((order) {
        return order.id == updatedOrder.id ? updatedOrder : order;
      }).toList();
    }

    state = state.copyWith(columns: newColumns);
  }
}

/// Provider pour le Kanban
final kanbanProvider = StateNotifierProvider<KanbanNotifier, KanbanState>((ref) {
  return KanbanNotifier();
});
