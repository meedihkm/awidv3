import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/customer_order.dart';

part 'customer_order_model.freezed.dart';
part 'customer_order_model.g.dart';

/// Model de Commande Client
/// Implémentation du model pour la sérialisation JSON
@freezed
class CustomerOrderModel with _$CustomerOrderModel {
  const factory CustomerOrderModel({
    required String id,
    required String orderNumber,
    required String customerId,
    required String customerName,
    required DateTime orderDate,
    DateTime? deliveryDate,
    required String status,
    required List<CustomerOrderItemModel> items,
    required double subtotal,
    required double deliveryFee,
    required double packagingDeposit,
    required double totalAmount,
    required double paidAmount,
    required double remainingAmount,
    String? delivererId,
    String? delivererName,
    String? deliveryAddress,
    String? notes,
    String? cancellationReason,
    DateTime? cancelledAt,
    DateTime? completedAt,
    @Default(false) bool hasProofOfDelivery,
    String? proofOfDeliveryId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerOrderModel;

  factory CustomerOrderModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerOrderModelFromJson(json);
}

/// Model d'Article de Commande
@freezed
class CustomerOrderItemModel with _$CustomerOrderItemModel {
  const factory CustomerOrderItemModel({
    required String id,
    required String productId,
    required String productName,
    required String productCode,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    String? productImage,
    String? unit,
    String? notes,
  }) = _CustomerOrderItemModel;

  factory CustomerOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerOrderItemModelFromJson(json);
}

/// Extensions de conversion
extension CustomerOrderModelX on CustomerOrderModel {
  /// Convertit le model en entité
  CustomerOrder toEntity() {
    return CustomerOrder(
      id: id,
      orderNumber: orderNumber,
      customerId: customerId,
      customerName: customerName,
      orderDate: orderDate,
      deliveryDate: deliveryDate,
      status: _parseOrderStatus(status),
      items: items.map((item) => item.toEntity()).toList(),
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      packagingDeposit: packagingDeposit,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      remainingAmount: remainingAmount,
      delivererId: delivererId,
      delivererName: delivererName,
      deliveryAddress: deliveryAddress,
      notes: notes,
      cancellationReason: cancellationReason,
      cancelledAt: cancelledAt,
      completedAt: completedAt,
      hasProofOfDelivery: hasProofOfDelivery,
      proofOfDeliveryId: proofOfDeliveryId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Parse le statut de commande
  OrderStatus _parseOrderStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return OrderStatus.pending;
      case 'confirmed':
        return OrderStatus.confirmed;
      case 'preparing':
        return OrderStatus.preparing;
      case 'ready':
        return OrderStatus.ready;
      case 'in_delivery':
        return OrderStatus.inDelivery;
      case 'delivered':
        return OrderStatus.delivered;
      case 'cancelled':
        return OrderStatus.cancelled;
      case 'failed':
        return OrderStatus.failed;
      default:
        return OrderStatus.pending;
    }
  }
}

extension CustomerOrderItemModelX on CustomerOrderItemModel {
  /// Convertit le model en entité
  CustomerOrderItem toEntity() {
    return CustomerOrderItem(
      id: id,
      productId: productId,
      productName: productName,
      productCode: productCode,
      quantity: quantity,
      unitPrice: unitPrice,
      totalPrice: totalPrice,
      productImage: productImage,
      unit: unit,
      notes: notes,
    );
  }
}

extension CustomerOrderEntityX on CustomerOrder {
  /// Convertit l'entité en model
  CustomerOrderModel toModel() {
    return CustomerOrderModel(
      id: id,
      orderNumber: orderNumber,
      customerId: customerId,
      customerName: customerName,
      orderDate: orderDate,
      deliveryDate: deliveryDate,
      status: _serializeOrderStatus(status),
      items: items.map((item) => item.toModel()).toList(),
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      packagingDeposit: packagingDeposit,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      remainingAmount: remainingAmount,
      delivererId: delivererId,
      delivererName: delivererName,
      deliveryAddress: deliveryAddress,
      notes: notes,
      cancellationReason: cancellationReason,
      cancelledAt: cancelledAt,
      completedAt: completedAt,
      hasProofOfDelivery: hasProofOfDelivery,
      proofOfDeliveryId: proofOfDeliveryId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Sérialise le statut de commande
  String _serializeOrderStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'pending';
      case OrderStatus.confirmed:
        return 'confirmed';
      case OrderStatus.preparing:
        return 'preparing';
      case OrderStatus.ready:
        return 'ready';
      case OrderStatus.inDelivery:
        return 'in_delivery';
      case OrderStatus.delivered:
        return 'delivered';
      case OrderStatus.cancelled:
        return 'cancelled';
      case OrderStatus.failed:
        return 'failed';
    }
  }
}

extension CustomerOrderItemEntityX on CustomerOrderItem {
  /// Convertit l'entité en model
  CustomerOrderItemModel toModel() {
    return CustomerOrderItemModel(
      id: id,
      productId: productId,
      productName: productName,
      productCode: productCode,
      quantity: quantity,
      unitPrice: unitPrice,
      totalPrice: totalPrice,
      productImage: productImage,
      unit: unit,
      notes: notes,
    );
  }
}
