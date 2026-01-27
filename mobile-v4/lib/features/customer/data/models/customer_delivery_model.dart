import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/customer_delivery.dart';

part 'customer_delivery_model.freezed.dart';
part 'customer_delivery_model.g.dart';

/// Model de Livraison Client
@freezed
class CustomerDeliveryModel with _$CustomerDeliveryModel {
  const factory CustomerDeliveryModel({
    required String id,
    required String deliveryNumber,
    required String customerId,
    required String customerName,
    required String delivererId,
    required String delivererName,
    String? delivererPhone,
    String? delivererPhoto,
    required List<String> orderIds,
    required int ordersCount,
    required double totalAmount,
    required String status,
    required DateTime scheduledDate,
    DateTime? startedAt,
    DateTime? estimatedArrival,
    DateTime? completedAt,
    required String deliveryAddress,
    double? deliveryLatitude,
    double? deliveryLongitude,
    double? currentLatitude,
    double? currentLongitude,
    double? distanceRemaining,
    List<DeliveryTrackingPointModel>? trackingPoints,
    String? notes,
    String? proofOfDeliveryId,
    @Default(false) bool hasProofOfDelivery,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerDeliveryModel;

  factory CustomerDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDeliveryModelFromJson(json);
}

/// Model de Point de Suivi
@freezed
class DeliveryTrackingPointModel with _$DeliveryTrackingPointModel {
  const factory DeliveryTrackingPointModel({
    required String id,
    required double latitude,
    required double longitude,
    required DateTime timestamp,
    double? speed,
    double? accuracy,
  }) = _DeliveryTrackingPointModel;

  factory DeliveryTrackingPointModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryTrackingPointModelFromJson(json);
}

extension CustomerDeliveryModelX on CustomerDeliveryModel {
  CustomerDelivery toEntity() {
    return CustomerDelivery(
      id: id,
      deliveryNumber: deliveryNumber,
      customerId: customerId,
      customerName: customerName,
      delivererId: delivererId,
      delivererName: delivererName,
      delivererPhone: delivererPhone,
      delivererPhoto: delivererPhoto,
      orderIds: orderIds,
      ordersCount: ordersCount,
      totalAmount: totalAmount,
      status: _parseDeliveryStatus(status),
      scheduledDate: scheduledDate,
      startedAt: startedAt,
      estimatedArrival: estimatedArrival,
      completedAt: completedAt,
      deliveryAddress: deliveryAddress,
      deliveryLatitude: deliveryLatitude,
      deliveryLongitude: deliveryLongitude,
      currentLatitude: currentLatitude,
      currentLongitude: currentLongitude,
      distanceRemaining: distanceRemaining,
      trackingPoints: trackingPoints?.map((p) => p.toEntity()).toList(),
      notes: notes,
      proofOfDeliveryId: proofOfDeliveryId,
      hasProofOfDelivery: hasProofOfDelivery,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  DeliveryStatus _parseDeliveryStatus(String status) {
    switch (status.toLowerCase()) {
      case 'scheduled':
        return DeliveryStatus.scheduled;
      case 'assigned':
        return DeliveryStatus.assigned;
      case 'in_progress':
        return DeliveryStatus.inProgress;
      case 'near_destination':
        return DeliveryStatus.nearDestination;
      case 'arrived':
        return DeliveryStatus.arrived;
      case 'completed':
        return DeliveryStatus.completed;
      case 'failed':
        return DeliveryStatus.failed;
      case 'cancelled':
        return DeliveryStatus.cancelled;
      default:
        return DeliveryStatus.scheduled;
    }
  }
}

extension DeliveryTrackingPointModelX on DeliveryTrackingPointModel {
  DeliveryTrackingPoint toEntity() {
    return DeliveryTrackingPoint(
      id: id,
      latitude: latitude,
      longitude: longitude,
      timestamp: timestamp,
      speed: speed,
      accuracy: accuracy,
    );
  }
}

extension CustomerDeliveryEntityX on CustomerDelivery {
  CustomerDeliveryModel toModel() {
    return CustomerDeliveryModel(
      id: id,
      deliveryNumber: deliveryNumber,
      customerId: customerId,
      customerName: customerName,
      delivererId: delivererId,
      delivererName: delivererName,
      delivererPhone: delivererPhone,
      delivererPhoto: delivererPhoto,
      orderIds: orderIds,
      ordersCount: ordersCount,
      totalAmount: totalAmount,
      status: _serializeDeliveryStatus(status),
      scheduledDate: scheduledDate,
      startedAt: startedAt,
      estimatedArrival: estimatedArrival,
      completedAt: completedAt,
      deliveryAddress: deliveryAddress,
      deliveryLatitude: deliveryLatitude,
      deliveryLongitude: deliveryLongitude,
      currentLatitude: currentLatitude,
      currentLongitude: currentLongitude,
      distanceRemaining: distanceRemaining,
      trackingPoints: trackingPoints?.map((p) => p.toModel()).toList(),
      notes: notes,
      proofOfDeliveryId: proofOfDeliveryId,
      hasProofOfDelivery: hasProofOfDelivery,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  String _serializeDeliveryStatus(DeliveryStatus status) {
    switch (status) {
      case DeliveryStatus.scheduled:
        return 'scheduled';
      case DeliveryStatus.assigned:
        return 'assigned';
      case DeliveryStatus.inProgress:
        return 'in_progress';
      case DeliveryStatus.nearDestination:
        return 'near_destination';
      case DeliveryStatus.arrived:
        return 'arrived';
      case DeliveryStatus.completed:
        return 'completed';
      case DeliveryStatus.failed:
        return 'failed';
      case DeliveryStatus.cancelled:
        return 'cancelled';
    }
  }
}

extension DeliveryTrackingPointEntityX on DeliveryTrackingPoint {
  DeliveryTrackingPointModel toModel() {
    return DeliveryTrackingPointModel(
      id: id,
      latitude: latitude,
      longitude: longitude,
      timestamp: timestamp,
      speed: speed,
      accuracy: accuracy,
    );
  }
}
