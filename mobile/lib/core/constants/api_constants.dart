class ApiConstants {
  static const String baseUrl = 'https://app-livraison-one.vercel.app/api';
  
  // Auth endpoints
  static const String login = '$baseUrl/auth/login';
  static const String me = '$baseUrl/auth/me';
  
  // Products endpoints
  static const String products = '$baseUrl/products';
  
  // Users endpoints
  static const String users = '$baseUrl/users';
  static const String deliverers = '$baseUrl/users/deliverers';
  
  // Orders endpoints
  static const String orders = '$baseUrl/orders';
  static const String myOrders = '$baseUrl/orders/my';
  
  // Deliveries endpoints
  static const String deliveries = '$baseUrl/deliveries';
  static const String deliveryRoute = '$baseUrl/deliveries/route';
  
  // Financial endpoints
  static const String dailyFinancial = '$baseUrl/financial/daily';
  static const String debts = '$baseUrl/financial/debts';
  
  // Super admin endpoints
  static const String superAdminTest = '$baseUrl/super-admin/test';
  static const String superAdminStats = '$baseUrl/super-admin/stats';
  static const String superAdminOrgs = '$baseUrl/super-admin/organizations';
}