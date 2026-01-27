// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDetailModel _$UserDetailModelFromJson(Map<String, dynamic> json) {
  return _UserDetailModel.fromJson(json);
}

/// @nodoc
mixin _$UserDetailModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_id')
  String get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_name')
  String? get organizationName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_limit')
  double? get creditLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_balance')
  double? get currentBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_orders')
  int? get totalOrders => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_deliveries')
  int? get completedDeliveries => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login_at')
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailModelCopyWith<UserDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailModelCopyWith<$Res> {
  factory $UserDetailModelCopyWith(
          UserDetailModel value, $Res Function(UserDetailModel) then) =
      _$UserDetailModelCopyWithImpl<$Res, UserDetailModel>;
  @useResult
  $Res call(
      {String id,
      String email,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String phone,
      String role,
      @JsonKey(name: 'organization_id') String organizationId,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'organization_name') String? organizationName,
      String? address,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'credit_limit') double? creditLimit,
      @JsonKey(name: 'current_balance') double? currentBalance,
      @JsonKey(name: 'total_orders') int? totalOrders,
      @JsonKey(name: 'completed_deliveries') int? completedDeliveries,
      @JsonKey(name: 'last_login_at') DateTime? lastLoginAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$UserDetailModelCopyWithImpl<$Res, $Val extends UserDetailModel>
    implements $UserDetailModelCopyWith<$Res> {
  _$UserDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? role = null,
    Object? organizationId = null,
    Object? isActive = null,
    Object? organizationName = freezed,
    Object? address = freezed,
    Object? avatarUrl = freezed,
    Object? creditLimit = freezed,
    Object? currentBalance = freezed,
    Object? totalOrders = freezed,
    Object? completedDeliveries = freezed,
    Object? lastLoginAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      organizationName: freezed == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      creditLimit: freezed == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      currentBalance: freezed == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      totalOrders: freezed == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      completedDeliveries: freezed == completedDeliveries
          ? _value.completedDeliveries
          : completedDeliveries // ignore: cast_nullable_to_non_nullable
              as int?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDetailModelImplCopyWith<$Res>
    implements $UserDetailModelCopyWith<$Res> {
  factory _$$UserDetailModelImplCopyWith(_$UserDetailModelImpl value,
          $Res Function(_$UserDetailModelImpl) then) =
      __$$UserDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String phone,
      String role,
      @JsonKey(name: 'organization_id') String organizationId,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'organization_name') String? organizationName,
      String? address,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'credit_limit') double? creditLimit,
      @JsonKey(name: 'current_balance') double? currentBalance,
      @JsonKey(name: 'total_orders') int? totalOrders,
      @JsonKey(name: 'completed_deliveries') int? completedDeliveries,
      @JsonKey(name: 'last_login_at') DateTime? lastLoginAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$UserDetailModelImplCopyWithImpl<$Res>
    extends _$UserDetailModelCopyWithImpl<$Res, _$UserDetailModelImpl>
    implements _$$UserDetailModelImplCopyWith<$Res> {
  __$$UserDetailModelImplCopyWithImpl(
      _$UserDetailModelImpl _value, $Res Function(_$UserDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? role = null,
    Object? organizationId = null,
    Object? isActive = null,
    Object? organizationName = freezed,
    Object? address = freezed,
    Object? avatarUrl = freezed,
    Object? creditLimit = freezed,
    Object? currentBalance = freezed,
    Object? totalOrders = freezed,
    Object? completedDeliveries = freezed,
    Object? lastLoginAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      organizationName: freezed == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      creditLimit: freezed == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      currentBalance: freezed == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      totalOrders: freezed == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      completedDeliveries: freezed == completedDeliveries
          ? _value.completedDeliveries
          : completedDeliveries // ignore: cast_nullable_to_non_nullable
              as int?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDetailModelImpl extends _UserDetailModel {
  const _$UserDetailModelImpl(
      {required this.id,
      required this.email,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.phone,
      required this.role,
      @JsonKey(name: 'organization_id') required this.organizationId,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'organization_name') this.organizationName,
      this.address,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'credit_limit') this.creditLimit,
      @JsonKey(name: 'current_balance') this.currentBalance,
      @JsonKey(name: 'total_orders') this.totalOrders,
      @JsonKey(name: 'completed_deliveries') this.completedDeliveries,
      @JsonKey(name: 'last_login_at') this.lastLoginAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();

  factory _$UserDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailModelImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String phone;
  @override
  final String role;
  @override
  @JsonKey(name: 'organization_id')
  final String organizationId;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'organization_name')
  final String? organizationName;
  @override
  final String? address;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'credit_limit')
  final double? creditLimit;
  @override
  @JsonKey(name: 'current_balance')
  final double? currentBalance;
  @override
  @JsonKey(name: 'total_orders')
  final int? totalOrders;
  @override
  @JsonKey(name: 'completed_deliveries')
  final int? completedDeliveries;
  @override
  @JsonKey(name: 'last_login_at')
  final DateTime? lastLoginAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserDetailModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, role: $role, organizationId: $organizationId, isActive: $isActive, organizationName: $organizationName, address: $address, avatarUrl: $avatarUrl, creditLimit: $creditLimit, currentBalance: $currentBalance, totalOrders: $totalOrders, completedDeliveries: $completedDeliveries, lastLoginAt: $lastLoginAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.completedDeliveries, completedDeliveries) ||
                other.completedDeliveries == completedDeliveries) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      firstName,
      lastName,
      phone,
      role,
      organizationId,
      isActive,
      organizationName,
      address,
      avatarUrl,
      creditLimit,
      currentBalance,
      totalOrders,
      completedDeliveries,
      lastLoginAt,
      createdAt,
      updatedAt);

  /// Create a copy of UserDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailModelImplCopyWith<_$UserDetailModelImpl> get copyWith =>
      __$$UserDetailModelImplCopyWithImpl<_$UserDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailModelImplToJson(
      this,
    );
  }
}

