// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packaging_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackagingTransaction _$PackagingTransactionFromJson(
        Map<String, dynamic> json) =>
    _PackagingTransaction(
      id: json['id'] as String,
      delivererId: json['deliverer_id'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      type: $enumDecode(_$PackagingTransactionTypeEnumMap, json['type']),
      items: (json['items'] as List<dynamic>)
          .map((e) => PackagingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      transactionDate: DateTime.parse(json['transaction_date'] as String),
      notes: json['notes'] as String?,
      qrCodeData: json['qr_code_data'] as String?,
      isUploaded: json['is_uploaded'] as bool? ?? false,
      uploadedAt: json['uploaded_at'] == null
          ? null
          : DateTime.parse(json['uploaded_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PackagingTransactionToJson(
        _PackagingTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deliverer_id': instance.delivererId,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'type': _$PackagingTransactionTypeEnumMap[instance.type]!,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'transaction_date': instance.transactionDate.toIso8601String(),
      'notes': instance.notes,
      'qr_code_data': instance.qrCodeData,
      'is_uploaded': instance.isUploaded,
      'uploaded_at': instance.uploadedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$PackagingTransactionTypeEnumMap = {
  PackagingTransactionType.deposit: 'deposit',
  PackagingTransactionType.return_: 'return',
};

_PackagingItem _$PackagingItemFromJson(Map<String, dynamic> json) =>
    _PackagingItem(
      packagingId: json['packaging_id'] as String,
      packagingName: json['packaging_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitValue: (json['unit_value'] as num).toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PackagingItemToJson(_PackagingItem instance) =>
    <String, dynamic>{
      'packaging_id': instance.packagingId,
      'packaging_name': instance.packagingName,
      'quantity': instance.quantity,
      'unit_value': instance.unitValue,
      'description': instance.description,
    };
