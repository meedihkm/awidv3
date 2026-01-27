import 'package:awid_mobile/features/kitchen/data/datasources/kitchen_local_datasource.dart';
import 'package:awid_mobile/features/kitchen/data/datasources/kitchen_remote_datasource.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_station.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_stats.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/production_task.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';
import 'package:awid_mobile/features/kitchen/domain/repositories/kitchen_repository.dart';

/// Implémentation du repository cuisine (offline-first)
class KitchenRepositoryImpl implements KitchenRepository {
  final KitchenRemoteDatasource _remoteDatasource;
  final KitchenLocalDatasource _localDatasource;

  KitchenRepositoryImpl(this._remoteDatasource, this._localDatasource);

  // ==================== ORDERS ====================

  @override
  Future<List<KitchenOrder>> getOrders({
    KitchenOrderStatus? status,
    OrderPriority? priority,
    String? stationId,
    DateTime? date,
    bool forceRefresh = false,
  }) async {
    try {
      // Essayer le cache d'abord si pas de refresh forcé
      if (!forceRefresh) {
        final cachedOrders = await _localDatasource.getCachedOrders();
        if (cachedOrders != null) {
          var orders = cachedOrders.map((m) => m.toEntity()).toList();

          // Appliquer les filtres
          if (status != null) {
            orders = orders.where((o) => o.status == status).toList();
          }
          if (priority != null) {
            orders = orders.where((o) => o.priority == priority).toList();
          }
          if (stationId != null) {
            orders = orders.where((o) => o.assignedStation == stationId).toList();
          }

          return orders;
        }
      }

      // Récupérer depuis l'API
      final models = await _remoteDatasource.getOrders(
        status: status,
        priority: priority,
        stationId: stationId,
        date: date,
      );

      // Mettre en cache
      await _localDatasource.cacheOrders(models);

      return models.map((m) => m.toEntity()).toList();
    } catch (e) {
      // En cas d'erreur, essayer le cache
      final cachedOrders = await _localDatasource.getCachedOrders();
      if (cachedOrders != null) {
        return cachedOrders.map((m) => m.toEntity()).toList();
      }
      rethrow;
    }
  }

  @override
  Future<KitchenOrder> getOrderById(String orderId) async {
    try {
      // Essayer le cache d'abord
      final cached = await _localDatasource.getCachedOrder(orderId);
      if (cached != null) {
        return cached.toEntity();
      }

      // Récupérer depuis l'API
      final model = await _remoteDatasource.getOrderById(orderId);

      // Mettre en cache
      await _localDatasource.cacheOrder(model);

      return model.toEntity();
    } catch (e) {
      // En cas d'erreur, essayer le cache
      final cached = await _localDatasource.getCachedOrder(orderId);
      if (cached != null) {
        return cached.toEntity();
      }
      rethrow;
    }
  }

  @override
  Future<KitchenOrder> updateOrderStatus({
    required String orderId,
    required KitchenOrderStatus status,
    String? stationId,
    String? staffId,
    String? notes,
  }) async {
    final model = await _remoteDatasource.updateOrderStatus(
      orderId: orderId,
      status: status,
      stationId: stationId,
      staffId: staffId,
      notes: notes,
    );

    // Mettre à jour le cache
    await _localDatasource.cacheOrder(model);

    return model.toEntity();
  }

  @override
  Future<KitchenOrder> assignOrderToStation({
    required String orderId,
    required String stationId,
    String? staffId,
  }) async {
    final model = await _remoteDatasource.assignOrderToStation(
      orderId: orderId,
      stationId: stationId,
      staffId: staffId,
    );

    await _localDatasource.cacheOrder(model);
    return model.toEntity();
  }

  @override
  Future<KitchenOrder> updateOrderPriority({
    required String orderId,
    required OrderPriority priority,
  }) async {
    final model = await _remoteDatasource.updateOrderPriority(
      orderId: orderId,
      priority: priority,
    );

    await _localDatasource.cacheOrder(model);
    return model.toEntity();
  }

  @override
  Future<KitchenOrder> updateOrderNotes({
    required String orderId,
    required String notes,
  }) async {
    final model = await _remoteDatasource.updateOrderNotes(
      orderId: orderId,
      notes: notes,
    );

    await _localDatasource.cacheOrder(model);
    return model.toEntity();
  }

