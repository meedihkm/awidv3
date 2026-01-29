// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryHistoryItem _$DeliveryHistoryItemFromJson(Map<String, dynamic> json) =>
    _DeliveryHistoryItem(
      id: json['id'] as String,
      orderNumber: json['order_number'] as String,
      customerName: json['customer_name'] as String,
      customerAddress: json['customer_address'] as String,
      deliveryDate: DateTime.parse(json['delivery_date'] as String),
      status: $enumDecode(_$DeliveryHistoryStatusEnumMap, json['status']),
      orderAmount: (json['order_amount'] as num).toDouble(),
      deliveryFee: (json['delivery_fee'] as num?)?.toDouble(),
      tip: (json['tip'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      rating: json['rating'] as String?,
      feedback: json['feedback'] as String?,
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      deliveryDuration: (json['delivery_duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeliveryHistoryItemToJson(
        _DeliveryHistoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'customer_name': instance.customerName,
      'customer_address': instance.customerAddress,
      'delivery_date': instance.deliveryDate.toIso8601String(),
      'status': _$DeliveryHistoryStatusEnumMap[instance.status]!,
      'order_amount': instance.orderAmount,
      'delivery_fee': instance.deliveryFee,
      'tip': instance.tip,
      'notes': instance.notes,
      'rating': instance.rating,
      'feedback': instance.feedback,
      'completed_at': instance.completedAt?.toIso8601String(),
      'delivery_duration': instance.deliveryDuration,
    };

const _$DeliveryHistoryStatusEnumMap = {
  DeliveryHistoryStatus.completed: 'completed',
  DeliveryHistoryStatus.cancelled: 'cancelled',
  DeliveryHistoryStatus.failed: 'failed',
};
