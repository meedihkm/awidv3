import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/presentation/pages/admin_dashboard_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
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

      // Deliverer
      GoRoute(path: AppConstants.routeDelivererDashboard, builder: (context, state) => const DelivererDashboardPage()),

      // Customer
      GoRoute(path: AppConstants.routeCustomerDashboard, builder: (context, state) => const CustomerDashboardPage()),

      // Kitchen
      GoRoute(path: AppConstants.routeKitchenDashboard, builder: (context, state) => const KitchenDashboardPage()),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

// Placeholder pages (will be implemented in next sprints)
class DelivererDashboardPage extends StatelessWidget {
  const DelivererDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deliverer Dashboard')),
      body: const Center(child: Text('Deliverer Dashboard - Sprint 5')),
    );
  }
}

class CustomerDashboardPage extends StatelessWidget {
  const CustomerDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Dashboard')),
      body: const Center(child: Text('Customer Dashboard - Sprint 7')),
    );
  }
}

class KitchenDashboardPage extends StatelessWidget {
  const KitchenDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kitchen Dashboard')),
      body: const Center(child: Text('Kitchen Dashboard - Sprint 9')),
    );
  }
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
