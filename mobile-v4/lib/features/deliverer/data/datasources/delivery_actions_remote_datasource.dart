import 'dart:convert';
import 'dart:io';

import '../../../../core/network/dio_client.dart';
import '../models/proof_of_delivery_model.dart';
import '../models/payment_collection_model.dart';
import '../models/packaging_transaction_model.dart';

/// Datasource Remote: Actions de Livraison
/// Gère les appels API pour les preuves, paiements et consignes
class DeliveryActionsRemoteDatasource {
  final DioClient _dioClient;

  const DeliveryActionsRemoteDatasource(this._dioClient);

  // ==================== PREUVE DE LIVRAISON ====================

  /// Upload une preuve de livraison
  Future<UploadProofResponse> uploadProofOfDelivery({
    required String deliveryId,
    required String delivererId,
    required String customerId,
    required DateTime timestamp,
    required double latitude,
    required double longitude,
    required String signatoryName,
    required String signatureImagePath,
    required List<String> photosPaths,
    String? notes,
    String? customerFeedback,
  }) async {
    try {
      // Convertir les images en base64
      final signatureBase64 = await _imageToBase64(signatureImagePath);
      final photosBase64 = <String>[];
      
      for (final photoPath in photosPaths) {
        final photoBase64 = await _imageToBase64(photoPath);
        photosBase64.add(photoBase64);
      }

      final request = UploadProofRequest(
        deliveryId: deliveryId,
        delivererId: delivererId,
        customerId: customerId,
        timestamp: timestamp,
        latitude: latitude,
        longitude: longitude,
        signatoryName: signatoryName,
        signatureImageBase64: signatureBase64,
        photosBase64: photosBase64,
        notes: notes,
        customerFeedback: customerFeedback,
      );

      final response = await _dioClient.post(
        '/deliverer/deliveries/$deliveryId/proof',
        data: request.toJson(),
      );

      return UploadProofResponse.fromJson(response.data);
    } catch (error) {
      throw _handleError(error, 'Erreur lors de l\'upload de la preuve de livraison');
    }
  }

  /// Récupère les preuves de livraison d'un livreur
  Future<List<ProofOfDeliveryModel>> getProofsOfDelivery({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
    bool? isUploaded,
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'deliverer_id': delivererId,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
        if (isUploaded != null) 'is_uploaded': isUploaded,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      };

      final response = await _dioClient.get(
        '/deliverer/proofs',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? response.data;
      return data
          .map((json) => proofOfDeliveryModelFromApiResponse(json))
          .toList();
    } catch (error) {
      throw _handleError(error, 'Erreur lors de la récupération des preuves');
    }
  }

  /// Récupère une preuve de livraison par ID
  Future<ProofOfDeliveryModel?> getProofOfDelivery(String proofId) async {
    try {
      final response = await _dioClient.get('/deliverer/proofs/$proofId');
      return proofOfDeliveryModelFromApiResponse(response.data);
    } catch (error) {
      if (_isNotFoundError(error)) return null;
      throw _handleError(error, 'Erreur lors de la récupération de la preuve');
    }
  }

  // ==================== PAIEMENTS ====================

  /// Upload un paiement
  Future<UploadPaymentResponse> uploadPaymentCollection({
    required String delivererId,
    required String customerId,
    required String customerName,
    required double amount,
    required String mode,
    required DateTime collectedAt,
    required List<Map<String, dynamic>> allocations,
    String? reference,
    String? notes,
    String? receiptImagePath,
  }) async {
    try {
      String? receiptBase64;
      if (receiptImagePath?.isNotEmpty == true) {
        receiptBase64 = await _imageToBase64(receiptImagePath!);
      }

      final request = UploadPaymentRequest(
        delivererId: delivererId,
        customerId: customerId,
        customerName: customerName,
        amount: amount,
        mode: mode,
        collectedAt: collectedAt,
        allocations: allocations,
        reference: reference,
        notes: notes,
        receiptImageBase64: receiptBase64,
      );

      final response = await _dioClient.post(
        '/deliverer/payments',
        data: request.toJson(),
      );

      return UploadPaymentResponse.fromJson(response.data);
    } catch (error) {
      throw _handleError(error, 'Erreur lors de l\'upload du paiement');
    }
  }

