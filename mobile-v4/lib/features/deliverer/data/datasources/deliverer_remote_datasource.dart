import '../../../../core/network/dio_client.dart';
import '../models/delivery_model.dart';
import '../models/delivery_stats_model.dart';
import '../models/route_model.dart';

/// Deliverer Remote Datasource
/// Gère les appels API pour les livreurs
class DelivererRemoteDatasource {
  const DelivererRemoteDatasource(this._dioClient);

  final DioClient _dioClient;

  /// Get deliveries
  Future<List<DeliveryModel>> getDeliveries({
    String? status,
    DateTime? date,
  }) async {
    final queryParams = <String, dynamic>{};

    if (status != null) queryParams['status'] = status;
    if (date != null) queryParams['date'] = date.toIso8601String();

    final response = await _dioClient.get(
      '/api/v1/deliverer/deliveries',
      queryParameters: queryParams,
    );

    final List<dynamic> data = response.data['data'] ?? response.data;
    return data.map((json) => DeliveryModel.fromJson(json)).toList();
  }

  /// Get delivery by ID
  Future<DeliveryModel> getDeliveryById(String id) async {
    final response = await _dioClient.get(
      '/api/v1/deliverer/deliveries/$id',
    );

    return DeliveryModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Get stats
  Future<DeliveryStatsModel> getStats({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final queryParams = <String, dynamic>{};

    if (startDate != null) {
      queryParams['start_date'] = startDate.toIso8601String();
    }
    if (endDate != null) {
      queryParams['end_date'] = endDate.toIso8601String();
    }

    final response = await _dioClient.get(
      '/api/v1/deliverer/stats',
      queryParameters: queryParams,
    );

    return DeliveryStatsModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Update delivery status
  Future<DeliveryModel> updateDeliveryStatus(
    String deliveryId,
    String status,
  ) async {
    final response = await _dioClient.patch(
      '/api/v1/deliverer/deliveries/$deliveryId/status',
      data: {'status': status},
    );

    return DeliveryModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Start delivery
  Future<DeliveryModel> startDelivery(String deliveryId) async {
    final response = await _dioClient.post(
      '/api/v1/deliverer/deliveries/$deliveryId/start',
    );

    return DeliveryModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Complete delivery
  Future<DeliveryModel> completeDelivery({
    required String deliveryId,
    String? notes,
    String? signatureUrl,
    String? photoUrl,
  }) async {
    final data = <String, dynamic>{};

    if (notes != null) data['notes'] = notes;
    if (signatureUrl != null) data['signature_url'] = signatureUrl;
    if (photoUrl != null) data['photo_url'] = photoUrl;

    final response = await _dioClient.post(
      '/api/v1/deliverer/deliveries/$deliveryId/complete',
      data: data,
    );

    return DeliveryModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Get route
  Future<DeliveryRouteModel> getRoute({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  }) async {
    final response = await _dioClient.post(
      '/api/v1/deliverer/route',
      data: {
        'start_lat': startLat,
        'start_lng': startLng,
        'end_lat': endLat,
        'end_lng': endLng,
      },
    );

    return DeliveryRouteModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Update location
  Future<void> updateLocation({
    required double latitude,
    required double longitude,
  }) async {
    await _dioClient.post(
      '/api/v1/deliverer/location',
      data: {
        'latitude': latitude,
        'longitude': longitude,
      },
    );
  }

  /// Get active delivery
  Future<DeliveryModel?> getActiveDelivery() async {
    try {
      final response = await _dioClient.get(
        '/api/v1/deliverer/deliveries/active',
      );

      return DeliveryModel.fromJson(response.data['data'] ?? response.data);
    } catch (e) {
      return null;
    }
  }
}
