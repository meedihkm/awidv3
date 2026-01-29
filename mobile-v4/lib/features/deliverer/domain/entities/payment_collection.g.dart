// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentCollection _$PaymentCollectionFromJson(Map<String, dynamic> json) =>
    _PaymentCollection(
      id: json['id'] as String,
      delivererId: json['deliverer_id'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      amount: (json['amount'] as num).toDouble(),
      mode: $enumDecode(_$PaymentModeEnumMap, json['mode']),
      collectedAt: DateTime.parse(json['collected_at'] as String),
      allocations: (json['allocations'] as List<dynamic>)
          .map((e) => PaymentAllocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      reference: json['reference'] as String?,
      notes: json['notes'] as String?,
      receiptImagePath: json['receipt_image_path'] as String?,
      isUploaded: json['is_uploaded'] as bool? ?? false,
      uploadedAt: json['uploaded_at'] == null
          ? null
          : DateTime.parse(json['uploaded_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PaymentCollectionToJson(_PaymentCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deliverer_id': instance.delivererId,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'amount': instance.amount,
      'mode': _$PaymentModeEnumMap[instance.mode]!,
      'collected_at': instance.collectedAt.toIso8601String(),
      'allocations': instance.allocations.map((e) => e.toJson()).toList(),
      'reference': instance.reference,
      'notes': instance.notes,
      'receipt_image_path': instance.receiptImagePath,
      'is_uploaded': instance.isUploaded,
      'uploaded_at': instance.uploadedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$PaymentModeEnumMap = {
  PaymentMode.cash: 'cash',
  PaymentMode.check: 'check',
  PaymentMode.transfer: 'transfer',
  PaymentMode.card: 'card',
};

_PaymentAllocation _$PaymentAllocationFromJson(Map<String, dynamic> json) =>
    _PaymentAllocation(
      orderId: json['order_id'] as String,
      orderNumber: json['order_number'] as String,
      allocatedAmount: (json['allocated_amount'] as num).toDouble(),
      orderDate: DateTime.parse(json['order_date'] as String),
      isFullyPaid: json['is_fully_paid'] as bool? ?? false,
    );

Map<String, dynamic> _$PaymentAllocationToJson(_PaymentAllocation instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_number': instance.orderNumber,
      'allocated_amount': instance.allocatedAmount,
      'order_date': instance.orderDate.toIso8601String(),
      'is_fully_paid': instance.isFullyPaid,
    };
