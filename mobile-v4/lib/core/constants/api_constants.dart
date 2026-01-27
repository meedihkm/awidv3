/// API Constants
/// Constantes pour les requêtes API
class ApiConstants {
  ApiConstants._();

  // Headers
  static const String headerContentType = 'Content-Type';
  static const String headerAuthorization = 'Authorization';
  static const String headerAccept = 'Accept';
  static const String headerAcceptLanguage = 'Accept-Language';

  // Content Types
  static const String contentTypeJson = 'application/json';
  static const String contentTypeFormData = 'multipart/form-data';

  // Auth
  static const String bearerPrefix = 'Bearer';

  // Query Parameters
  static const String paramPage = 'page';
  static const String paramLimit = 'limit';
  static const String paramSort = 'sort';
  static const String paramOrder = 'order';
  static const String paramSearch = 'search';
  static const String paramFilter = 'filter';

  // Order Status
  static const String orderStatusPending = 'pending';
  static const String orderStatusConfirmed = 'confirmed';
  static const String orderStatusPreparing = 'preparing';
  static const String orderStatusReady = 'ready';
  static const String orderStatusInDelivery = 'in_delivery';
  static const String orderStatusDelivered = 'delivered';
  static const String orderStatusCancelled = 'cancelled';

  // Delivery Status
  static const String deliveryStatusPending = 'pending';
  static const String deliveryStatusAssigned = 'assigned';
  static const String deliveryStatusPickedUp = 'picked_up';
  static const String deliveryStatusInTransit = 'in_transit';
  static const String deliveryStatusDelivered = 'delivered';
  static const String deliveryStatusFailed = 'failed';

  // Payment Status
  static const String paymentStatusPending = 'pending';
  static const String paymentStatusCompleted = 'completed';
  static const String paymentStatusFailed = 'failed';

  // Payment Methods
  static const String paymentMethodCash = 'cash';
  static const String paymentMethodCredit = 'credit';

  // User Roles
  static const String roleAdmin = 'admin';
  static const String roleDeliverer = 'deliverer';
  static const String roleCustomer = 'customer';
  static const String roleKitchen = 'kitchen';

  // WebSocket Events
  static const String wsEventConnect = 'connect';
  static const String wsEventDisconnect = 'disconnect';
  static const String wsEventError = 'error';
  static const String wsEventOrderCreated = 'order:created';
  static const String wsEventOrderUpdated = 'order:updated';
  static const String wsEventDeliveryUpdated = 'delivery:updated';
  static const String wsEventLocationUpdated = 'location:updated';
  static const String wsEventStatsUpdated = 'stats:updated';

  // Error Codes
  static const String errorUnauthorized = 'UNAUTHORIZED';
  static const String errorForbidden = 'FORBIDDEN';
  static const String errorNotFound = 'NOT_FOUND';
  static const String errorValidation = 'VALIDATION_ERROR';
  static const String errorServer = 'SERVER_ERROR';
  static const String errorNetwork = 'NETWORK_ERROR';
  static const String errorTimeout = 'TIMEOUT_ERROR';
}
