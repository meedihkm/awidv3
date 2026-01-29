// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterRequestModel _$RegisterRequestModelFromJson(
        Map<String, dynamic> json) =>
    _RegisterRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
      organizationId: json['organization_id'] as String,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$RegisterRequestModelToJson(
        _RegisterRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'organization_id': instance.organizationId,
      'role': instance.role,
    };
