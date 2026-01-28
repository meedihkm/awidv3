import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Auth
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

// Admin
import '../../features/admin/presentation/pages/admin_dashboard_page.dart';
import '../../features/admin/presentation/pages/users_page.dart';
import '../../features/admin/presentation/pages/products_page.dart';
import '../../features/admin/presentation/pages/order_detail_page.dart' as admin;

// Kitchen
import '../../features/kitchen/presentation/pages/kitchen_dashboard_page.dart';
import '../../features/kitchen/presentation/pages/kanban_board_page.dart';
import '../../features/kitchen/presentation/pages/stock_management_page.dart';
import '../../features/kitchen/presentation/pages/production_stats_page.dart';
import '../../features/kitchen/presentation/pages/order_detail_page.dart' as kitchen;

// Deliverer
import '../../features/deliverer/presentation/pages/deliverer_dashboard_page.dart';
import '../../features/deliverer/presentation/pages/deliveries_list_page.dart';
import '../../features/deliverer/presentation/pages/delivery_detail_page.dart';
import '../../features/deliverer/presentation/pages/route_map_page.dart';
import '../../features/deliverer/presentation/pages/proof_of_delivery_page.dart';
import '../../features/deliverer/presentation/pages/payment_collection_page.dart';
import '../../features/deliverer/presentation/pages/packaging_management_page.dart';
import '../../features/deliverer/presentation/pages/delivery_history_page.dart';
import '../../features/deliverer/presentation/pages/earnings_page.dart';

// Customer
import '../../features/customer/presentation/pages/customer_dashboard_page.dart';
import '../../features/customer/presentation/pages/customer_orders_page.dart';
import '../../features/customer/presentation/pages/customer_order_detail_page.dart';
import '../../features/customer/presentation/pages/customer_delivery_tracking_page.dart';
import '../../features/customer/presentation/pages/customer_credit_page.dart';
import '../../features/customer/presentation/pages/customer_packaging_page.dart';
import '../../features/customer/presentation/pages/customer_history_page.dart';
import '../../features/customer/presentation/pages/customer_account_page.dart';

import '../constants/app_constants.dart';