  /// Récupère les paiements d'un livreur
  Future<List<PaymentCollectionModel>> getPaymentCollections({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
    String? mode,
    bool? isUploaded,
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'deliverer_id': delivererId,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
        if (mode != null) 'mode': mode,
        if (isUploaded != null) 'is_uploaded': isUploaded,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      };

      final response = await _dioClient.get(
        '/deliverer/payments',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? response.data;
      return data
          .map((json) => paymentCollectionModelFromApiResponse(json))
          .toList();
    } catch (error) {
      throw _handleError(error, 'Erreur lors de la récupération des paiements');
    }
  }

  /// Récupère les commandes impayées d'un client
  Future<List<UnpaidOrderModel>> getUnpaidOrders(String customerId) async {
    try {
      final response = await _dioClient.get(
        '/deliverer/customers/$customerId/unpaid-orders',
      );

      final List<dynamic> data = response.data['data'] ?? response.data;
      return data
          .map((json) => unpaidOrderModelFromApiResponse(json))
          .toList();
    } catch (error) {
      throw _handleError(error, 'Erreur lors de la récupération des commandes impayées');
    }
  }

  /// Calcule l'allocation automatique d'un paiement
  Future<List<PaymentAllocationModel>> calculateAutoAllocation({
    required String customerId,
    required double amount,
  }) async {
    try {
      final response = await _dioClient.post(
        '/deliverer/payments/calculate-allocation',
        data: {
          'customer_id': customerId,
          'amount': amount,
        },
      );

      final List<dynamic> data = response.data['allocations'] ?? response.data;
      return data
          .map((json) => paymentAllocationModelFromApiResponse(json))
          .toList();
    } catch (error) {
      throw _handleError(error, 'Erreur lors du calcul de l\'allocation');
    }
  }

  // ==================== CONSIGNES ====================

  /// Upload une transaction de consigne
  Future<UploadPackagingTransactionResponse> uploadPackagingTransaction({
    required String delivererId,
    required String customerId,
    required String customerName,
    required String type,
    required List<Map<String, dynamic>> items,
    required DateTime transactionDate,
    String? notes,
    String? qrCodeData,
  }) async {
    try {
      final request = UploadPackagingTransactionRequest(
        delivererId: delivererId,
        customerId: customerId,
        customerName: customerName,
        type: type,
        items: items,
        transactionDate: transactionDate,
        notes: notes,
        qrCodeData: qrCodeData,
      );

      final response = await _dioClient.post(
        '/deliverer/packaging/transactions',
        data: request.toJson(),
      );

      return UploadPackagingTransactionResponse.fromJson(response.data);
    } catch (error) {
      throw _handleError(error, 'Erreur lors de l\'upload de la transaction de consigne');
    }
  }

  /// Récupère les transactions de consignes d'un livreur
  Future<List<PackagingTransactionModel>> getPackagingTransactions({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
    String? type,
    bool? isUploaded,
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'deliverer_id': delivererId,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
        if (type != null) 'type': type,
        if (isUploaded != null) 'is_uploaded': isUploaded,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      };

      final response = await _dioClient.get(
        '/deliverer/packaging/transactions',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? response.data;
      return data
          .map((json) => packagingTransactionModelFromApiResponse(json))
          .toList();
    } catch (error) {
      throw _handleError(error, 'Erreur lors de la récupération des transactions');
    }
  }

  /// Récupère le solde consignes d'un client
  Future<PackagingBalanceModel> getPackagingBalance(String customerId) async {
    try {
      final response = await _dioClient.get(
        '/deliverer/customers/$customerId/packaging-balance',
      );

      return packagingBalanceModelFromApiResponse(response.data);
    } catch (error) {
      throw _handleError(error, 'Erreur lors de la récupération du solde consignes');
    }
  }

  /// Récupère les types de consignes disponibles
  Future<List<PackagingTypeModel>> getPackagingTypes() async {
    try {
      final response = await _dioClient.get('/deliverer/packaging/types');

      final List<dynamic> data = response.data['data'] ?? response.data;
      return data
          .map((json) => packagingTypeModelFromApiResponse(json))
          .toList();
    } catch (error) {
      throw _handleError(error, 'Erreur lors de la récupération des types de consignes');
    }
  }

