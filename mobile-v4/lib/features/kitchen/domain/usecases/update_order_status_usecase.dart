import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:awid_mobile/features/kitchen/domain/repositories/kitchen_repository.dart';
import 'package:awid_mobile/features/kitchen/domain/usecases/get_kitchen_orders_usecase.dart';

/// Use case pour mettre à jour le statut d'une commande
class UpdateOrderStatusUseCase {
  final KitchenRepository _repository;

  UpdateOrderStatusUseCase(this._repository);

  /// Mettre à jour le statut d'une commande
  Future<Result<KitchenOrder>> execute({
    required String orderId,
    required KitchenOrderStatus newStatus,
    String? stationId,
    String? staffId,
    String? notes,
  }) async {
    try {
      final order = await _repository.updateOrderStatus(
        orderId: orderId,
        status: newStatus,
        stationId: stationId,
        staffId: staffId,
        notes: notes,
      );
      return Result.success(order);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Démarrer la préparation d'une commande
  Future<Result<KitchenOrder>> startPreparation({
    required String orderId,
    String? stationId,
    String? staffId,
  }) async {
    return execute(
      orderId: orderId,
      newStatus: KitchenOrderStatus.preparing,
      stationId: stationId,
      staffId: staffId,
    );
  }

  /// Marquer une commande comme prête
  Future<Result<KitchenOrder>> markAsReady({
    required String orderId,
    String? notes,
  }) async {
    return execute(
      orderId: orderId,
      newStatus: KitchenOrderStatus.ready,
      notes: notes,
    );
  }

  /// Compléter une commande
  Future<Result<KitchenOrder>> complete({
    required String orderId,
    String? notes,
  }) async {
    return execute(
      orderId: orderId,
      newStatus: KitchenOrderStatus.completed,
      notes: notes,
    );
  }

  /// Annuler une commande
  Future<Result<KitchenOrder>> cancel({
    required String orderId,
    required String reason,
  }) async {
    return execute(
      orderId: orderId,
      newStatus: KitchenOrderStatus.cancelled,
      notes: reason,
    );
  }

  /// Assigner une commande à une station
  Future<Result<KitchenOrder>> assignToStation({
    required String orderId,
    required String stationId,
    String? staffId,
  }) async {
    try {
      final order = await _repository.assignOrderToStation(
        orderId: orderId,
        stationId: stationId,
        staffId: staffId,
      );
      return Result.success(order);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Changer la priorité d'une commande
  Future<Result<KitchenOrder>> changePriority({
    required String orderId,
    required OrderPriority priority,
  }) async {
    try {
      final order = await _repository.updateOrderPriority(
        orderId: orderId,
        priority: priority,
      );
      return Result.success(order);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Mettre à jour les notes d'une commande
  Future<Result<KitchenOrder>> updateNotes({
    required String orderId,
    required String notes,
  }) async {
    try {
      final order = await _repository.updateOrderNotes(
        orderId: orderId,
        notes: notes,
      );
      return Result.success(order);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Marquer un item comme préparé
  Future<Result<KitchenOrder>> markItemPrepared({
    required String orderId,
    required String itemId,
  }) async {
    try {
      final order = await _repository.markItemPrepared(
        orderId: orderId,
        itemId: itemId,
      );
      return Result.success(order);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
