// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemModelImpl _$$OrderItemModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemModelImpl(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unit_price'] as num).toDouble(),
      totalPrice: (json['total_price'] as num).toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$OrderItemModelImplToJson(
        _$OrderItemModelImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'total_price': instance.totalPrice,
      'notes': instance.notes,
    };

_$OrderDetailModelImpl _$$OrderDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailModelImpl(
      id: json['id'] as String,
      orderNumber: json['order_number'] as String,
      status: json['status'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      organizationId: json['organization_id'] as String,
      organizationName: json['organization_name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      delivererId: json['deliverer_id'] as String?,
      delivererName: json['deliverer_name'] as String?,
      deliveryAddress: json['delivery_address'] as String?,
      deliveryInstructions: json['delivery_instructions'] as String?,
      paymentMethod: json['payment_method'] as String?,
      paymentStatus: json['payment_status'] as String?,
      scheduledFor: json['scheduled_for'] == null
          ? null
          : DateTime.parse(json['scheduled_for'] as String),
      deliveredAt: json['delivered_at'] == null
          ? null
          : DateTime.parse(json['delivered_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$OrderDetailModelImplToJson(
        _$OrderDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'status': instance.status,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'organization_id': instance.organizationId,
      'organization_name': instance.organizationName,
      'items': instance.items,
      'subtotal': instance.subtotal,
      'delivery_fee': instance.deliveryFee,
      'total_amount': instance.totalAmount,
      'created_at': instance.createdAt.toIso8601String(),
      'deliverer_id': instance.delivererId,
      'deliverer_name': instance.delivererName,
      'delivery_address': instance.deliveryAddress,
      'delivery_instructions': instance.deliveryInstructions,
      'payment_method': instance.paymentMethod,
      'payment_status': instance.paymentStatus,
      'scheduled_for': instance.scheduledFor?.toIso8601String(),
      'delivered_at': instance.deliveredAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
