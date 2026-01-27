/// Application Constants
/// Constantes générales de l'application
class AppConstants {
  AppConstants._();

  // Routes
  static const String routeSplash = '/';
  static const String routeLogin = '/login';
  static const String routeRegister = '/register';

  static const String routeAdminDashboard = '/admin';
  static const String routeAdminOrders = '/admin/orders';
  static const String routeAdminDeliveries = '/admin/deliveries';
  static const String routeAdminUsers = '/admin/users';
  static const String routeAdminProducts = '/admin/products';
  static const String routeAdminFinancial = '/admin/financial';

  static const String routeDelivererDashboard = '/deliverer';
  static const String routeDelivererDeliveries = '/deliverer/deliveries';
  static const String routeDelivererRoute = '/deliverer/route';
  static const String routeDelivererPayments = '/deliverer/payments';

  static const String routeCustomerDashboard = '/customer';
  static const String routeCustomerOrders = '/customer/orders';
  static const String routeCustomerTracking = '/customer/tracking';
  static const String routeCustomerHistory = '/customer/history';

  static const String routeKitchenDashboard = '/kitchen';
  static const String routeKitchenKanban = '/kitchen/kanban';
  static const String routeKitchenStock = '/kitchen/stock';

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
