import 'api_service.dart';

class PaymentService {
  final ApiService _apiService = ApiService();

  // Enregistrer un paiement (Admin ou Livreur)
  Future<Map<String, dynamic>> recordPayment({
    required String clientId,
    required double amount,
    String mode = 'auto',
    String? deliveryId,
    List<String>? targetOrders,
    String? notes,
  }) async {
    return await _apiService.recordPayment({
      'clientId': clientId,
      'amount': amount,
      'mode': mode,
      'deliveryId': deliveryId,
      'targetOrders': targetOrders,
      'notes': notes,
    });
  }

  // Obtenir les détails de dette d'un client
  Future<Map<String, dynamic>> getClientDebtDetails(String clientId) async {
    return await _apiService.getClientDebtDetails(clientId);
  }

  // Historique de tous les paiements (Admin)
  Future<Map<String, dynamic>> getPaymentHistory({
    int page = 1,
    int limit = 50,
  }) async {
    return await _apiService.getPaymentHistory(page: page, limit: limit);
  }

  // Historique des collectes du livreur
  Future<Map<String, dynamic>> getMyCollections() async {
    return await _apiService.getMyCollections();
  }

  // Historique des paiements du client
  Future<Map<String, dynamic>> getMyPayments() async {
    return await _apiService.getMyPayments();
  }

  // Statistiques des paiements
  Future<Map<String, dynamic>> getPaymentStats() async {
    return await _apiService.getPaymentStats();
  }
}
