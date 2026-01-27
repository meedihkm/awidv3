import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/customer_account.dart';

part 'customer_account_model.freezed.dart';
part 'customer_account_model.g.dart';

/// Model de Compte Client
@freezed
class CustomerAccountModel with _$CustomerAccountModel {
  const factory CustomerAccountModel({
    required String id,
    required String organizationId,
    required String organizationName,
    required String name,
    required String email,
    String? phone,
    String? address,
    double? latitude,
    double? longitude,
    required CustomerCreditInfoModel creditInfo,
    required CustomerPackagingInfoModel packagingInfo,
    required CustomerStatsModel stats,
    List<CustomerContactModel>? contacts,
    CustomerSettingsModel? settings,
    @Default(true) bool isActive,
    DateTime? lastOrderDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerAccountModel;

  factory CustomerAccountModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerAccountModelFromJson(json);
}

@freezed
class CustomerCreditInfoModel with _$CustomerCreditInfoModel {
  const factory CustomerCreditInfoModel({
    required double creditLimit,
    required double currentBalance,
    required double availableCredit,
    required int daysOverdue,
    DateTime? lastPaymentDate,
    required double lastPaymentAmount,
    @Default(false) bool isCreditBlocked,
    String? blockReason,
  }) = _CustomerCreditInfoModel;

  factory CustomerCreditInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreditInfoModelFromJson(json);
}

@freezed
class CustomerPackagingInfoModel with _$CustomerPackagingInfoModel {
  const factory CustomerPackagingInfoModel({
    required double totalValue,
    required int totalQuantity,
    required List<CustomerPackagingItemModel> items,
    DateTime? lastTransactionDate,
  }) = _CustomerPackagingInfoModel;

  factory CustomerPackagingInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerPackagingInfoModelFromJson(json);
}

@freezed
class CustomerPackagingItemModel with _$CustomerPackagingItemModel {
  const factory CustomerPackagingItemModel({
    required String packagingId,
    required String packagingName,
    required int quantity,
    required double unitValue,
    required double totalValue,
  }) = _CustomerPackagingItemModel;

  factory CustomerPackagingItemModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerPackagingItemModelFromJson(json);
}

@freezed
class CustomerStatsModel with _$CustomerStatsModel {
  const factory CustomerStatsModel({
    required int totalOrders,
    required int completedOrders,
    required int cancelledOrders,
    required double totalSpent,
    required double averageOrderValue,
    required int daysAsCustomer,
    double? averageRating,
  }) = _CustomerStatsModel;

  factory CustomerStatsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerStatsModelFromJson(json);
}

@freezed
class CustomerContactModel with _$CustomerContactModel {
  const factory CustomerContactModel({
    required String id,
    required String name,
    required String role,
    String? phone,
    String? email,
    @Default(true) bool isPrimary,
  }) = _CustomerContactModel;

  factory CustomerContactModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerContactModelFromJson(json);
}

@freezed
class CustomerSettingsModel with _$CustomerSettingsModel {
  const factory CustomerSettingsModel({
    @Default(true) bool emailNotifications,
    @Default(true) bool smsNotifications,
    @Default(true) bool pushNotifications,
    @Default(true) bool orderConfirmations,
    @Default(true) bool deliveryUpdates,
    @Default(true) bool paymentReminders,
    @Default(true) bool promotionalOffers,
    String? preferredLanguage,
    String? preferredCurrency,
  }) = _CustomerSettingsModel;

  factory CustomerSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerSettingsModelFromJson(json);
}

// Extensions de conversion
extension CustomerAccountModelX on CustomerAccountModel {
  CustomerAccount toEntity() {
    return CustomerAccount(
      id: id,
      organizationId: organizationId,
      organizationName: organizationName,
      name: name,
      email: email,
      phone: phone,
      address: address,
      latitude: latitude,
      longitude: longitude,
      creditInfo: creditInfo.toEntity(),
      packagingInfo: packagingInfo.toEntity(),
      stats: stats.toEntity(),
      contacts: contacts?.map((c) => c.toEntity()).toList(),
      settings: settings?.toEntity(),
      isActive: isActive,
      lastOrderDate: lastOrderDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension CustomerCreditInfoModelX on CustomerCreditInfoModel {
  CustomerCreditInfo toEntity() {
    return CustomerCreditInfo(
      creditLimit: creditLimit,
      currentBalance: currentBalance,
      availableCredit: availableCredit,
      daysOverdue: daysOverdue,
      lastPaymentDate: lastPaymentDate,
      lastPaymentAmount: lastPaymentAmount,
      isCreditBlocked: isCreditBlocked,
      blockReason: blockReason,
    );
  }
}

extension CustomerPackagingInfoModelX on CustomerPackagingInfoModel {
  CustomerPackagingInfo toEntity() {
    return CustomerPackagingInfo(
      totalValue: totalValue,
      totalQuantity: totalQuantity,
      items: items.map((i) => i.toEntity()).toList(),
      lastTransactionDate: lastTransactionDate,
    );
  }
}

extension CustomerPackagingItemModelX on CustomerPackagingItemModel {
  CustomerPackagingItem toEntity() {
    return CustomerPackagingItem(
      packagingId: packagingId,
      packagingName: packagingName,
      quantity: quantity,
      unitValue: unitValue,
      totalValue: totalValue,
    );
  }
}

extension CustomerStatsModelX on CustomerStatsModel {
  CustomerStats toEntity() {
    return CustomerStats(
      totalOrders: totalOrders,
      completedOrders: completedOrders,
      cancelledOrders: cancelledOrders,
      totalSpent: totalSpent,
      averageOrderValue: averageOrderValue,
      daysAsCustomer: daysAsCustomer,
      averageRating: averageRating,
    );
  }
}

extension CustomerContactModelX on CustomerContactModel {
  CustomerContact toEntity() {
    return CustomerContact(
      id: id,
      name: name,
      role: role,
      phone: phone,
      email: email,
      isPrimary: isPrimary,
    );
  }
}

extension CustomerSettingsModelX on CustomerSettingsModel {
  CustomerSettings toEntity() {
    return CustomerSettings(
      emailNotifications: emailNotifications,
      smsNotifications: smsNotifications,
      pushNotifications: pushNotifications,
      orderConfirmations: orderConfirmations,
      deliveryUpdates: deliveryUpdates,
      paymentReminders: paymentReminders,
      promotionalOffers: promotionalOffers,
      preferredLanguage: preferredLanguage,
      preferredCurrency: preferredCurrency,
    );
  }
}

// Extensions inverses (Entity -> Model)
extension CustomerAccountEntityX on CustomerAccount {
  CustomerAccountModel toModel() {
    return CustomerAccountModel(
      id: id,
      organizationId: organizationId,
      organizationName: organizationName,
      name: name,
      email: email,
      phone: phone,
      address: address,
      latitude: latitude,
      longitude: longitude,
      creditInfo: creditInfo.toModel(),
      packagingInfo: packagingInfo.toModel(),
      stats: stats.toModel(),
      contacts: contacts?.map((c) => c.toModel()).toList(),
      settings: settings?.toModel(),
      isActive: isActive,
      lastOrderDate: lastOrderDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension CustomerCreditInfoEntityX on CustomerCreditInfo {
  CustomerCreditInfoModel toModel() {
    return CustomerCreditInfoModel(
      creditLimit: creditLimit,
      currentBalance: currentBalance,
      availableCredit: availableCredit,
      daysOverdue: daysOverdue,
      lastPaymentDate: lastPaymentDate,
      lastPaymentAmount: lastPaymentAmount,
      isCreditBlocked: isCreditBlocked,
      blockReason: blockReason,
    );
  }
}

extension CustomerPackagingInfoEntityX on CustomerPackagingInfo {
  CustomerPackagingInfoModel toModel() {
    return CustomerPackagingInfoModel(
      totalValue: totalValue,
      totalQuantity: totalQuantity,
      items: items.map((i) => i.toModel()).toList(),
      lastTransactionDate: lastTransactionDate,
    );
  }
}

extension CustomerPackagingItemEntityX on CustomerPackagingItem {
  CustomerPackagingItemModel toModel() {
    return CustomerPackagingItemModel(
      packagingId: packagingId,
      packagingName: packagingName,
      quantity: quantity,
      unitValue: unitValue,
      totalValue: totalValue,
    );
  }
}

extension CustomerStatsEntityX on CustomerStats {
  CustomerStatsModel toModel() {
    return CustomerStatsModel(
      totalOrders: totalOrders,
      completedOrders: completedOrders,
      cancelledOrders: cancelledOrders,
      totalSpent: totalSpent,
      averageOrderValue: averageOrderValue,
      daysAsCustomer: daysAsCustomer,
      averageRating: averageRating,
    );
  }
}

extension CustomerContactEntityX on CustomerContact {
  CustomerContactModel toModel() {
    return CustomerContactModel(
      id: id,
      name: name,
      role: role,
      phone: phone,
      email: email,
      isPrimary: isPrimary,
    );
  }
}

extension CustomerSettingsEntityX on CustomerSettings {
  CustomerSettingsModel toModel() {
    return CustomerSettingsModel(
      emailNotifications: emailNotifications,
      smsNotifications: smsNotifications,
      pushNotifications: pushNotifications,
      orderConfirmations: orderConfirmations,
      deliveryUpdates: deliveryUpdates,
      paymentReminders: paymentReminders,
      promotionalOffers: promotionalOffers,
      preferredLanguage: preferredLanguage,
      preferredCurrency: preferredCurrency,
    );
  }
}