/// App Router
/// Configuration du routage avec GoRouter
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppConstants.routeLogin,
    routes: [
      // ==================== AUTH ====================
      GoRoute(
        path: AppConstants.routeLogin,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppConstants.routeRegister,
        builder: (context, state) => const RegisterPage(),
      ),

      // ==================== ADMIN ====================
      GoRoute(
        path: AppConstants.routeAdminDashboard,
        builder: (context, state) => const AdminDashboardPage(),
      ),
      GoRoute(
        path: AppConstants.routeAdminUsers,
        builder: (context, state) => const UsersPage(),
      ),
      GoRoute(
        path: AppConstants.routeAdminProducts,
        builder: (context, state) => const ProductsPage(),
      ),
      GoRoute(
        path: AppConstants.routeAdminOrderDetail,
        builder: (context, state) {
          final orderId = state.pathParameters['orderId']!;
          return admin.OrderDetailPage(orderId: orderId);
        },
      ),

      // ==================== KITCHEN ====================
      GoRoute(
        path: AppConstants.routeKitchenDashboard,
        builder: (context, state) => const KitchenDashboardPage(),
      ),
      GoRoute(
        path: AppConstants.routeKitchenKanban,
        builder: (context, state) => const KanbanBoardPage(),
      ),
      GoRoute(
        path: AppConstants.routeKitchenStock,
        builder: (context, state) => const StockManagementPage(),
      ),
      GoRoute(
        path: AppConstants.routeKitchenStats,
        builder: (context, state) => const ProductionStatsPage(),
      ),
      GoRoute(
        path: AppConstants.routeKitchenOrderDetail,
        builder: (context, state) {
          final orderId = state.pathParameters['orderId']!;
          return kitchen.OrderDetailPage(orderId: orderId);
        },
      ),

      // ==================== DELIVERER ====================
      GoRoute(
        path: AppConstants.routeDelivererDashboard,
        builder: (context, state) => const DelivererDashboardPage(),
      ),
      GoRoute(
        path: AppConstants.routeDelivererDeliveries,
        builder: (context, state) => const DeliveriesListPage(),
      ),
      GoRoute(
        path: AppConstants.routeDelivererDeliveryDetail,
        builder: (context, state) {
          final deliveryId = state.pathParameters['deliveryId']!;
          return DeliveryDetailPage(deliveryId: deliveryId);
        },
      ),
      GoRoute(
        path: AppConstants.routeDelivererRoute,
        builder: (context, state) {
          final deliveryId = state.pathParameters['deliveryId']!;
          return RouteMapPage(deliveryId: deliveryId);
        },
      ),
      GoRoute(
        path: AppConstants.routeDelivererProof,
        builder: (context, state) {
          final deliveryId = state.pathParameters['deliveryId']!;
          final customerId = state.uri.queryParameters['customerId'] ?? '';
          final customerName = state.uri.queryParameters['customerName'] ?? '';
          return Consumer(
            builder: (context, ref, child) {
              final authState = ref.watch(authProvider);
              final delivererId = authState.user?.id ?? '';
              return ProofOfDeliveryPage(
                deliveryId: deliveryId,
                delivererId: delivererId,
                customerId: customerId,
                customerName: customerName,
              );
            },
          );
        },
      ),
      GoRoute(
        path: AppConstants.routeDelivererPayment,
        builder: (context, state) {
          final customerId = state.pathParameters['customerId']!;
          final customerName = state.uri.queryParameters['customerName'] ?? '';
          final deliveryId = state.uri.queryParameters['deliveryId'] ?? '';
          return PaymentCollectionPage(
            customerId: customerId,
            customerName: customerName,
            deliveryId: deliveryId,
          );
        },
      ),
      GoRoute(
        path: AppConstants.routeDelivererPackaging,
        builder: (context, state) {
          final customerId = state.pathParameters['customerId']!;
          final customerName = state.uri.queryParameters['customerName'] ?? '';
          final deliveryId = state.uri.queryParameters['deliveryId'] ?? '';
          return PackagingManagementPage(
            customerId: customerId,
            customerName: customerName,
            deliveryId: deliveryId,
          );
        },
      ),
      GoRoute(
        path: AppConstants.routeDelivererHistory,
        builder: (context, state) => Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authProvider);
            final delivererId = authState.user?.id ?? '';
            return DeliveryHistoryPage(delivererId: delivererId);
          },
        ),
      ),
      GoRoute(
        path: AppConstants.routeDelivererEarnings,
        builder: (context, state) => Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authProvider);
            final delivererId = authState.user?.id ?? '';
            return EarningsPage(delivererId: delivererId);
          },
        ),
      ),

      // ==================== CUSTOMER ====================
      GoRoute(
        path: AppConstants.routeCustomerDashboard,
        builder: (context, state) => Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authProvider);
            final customerId = authState.user?.id ?? '';
            return CustomerDashboardPage(customerId: customerId);
          },
        ),
      ),
      GoRoute(
        path: AppConstants.routeCustomerOrders,
        builder: (context, state) => Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authProvider);
            final customerId = authState.user?.id ?? '';
            return CustomerOrdersPage(customerId: customerId);
          },
        ),
      ),
      GoRoute(
        path: AppConstants.routeCustomerOrderDetail,
        builder: (context, state) {
          final orderId = state.pathParameters['orderId']!;
          return CustomerOrderDetailPage(orderId: orderId);
        },
      ),
      GoRoute(
        path: AppConstants.routeCustomerTracking,
        builder: (context, state) {
          final deliveryId = state.pathParameters['deliveryId']!;
          return CustomerDeliveryTrackingPage(deliveryId: deliveryId);
        },
      ),
      GoRoute(
        path: AppConstants.routeCustomerCredit,
        builder: (context, state) => Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authProvider);
            final customerId = authState.user?.id ?? '';
            return CustomerCreditPage(customerId: customerId);
          },
        ),
      ),
      GoRoute(
        path: AppConstants.routeCustomerPackaging,
        builder: (context, state) => Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authProvider);
            final customerId = authState.user?.id ?? '';
            return CustomerPackagingPage(customerId: customerId);
          },
        ),
      ),
      GoRoute(
        path: AppConstants.routeCustomerHistory,
        builder: (context, state) => Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authProvider);
            final customerId = authState.user?.id ?? '';
            return CustomerHistoryPage(customerId: customerId);
          },
        ),
      ),
      GoRoute(
        path: AppConstants.routeCustomerAccount,
        builder: (context, state) => Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authProvider);
            final customerId = authState.user?.id ?? '';
            return CustomerAccountPage(customerId: customerId);
          },
        ),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Page not found')),
    );
  }
}
