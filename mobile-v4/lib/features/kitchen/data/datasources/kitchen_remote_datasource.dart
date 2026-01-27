import 'package:awid_mobile/core/network/dio_client.dart';
import 'package:awid_mobile/features/kitchen/data/models/kitchen_order_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/kitchen_station_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/kitchen_stats_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/production_task_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/stock_item_model.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_station.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/production_task.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';
import 'package:dio/dio.dart';

/// Datasource distant pour la cuisine
class KitchenRemoteDatasource {
  final DioClient _dioClient;

  KitchenRemoteDatasource(this._dioClient);

  // ==================== ORDERS ====================

  /// Récupérer les commandes
  Future<List<KitchenOrderModel>> getOrders({
    KitchenOrderStatus? status,
    OrderPriority? priority,
    String? stationId,
    DateTime? date,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (status != null) queryParams['status'] = status.name;
      if (priority != null) queryParams['priority'] = priority.name;
      if (stationId != null) queryParams['stationId'] = stationId;
      if (date != null) queryParams['date'] = date.toIso8601String();

      final response = await _dioClient.get(
        '/kitchen/orders',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => KitchenOrderModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Récupérer une commande par ID
  Future<KitchenOrderModel> getOrderById(String orderId) async {
    try {
      final response = await _dioClient.get('/kitchen/orders/$orderId');
      return KitchenOrderModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Mettre à jour le statut d'une commande
  Future<KitchenOrderModel> updateOrderStatus({
    required String orderId,
    required KitchenOrderStatus status,
    String? stationId,
    String? staffId,
    String? notes,
  }) async {
    try {
      final response = await _dioClient.patch(
        '/kitchen/orders/$orderId/status',
        data: {
          'status': status.name,
          if (stationId != null) 'stationId': stationId,
          if (staffId != null) 'staffId': staffId,
          if (notes != null) 'notes': notes,
        },
      );
      return KitchenOrderModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Assigner une commande à une station
  Future<KitchenOrderModel> assignOrderToStation({
    required String orderId,
    required String stationId,
    String? staffId,
  }) async {
    try {
      final response = await _dioClient.post(
        '/kitchen/orders/$orderId/assign',
        data: {
          'stationId': stationId,
          if (staffId != null) 'staffId': staffId,
        },
      );
      return KitchenOrderModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Mettre à jour la priorité
  Future<KitchenOrderModel> updateOrderPriority({
    required String orderId,
    required OrderPriority priority,
  }) async {
    try {
      final response = await _dioClient.patch(
        '/kitchen/orders/$orderId/priority',
        data: {'priority': priority.name},
      );
      return KitchenOrderModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Mettre à jour les notes
  Future<KitchenOrderModel> updateOrderNotes({
    required String orderId,
    required String notes,
  }) async {
    try {
      final response = await _dioClient.patch(
        '/kitchen/orders/$orderId/notes',
        data: {'notes': notes},
      );
      return KitchenOrderModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Marquer un item comme préparé
  Future<KitchenOrderModel> markItemPrepared({
    required String orderId,
    required String itemId,
  }) async {
    try {
      final response = await _dioClient.post(
        '/kitchen/orders/$orderId/items/$itemId/prepared',
      );
      return KitchenOrderModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==================== STATIONS ====================

  /// Récupérer les stations
  Future<List<KitchenStationModel>> getStations({
    StationType? type,
    StationStatus? status,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (type != null) queryParams['type'] = type.name;
      if (status != null) queryParams['status'] = status.name;

      final response = await _dioClient.get(
        '/kitchen/stations',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => KitchenStationModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Récupérer une station par ID
  Future<KitchenStationModel> getStationById(String stationId) async {
    try {
      final response = await _dioClient.get('/kitchen/stations/$stationId');
      return KitchenStationModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Mettre à jour le statut d'une station
  Future<KitchenStationModel> updateStationStatus({
    required String stationId,
    required StationStatus status,
  }) async {
    try {
      final response = await _dioClient.patch(
        '/kitchen/stations/$stationId/status',
        data: {'status': status.name},
      );
      return KitchenStationModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Assigner un staff à une station
  Future<KitchenStationModel> assignStaffToStation({
    required String stationId,
    required String staffId,
  }) async {
    try {
      final response = await _dioClient.post(
        '/kitchen/stations/$stationId/assign',
        data: {'staffId': staffId},
      );
      return KitchenStationModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==================== STOCK ====================

  /// Récupérer les articles en stock
  Future<List<StockItemModel>> getStockItems({
    String? category,
    StockLevel? level,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (category != null) queryParams['category'] = category;
      if (level != null) queryParams['level'] = level.name;

      final response = await _dioClient.get(
        '/kitchen/stock',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => StockItemModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Récupérer un article par ID
  Future<StockItemModel> getStockItemById(String itemId) async {
    try {
      final response = await _dioClient.get('/kitchen/stock/$itemId');
      return StockItemModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Ajuster la quantité
  Future<StockItemModel> adjustStockQuantity({
    required String itemId,
    required double quantity,
    required StockMovementType type,
    String? reason,
    String? orderId,
  }) async {
    try {
      final response = await _dioClient.post(
        '/kitchen/stock/$itemId/adjust',
        data: {
          'quantity': quantity,
          'type': type.name,
          if (reason != null) 'reason': reason,
          if (orderId != null) 'orderId': orderId,
        },
      );
      return StockItemModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Créer un article de stock
  Future<StockItemModel> createStockItem(Map<String, dynamic> data) async {
    try {
      final response = await _dioClient.post('/kitchen/stock', data: data);
      return StockItemModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Mettre à jour un article
  Future<StockItemModel> updateStockItem({
    required String itemId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dioClient.patch(
        '/kitchen/stock/$itemId',
        data: data,
      );
      return StockItemModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Récupérer l'historique des mouvements
  Future<List<StockMovementModel>> getStockMovements({
    String? itemId,
    DateTime? startDate,
    DateTime? endDate,
    StockMovementType? type,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (itemId != null) queryParams['itemId'] = itemId;
      if (startDate != null) queryParams['startDate'] = startDate.toIso8601String();
      if (endDate != null) queryParams['endDate'] = endDate.toIso8601String();
      if (type != null) queryParams['type'] = type.name;

      final response = await _dioClient.get(
        '/kitchen/stock/movements',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => StockMovementModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Récupérer les alertes
  Future<List<StockAlertModel>> getStockAlerts({bool activeOnly = true}) async {
    try {
      final response = await _dioClient.get(
        '/kitchen/stock/alerts',
        queryParameters: {'activeOnly': activeOnly},
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => StockAlertModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Résoudre une alerte
  Future<void> resolveStockAlert(String alertId) async {
    try {
      await _dioClient.post('/kitchen/stock/alerts/$alertId/resolve');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==================== STATISTICS ====================

  /// Récupérer les statistiques
  Future<KitchenStatsModel> getStats({DateTime? date}) async {
    try {
      final queryParams = <String, dynamic>{};
      if (date != null) queryParams['date'] = date.toIso8601String();

      final response = await _dioClient.get(
        '/kitchen/stats',
        queryParameters: queryParams,
      );

      return KitchenStatsModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Récupérer les statistiques par période
  Future<PeriodStatsModel> getPeriodStats({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final response = await _dioClient.get(
        '/kitchen/stats/period',
        queryParameters: {
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
        },
      );

      return PeriodStatsModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Récupérer les statistiques horaires
  Future<List<HourlyStatsModel>> getHourlyStats({DateTime? date}) async {
    try {
      final queryParams = <String, dynamic>{};
      if (date != null) queryParams['date'] = date.toIso8601String();

      final response = await _dioClient.get(
        '/kitchen/stats/hourly',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => HourlyStatsModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==================== PRODUCTION TASKS ====================

  /// Récupérer les tâches
  Future<List<ProductionTaskModel>> getProductionTasks({
    TaskStatus? status,
    TaskType? type,
    String? stationId,
    DateTime? date,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (status != null) queryParams['status'] = status.name;
      if (type != null) queryParams['type'] = type.name;
      if (stationId != null) queryParams['stationId'] = stationId;
      if (date != null) queryParams['date'] = date.toIso8601String();

      final response = await _dioClient.get(
        '/kitchen/tasks',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => ProductionTaskModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Récupérer une tâche par ID
  Future<ProductionTaskModel> getTaskById(String taskId) async {
    try {
      final response = await _dioClient.get('/kitchen/tasks/$taskId');
      return ProductionTaskModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Mettre à jour le statut d'une tâche
  Future<ProductionTaskModel> updateTaskStatus({
    required String taskId,
    required TaskStatus status,
    String? notes,
  }) async {
    try {
      final response = await _dioClient.patch(
        '/kitchen/tasks/$taskId/status',
        data: {
          'status': status.name,
          if (notes != null) 'notes': notes,
        },
      );
      return ProductionTaskModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Assigner une tâche
  Future<ProductionTaskModel> assignTask({
    required String taskId,
    required String stationId,
    String? staffId,
  }) async {
    try {
      final response = await _dioClient.post(
        '/kitchen/tasks/$taskId/assign',
        data: {
          'stationId': stationId,
          if (staffId != null) 'staffId': staffId,
        },
      );
      return ProductionTaskModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Compléter une étape
  Future<ProductionTaskModel> completeTaskStep({
    required String taskId,
    required String stepId,
    String? notes,
  }) async {
    try {
      final response = await _dioClient.post(
        '/kitchen/tasks/$taskId/steps/$stepId/complete',
        data: {
          if (notes != null) 'notes': notes,
        },
      );
      return ProductionTaskModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ==================== ERROR HANDLING ====================

  Exception _handleError(DioException error) {
    if (error.response != null) {
      final message = error.response?.data['message'] ?? 'Erreur serveur';
      return Exception(message);
    } else if (error.type == DioExceptionType.connectionTimeout) {
      return Exception('Délai de connexion dépassé');
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return Exception('Délai de réception dépassé');
    } else {
      return Exception('Erreur réseau: ${error.message}');
    }
  }
}
