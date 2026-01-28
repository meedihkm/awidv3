/// API Configuration
/// Contient toutes les URLs et endpoints de l'API
class ApiConfig {
  ApiConfig._();

  // Base URLs
  static const String _devBaseUrl = 'http://mgkgcgkkssk0k0sw880ksgso0.62.171.130.92.sslip.io:3001/api/v1';
  static const String _stagingBaseUrl = 'https://staging-api.awid.dz/api/v1';
  static const String _prodBaseUrl = 'https://api.awid.dz/api/v1';

  static const String _devWsUrl = 'http://mgkgcgkkssk0k0sw880ksgso0.62.171.130.92.sslip.io:3001';
  static const String _stagingWsUrl = 'https://staging-api.awid.dz';
  static const String _prodWsUrl = 'https://api.awid.dz';

  // Get base URL based on environment
  static String get baseUrl {
    const env = String.fromEnvironment('ENV', defaultValue: 'development');
    switch (env) {
      case 'production':
        return _prodBaseUrl;
      case 'staging':
        return _stagingBaseUrl;
      default:
        return _devBaseUrl;
    }
  }

  // Get WebSocket URL based on environment
  static String get wsUrl {
    const env = String.fromEnvironment('ENV', defaultValue: 'development');
    switch (env) {
      case 'production':
        return _prodWsUrl;
      case 'staging':
        return _stagingWsUrl;
      default:
        return _devWsUrl;
    }
  }

  // Auth Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refresh = '/auth/refresh';
  static const String logout = '/auth/logout';
  static const String changePassword = '/auth/change-password';

  // User Endpoints
  static const String users = '/users';
  static String userById(String id) => '/users/$id';

  // Organization Endpoints
  static const String organizations = '/organizations';
  static String organizationById(String id) => '/organizations/$id';

  // Product Endpoints
  static const String products = '/products';
  static String productById(String id) => '/products/$id';

  // Order Endpoints
  static const String orders = '/orders';
  static String orderById(String id) => '/orders/$id';
  static String orderStatus(String id) => '/orders/$id/status';
  static String orderAssign(String id) => '/orders/$id/assign';
  static String orderCancel(String id) => '/orders/$id/cancel';

  // Delivery Endpoints
  static const String deliveries = '/deliveries';
  static String deliveryById(String id) => '/deliveries/$id';
  static String deliveryTracking(String id) => '/deliveries/$id/tracking';
  static String deliveryStatus(String id) => '/deliveries/$id/status';
  static String deliveryLocation(String id) => '/deliveries/$id/location';
  static String deliveryComplete(String id) => '/deliveries/$id/complete';

  // Payment Endpoints
  static const String payments = '/payments';
  static String paymentById(String id) => '/payments/$id';
  static String paymentHistory(String customerId) => '/payments/customer/$customerId/history';
  static String paymentAllocate(String id) => '/payments/$id/allocate';

  // Health Check
  static const String health = '/health';
}
