// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderSummaryModel _$OrderSummaryModelFromJson(Map<String, dynamic> json) =>
    _OrderSummaryModel(
      id: json['id'] as String,
      customerName: json['customer_name'] as String,
      customerOrganization: json['customer_organization'] as String,
      status: json['status'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      itemsCount: (json['items_count'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      delivererName: json['deliverer_name'] as String?,
      deliveryTime: json['delivery_time'] == null
          ? null
          : DateTime.parse(json['delivery_time'] as String),
    );

Map<String, dynamic> _$OrderSummaryModelToJson(_OrderSummaryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_name': instance.customerName,
      'customer_organization': instance.customerOrganization,
      'status': instance.status,
      'total_amount': instance.totalAmount,
      'items_count': instance.itemsCount,
      'created_at': instance.createdAt.toIso8601String(),
      'deliverer_name': instance.delivererName,
      'delivery_time': instance.deliveryTime?.toIso8601String(),
    };
