import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/presentation/pages/admin_dashboard_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/customer/presentation/pages/customer_dashboard_page.dart';
import '../../features/deliverer/presentation/pages/deliverer_dashboard_page.dart';
import '../../features/kitchen/presentation/pages/kitchen_dashboard_page.dart';
import '../constants/app_constants.dart';

/// App Router
/// Configuration du routage avec GoRouter
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppConstants.routeLogin,
    routes: [
      // Auth
      GoRoute(path: AppConstants.routeLogin, builder: (context, state) => const LoginPage()),
      GoRoute(path: AppConstants.routeRegister, builder: (context, state) => const RegisterPage()),

      // Admin
      GoRoute(path: AppConstants.routeAdminDashboard, builder: (context, state) => const AdminDashboardPage()),

      // Deliverer - Using real page
      GoRoute(path: AppConstants.routeDelivererDashboard, builder: (context, state) => const DelivererDashboardPage()),

      // Customer - Using real page with user ID from auth
      GoRoute(
        path: AppConstants.routeCustomerDashboard, 
        builder: (context, state) => Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authProvider);
            final userId = authState.user?.id ?? 'unknown-user';
            return CustomerDashboardPage(customerId: userId);
          },
        ),
      ),

      // Kitchen - Using real page
      GoRoute(path: AppConstants.routeKitchenDashboard, builder: (context, state) => const KitchenDashboardPage()),
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
