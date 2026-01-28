import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';
import 'package:awid_mobile/features/kitchen/domain/repositories/kitchen_repository.dart';
import 'package:awid_mobile/features/kitchen/domain/usecases/get_kitchen_orders_usecase.dart';

/// Use case pour gérer le stock
class ManageStockUseCase {
  final KitchenRepository _repository;

  ManageStockUseCase(this._repository);

  /// Récupérer tous les articles en stock
  Future<Result<List<StockItem>>> getStockItems({
    String? category,
    StockLevel? level,
    bool forceRefresh = false,
  }) async {
    try {
      final items = await _repository.getStockItems(
        category: category,
        level: level,
        forceRefresh: forceRefresh,
      );
      return Result.success(items);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Récupérer un article par ID
  Future<Result<StockItem>> getStockItemById(String itemId) async {
    try {
      final item = await _repository.getStockItemById(itemId);
      return Result.success(item);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Récupérer les articles en stock bas
  Future<Result<List<StockItem>>> getLowStockItems() async {
    try {
      final items = await _repository.getStockItems();
      final lowStock = items.where((i) => i.isLow || i.isCritical).toList();
      return Result.success(lowStock);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Récupérer les articles en rupture
  Future<Result<List<StockItem>>> getOutOfStockItems() async {
    try {
      final items = await _repository.getStockItems();
      final outOfStock = items.where((i) => i.isOutOfStock).toList();
      return Result.success(outOfStock);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Récupérer les articles proches de l'expiration
  Future<Result<List<StockItem>>> getNearExpirationItems() async {
    try {
      final items = await _repository.getStockItems();
      final nearExpiration = items.where((i) => i.isNearExpiration).toList();
      return Result.success(nearExpiration);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Ajuster la quantité d'un article
  Future<Result<StockItem>> adjustQuantity({
    required String itemId,
    required double quantity,
    required StockMovementType type,
    String? reason,
    String? orderId,
  }) async {
    try {
      final item = await _repository.adjustStockQuantity(
        itemId: itemId,
        quantity: quantity,
        type: type,
        reason: reason,
        orderId: orderId,
      );
      return Result.success(item);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Ajouter du stock (réapprovisionnement)
  Future<Result<StockItem>> addStock({
    required String itemId,
    required double quantity,
    String? reason,
  }) async {
    return adjustQuantity(
      itemId: itemId,
      quantity: quantity,
      type: StockMovementType.stockIn,
      reason: reason,
    );
  }

  /// Retirer du stock (utilisation)
  Future<Result<StockItem>> removeStock({
    required String itemId,
    required double quantity,
    String? orderId,
    String? reason,
  }) async {
    return adjustQuantity(
      itemId: itemId,
      quantity: quantity,
      type: StockMovementType.stockOut,
      orderId: orderId,
      reason: reason,
    );
  }

  /// Déclarer une perte
  Future<Result<StockItem>> declareWaste({
    required String itemId,
    required double quantity,
    required String reason,
  }) async {
    return adjustQuantity(
      itemId: itemId,
      quantity: quantity,
      type: StockMovementType.waste,
      reason: reason,
    );
  }

  /// Récupérer l'historique des mouvements
  Future<Result<List<StockMovement>>> getStockMovements({
    String? itemId,
    DateTime? startDate,
    DateTime? endDate,
    StockMovementType? type,
  }) async {
    try {
      final movements = await _repository.getStockMovements(
        itemId: itemId,
        startDate: startDate,
        endDate: endDate,
        type: type,
      );
      return Result.success(movements);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Récupérer les alertes de stock
  Future<Result<List<StockAlert>>> getStockAlerts({
    bool activeOnly = true,
  }) async {
    try {
      final alerts = await _repository.getStockAlerts(activeOnly: activeOnly);
      return Result.success(alerts);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Résoudre une alerte
  Future<Result<void>> resolveAlert(String alertId) async {
    try {
      await _repository.resolveStockAlert(alertId);
      return Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Créer un article de stock
  Future<Result<StockItem>> createStockItem({
    required String productId,
    required String productName,
    required double currentQuantity,
    required double minimumQuantity,
    required double maximumQuantity,
    required StockUnit unit,
    String? category,
    String? supplier,
    String? location,
    String? barcode,
  }) async {
    try {
      final item = await _repository.createStockItem(
        productId: productId,
        productName: productName,
        currentQuantity: currentQuantity,
        minimumQuantity: minimumQuantity,
        maximumQuantity: maximumQuantity,
        unit: unit,
        category: category,
        supplier: supplier,
        location: location,
        barcode: barcode,
      );
      return Result.success(item);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  /// Mettre à jour un article de stock
  Future<Result<StockItem>> updateStockItem({
    required String itemId,
    double? minimumQuantity,
    double? maximumQuantity,
    String? location,
    String? supplier,
  }) async {
    try {
      final item = await _repository.updateStockItem(
        itemId: itemId,
        minimumQuantity: minimumQuantity,
        maximumQuantity: maximumQuantity,
        location: location,
        supplier: supplier,
      );
      return Result.success(item);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
