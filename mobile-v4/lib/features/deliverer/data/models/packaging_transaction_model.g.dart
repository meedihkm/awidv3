// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packaging_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackagingTransactionModel _$PackagingTransactionModelFromJson(
        Map<String, dynamic> json) =>
    _PackagingTransactionModel(
      id: json['id'] as String,
      delivererId: json['deliverer_id'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      type: $enumDecode(_$PackagingTransactionTypeEnumMap, json['type']),
      items: (json['items'] as List<dynamic>)
          .map((e) => PackagingItemModel.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$PackagingTransactionModelToJson(
        _PackagingTransactionModel instance) =>
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

_PackagingItemModel _$PackagingItemModelFromJson(Map<String, dynamic> json) =>
    _PackagingItemModel(
      packagingId: json['packaging_id'] as String,
      packagingName: json['packaging_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitValue: (json['unit_value'] as num).toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PackagingItemModelToJson(_PackagingItemModel instance) =>
    <String, dynamic>{
      'packaging_id': instance.packagingId,
      'packaging_name': instance.packagingName,
      'quantity': instance.quantity,
      'unit_value': instance.unitValue,
      'description': instance.description,
    };

_UploadPackagingTransactionRequest _$UploadPackagingTransactionRequestFromJson(
        Map<String, dynamic> json) =>
    _UploadPackagingTransactionRequest(
      delivererId: json['deliverer_id'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      type: json['type'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      transactionDate: DateTime.parse(json['transaction_date'] as String),
      notes: json['notes'] as String?,
      qrCodeData: json['qr_code_data'] as String?,
    );

Map<String, dynamic> _$UploadPackagingTransactionRequestToJson(
        _UploadPackagingTransactionRequest instance) =>
    <String, dynamic>{
      'deliverer_id': instance.delivererId,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'type': instance.type,
      'items': instance.items,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'notes': instance.notes,
      'qr_code_data': instance.qrCodeData,
    };

_UploadPackagingTransactionResponse
    _$UploadPackagingTransactionResponseFromJson(Map<String, dynamic> json) =>
        _UploadPackagingTransactionResponse(
          id: json['id'] as String,
          status: json['status'] as String,
          message: json['message'] as String,
          uploadedAt: DateTime.parse(json['uploaded_at'] as String),
          newBalance: (json['new_balance'] as num?)?.toDouble(),
          balanceItems: (json['balance_items'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList(),
        );

Map<String, dynamic> _$UploadPackagingTransactionResponseToJson(
        _UploadPackagingTransactionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'message': instance.message,
      'uploaded_at': instance.uploadedAt.toIso8601String(),
      'new_balance': instance.newBalance,
      'balance_items': instance.balanceItems,
    };

_PackagingBalanceModel _$PackagingBalanceModelFromJson(
        Map<String, dynamic> json) =>
    _PackagingBalanceModel(
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              PackagingBalanceItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalValue: (json['total_value'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$PackagingBalanceModelToJson(
        _PackagingBalanceModel instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'total_value': instance.totalValue,
      'last_updated': instance.lastUpdated.toIso8601String(),
    };

_PackagingBalanceItemModel _$PackagingBalanceItemModelFromJson(
        Map<String, dynamic> json) =>
    _PackagingBalanceItemModel(
      packagingId: json['packaging_id'] as String,
      packagingName: json['packaging_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitValue: (json['unit_value'] as num).toDouble(),
      totalValue: (json['total_value'] as num).toDouble(),
    );

Map<String, dynamic> _$PackagingBalanceItemModelToJson(
        _PackagingBalanceItemModel instance) =>
    <String, dynamic>{
      'packaging_id': instance.packagingId,
      'packaging_name': instance.packagingName,
      'quantity': instance.quantity,
      'unit_value': instance.unitValue,
      'total_value': instance.totalValue,
    };

_PackagingTypeModel _$PackagingTypeModelFromJson(Map<String, dynamic> json) =>
    _PackagingTypeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      value: (json['value'] as num).toDouble(),
      qrCodePattern: json['qr_code_pattern'] as String?,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$PackagingTypeModelToJson(_PackagingTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'value': instance.value,
      'qr_code_pattern': instance.qrCodePattern,
      'is_active': instance.isActive,
    };

_PackagingQrDataModel _$PackagingQrDataModelFromJson(
        Map<String, dynamic> json) =>
    _PackagingQrDataModel(
      packagingId: json['packaging_id'] as String,
      packagingName: json['packaging_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      batchNumber: json['batch_number'] as String?,
      expiryDate: json['expiry_date'] == null
          ? null
          : DateTime.parse(json['expiry_date'] as String),
    );

Map<String, dynamic> _$PackagingQrDataModelToJson(
        _PackagingQrDataModel instance) =>
    <String, dynamic>{
      'packaging_id': instance.packagingId,
      'packaging_name': instance.packagingName,
      'quantity': instance.quantity,
      'batch_number': instance.batchNumber,
      'expiry_date': instance.expiryDate?.toIso8601String(),
    };
