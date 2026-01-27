import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/delivery.dart';

part 'delivery_model.freezed.dart';
part 'delivery_model.g.dart';

/// Delivery Model
/// Model pour la sérialisation JSON de la livraison
@freezed
class DeliveryModel with _$DeliveryModel {
  const factory DeliveryModel({
    required String id,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'order_number') required String orderNumber,
    required String status,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'customer_phone') required String customerPhone,
    @JsonKey(name: 'delivery_address') required String deliveryAddress,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'total_amount') required double totalAmount,
    @JsonKey(name: 'scheduled_for') required DateTime scheduledFor,
    @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
    @JsonKey(name: 'customer_organization') String? customerOrganization,
    @JsonKey(name: 'items_count') int? itemsCount,
    @JsonKey(name: 'picked_up_at') DateTime? pickedUpAt,
    @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _DeliveryModel;

  const DeliveryModel._();

  /// From JSON
  factory DeliveryModel.fromJson(Map<String, dynamic> json) => _$DeliveryModelFromJson(json);

  /// To Entity
  Delivery toEntity() {
    return Delivery(
      id: id,
      orderId: orderId,
      orderNumber: orderNumber,
      status: status,
      customerName: customerName,
      customerPhone: customerPhone,
      deliveryAddress: deliveryAddress,
      latitude: latitude,
      longitude: longitude,
      totalAmount: totalAmount,
      scheduledFor: scheduledFor,
      deliveryInstructions: deliveryInstructions,
      customerOrganization: customerOrganization,
      itemsCount: itemsCount,
      pickedUpAt: pickedUpAt,
      deliveredAt: deliveredAt,
      createdAt: createdAt,
    );
  }

  /// From Entity
  factory DeliveryModel.fromEntity(Delivery entity) {
    return DeliveryModel(
      id: entity.id,
      orderId: entity.orderId,
      orderNumber: entity.orderNumber,
      status: entity.status,
      customerName: entity.customerName,
      customerPhone: entity.customerPhone,
      deliveryAddress: entity.deliveryAddress,
      latitude: entity.latitude,
      longitude: entity.longitude,
      totalAmount: entity.totalAmount,
      scheduledFor: entity.scheduledFor,
      deliveryInstructions: entity.deliveryInstructions,
      customerOrganization: entity.customerOrganization,
      itemsCount: entity.itemsCount,
      pickedUpAt: entity.pickedUpAt,
      deliveredAt: entity.deliveredAt,
      createdAt: entity.createdAt,
    );
  }
}
