class ApiConstants {
  // URL configurable via --dart-define=API_URL=...
  // En production: flutter build apk --dart-define=API_URL=https://votre-api.com/api
  static const String baseUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://awidv2.vercel.app/api',
  );
  
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
  
  // Debt endpoints (Feature 1)
  static const String debtBase = '$baseUrl/debt';
  
  // Super admin endpoints
  static const String superAdminTest = '$baseUrl/super-admin/test';
  static const String superAdminStats = '$baseUrl/super-admin/stats';
  static const String superAdminOrgs = '$baseUrl/super-admin/organizations';
}