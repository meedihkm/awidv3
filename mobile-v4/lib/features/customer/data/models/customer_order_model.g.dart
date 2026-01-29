// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerOrderModel _$CustomerOrderModelFromJson(Map<String, dynamic> json) =>
    _CustomerOrderModel(
      id: json['id'] as String,
      orderNumber: json['order_number'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      orderDate: DateTime.parse(json['order_date'] as String),
      deliveryDate: json['delivery_date'] == null
          ? null
          : DateTime.parse(json['delivery_date'] as String),
      status: json['status'] as String,
      items: (json['items'] as List<dynamic>)
          .map(
              (e) => CustomerOrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      packagingDeposit: (json['packaging_deposit'] as num).toDouble(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      paidAmount: (json['paid_amount'] as num).toDouble(),
      remainingAmount: (json['remaining_amount'] as num).toDouble(),
      delivererId: json['deliverer_id'] as String?,
      delivererName: json['deliverer_name'] as String?,
      deliveryAddress: json['delivery_address'] as String?,
      notes: json['notes'] as String?,
      cancellationReason: json['cancellation_reason'] as String?,
      cancelledAt: json['cancelled_at'] == null
          ? null
          : DateTime.parse(json['cancelled_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      hasProofOfDelivery: json['has_proof_of_delivery'] as bool? ?? false,
      proofOfDeliveryId: json['proof_of_delivery_id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CustomerOrderModelToJson(_CustomerOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'order_date': instance.orderDate.toIso8601String(),
      'delivery_date': instance.deliveryDate?.toIso8601String(),
      'status': instance.status,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'subtotal': instance.subtotal,
      'delivery_fee': instance.deliveryFee,
      'packaging_deposit': instance.packagingDeposit,
      'total_amount': instance.totalAmount,
      'paid_amount': instance.paidAmount,
      'remaining_amount': instance.remainingAmount,
      'deliverer_id': instance.delivererId,
      'deliverer_name': instance.delivererName,
      'delivery_address': instance.deliveryAddress,
      'notes': instance.notes,
      'cancellation_reason': instance.cancellationReason,
      'cancelled_at': instance.cancelledAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
      'has_proof_of_delivery': instance.hasProofOfDelivery,
      'proof_of_delivery_id': instance.proofOfDeliveryId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_CustomerOrderItemModel _$CustomerOrderItemModelFromJson(
        Map<String, dynamic> json) =>
    _CustomerOrderItemModel(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      productCode: json['product_code'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unit_price'] as num).toDouble(),
      totalPrice: (json['total_price'] as num).toDouble(),
      productImage: json['product_image'] as String?,
      unit: json['unit'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$CustomerOrderItemModelToJson(
        _CustomerOrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_code': instance.productCode,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'total_price': instance.totalPrice,
      'product_image': instance.productImage,
      'unit': instance.unit,
      'notes': instance.notes,
    };
