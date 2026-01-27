import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/websocket_client.dart';
import '../../data/datasources/admin_remote_datasource.dart';
import '../../data/repositories/admin_repository_impl.dart';
import '../../domain/entities/dashboard_stats.dart';
import '../../domain/entities/order_summary.dart';
import '../../domain/entities/deliverer_location.dart';
import '../../domain/repositories/admin_repository.dart';

// Providers for dependencies
final adminRemoteDatasourceProvider = Provider<AdminRemoteDatasource>((ref) {
  return AdminRemoteDatasource(DioClient());
});

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  return AdminRepositoryImpl(ref.watch(adminRemoteDatasourceProvider));
});

final websocketClientProvider = Provider<WebSocketClient>((ref) {
  return WebSocketClient();
});

// Dashboard Stats Provider
final dashboardStatsProvider = StateNotifierProvider<DashboardStatsNotifier, AsyncValue<DashboardStats>>((ref) {
  return DashboardStatsNotifier(ref.watch(adminRepositoryProvider), ref.watch(websocketClientProvider));
});

class DashboardStatsNotifier extends StateNotifier<AsyncValue<DashboardStats>> {
  DashboardStatsNotifier(this._repository, this._websocketClient) : super(const AsyncValue.loading()) {
    _init();
  }
  final AdminRepository _repository;
  final WebSocketClient _websocketClient;

  Future<void> _init() async {
    await loadStats();
    _listenToStatsUpdates();
  }

  Future<void> loadStats() async {
    state = const AsyncValue.loading();
    try {
      final stats = await _repository.getDashboardStats();
      state = AsyncValue.data(stats);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  void _listenToStatsUpdates() {
    _websocketClient.listenToStats((data) {
      // Update stats from WebSocket
      if (data is Map<String, dynamic>) {
        try {
          // Parse and update stats
          loadStats();
        } catch (e) {
          // Ignore parsing errors
        }
      }
    });
  }

  @override
  void dispose() {
    _websocketClient.off('stats:updated');
    super.dispose();
  }
}

// Recent Orders Provider
final recentOrdersProvider = StateNotifierProvider<RecentOrdersNotifier, AsyncValue<List<OrderSummary>>>((ref) {
  return RecentOrdersNotifier(ref.watch(adminRepositoryProvider), ref.watch(websocketClientProvider));
});

class RecentOrdersNotifier extends StateNotifier<AsyncValue<List<OrderSummary>>> {
  RecentOrdersNotifier(this._repository, this._websocketClient) : super(const AsyncValue.loading()) {
    _init();
  }
  final AdminRepository _repository;
  final WebSocketClient _websocketClient;

  Future<void> _init() async {
    await loadOrders();
    _listenToOrderUpdates();
  }

  Future<void> loadOrders({String? status}) async {
    state = const AsyncValue.loading();
    try {
      final orders = await _repository.getRecentOrders(status: status);
      state = AsyncValue.data(orders);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  void _listenToOrderUpdates() {
    _websocketClient.listenToOrders((data) {
      // Reload orders when updated
      loadOrders();
    });
  }

  @override
  void dispose() {
    _websocketClient.off('order:created');
    _websocketClient.off('order:updated');
    super.dispose();
  }
}

// Deliverers Locations Provider
final deliverersLocationsProvider =
    StateNotifierProvider<DeliverersLocationsNotifier, AsyncValue<List<DelivererLocation>>>((ref) {
      return DeliverersLocationsNotifier(ref.watch(adminRepositoryProvider), ref.watch(websocketClientProvider));
    });

class DeliverersLocationsNotifier extends StateNotifier<AsyncValue<List<DelivererLocation>>> {
  DeliverersLocationsNotifier(this._repository, this._websocketClient) : super(const AsyncValue.loading()) {
    _init();
  }
  final AdminRepository _repository;
  final WebSocketClient _websocketClient;

  Future<void> _init() async {
    await loadLocations();
    _listenToLocationUpdates();
  }

  Future<void> loadLocations() async {
    state = const AsyncValue.loading();
    try {
      final locations = await _repository.getDeliverersLocations();
      state = AsyncValue.data(locations);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  void _listenToLocationUpdates() {
    _websocketClient.listenToLocation((data) {
      // Reload locations when updated
      loadLocations();
    });
  }

  @override
  void dispose() {
    _websocketClient.off('location:updated');
    super.dispose();
  }
}
