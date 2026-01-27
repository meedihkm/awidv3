import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_detail.dart';

part 'user_detail_model.freezed.dart';
part 'user_detail_model.g.dart';

/// User Detail Model
/// Model pour la sérialisation JSON des détails utilisateur
@freezed
class UserDetailModel with _$UserDetailModel {
  const factory UserDetailModel({
    required String id,
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String phone,
    required String role,
    @JsonKey(name: 'organization_id') required String organizationId,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'organization_name') String? organizationName,
    String? address,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'credit_limit') double? creditLimit,
    @JsonKey(name: 'current_balance') double? currentBalance,
    @JsonKey(name: 'total_orders') int? totalOrders,
    @JsonKey(name: 'completed_deliveries') int? completedDeliveries,
    @JsonKey(name: 'last_login_at') DateTime? lastLoginAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserDetailModel;

  /// From Entity
  factory UserDetailModel.fromEntity(UserDetail entity) {
    return UserDetailModel(
      id: entity.id,
      email: entity.email,
      firstName: entity.firstName,
      lastName: entity.lastName,
      phone: entity.phone,
      role: entity.role,
      organizationId: entity.organizationId,
      isActive: entity.isActive,
      organizationName: entity.organizationName,
      address: entity.address,
      avatarUrl: entity.avatarUrl,
      creditLimit: entity.creditLimit,
      currentBalance: entity.currentBalance,
      totalOrders: entity.totalOrders,
      completedDeliveries: entity.completedDeliveries,
      lastLoginAt: entity.lastLoginAt,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  const UserDetailModel._();

  /// From JSON
  factory UserDetailModel.fromJson(Map<String, dynamic> json) => _$UserDetailModelFromJson(json);

  /// To Entity
  UserDetail toEntity() {
    return UserDetail(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      role: role,
      organizationId: organizationId,
      isActive: isActive,
      organizationName: organizationName,
      address: address,
      avatarUrl: avatarUrl,
      creditLimit: creditLimit,
      currentBalance: currentBalance,
      totalOrders: totalOrders,
      completedDeliveries: completedDeliveries,
      lastLoginAt: lastLoginAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
