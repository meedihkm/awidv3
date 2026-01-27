// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserDetail {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get organizationId => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get organizationName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  double? get creditLimit => throw _privateConstructorUsedError;
  double? get currentBalance => throw _privateConstructorUsedError;
  int? get totalOrders => throw _privateConstructorUsedError;
  int? get completedDeliveries => throw _privateConstructorUsedError;
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailCopyWith<UserDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailCopyWith<$Res> {
  factory $UserDetailCopyWith(
          UserDetail value, $Res Function(UserDetail) then) =
      _$UserDetailCopyWithImpl<$Res, UserDetail>;
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String phone,
      String role,
      String organizationId,
      bool isActive,
      String? organizationName,
      String? address,
      String? avatarUrl,
      double? creditLimit,
      double? currentBalance,
      int? totalOrders,
      int? completedDeliveries,
      DateTime? lastLoginAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$UserDetailCopyWithImpl<$Res, $Val extends UserDetail>
    implements $UserDetailCopyWith<$Res> {
  _$UserDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetail
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
abstract class _$$UserDetailImplCopyWith<$Res>
    implements $UserDetailCopyWith<$Res> {
  factory _$$UserDetailImplCopyWith(
          _$UserDetailImpl value, $Res Function(_$UserDetailImpl) then) =
      __$$UserDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String phone,
      String role,
      String organizationId,
      bool isActive,
      String? organizationName,
      String? address,
      String? avatarUrl,
      double? creditLimit,
      double? currentBalance,
      int? totalOrders,
      int? completedDeliveries,
      DateTime? lastLoginAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$UserDetailImplCopyWithImpl<$Res>
    extends _$UserDetailCopyWithImpl<$Res, _$UserDetailImpl>
    implements _$$UserDetailImplCopyWith<$Res> {
  __$$UserDetailImplCopyWithImpl(
      _$UserDetailImpl _value, $Res Function(_$UserDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetail
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
    return _then(_$UserDetailImpl(
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

class _$UserDetailImpl extends _UserDetail {
  const _$UserDetailImpl(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.role,
      required this.organizationId,
      required this.isActive,
      this.organizationName,
      this.address,
      this.avatarUrl,
      this.creditLimit,
      this.currentBalance,
      this.totalOrders,
      this.completedDeliveries,
      this.lastLoginAt,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  final String id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;
  @override
  final String role;
  @override
  final String organizationId;
  @override
  final bool isActive;
  @override
  final String? organizationName;
  @override
  final String? address;
  @override
  final String? avatarUrl;
  @override
  final double? creditLimit;
  @override
  final double? currentBalance;
  @override
  final int? totalOrders;
  @override
  final int? completedDeliveries;
  @override
  final DateTime? lastLoginAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserDetail(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, role: $role, organizationId: $organizationId, isActive: $isActive, organizationName: $organizationName, address: $address, avatarUrl: $avatarUrl, creditLimit: $creditLimit, currentBalance: $currentBalance, totalOrders: $totalOrders, completedDeliveries: $completedDeliveries, lastLoginAt: $lastLoginAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailImpl &&
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

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailImplCopyWith<_$UserDetailImpl> get copyWith =>
      __$$UserDetailImplCopyWithImpl<_$UserDetailImpl>(this, _$identity);
}

abstract class _UserDetail extends UserDetail {
  const factory _UserDetail(
      {required final String id,
      required final String email,
      required final String firstName,
      required final String lastName,
      required final String phone,
      required final String role,
      required final String organizationId,
      required final bool isActive,
      final String? organizationName,
      final String? address,
      final String? avatarUrl,
      final double? creditLimit,
      final double? currentBalance,
      final int? totalOrders,
      final int? completedDeliveries,
      final DateTime? lastLoginAt,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$UserDetailImpl;
  const _UserDetail._() : super._();

  @override
  String get id;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get phone;
  @override
  String get role;
  @override
  String get organizationId;
  @override
  bool get isActive;
  @override
  String? get organizationName;
  @override
  String? get address;
  @override
  String? get avatarUrl;
  @override
  double? get creditLimit;
  @override
  double? get currentBalance;
  @override
  int? get totalOrders;
  @override
  int? get completedDeliveries;
  @override
  DateTime? get lastLoginAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailImplCopyWith<_$UserDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
