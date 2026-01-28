import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Navigation Helper
/// Méthodes utilitaires pour faciliter la navigation dans l'application
class NavigationHelper {
  NavigationHelper._();

  // ==================== AUTH ====================
  static void goToLogin(BuildContext context) {
    context.go(AppConstants.routeLogin);
  }

  static void goToRegister(BuildContext context) {
    context.go(AppConstants.routeRegister);
  }

  // ==================== ADMIN ====================
  static void goToAdminDashboard(BuildContext context) {
    context.go(AppConstants.routeAdminDashboard);
  }

  static void goToAdminUsers(BuildContext context) {
    context.go(AppConstants.routeAdminUsers);
  }

  static void goToAdminProducts(BuildContext context) {
    context.go(AppConstants.routeAdminProducts);
  }

  static void goToAdminOrderDetail(BuildContext context, String orderId) {
    context.go(AppConstants.routeAdminOrderDetail.replaceAll(':orderId', orderId));
  }

  // ==================== KITCHEN ====================
  static void goToKitchenDashboard(BuildContext context) {
    context.go(AppConstants.routeKitchenDashboard);
  }

  static void goToKitchenKanban(BuildContext context) {
    context.go(AppConstants.routeKitchenKanban);
  }

  static void goToKitchenStock(BuildContext context) {
    context.go(AppConstants.routeKitchenStock);
  }

  static void goToKitchenStats(BuildContext context) {
    context.go(AppConstants.routeKitchenStats);
  }

  static void goToKitchenOrderDetail(BuildContext context, String orderId) {
    context.go(AppConstants.routeKitchenOrderDetail.replaceAll(':orderId', orderId));
  }

  // ==================== DELIVERER ====================
  static void goToDelivererDashboard(BuildContext context) {
    context.go(AppConstants.routeDelivererDashboard);
  }

  static void goToDelivererDeliveries(BuildContext context) {
    context.go(AppConstants.routeDelivererDeliveries);
  }

  static void goToDelivererDeliveryDetail(BuildContext context, String deliveryId) {
    context.go(AppConstants.routeDelivererDeliveryDetail.replaceAll(':deliveryId', deliveryId));
  }

  static void goToDelivererRoute(BuildContext context, String deliveryId) {
    context.go(AppConstants.routeDelivererRoute.replaceAll(':deliveryId', deliveryId));
  }

  static void goToDelivererProof(BuildContext context, String deliveryId) {
    context.go(AppConstants.routeDelivererProof.replaceAll(':deliveryId', deliveryId));
  }

  static void goToDelivererPayment(BuildContext context, String customerId, String customerName) {
    context.go('${AppConstants.routeDelivererPayment.replaceAll(':customerId', customerId)}?customerName=$customerName');
  }

  static void goToDelivererPackaging(BuildContext context, String customerId, String customerName) {
    context.go('${AppConstants.routeDelivererPackaging.replaceAll(':customerId', customerId)}?customerName=$customerName');
  }

  static void goToDelivererHistory(BuildContext context) {
    context.go(AppConstants.routeDelivererHistory);
  }

  static void goToDelivererEarnings(BuildContext context) {
    context.go(AppConstants.routeDelivererEarnings);
  }

  // ==================== CUSTOMER ====================
  static void goToCustomerDashboard(BuildContext context) {
    context.go(AppConstants.routeCustomerDashboard);
  }

  static void goToCustomerOrders(BuildContext context) {
    context.go(AppConstants.routeCustomerOrders);
  }

  static void goToCustomerOrderDetail(BuildContext context, String orderId) {
    context.go(AppConstants.routeCustomerOrderDetail.replaceAll(':orderId', orderId));
  }

  static void goToCustomerTracking(BuildContext context, String deliveryId) {
    context.go(AppConstants.routeCustomerTracking.replaceAll(':deliveryId', deliveryId));
  }

  static void goToCustomerCredit(BuildContext context) {
    context.go(AppConstants.routeCustomerCredit);
  }

  static void goToCustomerPackaging(BuildContext context) {
    context.go(AppConstants.routeCustomerPackaging);
  }

  static void goToCustomerHistory(BuildContext context) {
    context.go(AppConstants.routeCustomerHistory);
  }

  static void goToCustomerAccount(BuildContext context) {
    context.go(AppConstants.routeCustomerAccount);
  }

  // ==================== NAVIGATION UTILITIES ====================
  
  /// Retour à la page précédente
  static void goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    }
  }

  /// Navigation vers le dashboard selon le rôle
  static void goToDashboardByRole(BuildContext context, String role) {
    switch (role.toLowerCase()) {
      case 'admin':
        goToAdminDashboard(context);
        break;
      case 'kitchen':
      case 'atelier':
        goToKitchenDashboard(context);
        break;
      case 'deliverer':
      case 'livreur':
        goToDelivererDashboard(context);
        break;
      case 'customer':
      case 'client':
        goToCustomerDashboard(context);
        break;
      default:
        goToLogin(context);
    }
  }

  /// Déconnexion et retour au login
  static void logout(BuildContext context) {
    goToLogin(context);
  }
}
