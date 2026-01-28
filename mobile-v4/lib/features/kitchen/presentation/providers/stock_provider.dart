import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';
import 'package:awid_mobile/features/kitchen/domain/usecases/manage_stock_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

/// État du stock
class StockState {
  final List<StockItem> items;
  final List<StockAlert> alerts;
  final bool isLoading;
  final String? error;

  StockState({
    this.items = const [],
    this.alerts = const [],
    this.isLoading = false,
    this.error,
  });

  StockState copyWith({
    List<StockItem>? items,
    List<StockAlert>? alerts,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return StockState(
      items: items ?? this.items,
      alerts: alerts ?? this.alerts,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }

  /// Articles en stock bas
  List<StockItem> get lowStockItems {
    return items.where((i) => i.isLow || i.isCritical).toList();
  }

  /// Articles en rupture
  List<StockItem> get outOfStockItems {
    return items.where((i) => i.isOutOfStock).toList();
  }

  /// Alertes actives
  List<StockAlert> get activeAlerts {
    return alerts.where((a) => a.isActive).toList();
  }
}

/// Notifier pour le stock
class StockNotifier extends StateNotifier<StockState> {
  final ManageStockUseCase _manageStockUseCase;

  StockNotifier(this._manageStockUseCase) : super(StockState());

  /// Charger les articles
  Future<void> loadItems({bool forceRefresh = false}) async {
    state = state.copyWith(isLoading: true, clearError: true);

    final result = await _manageStockUseCase.getStockItems(
      forceRefresh: forceRefresh,
    );

    if (result.isSuccess) {
      state = state.copyWith(
        items: result.data!,
        isLoading: false,
      );
      await _loadAlerts();
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.error,
      );
    }
  }

  /// Charger les alertes
  Future<void> _loadAlerts() async {
    final result = await _manageStockUseCase.getStockAlerts();
    if (result.isSuccess) {
      state = state.copyWith(alerts: result.data!);
    }
  }

  /// Ajuster la quantité
  Future<void> adjustQuantity({
    required String itemId,
    required double quantity,
    required StockMovementType type,
    String? reason,
  }) async {
    final result = await _manageStockUseCase.adjustQuantity(
      itemId: itemId,
      quantity: quantity,
      type: type,
      reason: reason,
    );

    if (result.isSuccess) {
      await loadItems(forceRefresh: true);
    }
  }
}

/// Provider pour le stock
final stockProvider = StateNotifierProvider<StockNotifier, StockState>((ref) {
  // TODO: Injecter dépendances
  throw UnimplementedError();
});
