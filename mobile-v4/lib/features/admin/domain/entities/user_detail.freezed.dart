// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDetail {
  String get id;
  String get email;
  String get firstName;
  String get lastName;
  String get phone;
  String get role;
  String get organizationId;
  bool get isActive;
  String? get organizationName;
  String? get address;
  String? get avatarUrl;
  double? get creditLimit;
  double? get currentBalance;
  int? get totalOrders;
  int? get completedDeliveries;
  DateTime? get lastLoginAt;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDetailCopyWith<UserDetail> get copyWith =>
      _$UserDetailCopyWithImpl<UserDetail>(this as UserDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDetail &&
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

  @override
  String toString() {
    return 'UserDetail(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, role: $role, organizationId: $organizationId, isActive: $isActive, organizationName: $organizationName, address: $address, avatarUrl: $avatarUrl, creditLimit: $creditLimit, currentBalance: $currentBalance, totalOrders: $totalOrders, completedDeliveries: $completedDeliveries, lastLoginAt: $lastLoginAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $UserDetailCopyWith<$Res> {
  factory $UserDetailCopyWith(
          UserDetail value, $Res Function(UserDetail) _then) =
      _$UserDetailCopyWithImpl;
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
class _$UserDetailCopyWithImpl<$Res> implements $UserDetailCopyWith<$Res> {
  _$UserDetailCopyWithImpl(this._self, this._then);

  final UserDetail _self;
  final $Res Function(UserDetail) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _self.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      organizationName: freezed == organizationName
          ? _self.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      creditLimit: freezed == creditLimit
          ? _self.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      currentBalance: freezed == currentBalance
          ? _self.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      totalOrders: freezed == totalOrders
          ? _self.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      completedDeliveries: freezed == completedDeliveries
          ? _self.completedDeliveries
          : completedDeliveries // ignore: cast_nullable_to_non_nullable
              as int?,
      lastLoginAt: freezed == lastLoginAt
          ? _self.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserDetail].
extension UserDetailPatterns on UserDetail {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserDetail() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDetail():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDetail() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
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
            DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserDetail() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.firstName,
            _that.lastName,
            _that.phone,
            _that.role,
            _that.organizationId,
            _that.isActive,
            _that.organizationName,
            _that.address,
            _that.avatarUrl,
            _that.creditLimit,
            _that.currentBalance,
            _that.totalOrders,
            _that.completedDeliveries,
            _that.lastLoginAt,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
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
            DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDetail():
        return $default(
            _that.id,
            _that.email,
            _that.firstName,
            _that.lastName,
            _that.phone,
            _that.role,
            _that.organizationId,
            _that.isActive,
            _that.organizationName,
            _that.address,
            _that.avatarUrl,
            _that.creditLimit,
            _that.currentBalance,
            _that.totalOrders,
            _that.completedDeliveries,
            _that.lastLoginAt,
            _that.createdAt,
            _that.updatedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
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
            DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDetail() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.firstName,
            _that.lastName,
            _that.phone,
            _that.role,
            _that.organizationId,
            _that.isActive,
            _that.organizationName,
            _that.address,
            _that.avatarUrl,
            _that.creditLimit,
            _that.currentBalance,
            _that.totalOrders,
            _that.completedDeliveries,
            _that.lastLoginAt,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserDetail extends UserDetail {
  const _UserDetail(
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

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDetailCopyWith<_UserDetail> get copyWith =>
      __$UserDetailCopyWithImpl<_UserDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDetail &&
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

  @override
  String toString() {
    return 'UserDetail(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, role: $role, organizationId: $organizationId, isActive: $isActive, organizationName: $organizationName, address: $address, avatarUrl: $avatarUrl, creditLimit: $creditLimit, currentBalance: $currentBalance, totalOrders: $totalOrders, completedDeliveries: $completedDeliveries, lastLoginAt: $lastLoginAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$UserDetailCopyWith<$Res>
    implements $UserDetailCopyWith<$Res> {
  factory _$UserDetailCopyWith(
          _UserDetail value, $Res Function(_UserDetail) _then) =
      __$UserDetailCopyWithImpl;
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
class __$UserDetailCopyWithImpl<$Res> implements _$UserDetailCopyWith<$Res> {
  __$UserDetailCopyWithImpl(this._self, this._then);

  final _UserDetail _self;
  final $Res Function(_UserDetail) _then;

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_UserDetail(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _self.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      organizationName: freezed == organizationName
          ? _self.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      creditLimit: freezed == creditLimit
          ? _self.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      currentBalance: freezed == currentBalance
          ? _self.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      totalOrders: freezed == totalOrders
          ? _self.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      completedDeliveries: freezed == completedDeliveries
          ? _self.completedDeliveries
          : completedDeliveries // ignore: cast_nullable_to_non_nullable
              as int?,
      lastLoginAt: freezed == lastLoginAt
          ? _self.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
