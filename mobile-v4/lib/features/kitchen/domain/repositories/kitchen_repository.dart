import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_station.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_stats.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/production_task.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';

/// Interface du repository pour la cuisine
abstract class KitchenRepository {
  // ==================== ORDERS ====================
  
  /// Récupérer les commandes
  Future<List<KitchenOrder>> getOrders({
    KitchenOrderStatus? status,
    OrderPriority? priority,
    String? stationId,
    DateTime? date,
    bool forceRefresh = false,
  });

  /// Récupérer une commande par ID
  Future<KitchenOrder> getOrderById(String orderId);

  /// Mettre à jour le statut d'une commande
  Future<KitchenOrder> updateOrderStatus({
    required String orderId,
    required KitchenOrderStatus status,
    String? stationId,
    String? staffId,
    String? notes,
  });

  /// Assigner une commande à une station
  Future<KitchenOrder> assignOrderToStation({
    required String orderId,
    required String stationId,
    String? staffId,
  });

  /// Mettre à jour la priorité d'une commande
  Future<KitchenOrder> updateOrderPriority({
    required String orderId,
    required OrderPriority priority,
  });

  /// Mettre à jour les notes d'une commande
  Future<KitchenOrder> updateOrderNotes({
    required String orderId,
    required String notes,
  });

  /// Marquer un item comme préparé
  Future<KitchenOrder> markItemPrepared({
    required String orderId,
    required String itemId,
  });

  // ==================== STATIONS ====================
  
  /// Récupérer les stations
  Future<List<KitchenStation>> getStations({
    StationType? type,
    StationStatus? status,
  });

  /// Récupérer une station par ID
  Future<KitchenStation> getStationById(String stationId);

  /// Mettre à jour le statut d'une station
  Future<KitchenStation> updateStationStatus({
    required String stationId,
    required StationStatus status,
  });

  /// Assigner un staff à une station
  Future<KitchenStation> assignStaffToStation({
    required String stationId,
    required String staffId,
  });

  // ==================== STOCK ====================
  
  /// Récupérer les articles en stock
  Future<List<StockItem>> getStockItems({
    String? category,
    StockLevel? level,
    bool forceRefresh = false,
  });

  /// Récupérer un article par ID
  Future<StockItem> getStockItemById(String itemId);

  /// Ajuster la quantité d'un article
  Future<StockItem> adjustStockQuantity({
    required String itemId,
    required double quantity,
    required StockMovementType type,
    String? reason,
    String? orderId,
  });

  /// Créer un article de stock
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
  });

  /// Mettre à jour un article de stock
  Future<StockItem> updateStockItem({
    required String itemId,
    double? minimumQuantity,
    double? maximumQuantity,
    String? location,
    String? supplier,
  });

  /// Récupérer l'historique des mouvements
  Future<List<StockMovement>> getStockMovements({
    String? itemId,
    DateTime? startDate,
    DateTime? endDate,
    StockMovementType? type,
  });

  /// Récupérer les alertes de stock
  Future<List<StockAlert>> getStockAlerts({
    bool activeOnly = true,
  });

  /// Résoudre une alerte
  Future<void> resolveStockAlert(String alertId);

  // ==================== STATISTICS ====================
  
  /// Récupérer les statistiques
  Future<KitchenStats> getStats({
    DateTime? date,
    bool forceRefresh = false,
  });

  /// Récupérer les statistiques par période
  Future<PeriodStats> getPeriodStats({
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Récupérer les statistiques horaires
  Future<List<HourlyStats>> getHourlyStats({
    DateTime? date,
  });

  // ==================== PRODUCTION TASKS ====================
  
  /// Récupérer les tâches de production
  Future<List<ProductionTask>> getProductionTasks({
    TaskStatus? status,
    TaskType? type,
    String? stationId,
    DateTime? date,
  });

  /// Récupérer une tâche par ID
  Future<ProductionTask> getTaskById(String taskId);

  /// Mettre à jour le statut d'une tâche
  Future<ProductionTask> updateTaskStatus({
    required String taskId,
    required TaskStatus status,
    String? notes,
  });

  /// Assigner une tâche
  Future<ProductionTask> assignTask({
    required String taskId,
    required String stationId,
    String? staffId,
  });

  /// Compléter une étape de tâche
  Future<ProductionTask> completeTaskStep({
    required String taskId,
    required String stepId,
    String? notes,
  });

  // ==================== REAL-TIME ====================
  
  /// Stream des mises à jour de commandes
  Stream<KitchenOrder> watchOrderUpdates();

  /// Stream des alertes de stock
  Stream<StockAlert> watchStockAlerts();

  /// Stream des statistiques
  Stream<KitchenStats> watchStats();
}