abstract class _UserDetailModel extends UserDetailModel {
  const factory _UserDetailModel(
      {required final String id,
      required final String email,
      @JsonKey(name: 'first_name') required final String firstName,
      @JsonKey(name: 'last_name') required final String lastName,
      required final String phone,
      required final String role,
      @JsonKey(name: 'organization_id') required final String organizationId,
      @JsonKey(name: 'is_active') required final bool isActive,
      @JsonKey(name: 'organization_name') final String? organizationName,
      final String? address,
      @JsonKey(name: 'avatar_url') final String? avatarUrl,
      @JsonKey(name: 'credit_limit') final double? creditLimit,
      @JsonKey(name: 'current_balance') final double? currentBalance,
      @JsonKey(name: 'total_orders') final int? totalOrders,
      @JsonKey(name: 'completed_deliveries') final int? completedDeliveries,
      @JsonKey(name: 'last_login_at') final DateTime? lastLoginAt,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      final DateTime? updatedAt}) = _$UserDetailModelImpl;
  const _UserDetailModel._() : super._();

  factory _UserDetailModel.fromJson(Map<String, dynamic> json) =
      _$UserDetailModelImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get phone;
  @override
  String get role;
  @override
  @JsonKey(name: 'organization_id')
  String get organizationId;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'organization_name')
  String? get organizationName;
  @override
  String? get address;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'credit_limit')
  double? get creditLimit;
  @override
  @JsonKey(name: 'current_balance')
  double? get currentBalance;
  @override
  @JsonKey(name: 'total_orders')
  int? get totalOrders;
  @override
  @JsonKey(name: 'completed_deliveries')
  int? get completedDeliveries;
  @override
  @JsonKey(name: 'last_login_at')
  DateTime? get lastLoginAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of UserDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailModelImplCopyWith<_$UserDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
