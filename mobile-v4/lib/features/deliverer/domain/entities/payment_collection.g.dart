// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentCollectionImpl _$$PaymentCollectionImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentCollectionImpl(
      id: json['id'] as String,
      delivererId: json['delivererId'] as String,
      customerId: json['customerId'] as String,
      customerName: json['customerName'] as String,
      amount: (json['amount'] as num).toDouble(),
      mode: $enumDecode(_$PaymentModeEnumMap, json['mode']),
      collectedAt: DateTime.parse(json['collectedAt'] as String),
      allocations: (json['allocations'] as List<dynamic>)
          .map((e) => PaymentAllocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      reference: json['reference'] as String?,
      notes: json['notes'] as String?,
      receiptImagePath: json['receiptImagePath'] as String?,
      isUploaded: json['isUploaded'] as bool? ?? false,
      uploadedAt: json['uploadedAt'] == null
          ? null
          : DateTime.parse(json['uploadedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PaymentCollectionImplToJson(
        _$PaymentCollectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'delivererId': instance.delivererId,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'amount': instance.amount,
      'mode': _$PaymentModeEnumMap[instance.mode]!,
      'collectedAt': instance.collectedAt.toIso8601String(),
      'allocations': instance.allocations,
      'reference': instance.reference,
      'notes': instance.notes,
      'receiptImagePath': instance.receiptImagePath,
      'isUploaded': instance.isUploaded,
      'uploadedAt': instance.uploadedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$PaymentModeEnumMap = {
  PaymentMode.cash: 'cash',
  PaymentMode.check: 'check',
  PaymentMode.transfer: 'transfer',
  PaymentMode.card: 'card',
};

_$PaymentAllocationImpl _$$PaymentAllocationImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentAllocationImpl(
      orderId: json['orderId'] as String,
      orderNumber: json['orderNumber'] as String,
      allocatedAmount: (json['allocatedAmount'] as num).toDouble(),
      orderDate: DateTime.parse(json['orderDate'] as String),
      isFullyPaid: json['isFullyPaid'] as bool? ?? false,
    );

Map<String, dynamic> _$$PaymentAllocationImplToJson(
        _$PaymentAllocationImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderNumber': instance.orderNumber,
      'allocatedAmount': instance.allocatedAmount,
      'orderDate': instance.orderDate.toIso8601String(),
      'isFullyPaid': instance.isFullyPaid,
    };
