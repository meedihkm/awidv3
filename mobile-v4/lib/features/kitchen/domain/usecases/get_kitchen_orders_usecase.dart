import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:awid_mobile/features/kitchen/domain/repositories/kitchen_repository.dart';

/// Use case pour récupérer les commandes de cuisine
class GetKitchenOrdersUseCase {
  final KitchenRepository _repository;

  GetKitchenOrdersUseCase(this._repository);

  /// Récupérer toutes les commandes
  Future<Result<List<KitchenOrder>>> execute({
    KitchenOrderStatus? status,
    OrderPriority? priority,
    String? stationId,
    DateTime? date,
    bool forceRefresh = false,
  }) async {
    try {
      final orders = await _repository.getOrders(
        status: status,
        priority: priority,
        stationId: stationId,
        date: date,
        forceRefresh: forceRefresh,
      );
      return Result.success(orders);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Récupérer une commande par ID
  Future<Result<KitchenOrder>> getById(String orderId) async {
    try {
      final order = await _repository.getOrderById(orderId);
      return Result.success(order);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Récupérer les commandes en attente
  Future<Result<List<KitchenOrder>>> getPendingOrders() async {
    return execute(status: KitchenOrderStatus.pending);
  }

  /// Récupérer les commandes en cours
  Future<Result<List<KitchenOrder>>> getActiveOrders() async {
    return execute(status: KitchenOrderStatus.preparing);
  }

  /// Récupérer les commandes prêtes
  Future<Result<List<KitchenOrder>>> getReadyOrders() async {
    return execute(status: KitchenOrderStatus.ready);
  }

  /// Récupérer les commandes urgentes
  Future<Result<List<KitchenOrder>>> getUrgentOrders() async {
    return execute(priority: OrderPriority.urgent);
  }

  /// Récupérer les commandes en retard
  Future<Result<List<KitchenOrder>>> getDelayedOrders() async {
    try {
      final orders = await _repository.getOrders();
      final delayed = orders.where((o) => o.isLate).toList();
      return Result.success(delayed);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

/// Résultat d'opération
class Result<T> {
  final T? data;
  final String? error;
  final bool isSuccess;

  Result._({this.data, this.error, required this.isSuccess});

  factory Result.success(T data) {
    return Result._(data: data, isSuccess: true);
  }

  factory Result.failure(String error) {
    return Result._(error: error, isSuccess: false);
  }

  bool get isFailure => !isSuccess;
}
