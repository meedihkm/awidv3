/// Storage Keys
/// Clés pour le stockage local et sécurisé
class StorageKeys {
  StorageKeys._();

  // Secure Storage (flutter_secure_storage)
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String userRole = 'user_role';
  static const String organizationId = 'organization_id';

  // Local Storage (Hive)
  static const String userBox = 'user_box';
  static const String settingsBox = 'settings_box';
  static const String cacheBox = 'cache_box';
  static const String offlineBox = 'offline_box';

  // Preferences (shared_preferences)
  static const String isFirstLaunch = 'is_first_launch';
  static const String isDarkMode = 'is_dark_mode';
  static const String language = 'language';
  static const String notificationsEnabled = 'notifications_enabled';
  static const String locationEnabled = 'location_enabled';
  static const String biometricsEnabled = 'biometrics_enabled';
  static const String lastSyncTime = 'last_sync_time';

  // Cache Keys
  static const String cacheProducts = 'cache_products';
  static const String cacheOrders = 'cache_orders';
  static const String cacheDeliveries = 'cache_deliveries';
  static const String cacheUsers = 'cache_users';
  static const String cacheStats = 'cache_stats';

  // Offline Queue
  static const String offlineOrders = 'offline_orders';
  static const String offlinePayments = 'offline_payments';
  static const String offlineDeliveries = 'offline_deliveries';
}
