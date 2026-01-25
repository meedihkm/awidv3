import 'api_service.dart';

class PaymentService {
  final ApiService _apiService = ApiService();

  /// Enregistre un paiement (Admin ou Livreur)
  Future<Map<String, dynamic>> recordPayment({
    required String clientId,
    required double amount,
    String mode = 'cash',
    String? deliveryId,
    List<String>? targetOrders,
    String? notes,
  }) async {
    return _apiService.recordPayment(
      customerId: clientId,
      amount: amount,
      mode: mode,
      deliveryId: deliveryId,
      targetOrders: targetOrders,
      notes: notes,
    );
  }

  /// Obtient les détails de dette d'un client
  Future<Map<String, dynamic>> getClientDebtDetails(String clientId) async {
    return _apiService.getCustomerDebt(clientId);
  }

  /// Historique de tous les paiements (Admin)
  Future<Map<String, dynamic>> getPaymentHistory({
    int page = 1,
    int limit = 50,
    String? customerId,
    String? collectorId,
    String? dateFrom,
    String? dateTo,
  }) async {
    return _apiService.getPaymentHistory(
      page: page,
      limit: limit,
      customerId: customerId,
      collectorId: collectorId,
      dateFrom: dateFrom,
      dateTo: dateTo,
    );
  }

  /// Historique des collectes du livreur
  Future<Map<String, dynamic>> getMyCollections() async {
    return _apiService.getMyCollections();
  }

  /// Statistiques des paiements
  Future<Map<String, dynamic>> getPaymentStats() async {
    return _apiService.getPaymentStats();
  }
}