  @override
  Future<KitchenOrder> markItemPrepared({
    required String orderId,
    required String itemId,
  }) async {
    final model = await _remoteDatasource.markItemPrepared(
      orderId: orderId,
      itemId: itemId,
    );

    await _localDatasource.cacheOrder(model);
    return model.toEntity();
  }

  // ==================== STATIONS ====================

  @override
  Future<List<KitchenStation>> getStations({
    StationType? type,
    StationStatus? status,
  }) async {
    try {
      // Essayer le cache d'abord
      final cached = await _localDatasource.getCachedStations();
      if (cached != null) {
        var stations = cached.map((m) => m.toEntity()).toList();

        // Appliquer les filtres
        if (type != null) {
          stations = stations.where((s) => s.type == type).toList();
        }
        if (status != null) {
          stations = stations.where((s) => s.status == status).toList();
        }

        return stations;
      }

      // Récupérer depuis l'API
      final models = await _remoteDatasource.getStations(
        type: type,
        status: status,
      );

      // Mettre en cache
      await _localDatasource.cacheStations(models);

      return models.map((m) => m.toEntity()).toList();
    } catch (e) {
      final cached = await _localDatasource.getCachedStations();
      if (cached != null) {
        return cached.map((m) => m.toEntity()).toList();
      }
      rethrow;
    }
  }

  @override
  Future<KitchenStation> getStationById(String stationId) async {
    final model = await _remoteDatasource.getStationById(stationId);
    return model.toEntity();
  }

  @override
  Future<KitchenStation> updateStationStatus({
    required String stationId,
    required StationStatus status,
  }) async {
    final model = await _remoteDatasource.updateStationStatus(
      stationId: stationId,
      status: status,
    );
    return model.toEntity();
  }

  @override
  Future<KitchenStation> assignStaffToStation({
    required String stationId,
    required String staffId,
  }) async {
    final model = await _remoteDatasource.assignStaffToStation(
      stationId: stationId,
      staffId: staffId,
    );
    return model.toEntity();
  }

  // ==================== STOCK ====================

