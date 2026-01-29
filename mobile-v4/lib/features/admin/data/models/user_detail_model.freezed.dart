// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDetailModel {
  String get id;
  String get email;
  @JsonKey(name: 'first_name')
  String get firstName;
  @JsonKey(name: 'last_name')
  String get lastName;
  String get phone;
  String get role;
  @JsonKey(name: 'organization_id')
  String get organizationId;
  @JsonKey(name: 'is_active')
  bool get isActive;
  @JsonKey(name: 'organization_name')
  String? get organizationName;
  String? get address;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @JsonKey(name: 'credit_limit')
  double? get creditLimit;
  @JsonKey(name: 'current_balance')
  double? get currentBalance;
  @JsonKey(name: 'total_orders')
  int? get totalOrders;
  @JsonKey(name: 'completed_deliveries')
  int? get completedDeliveries;
  @JsonKey(name: 'last_login_at')
  DateTime? get lastLoginAt;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of UserDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDetailModelCopyWith<UserDetailModel> get copyWith =>
      _$UserDetailModelCopyWithImpl<UserDetailModel>(
          this as UserDetailModel, _$identity);

  /// Serializes this UserDetailModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDetailModel &&
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

  @override
  String toString() {
    return 'UserDetailModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, role: $role, organizationId: $organizationId, isActive: $isActive, organizationName: $organizationName, address: $address, avatarUrl: $avatarUrl, creditLimit: $creditLimit, currentBalance: $currentBalance, totalOrders: $totalOrders, completedDeliveries: $completedDeliveries, lastLoginAt: $lastLoginAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $UserDetailModelCopyWith<$Res> {
  factory $UserDetailModelCopyWith(
          UserDetailModel value, $Res Function(UserDetailModel) _then) =
      _$UserDetailModelCopyWithImpl;
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
class _$UserDetailModelCopyWithImpl<$Res>
    implements $UserDetailModelCopyWith<$Res> {
  _$UserDetailModelCopyWithImpl(this._self, this._then);

  final UserDetailModel _self;
  final $Res Function(UserDetailModel) _then;

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

/// Adds pattern-matching-related methods to [UserDetailModel].
extension UserDetailModelPatterns on UserDetailModel {
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
    TResult Function(_UserDetailModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserDetailModel() when $default != null:
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
    TResult Function(_UserDetailModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDetailModel():
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
    TResult? Function(_UserDetailModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDetailModel() when $default != null:
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
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserDetailModel() when $default != null:
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
            @JsonKey(name: 'updated_at') DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDetailModel():
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
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDetailModel() when $default != null:
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
@JsonSerializable()
class _UserDetailModel extends UserDetailModel {
  const _UserDetailModel(
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
  factory _UserDetailModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailModelFromJson(json);

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

  /// Create a copy of UserDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDetailModelCopyWith<_UserDetailModel> get copyWith =>
      __$UserDetailModelCopyWithImpl<_UserDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDetailModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDetailModel &&
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

  @override
  String toString() {
    return 'UserDetailModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, role: $role, organizationId: $organizationId, isActive: $isActive, organizationName: $organizationName, address: $address, avatarUrl: $avatarUrl, creditLimit: $creditLimit, currentBalance: $currentBalance, totalOrders: $totalOrders, completedDeliveries: $completedDeliveries, lastLoginAt: $lastLoginAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$UserDetailModelCopyWith<$Res>
    implements $UserDetailModelCopyWith<$Res> {
  factory _$UserDetailModelCopyWith(
          _UserDetailModel value, $Res Function(_UserDetailModel) _then) =
      __$UserDetailModelCopyWithImpl;
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
class __$UserDetailModelCopyWithImpl<$Res>
    implements _$UserDetailModelCopyWith<$Res> {
  __$UserDetailModelCopyWithImpl(this._self, this._then);

  final _UserDetailModel _self;
  final $Res Function(_UserDetailModel) _then;

  /// Create a copy of UserDetailModel
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
    return _then(_UserDetailModel(
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
