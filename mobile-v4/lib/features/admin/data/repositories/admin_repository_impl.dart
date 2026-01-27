import '../../domain/entities/dashboard_stats.dart';
import '../../domain/entities/deliverer_location.dart';
import '../../domain/entities/order_summary.dart';
import '../../domain/repositories/admin_repository.dart';
import '../datasources/admin_remote_datasource.dart';

/// Admin Repository Implementation
/// Implémentation du repository admin
class AdminRepositoryImpl implements AdminRepository {
  AdminRepositoryImpl(this._remoteDatasource);
  final AdminRemoteDatasource _remoteDatasource;

  @override
  Future<DashboardStats> getDashboardStats() async {
    try {
      final model = await _remoteDatasource.getDashboardStats();
      return model.toEntity();
    } catch (e) {
      throw Exception('Échec de récupération des stats: ${e.toString()}');
    }
  }

  @override
  Future<List<OrderSummary>> getRecentOrders({int page = 1, int limit = 20, String? status}) async {
    try {
      final models = await _remoteDatasource.getRecentOrders(page: page, limit: limit, status: status);
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Échec de récupération des commandes: ${e.toString()}');
    }
  }

  @override
  Future<List<DelivererLocation>> getDeliverersLocations() async {
    try {
      final models = await _remoteDatasource.getDeliverersLocations();
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Échec de récupération des positions: ${e.toString()}');
    }
  }

  @override
  Future<OrderSummary> getOrderById(String id) async {
    try {
      final model = await _remoteDatasource.getOrderById(id);
      return model.toEntity();
    } catch (e) {
      throw Exception('Échec de récupération de la commande: ${e.toString()}');
    }
  }
}
