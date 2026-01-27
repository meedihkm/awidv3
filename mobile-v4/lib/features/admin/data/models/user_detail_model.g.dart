// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailModelImpl _$$UserDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDetailModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
      organizationId: json['organization_id'] as String,
      isActive: json['is_active'] as bool,
      organizationName: json['organization_name'] as String?,
      address: json['address'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      creditLimit: (json['credit_limit'] as num?)?.toDouble(),
      currentBalance: (json['current_balance'] as num?)?.toDouble(),
      totalOrders: (json['total_orders'] as num?)?.toInt(),
      completedDeliveries: (json['completed_deliveries'] as num?)?.toInt(),
      lastLoginAt: json['last_login_at'] == null
          ? null
          : DateTime.parse(json['last_login_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserDetailModelImplToJson(
        _$UserDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'role': instance.role,
      'organization_id': instance.organizationId,
      'is_active': instance.isActive,
      'organization_name': instance.organizationName,
      'address': instance.address,
      'avatar_url': instance.avatarUrl,
      'credit_limit': instance.creditLimit,
      'current_balance': instance.currentBalance,
      'total_orders': instance.totalOrders,
      'completed_deliveries': instance.completedDeliveries,
      'last_login_at': instance.lastLoginAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
