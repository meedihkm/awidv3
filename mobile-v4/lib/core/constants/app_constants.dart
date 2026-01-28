/// Application Constants
/// Constantes générales de l'application
class AppConstants {
  AppConstants._();

  // Routes
  static const String routeSplash = '/';
  static const String routeLogin = '/login';
  static const String routeRegister = '/register';

  // Admin Routes
  static const String routeAdminDashboard = '/admin';
  static const String routeAdminUsers = '/admin/users';
  static const String routeAdminProducts = '/admin/products';
  static const String routeAdminOrderDetail = '/admin/orders/:orderId';

  // Kitchen Routes
  static const String routeKitchenDashboard = '/kitchen';
  static const String routeKitchenKanban = '/kitchen/kanban';
  static const String routeKitchenStock = '/kitchen/stock';
  static const String routeKitchenStats = '/kitchen/stats';
  static const String routeKitchenOrderDetail = '/kitchen/orders/:orderId';

  // Deliverer Routes
  static const String routeDelivererDashboard = '/deliverer';
  static const String routeDelivererDeliveries = '/deliverer/deliveries';
  static const String routeDelivererDeliveryDetail = '/deliverer/deliveries/:deliveryId';
  static const String routeDelivererRoute = '/deliverer/route/:deliveryId';
  static const String routeDelivererProof = '/deliverer/proof/:deliveryId';
  static const String routeDelivererPayment = '/deliverer/payment/:customerId';
  static const String routeDelivererPackaging = '/deliverer/packaging/:customerId';
  static const String routeDelivererHistory = '/deliverer/history';
  static const String routeDelivererEarnings = '/deliverer/earnings';

  // Customer Routes
  static const String routeCustomerDashboard = '/customer';
  static const String routeCustomerOrders = '/customer/orders';
  static const String routeCustomerOrderDetail = '/customer/orders/:orderId';
  static const String routeCustomerTracking = '/customer/tracking/:deliveryId';
  static const String routeCustomerCredit = '/customer/credit';
  static const String routeCustomerPackaging = '/customer/packaging';
  static const String routeCustomerHistory = '/customer/history';
  static const String routeCustomerAccount = '/customer/account';

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int minPhoneLength = 10;
  static const int maxPhoneLength = 15;

  // Formats
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';
  static const String currencySymbol = 'DA'; // Dinar Algérien

  // Limits
  static const int maxOrderItems = 50;
  static const int maxImageUploadSize = 5 * 1024 * 1024; // 5 MB
  static const int maxCommentLength = 500;

  // Timeouts
  static const int splashDuration = 2; // seconds
  static const int toastDuration = 3; // seconds
  static const int snackbarDuration = 4; // seconds

  // Map
  static const double defaultMapZoom = 15.0;
  static const double minMapZoom = 10.0;
  static const double maxMapZoom = 18.0;

  // Animations
  static const int animationDuration = 300; // milliseconds
  static const int pageTransitionDuration = 250; // milliseconds

  // Refresh
  static const int pullToRefreshDuration = 1000; // milliseconds
  static const int autoRefreshInterval = 30; // seconds

  // Offline
  static const int maxOfflineQueueSize = 100;
  static const int offlineSyncInterval = 60; // seconds

  // Images
  static const String placeholderImage = 'assets/images/placeholder.png';
  static const String logoImage = 'assets/images/logo.png';
  static const String emptyStateImage = 'assets/images/empty_state.png';

  // Icons
  static const String iconAdmin = 'assets/icons/admin.svg';
  static const String iconDeliverer = 'assets/icons/deliverer.svg';
  static const String iconCustomer = 'assets/icons/customer.svg';
  static const String iconKitchen = 'assets/icons/kitchen.svg';
}
