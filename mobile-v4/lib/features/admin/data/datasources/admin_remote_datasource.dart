import '../../../../core/network/dio_client.dart';
import '../../../../core/config/api_config.dart';
import '../models/dashboard_stats_model.dart';
import '../models/order_summary_model.dart';
import '../models/deliverer_location_model.dart';

/// Admin Remote Datasource
/// Source de données distante pour l'admin
class AdminRemoteDatasource {
  AdminRemoteDatasource(this._dioClient);
  final DioClient _dioClient;

  /// Get dashboard stats
  Future<DashboardStatsModel> getDashboardStats() async {
    try {
      final response = await _dioClient.get('/admin/stats');
      return DashboardStatsModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Erreur de récupération des stats: ${e.toString()}');
    }
  }

  /// Get recent orders
  Future<List<OrderSummaryModel>> getRecentOrders({int page = 1, int limit = 20, String? status}) async {
    try {
      final queryParams = {'page': page, 'limit': limit, if (status != null) 'status': status};

      final response = await _dioClient.get(ApiConfig.orders, queryParameters: queryParams);

      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.map((json) => OrderSummaryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Erreur de récupération des commandes: ${e.toString()}');
    }
  }

  /// Get deliverers locations
  Future<List<DelivererLocationModel>> getDeliverersLocations() async {
    try {
      final response = await _dioClient.get('/admin/deliverers/locations');

      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.map((json) => DelivererLocationModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Erreur de récupération des positions: ${e.toString()}');
    }
  }

  /// Get order by ID
  Future<OrderSummaryModel> getOrderById(String id) async {
    try {
      final response = await _dioClient.get(ApiConfig.orderById(id));
      return OrderSummaryModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Erreur de récupération de la commande: ${e.toString()}');
    }
  }
}
