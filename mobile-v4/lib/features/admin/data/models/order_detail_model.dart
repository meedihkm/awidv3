import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/order_detail.dart';

part 'order_detail_model.freezed.dart';
part 'order_detail_model.g.dart';

/// Order Item Model
@freezed
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    required int quantity,
    @JsonKey(name: 'unit_price') required double unitPrice,
    @JsonKey(name: 'total_price') required double totalPrice,
    String? notes,
  }) = _OrderItemModel;

  factory OrderItemModel.fromEntity(OrderItem entity) {
    return OrderItemModel(
      productId: entity.productId,
      productName: entity.productName,
      quantity: entity.quantity,
      unitPrice: entity.unitPrice,
      totalPrice: entity.totalPrice,
      notes: entity.notes,
    );
  }

  const OrderItemModel._();

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

  OrderItem toEntity() {
    return OrderItem(
      productId: productId,
      productName: productName,
      quantity: quantity,
      unitPrice: unitPrice,
      totalPrice: totalPrice,
      notes: notes,
    );
  }
}

/// Order Detail Model
/// Model pour la sérialisation JSON des détails de commande
@freezed
class OrderDetailModel with _$OrderDetailModel {
  const factory OrderDetailModel({
    required String id,
    @JsonKey(name: 'order_number') required String orderNumber,
    required String status,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'organization_id') required String organizationId,
    @JsonKey(name: 'organization_name') required String organizationName,
    required List<OrderItemModel> items,
    required double subtotal,
    @JsonKey(name: 'delivery_fee') required double deliveryFee,
    @JsonKey(name: 'total_amount') required double totalAmount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'deliverer_id') String? delivererId,
    @JsonKey(name: 'deliverer_name') String? delivererName,
    @JsonKey(name: 'delivery_address') String? deliveryAddress,
    @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'scheduled_for') DateTime? scheduledFor,
    @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _OrderDetailModel;

  /// From Entity
  factory OrderDetailModel.fromEntity(OrderDetail entity) {
    return OrderDetailModel(
      id: entity.id,
      orderNumber: entity.orderNumber,
      status: entity.status,
      customerId: entity.customerId,
      customerName: entity.customerName,
      organizationId: entity.organizationId,
      organizationName: entity.organizationName,
      items: entity.items.map((item) => OrderItemModel.fromEntity(item)).toList(),
      subtotal: entity.subtotal,
      deliveryFee: entity.deliveryFee,
      totalAmount: entity.totalAmount,
      createdAt: entity.createdAt,
      delivererId: entity.delivererId,
      delivererName: entity.delivererName,
      deliveryAddress: entity.deliveryAddress,
      deliveryInstructions: entity.deliveryInstructions,
      paymentMethod: entity.paymentMethod,
      paymentStatus: entity.paymentStatus,
      scheduledFor: entity.scheduledFor,
      deliveredAt: entity.deliveredAt,
      updatedAt: entity.updatedAt,
    );
  }

  const OrderDetailModel._();

  /// From JSON
  factory OrderDetailModel.fromJson(Map<String, dynamic> json) => _$OrderDetailModelFromJson(json);

  /// To Entity
  OrderDetail toEntity() {
    return OrderDetail(
      id: id,
      orderNumber: orderNumber,
      status: status,
      customerId: customerId,
      customerName: customerName,
      organizationId: organizationId,
      organizationName: organizationName,
      items: items.map((item) => item.toEntity()).toList(),
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      totalAmount: totalAmount,
      createdAt: createdAt,
      delivererId: delivererId,
      delivererName: delivererName,
      deliveryAddress: deliveryAddress,
      deliveryInstructions: deliveryInstructions,
      paymentMethod: paymentMethod,
      paymentStatus: paymentStatus,
      scheduledFor: scheduledFor,
      deliveredAt: deliveredAt,
      updatedAt: updatedAt,
    );
  }
}