  /// Scan un QR code de consigne
  Future<PackagingQrDataModel?> scanPackagingQrCode(String qrData) async {
    try {
      final response = await _dioClient.post(
        '/deliverer/packaging/scan-qr',
        data: {'qr_data': qrData},
      );

      return packagingQrDataModelFromApiResponse(response.data);
    } catch (error) {
      if (_isNotFoundError(error)) return null;
      throw _handleError(error, 'Erreur lors du scan du QR code');
    }
  }

  // ==================== HISTORIQUE & STATISTIQUES ====================

  /// Récupère l'historique des livraisons
  Future<List<Map<String, dynamic>>> getDeliveryHistory({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    String? customerId,
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'deliverer_id': delivererId,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
        if (status != null) 'status': status,
        if (customerId != null) 'customer_id': customerId,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      };

      final response = await _dioClient.get(
        '/deliverer/history',
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data['data'] ?? response.data;
      return data.cast<Map<String, dynamic>>();
    } catch (error) {
      throw _handleError(error, 'Erreur lors de la récupération de l\'historique');
    }
  }

  /// Récupère les gains d'un livreur
  Future<Map<String, dynamic>> getDelivererEarnings({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'deliverer_id': delivererId,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
      };

      final response = await _dioClient.get(
        '/deliverer/earnings',
        queryParameters: queryParams,
      );

      return response.data;
    } catch (error) {
      throw _handleError(error, 'Erreur lors de la récupération des gains');
    }
  }

  /// Récupère les statistiques détaillées
  Future<Map<String, dynamic>> getDetailedStats({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'deliverer_id': delivererId,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
      };

      final response = await _dioClient.get(
        '/deliverer/stats/detailed',
        queryParameters: queryParams,
      );

      return response.data;
    } catch (error) {
      throw _handleError(error, 'Erreur lors de la récupération des statistiques');
    }
  }

  // ==================== SYNCHRONISATION ====================

  /// Synchronise toutes les données en attente
  Future<Map<String, dynamic>> syncAllPendingData(String delivererId) async {
    try {
      final response = await _dioClient.post(
        '/deliverer/sync',
        data: {'deliverer_id': delivererId},
      );

      return response.data;
    } catch (error) {
      throw _handleError(error, 'Erreur lors de la synchronisation');
    }
  }

  /// Vérifie le statut de synchronisation
  Future<Map<String, dynamic>> getSyncStatus(String delivererId) async {
    try {
      final response = await _dioClient.get(
        '/deliverer/sync/status',
        queryParameters: {'deliverer_id': delivererId},
      );

      return response.data;
    } catch (error) {
      throw _handleError(error, 'Erreur lors de la vérification du statut de sync');
    }
  }

  // ==================== MÉTHODES UTILITAIRES ====================

  /// Convertit une image en base64
  Future<String> _imageToBase64(String imagePath) async {
    try {
      final file = File(imagePath);
      if (!await file.exists()) {
        throw Exception('Fichier image non trouvé: $imagePath');
      }

      final bytes = await file.readAsBytes();
      return base64Encode(bytes);
    } catch (error) {
      throw Exception('Erreur lors de la conversion de l\'image: $error');
    }
  }

  /// Gère les erreurs et les convertit en messages utilisateur
  Exception _handleError(dynamic error, String defaultMessage) {
    if (error is Exception) {
      return error;
    }
    
    // Extraire le message d'erreur de la réponse API si possible
    String message = defaultMessage;
    try {
      if (error.response?.data != null) {
        final data = error.response.data;
        if (data is Map<String, dynamic>) {
          message = data['message'] ?? data['error'] ?? defaultMessage;
        }
      }
    } catch (_) {
      // Ignorer les erreurs de parsing
    }

    return Exception(message);
  }

  /// Vérifie si l'erreur est une erreur 404
  bool _isNotFoundError(dynamic error) {
    try {
      return error.response?.statusCode == 404;
    } catch (_) {
      return false;
    }
  }
}