/// Application Configuration
/// Configuration globale de l'application
class AppConfig {
  AppConfig._();

  // App Info
  static const String appName = 'AWID Mobile';
  static const String appVersion = '4.0.0';
  static const int appBuildNumber = 1;

  // Environment
  static const String environment = String.fromEnvironment('ENV', defaultValue: 'development');

  static bool get isDevelopment => environment == 'development';
  static bool get isStaging => environment == 'staging';
  static bool get isProduction => environment == 'production';

  // Network
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // Cache
  static const Duration cacheMaxAge = Duration(hours: 1);
  static const int cacheMaxSize = 100; // MB

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Location
  static const Duration locationUpdateInterval = Duration(seconds: 10);
  static const double locationAccuracy = 10; // meters

  // Maps
  static const double defaultZoom = 15;
  static const double defaultLatitude = 36.7538; // Algiers
  static const double defaultLongitude = 3.0588;

  // Images
  static const int maxImageSize = 5; // MB
  static const int imageQuality = 85; // 0-100

  // Notifications
  static const String oneSignalAppId = String.fromEnvironment('ONESIGNAL_APP_ID');

  // Logging
  static bool get enableLogging => !isProduction;
  static bool get enableCrashReporting => isProduction || isStaging;

  // Features Flags
  static const bool enableBiometrics = true;
  static const bool enableOfflineMode = true;
  static const bool enablePushNotifications = true;
  static const bool enableAnalytics = true;

  // Security
  static const bool enableCertificatePinning = false; // TODO: Enable in production
  static const Duration tokenRefreshThreshold = Duration(minutes: 5);

  // UI
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration debounceDelay = Duration(milliseconds: 500);
  static const Duration toastDuration = Duration(seconds: 3);
}
