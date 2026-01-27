import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/packaging_transaction.dart';
import '../../domain/repositories/delivery_actions_repository.dart';

part 'packaging_transaction_model.freezed.dart';
part 'packaging_transaction_model.g.dart';

/// Model: Transaction de Consigne
/// Model pour la sérialisation JSON de la transaction de consigne
@freezed
class PackagingTransactionModel with _$PackagingTransactionModel {
  const factory PackagingTransactionModel({
    required String id,
    @JsonKey(name: 'deliverer_id') required String delivererId,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') required String customerName,
    required PackagingTransactionType type,
    required List<PackagingItemModel> items,
    @JsonKey(name: 'transaction_date') required DateTime transactionDate,
    String? notes,
    @JsonKey(name: 'qr_code_data') String? qrCodeData,
    @JsonKey(name: 'is_uploaded') @Default(false) bool isUploaded,
    @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _PackagingTransactionModel;

  factory PackagingTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$PackagingTransactionModelFromJson(json);
}

/// Model: Article de Consigne
@freezed
class PackagingItemModel with _$PackagingItemModel {
  const factory PackagingItemModel({
    @JsonKey(name: 'packaging_id') required String packagingId,
    @JsonKey(name: 'packaging_name') required String packagingName,
    required int quantity,
    @JsonKey(name: 'unit_value') required double unitValue,
    String? description,
  }) = _PackagingItemModel;

  factory PackagingItemModel.fromJson(Map<String, dynamic> json) =>
      _$PackagingItemModelFromJson(json);
}

extension PackagingTransactionModelX on PackagingTransactionModel {
  /// Convertit le model en entité domain
  PackagingTransaction toEntity() {
    return PackagingTransaction(
      id: id,
      delivererId: delivererId,
      customerId: customerId,
      customerName: customerName,
      type: type,
      items: items.map((i) => i.toEntity()).toList(),
      transactionDate: transactionDate,
      notes: notes,
      qrCodeData: qrCodeData,
      isUploaded: isUploaded,
      uploadedAt: uploadedAt,
      createdAt: createdAt,
    );
  }

  /// Crée un model à partir d'une entité domain
  static PackagingTransactionModel fromEntity(PackagingTransaction entity) {
    return PackagingTransactionModel(
      id: entity.id,
      delivererId: entity.delivererId,
      customerId: entity.customerId,
      customerName: entity.customerName,
      type: entity.type,
      items: entity.items
          .map((i) => packagingItemModelFromEntity(i))
          .toList(),
      transactionDate: entity.transactionDate,
      notes: entity.notes,
      qrCodeData: entity.qrCodeData,
      isUploaded: entity.isUploaded,
      uploadedAt: entity.uploadedAt,
      createdAt: entity.createdAt,
    );
  }

  /// Crée un model pour l'upload vers l'API
  Map<String, dynamic> toUploadJson() {
    return {
      'deliverer_id': delivererId,
      'customer_id': customerId,
      'customer_name': customerName,
      'type': type.name,
      'items': items.map((i) => i.toUploadJson()).toList(),
      'transaction_date': transactionDate.toIso8601String(),
      if (notes?.isNotEmpty == true) 'notes': notes,
      if (qrCodeData?.isNotEmpty == true) 'qr_code_data': qrCodeData,
    };
  }
}

/// Crée un PackagingTransactionModel à partir d'une entité domain
PackagingTransactionModel packagingTransactionModelFromEntity(PackagingTransaction entity) {
  return PackagingTransactionModel(
    id: entity.id,
    delivererId: entity.delivererId,
    customerId: entity.customerId,
    customerName: entity.customerName,
    type: entity.type,
    items: entity.items
        .map((i) => packagingItemModelFromEntity(i))
        .toList(),
    transactionDate: entity.transactionDate,
    notes: entity.notes,
    qrCodeData: entity.qrCodeData,
    isUploaded: entity.isUploaded,
    uploadedAt: entity.uploadedAt,
    createdAt: entity.createdAt,
  );
}

/// Crée un PackagingTransactionModel à partir de la réponse API
PackagingTransactionModel packagingTransactionModelFromApiResponse(Map<String, dynamic> json) {
  return PackagingTransactionModel(
    id: json['id'] as String,
    delivererId: json['deliverer_id'] as String,
    customerId: json['customer_id'] as String,
    customerName: json['customer_name'] as String,
    type: PackagingTransactionType.values.firstWhere(
      (t) => t.name == json['type'],
      orElse: () => PackagingTransactionType.deposit,
    ),
    items: (json['items'] as List)
        .map((i) => packagingItemModelFromApiResponse(i))
        .toList(),
    transactionDate: DateTime.parse(json['transaction_date'] as String),
    notes: json['notes'] as String?,
    qrCodeData: json['qr_code_data'] as String?,
    isUploaded: json['is_uploaded'] as bool? ?? true,
    uploadedAt: json['uploaded_at'] != null 
        ? DateTime.parse(json['uploaded_at'] as String)
        : null,
    createdAt: json['created_at'] != null 
        ? DateTime.parse(json['created_at'] as String)
        : null,
  );
}

extension PackagingItemModelX on PackagingItemModel {
  /// Convertit le model en entité domain
  PackagingItem toEntity() {
    return PackagingItem(
      packagingId: packagingId,
      packagingName: packagingName,
      quantity: quantity,
      unitValue: unitValue,
      description: description,
    );
  }

  /// Crée un model pour l'upload vers l'API
  Map<String, dynamic> toUploadJson() {
    return {
      'packaging_id': packagingId,
      'packaging_name': packagingName,
      'quantity': quantity,
      'unit_value': unitValue,
      if (description?.isNotEmpty == true) 'description': description,
    };
  }
}

/// Crée un PackagingItemModel à partir d'une entité domain
PackagingItemModel packagingItemModelFromEntity(PackagingItem entity) {
  return PackagingItemModel(
    packagingId: entity.packagingId,
    packagingName: entity.packagingName,
    quantity: entity.quantity,
    unitValue: entity.unitValue,
    description: entity.description,
  );
}

/// Crée un PackagingItemModel à partir de la réponse API
PackagingItemModel packagingItemModelFromApiResponse(Map<String, dynamic> json) {
  return PackagingItemModel(
    packagingId: json['packaging_id'] as String,
    packagingName: json['packaging_name'] as String,
    quantity: json['quantity'] as int,
    unitValue: (json['unit_value'] as num).toDouble(),
    description: json['description'] as String?,
  );
}

/// Model pour la requête d'upload de transaction
@freezed
class UploadPackagingTransactionRequest with _$UploadPackagingTransactionRequest {
  const factory UploadPackagingTransactionRequest({
    @JsonKey(name: 'deliverer_id') required String delivererId,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') required String customerName,
    required String type,
    required List<Map<String, dynamic>> items,
    @JsonKey(name: 'transaction_date') required DateTime transactionDate,
    String? notes,
    @JsonKey(name: 'qr_code_data') String? qrCodeData,
  }) = _UploadPackagingTransactionRequest;

  factory UploadPackagingTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadPackagingTransactionRequestFromJson(json);
}

/// Model pour la réponse d'upload de transaction
@freezed
class UploadPackagingTransactionResponse with _$UploadPackagingTransactionResponse {
  const factory UploadPackagingTransactionResponse({
    required String id,
    required String status,
    required String message,
    @JsonKey(name: 'uploaded_at') required DateTime uploadedAt,
    @JsonKey(name: 'new_balance') double? newBalance,
    @JsonKey(name: 'balance_items') List<Map<String, dynamic>>? balanceItems,
  }) = _UploadPackagingTransactionResponse;

  factory UploadPackagingTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadPackagingTransactionResponseFromJson(json);
}

extension UploadPackagingTransactionResponseX on UploadPackagingTransactionResponse {
  /// Vérifie si l'upload a réussi
  bool get isSuccess => status == 'success' || status == 'uploaded';

  /// Vérifie si l'upload a échoué
  bool get isFailure => status == 'error' || status == 'failed';

  /// Vérifie si le nouveau solde est disponible
  bool get hasNewBalance => newBalance != null;
}

/// Model pour le solde consignes
@freezed
class PackagingBalanceModel with _$PackagingBalanceModel {
  const factory PackagingBalanceModel({
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') required String customerName,
    required List<PackagingBalanceItemModel> items,
    @JsonKey(name: 'total_value') required double totalValue,
    @JsonKey(name: 'last_updated') required DateTime lastUpdated,
  }) = _PackagingBalanceModel;

  factory PackagingBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$PackagingBalanceModelFromJson(json);
}

/// Model pour un article du solde consignes
@freezed
class PackagingBalanceItemModel with _$PackagingBalanceItemModel {
  const factory PackagingBalanceItemModel({
    @JsonKey(name: 'packaging_id') required String packagingId,
    @JsonKey(name: 'packaging_name') required String packagingName,
    required int quantity,
    @JsonKey(name: 'unit_value') required double unitValue,
    @JsonKey(name: 'total_value') required double totalValue,
  }) = _PackagingBalanceItemModel;

  factory PackagingBalanceItemModel.fromJson(Map<String, dynamic> json) =>
      _$PackagingBalanceItemModelFromJson(json);
}

extension PackagingBalanceModelX on PackagingBalanceModel {
  /// Convertit le model en classe auxiliaire
  PackagingBalance toPackagingBalance() {
    return PackagingBalance(
      customerId: customerId,
      customerName: customerName,
      items: items.map((i) => i.toPackagingBalanceItem()).toList(),
      totalValue: totalValue,
      lastUpdated: lastUpdated,
    );
  }
}

/// Crée un PackagingBalanceModel à partir de la réponse API
PackagingBalanceModel packagingBalanceModelFromApiResponse(Map<String, dynamic> json) {
  return PackagingBalanceModel(
    customerId: json['customer_id'] as String,
    customerName: json['customer_name'] as String,
    items: (json['items'] as List)
        .map((i) => packagingBalanceItemModelFromApiResponse(i))
        .toList(),
    totalValue: (json['total_value'] as num).toDouble(),
    lastUpdated: DateTime.parse(json['last_updated'] as String),
  );
}

extension PackagingBalanceItemModelX on PackagingBalanceItemModel {
  /// Convertit le model en classe auxiliaire
  PackagingBalanceItem toPackagingBalanceItem() {
    return PackagingBalanceItem(
      packagingId: packagingId,
      packagingName: packagingName,
      quantity: quantity,
      unitValue: unitValue,
      totalValue: totalValue,
    );
  }
}

/// Crée un PackagingBalanceItemModel à partir de la réponse API
PackagingBalanceItemModel packagingBalanceItemModelFromApiResponse(Map<String, dynamic> json) {
  return PackagingBalanceItemModel(
    packagingId: json['packaging_id'] as String,
    packagingName: json['packaging_name'] as String,
    quantity: json['quantity'] as int,
    unitValue: (json['unit_value'] as num).toDouble(),
    totalValue: (json['total_value'] as num).toDouble(),
  );
}

/// Model pour les types de consignes
@freezed
class PackagingTypeModel with _$PackagingTypeModel {
  const factory PackagingTypeModel({
    required String id,
    required String name,
    required String description,
    required double value,
    @JsonKey(name: 'qr_code_pattern') String? qrCodePattern,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _PackagingTypeModel;

  factory PackagingTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PackagingTypeModelFromJson(json);
}

extension PackagingTypeModelX on PackagingTypeModel {
  /// Convertit le model en classe auxiliaire
  PackagingType toPackagingType() {
    return PackagingType(
      id: id,
      name: name,
      description: description,
      value: value,
      qrCodePattern: qrCodePattern,
      isActive: isActive,
    );
  }
}

/// Crée un PackagingTypeModel à partir de la réponse API
PackagingTypeModel packagingTypeModelFromApiResponse(Map<String, dynamic> json) {
  return PackagingTypeModel(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    value: (json['value'] as num).toDouble(),
    qrCodePattern: json['qr_code_pattern'] as String?,
    isActive: json['is_active'] as bool,
  );
}

/// Model pour les données QR code
@freezed
class PackagingQrDataModel with _$PackagingQrDataModel {
  const factory PackagingQrDataModel({
    @JsonKey(name: 'packaging_id') required String packagingId,
    @JsonKey(name: 'packaging_name') required String packagingName,
    required int quantity,
    @JsonKey(name: 'batch_number') String? batchNumber,
    @JsonKey(name: 'expiry_date') DateTime? expiryDate,
  }) = _PackagingQrDataModel;

  factory PackagingQrDataModel.fromJson(Map<String, dynamic> json) =>
      _$PackagingQrDataModelFromJson(json);
}

extension PackagingQrDataModelX on PackagingQrDataModel {
  /// Convertit le model en classe auxiliaire
  PackagingQrData toPackagingQrData() {
    return PackagingQrData(
      packagingId: packagingId,
      packagingName: packagingName,
      quantity: quantity,
      batchNumber: batchNumber,
      expiryDate: expiryDate,
    );
  }
}

/// Crée un PackagingQrDataModel à partir de la réponse API
PackagingQrDataModel packagingQrDataModelFromApiResponse(Map<String, dynamic> json) {
  return PackagingQrDataModel(
    packagingId: json['packaging_id'] as String,
    packagingName: json['packaging_name'] as String,
    quantity: json['quantity'] as int,
    batchNumber: json['batch_number'] as String?,
    expiryDate: json['expiry_date'] != null 
        ? DateTime.parse(json['expiry_date'] as String)
        : null,
  );
}