  @override
  Future<List<StockItem>> getStockItems({
    String? category,
    StockLevel? level,
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh) {
        final cached = await _localDatasource.getCachedStockItems();
        if (cached != null) {
          var items = cached.map((m) => m.toEntity()).toList();

          if (category != null) {
            items = items.where((i) => i.category == category).toList();
          }
          if (level != null) {
            items = items.where((i) => i.stockLevel == level).toList();
          }

          return items;
        }
      }

      final models = await _remoteDatasource.getStockItems(
        category: category,
        level: level,
      );

      await _localDatasource.cacheStockItems(models);
      return models.map((m) => m.toEntity()).toList();
    } catch (e) {
      final cached = await _localDatasource.getCachedStockItems();
      if (cached != null) {
        return cached.map((m) => m.toEntity()).toList();
      }
      rethrow;
    }
  }

  @override
  Future<StockItem> getStockItemById(String itemId) async {
    try {
      final cached = await _localDatasource.getCachedStockItem(itemId);
      if (cached != null) {
        return cached.toEntity();
      }

      final model = await _remoteDatasource.getStockItemById(itemId);
      await _localDatasource.cacheStockItem(model);
      return model.toEntity();
    } catch (e) {
      final cached = await _localDatasource.getCachedStockItem(itemId);
      if (cached != null) {
        return cached.toEntity();
      }
      rethrow;
    }
  }

  @override
  Future<StockItem> adjustStockQuantity({
    required String itemId,
    required double quantity,
    required StockMovementType type,
    String? reason,
    String? orderId,
  }) async {
    final model = await _remoteDatasource.adjustStockQuantity(
      itemId: itemId,
      quantity: quantity,
      type: type,
      reason: reason,
      orderId: orderId,
    );

    await _localDatasource.cacheStockItem(model);
    return model.toEntity();
  }

  @override
  Future<StockItem> createStockItem({
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
    final data = {
      'productId': productId,
      'productName': productName,
      'currentQuantity': currentQuantity,
      'minimumQuantity': minimumQuantity,
      'maximumQuantity': maximumQuantity,
      'unit': unit.name,
      if (category != null) 'category': category,
      if (supplier != null) 'supplier': supplier,
      if (location != null) 'location': location,
      if (barcode != null) 'barcode': barcode,
    };

    final model = await _remoteDatasource.createStockItem(data);
    await _localDatasource.cacheStockItem(model);
    return model.toEntity();
  }

  @override
  Future<StockItem> updateStockItem({
    required String itemId,
    double? minimumQuantity,
    double? maximumQuantity,
    String? location,
    String? supplier,
  }) async {
    final data = <String, dynamic>{};
    if (minimumQuantity != null) data['minimumQuantity'] = minimumQuantity;
    if (maximumQuantity != null) data['maximumQuantity'] = maximumQuantity;
    if (location != null) data['location'] = location;
    if (supplier != null) data['supplier'] = supplier;

    final model = await _remoteDatasource.updateStockItem(
      itemId: itemId,
      data: data,
    );

    await _localDatasource.cacheStockItem(model);
    return model.toEntity();
  }

  @override
  Future<List<StockMovement>> getStockMovements({
    String? itemId,
    DateTime? startDate,
    DateTime? endDate,
    StockMovementType? type,
  }) async {
    final models = await _remoteDatasource.getStockMovements(
      itemId: itemId,
      startDate: startDate,
      endDate: endDate,
      type: type,
    );

    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<StockAlert>> getStockAlerts({bool activeOnly = true}) async {
    final models = await _remoteDatasource.getStockAlerts(
      activeOnly: activeOnly,
    );

    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> resolveStockAlert(String alertId) async {
    await _remoteDatasource.resolveStockAlert(alertId);
  }

  // ==================== STATISTICS ====================

  @override
  Future<KitchenStats> getStats({
    DateTime? date,
    bool forceRefresh = false,
  }) async {
    final targetDate = date ?? DateTime.now();

    try {
      if (!forceRefresh) {
        final cached = await _localDatasource.getCachedStats(targetDate);
        if (cached != null) {
          return cached.toEntity();
        }
      }

      final model = await _remoteDatasource.getStats(date: targetDate);
      await _localDatasource.cacheStats(model);
      return model.toEntity();
    } catch (e) {
      final cached = await _localDatasource.getCachedStats(targetDate);
      if (cached != null) {
        return cached.toEntity();
      }
      rethrow;
    }
  }

  @override
  Future<PeriodStats> getPeriodStats({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final model = await _remoteDatasource.getPeriodStats(
      startDate: startDate,
      endDate: endDate,
    );

    return model.toEntity();
  }

  @override
  Future<List<HourlyStats>> getHourlyStats({DateTime? date}) async {
    final models = await _remoteDatasource.getHourlyStats(date: date);
    return models.map((m) => m.toEntity()).toList();
  }

  // ==================== PRODUCTION TASKS ====================

  @override
  Future<List<ProductionTask>> getProductionTasks({
    TaskStatus? status,
    TaskType? type,
    String? stationId,
    DateTime? date,
  }) async {
    final models = await _remoteDatasource.getProductionTasks(
      status: status,
      type: type,
      stationId: stationId,
      date: date,
    );

    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<ProductionTask> getTaskById(String taskId) async {
    final model = await _remoteDatasource.getTaskById(taskId);
    return model.toEntity();
  }

  @override
  Future<ProductionTask> updateTaskStatus({
    required String taskId,
    required TaskStatus status,
    String? notes,
  }) async {
    final model = await _remoteDatasource.updateTaskStatus(
      taskId: taskId,
      status: status,
      notes: notes,
    );

    return model.toEntity();
  }

  @override
  Future<ProductionTask> assignTask({
    required String taskId,
    required String stationId,
    String? staffId,
  }) async {
    final model = await _remoteDatasource.assignTask(
      taskId: taskId,
      stationId: stationId,
      staffId: staffId,
    );

    return model.toEntity();
  }

  @override
  Future<ProductionTask> completeTaskStep({
    required String taskId,
    required String stepId,
    String? notes,
  }) async {
    final model = await _remoteDatasource.completeTaskStep(
      taskId: taskId,
      stepId: stepId,
      notes: notes,
    );

    return model.toEntity();
  }

  // ==================== REAL-TIME ====================

  @override
  Stream<KitchenOrder> watchOrderUpdates() {
    // TODO: Implémenter WebSocket pour les mises à jour temps réel
    throw UnimplementedError('WebSocket not implemented yet');
  }

  @override
  Stream<StockAlert> watchStockAlerts() {
    // TODO: Implémenter WebSocket pour les alertes temps réel
    throw UnimplementedError('WebSocket not implemented yet');
  }

  @override
  Stream<KitchenStats> watchStats() {
    // TODO: Implémenter WebSocket pour les stats temps réel
    throw UnimplementedError('WebSocket not implemented yet');
  }
}
