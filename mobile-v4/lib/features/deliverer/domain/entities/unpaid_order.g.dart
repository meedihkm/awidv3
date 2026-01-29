// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unpaid_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnpaidOrder _$UnpaidOrderFromJson(Map<String, dynamic> json) => _UnpaidOrder(
      orderId: json['order_id'] as String,
      orderNumber: json['order_number'] as String,
      orderDate: DateTime.parse(json['order_date'] as String),
      totalAmount: (json['total_amount'] as num).toDouble(),
      paidAmount: (json['paid_amount'] as num).toDouble(),
      remainingAmount: (json['remaining_amount'] as num).toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$UnpaidOrderToJson(_UnpaidOrder instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_number': instance.orderNumber,
      'order_date': instance.orderDate.toIso8601String(),
      'total_amount': instance.totalAmount,
      'paid_amount': instance.paidAmount,
      'remaining_amount': instance.remainingAmount,
      'notes': instance.notes,
    };

_ManualAllocation _$ManualAllocationFromJson(Map<String, dynamic> json) =>
    _ManualAllocation(
      orderId: json['order_id'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$ManualAllocationToJson(_ManualAllocation instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'amount': instance.amount,
    };
