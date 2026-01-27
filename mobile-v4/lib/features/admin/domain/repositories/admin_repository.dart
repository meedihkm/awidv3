import '../entities/dashboard_stats.dart';
import '../entities/deliverer_location.dart';
import '../entities/order_summary.dart';

/// Admin Repository Interface
/// Interface du repository admin
abstract class AdminRepository {
  /// Get dashboard stats
  Future<DashboardStats> getDashboardStats();

  /// Get recent orders
  Future<List<OrderSummary>> getRecentOrders({int page = 1, int limit = 20, String? status});

  /// Get deliverers locations
  Future<List<DelivererLocation>> getDeliverersLocations();

  /// Get order by ID
  Future<OrderSummary> getOrderById(String id);
}
