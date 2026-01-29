// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerAccount {
  String get id;
  String get organizationId;
  String get organizationName;
  String get name;
  String get email;
  String? get phone;
  String? get address;
  double? get latitude;
  double? get longitude;
  CustomerCreditInfo get creditInfo;
  CustomerPackagingInfo get packagingInfo;
  CustomerStats get stats;
  List<CustomerContact>? get contacts;
  CustomerSettings? get settings;
  bool get isActive;
  DateTime? get lastOrderDate;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerAccountCopyWith<CustomerAccount> get copyWith =>
      _$CustomerAccountCopyWithImpl<CustomerAccount>(
          this as CustomerAccount, _$identity);

  /// Serializes this CustomerAccount to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerAccount &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.creditInfo, creditInfo) ||
                other.creditInfo == creditInfo) &&
            (identical(other.packagingInfo, packagingInfo) ||
                other.packagingInfo == packagingInfo) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(other.contacts, contacts) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastOrderDate, lastOrderDate) ||
                other.lastOrderDate == lastOrderDate) &&
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
      organizationId,
      organizationName,
      name,
      email,
      phone,
      address,
      latitude,
      longitude,
      creditInfo,
      packagingInfo,
      stats,
      const DeepCollectionEquality().hash(contacts),
      settings,
      isActive,
      lastOrderDate,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'CustomerAccount(id: $id, organizationId: $organizationId, organizationName: $organizationName, name: $name, email: $email, phone: $phone, address: $address, latitude: $latitude, longitude: $longitude, creditInfo: $creditInfo, packagingInfo: $packagingInfo, stats: $stats, contacts: $contacts, settings: $settings, isActive: $isActive, lastOrderDate: $lastOrderDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $CustomerAccountCopyWith<$Res> {
  factory $CustomerAccountCopyWith(
          CustomerAccount value, $Res Function(CustomerAccount) _then) =
      _$CustomerAccountCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String organizationId,
      String organizationName,
      String name,
      String email,
      String? phone,
      String? address,
      double? latitude,
      double? longitude,
      CustomerCreditInfo creditInfo,
      CustomerPackagingInfo packagingInfo,
      CustomerStats stats,
      List<CustomerContact>? contacts,
      CustomerSettings? settings,
      bool isActive,
      DateTime? lastOrderDate,
      DateTime? createdAt,
      DateTime? updatedAt});

  $CustomerCreditInfoCopyWith<$Res> get creditInfo;
  $CustomerPackagingInfoCopyWith<$Res> get packagingInfo;
  $CustomerStatsCopyWith<$Res> get stats;
  $CustomerSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class _$CustomerAccountCopyWithImpl<$Res>
    implements $CustomerAccountCopyWith<$Res> {
  _$CustomerAccountCopyWithImpl(this._self, this._then);

  final CustomerAccount _self;
  final $Res Function(CustomerAccount) _then;

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? organizationName = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? creditInfo = null,
    Object? packagingInfo = null,
    Object? stats = null,
    Object? contacts = freezed,
    Object? settings = freezed,
    Object? isActive = null,
    Object? lastOrderDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _self.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _self.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      creditInfo: null == creditInfo
          ? _self.creditInfo
          : creditInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCreditInfo,
      packagingInfo: null == packagingInfo
          ? _self.packagingInfo
          : packagingInfo // ignore: cast_nullable_to_non_nullable
              as CustomerPackagingInfo,
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CustomerStats,
      contacts: freezed == contacts
          ? _self.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<CustomerContact>?,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as CustomerSettings?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastOrderDate: freezed == lastOrderDate
          ? _self.lastOrderDate
          : lastOrderDate // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCreditInfoCopyWith<$Res> get creditInfo {
    return $CustomerCreditInfoCopyWith<$Res>(_self.creditInfo, (value) {
      return _then(_self.copyWith(creditInfo: value));
    });
  }

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerPackagingInfoCopyWith<$Res> get packagingInfo {
    return $CustomerPackagingInfoCopyWith<$Res>(_self.packagingInfo, (value) {
      return _then(_self.copyWith(packagingInfo: value));
    });
  }

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerStatsCopyWith<$Res> get stats {
    return $CustomerStatsCopyWith<$Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
      return null;
    }

    return $CustomerSettingsCopyWith<$Res>(_self.settings!, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CustomerAccount].
extension CustomerAccountPatterns on CustomerAccount {
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
    TResult Function(_CustomerAccount value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerAccount() when $default != null:
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
    TResult Function(_CustomerAccount value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerAccount():
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
    TResult? Function(_CustomerAccount value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerAccount() when $default != null:
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
            String organizationId,
            String organizationName,
            String name,
            String email,
            String? phone,
            String? address,
            double? latitude,
            double? longitude,
            CustomerCreditInfo creditInfo,
            CustomerPackagingInfo packagingInfo,
            CustomerStats stats,
            List<CustomerContact>? contacts,
            CustomerSettings? settings,
            bool isActive,
            DateTime? lastOrderDate,
            DateTime? createdAt,
            DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerAccount() when $default != null:
        return $default(
            _that.id,
            _that.organizationId,
            _that.organizationName,
            _that.name,
            _that.email,
            _that.phone,
            _that.address,
            _that.latitude,
            _that.longitude,
            _that.creditInfo,
            _that.packagingInfo,
            _that.stats,
            _that.contacts,
            _that.settings,
            _that.isActive,
            _that.lastOrderDate,
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
            String organizationId,
            String organizationName,
            String name,
            String email,
            String? phone,
            String? address,
            double? latitude,
            double? longitude,
            CustomerCreditInfo creditInfo,
            CustomerPackagingInfo packagingInfo,
            CustomerStats stats,
            List<CustomerContact>? contacts,
            CustomerSettings? settings,
            bool isActive,
            DateTime? lastOrderDate,
            DateTime? createdAt,
            DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerAccount():
        return $default(
            _that.id,
            _that.organizationId,
            _that.organizationName,
            _that.name,
            _that.email,
            _that.phone,
            _that.address,
            _that.latitude,
            _that.longitude,
            _that.creditInfo,
            _that.packagingInfo,
            _that.stats,
            _that.contacts,
            _that.settings,
            _that.isActive,
            _that.lastOrderDate,
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
            String organizationId,
            String organizationName,
            String name,
            String email,
            String? phone,
            String? address,
            double? latitude,
            double? longitude,
            CustomerCreditInfo creditInfo,
            CustomerPackagingInfo packagingInfo,
            CustomerStats stats,
            List<CustomerContact>? contacts,
            CustomerSettings? settings,
            bool isActive,
            DateTime? lastOrderDate,
            DateTime? createdAt,
            DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerAccount() when $default != null:
        return $default(
            _that.id,
            _that.organizationId,
            _that.organizationName,
            _that.name,
            _that.email,
            _that.phone,
            _that.address,
            _that.latitude,
            _that.longitude,
            _that.creditInfo,
            _that.packagingInfo,
            _that.stats,
            _that.contacts,
            _that.settings,
            _that.isActive,
            _that.lastOrderDate,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerAccount implements CustomerAccount {
  const _CustomerAccount(
      {required this.id,
      required this.organizationId,
      required this.organizationName,
      required this.name,
      required this.email,
      this.phone,
      this.address,
      this.latitude,
      this.longitude,
      required this.creditInfo,
      required this.packagingInfo,
      required this.stats,
      final List<CustomerContact>? contacts,
      this.settings,
      this.isActive = true,
      this.lastOrderDate,
      this.createdAt,
      this.updatedAt})
      : _contacts = contacts;
  factory _CustomerAccount.fromJson(Map<String, dynamic> json) =>
      _$CustomerAccountFromJson(json);

  @override
  final String id;
  @override
  final String organizationId;
  @override
  final String organizationName;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final CustomerCreditInfo creditInfo;
  @override
  final CustomerPackagingInfo packagingInfo;
  @override
  final CustomerStats stats;
  final List<CustomerContact>? _contacts;
  @override
  List<CustomerContact>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CustomerSettings? settings;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime? lastOrderDate;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerAccountCopyWith<_CustomerAccount> get copyWith =>
      __$CustomerAccountCopyWithImpl<_CustomerAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerAccountToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerAccount &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.creditInfo, creditInfo) ||
                other.creditInfo == creditInfo) &&
            (identical(other.packagingInfo, packagingInfo) ||
                other.packagingInfo == packagingInfo) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastOrderDate, lastOrderDate) ||
                other.lastOrderDate == lastOrderDate) &&
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
      organizationId,
      organizationName,
      name,
      email,
      phone,
      address,
      latitude,
      longitude,
      creditInfo,
      packagingInfo,
      stats,
      const DeepCollectionEquality().hash(_contacts),
      settings,
      isActive,
      lastOrderDate,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'CustomerAccount(id: $id, organizationId: $organizationId, organizationName: $organizationName, name: $name, email: $email, phone: $phone, address: $address, latitude: $latitude, longitude: $longitude, creditInfo: $creditInfo, packagingInfo: $packagingInfo, stats: $stats, contacts: $contacts, settings: $settings, isActive: $isActive, lastOrderDate: $lastOrderDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$CustomerAccountCopyWith<$Res>
    implements $CustomerAccountCopyWith<$Res> {
  factory _$CustomerAccountCopyWith(
          _CustomerAccount value, $Res Function(_CustomerAccount) _then) =
      __$CustomerAccountCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String organizationId,
      String organizationName,
      String name,
      String email,
      String? phone,
      String? address,
      double? latitude,
      double? longitude,
      CustomerCreditInfo creditInfo,
      CustomerPackagingInfo packagingInfo,
      CustomerStats stats,
      List<CustomerContact>? contacts,
      CustomerSettings? settings,
      bool isActive,
      DateTime? lastOrderDate,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $CustomerCreditInfoCopyWith<$Res> get creditInfo;
  @override
  $CustomerPackagingInfoCopyWith<$Res> get packagingInfo;
  @override
  $CustomerStatsCopyWith<$Res> get stats;
  @override
  $CustomerSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class __$CustomerAccountCopyWithImpl<$Res>
    implements _$CustomerAccountCopyWith<$Res> {
  __$CustomerAccountCopyWithImpl(this._self, this._then);

  final _CustomerAccount _self;
  final $Res Function(_CustomerAccount) _then;

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? organizationName = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? creditInfo = null,
    Object? packagingInfo = null,
    Object? stats = null,
    Object? contacts = freezed,
    Object? settings = freezed,
    Object? isActive = null,
    Object? lastOrderDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_CustomerAccount(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _self.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _self.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      creditInfo: null == creditInfo
          ? _self.creditInfo
          : creditInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCreditInfo,
      packagingInfo: null == packagingInfo
          ? _self.packagingInfo
          : packagingInfo // ignore: cast_nullable_to_non_nullable
              as CustomerPackagingInfo,
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CustomerStats,
      contacts: freezed == contacts
          ? _self._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<CustomerContact>?,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as CustomerSettings?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastOrderDate: freezed == lastOrderDate
          ? _self.lastOrderDate
          : lastOrderDate // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCreditInfoCopyWith<$Res> get creditInfo {
    return $CustomerCreditInfoCopyWith<$Res>(_self.creditInfo, (value) {
      return _then(_self.copyWith(creditInfo: value));
    });
  }

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerPackagingInfoCopyWith<$Res> get packagingInfo {
    return $CustomerPackagingInfoCopyWith<$Res>(_self.packagingInfo, (value) {
      return _then(_self.copyWith(packagingInfo: value));
    });
  }

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerStatsCopyWith<$Res> get stats {
    return $CustomerStatsCopyWith<$Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
      return null;
    }

    return $CustomerSettingsCopyWith<$Res>(_self.settings!, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

/// @nodoc
mixin _$CustomerCreditInfo {
  double get creditLimit;
  double get currentBalance;
  double get availableCredit;
  int get daysOverdue;
  DateTime? get lastPaymentDate;
  double get lastPaymentAmount;
  bool get isCreditBlocked;
  String? get blockReason;

  /// Create a copy of CustomerCreditInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerCreditInfoCopyWith<CustomerCreditInfo> get copyWith =>
      _$CustomerCreditInfoCopyWithImpl<CustomerCreditInfo>(
          this as CustomerCreditInfo, _$identity);

  /// Serializes this CustomerCreditInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerCreditInfo &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.availableCredit, availableCredit) ||
                other.availableCredit == availableCredit) &&
            (identical(other.daysOverdue, daysOverdue) ||
                other.daysOverdue == daysOverdue) &&
            (identical(other.lastPaymentDate, lastPaymentDate) ||
                other.lastPaymentDate == lastPaymentDate) &&
            (identical(other.lastPaymentAmount, lastPaymentAmount) ||
                other.lastPaymentAmount == lastPaymentAmount) &&
            (identical(other.isCreditBlocked, isCreditBlocked) ||
                other.isCreditBlocked == isCreditBlocked) &&
            (identical(other.blockReason, blockReason) ||
                other.blockReason == blockReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      creditLimit,
      currentBalance,
      availableCredit,
      daysOverdue,
      lastPaymentDate,
      lastPaymentAmount,
      isCreditBlocked,
      blockReason);

  @override
  String toString() {
    return 'CustomerCreditInfo(creditLimit: $creditLimit, currentBalance: $currentBalance, availableCredit: $availableCredit, daysOverdue: $daysOverdue, lastPaymentDate: $lastPaymentDate, lastPaymentAmount: $lastPaymentAmount, isCreditBlocked: $isCreditBlocked, blockReason: $blockReason)';
  }
}

/// @nodoc
abstract mixin class $CustomerCreditInfoCopyWith<$Res> {
  factory $CustomerCreditInfoCopyWith(
          CustomerCreditInfo value, $Res Function(CustomerCreditInfo) _then) =
      _$CustomerCreditInfoCopyWithImpl;
  @useResult
  $Res call(
      {double creditLimit,
      double currentBalance,
      double availableCredit,
      int daysOverdue,
      DateTime? lastPaymentDate,
      double lastPaymentAmount,
      bool isCreditBlocked,
      String? blockReason});
}

/// @nodoc
class _$CustomerCreditInfoCopyWithImpl<$Res>
    implements $CustomerCreditInfoCopyWith<$Res> {
  _$CustomerCreditInfoCopyWithImpl(this._self, this._then);

  final CustomerCreditInfo _self;
  final $Res Function(CustomerCreditInfo) _then;

  /// Create a copy of CustomerCreditInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditLimit = null,
    Object? currentBalance = null,
    Object? availableCredit = null,
    Object? daysOverdue = null,
    Object? lastPaymentDate = freezed,
    Object? lastPaymentAmount = null,
    Object? isCreditBlocked = null,
    Object? blockReason = freezed,
  }) {
    return _then(_self.copyWith(
      creditLimit: null == creditLimit
          ? _self.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as double,
      currentBalance: null == currentBalance
          ? _self.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      availableCredit: null == availableCredit
          ? _self.availableCredit
          : availableCredit // ignore: cast_nullable_to_non_nullable
              as double,
      daysOverdue: null == daysOverdue
          ? _self.daysOverdue
          : daysOverdue // ignore: cast_nullable_to_non_nullable
              as int,
      lastPaymentDate: freezed == lastPaymentDate
          ? _self.lastPaymentDate
          : lastPaymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastPaymentAmount: null == lastPaymentAmount
          ? _self.lastPaymentAmount
          : lastPaymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isCreditBlocked: null == isCreditBlocked
          ? _self.isCreditBlocked
          : isCreditBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockReason: freezed == blockReason
          ? _self.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerCreditInfo].
extension CustomerCreditInfoPatterns on CustomerCreditInfo {
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
    TResult Function(_CustomerCreditInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerCreditInfo() when $default != null:
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
    TResult Function(_CustomerCreditInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerCreditInfo():
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
    TResult? Function(_CustomerCreditInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerCreditInfo() when $default != null:
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
            double creditLimit,
            double currentBalance,
            double availableCredit,
            int daysOverdue,
            DateTime? lastPaymentDate,
            double lastPaymentAmount,
            bool isCreditBlocked,
            String? blockReason)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerCreditInfo() when $default != null:
        return $default(
            _that.creditLimit,
            _that.currentBalance,
            _that.availableCredit,
            _that.daysOverdue,
            _that.lastPaymentDate,
            _that.lastPaymentAmount,
            _that.isCreditBlocked,
            _that.blockReason);
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
            double creditLimit,
            double currentBalance,
            double availableCredit,
            int daysOverdue,
            DateTime? lastPaymentDate,
            double lastPaymentAmount,
            bool isCreditBlocked,
            String? blockReason)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerCreditInfo():
        return $default(
            _that.creditLimit,
            _that.currentBalance,
            _that.availableCredit,
            _that.daysOverdue,
            _that.lastPaymentDate,
            _that.lastPaymentAmount,
            _that.isCreditBlocked,
            _that.blockReason);
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
            double creditLimit,
            double currentBalance,
            double availableCredit,
            int daysOverdue,
            DateTime? lastPaymentDate,
            double lastPaymentAmount,
            bool isCreditBlocked,
            String? blockReason)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerCreditInfo() when $default != null:
        return $default(
            _that.creditLimit,
            _that.currentBalance,
            _that.availableCredit,
            _that.daysOverdue,
            _that.lastPaymentDate,
            _that.lastPaymentAmount,
            _that.isCreditBlocked,
            _that.blockReason);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerCreditInfo implements CustomerCreditInfo {
  const _CustomerCreditInfo(
      {required this.creditLimit,
      required this.currentBalance,
      required this.availableCredit,
      required this.daysOverdue,
      this.lastPaymentDate,
      required this.lastPaymentAmount,
      this.isCreditBlocked = false,
      this.blockReason});
  factory _CustomerCreditInfo.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreditInfoFromJson(json);

  @override
  final double creditLimit;
  @override
  final double currentBalance;
  @override
  final double availableCredit;
  @override
  final int daysOverdue;
  @override
  final DateTime? lastPaymentDate;
  @override
  final double lastPaymentAmount;
  @override
  @JsonKey()
  final bool isCreditBlocked;
  @override
  final String? blockReason;

  /// Create a copy of CustomerCreditInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerCreditInfoCopyWith<_CustomerCreditInfo> get copyWith =>
      __$CustomerCreditInfoCopyWithImpl<_CustomerCreditInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerCreditInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerCreditInfo &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.availableCredit, availableCredit) ||
                other.availableCredit == availableCredit) &&
            (identical(other.daysOverdue, daysOverdue) ||
                other.daysOverdue == daysOverdue) &&
            (identical(other.lastPaymentDate, lastPaymentDate) ||
                other.lastPaymentDate == lastPaymentDate) &&
            (identical(other.lastPaymentAmount, lastPaymentAmount) ||
                other.lastPaymentAmount == lastPaymentAmount) &&
            (identical(other.isCreditBlocked, isCreditBlocked) ||
                other.isCreditBlocked == isCreditBlocked) &&
            (identical(other.blockReason, blockReason) ||
                other.blockReason == blockReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      creditLimit,
      currentBalance,
      availableCredit,
      daysOverdue,
      lastPaymentDate,
      lastPaymentAmount,
      isCreditBlocked,
      blockReason);

  @override
  String toString() {
    return 'CustomerCreditInfo(creditLimit: $creditLimit, currentBalance: $currentBalance, availableCredit: $availableCredit, daysOverdue: $daysOverdue, lastPaymentDate: $lastPaymentDate, lastPaymentAmount: $lastPaymentAmount, isCreditBlocked: $isCreditBlocked, blockReason: $blockReason)';
  }
}

/// @nodoc
abstract mixin class _$CustomerCreditInfoCopyWith<$Res>
    implements $CustomerCreditInfoCopyWith<$Res> {
  factory _$CustomerCreditInfoCopyWith(
          _CustomerCreditInfo value, $Res Function(_CustomerCreditInfo) _then) =
      __$CustomerCreditInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double creditLimit,
      double currentBalance,
      double availableCredit,
      int daysOverdue,
      DateTime? lastPaymentDate,
      double lastPaymentAmount,
      bool isCreditBlocked,
      String? blockReason});
}

/// @nodoc
class __$CustomerCreditInfoCopyWithImpl<$Res>
    implements _$CustomerCreditInfoCopyWith<$Res> {
  __$CustomerCreditInfoCopyWithImpl(this._self, this._then);

  final _CustomerCreditInfo _self;
  final $Res Function(_CustomerCreditInfo) _then;

  /// Create a copy of CustomerCreditInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? creditLimit = null,
    Object? currentBalance = null,
    Object? availableCredit = null,
    Object? daysOverdue = null,
    Object? lastPaymentDate = freezed,
    Object? lastPaymentAmount = null,
    Object? isCreditBlocked = null,
    Object? blockReason = freezed,
  }) {
    return _then(_CustomerCreditInfo(
      creditLimit: null == creditLimit
          ? _self.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as double,
      currentBalance: null == currentBalance
          ? _self.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      availableCredit: null == availableCredit
          ? _self.availableCredit
          : availableCredit // ignore: cast_nullable_to_non_nullable
              as double,
      daysOverdue: null == daysOverdue
          ? _self.daysOverdue
          : daysOverdue // ignore: cast_nullable_to_non_nullable
              as int,
      lastPaymentDate: freezed == lastPaymentDate
          ? _self.lastPaymentDate
          : lastPaymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastPaymentAmount: null == lastPaymentAmount
          ? _self.lastPaymentAmount
          : lastPaymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isCreditBlocked: null == isCreditBlocked
          ? _self.isCreditBlocked
          : isCreditBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockReason: freezed == blockReason
          ? _self.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CustomerPackagingInfo {
  double get totalValue;
  int get totalQuantity;
  List<CustomerPackagingItem> get items;
  DateTime? get lastTransactionDate;

  /// Create a copy of CustomerPackagingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerPackagingInfoCopyWith<CustomerPackagingInfo> get copyWith =>
      _$CustomerPackagingInfoCopyWithImpl<CustomerPackagingInfo>(
          this as CustomerPackagingInfo, _$identity);

  /// Serializes this CustomerPackagingInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerPackagingInfo &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.lastTransactionDate, lastTransactionDate) ||
                other.lastTransactionDate == lastTransactionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalValue, totalQuantity,
      const DeepCollectionEquality().hash(items), lastTransactionDate);

  @override
  String toString() {
    return 'CustomerPackagingInfo(totalValue: $totalValue, totalQuantity: $totalQuantity, items: $items, lastTransactionDate: $lastTransactionDate)';
  }
}

/// @nodoc
abstract mixin class $CustomerPackagingInfoCopyWith<$Res> {
  factory $CustomerPackagingInfoCopyWith(CustomerPackagingInfo value,
          $Res Function(CustomerPackagingInfo) _then) =
      _$CustomerPackagingInfoCopyWithImpl;
  @useResult
  $Res call(
      {double totalValue,
      int totalQuantity,
      List<CustomerPackagingItem> items,
      DateTime? lastTransactionDate});
}

/// @nodoc
class _$CustomerPackagingInfoCopyWithImpl<$Res>
    implements $CustomerPackagingInfoCopyWith<$Res> {
  _$CustomerPackagingInfoCopyWithImpl(this._self, this._then);

  final CustomerPackagingInfo _self;
  final $Res Function(CustomerPackagingInfo) _then;

  /// Create a copy of CustomerPackagingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalValue = null,
    Object? totalQuantity = null,
    Object? items = null,
    Object? lastTransactionDate = freezed,
  }) {
    return _then(_self.copyWith(
      totalValue: null == totalValue
          ? _self.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: null == totalQuantity
          ? _self.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerPackagingItem>,
      lastTransactionDate: freezed == lastTransactionDate
          ? _self.lastTransactionDate
          : lastTransactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerPackagingInfo].
extension CustomerPackagingInfoPatterns on CustomerPackagingInfo {
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
    TResult Function(_CustomerPackagingInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingInfo() when $default != null:
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
    TResult Function(_CustomerPackagingInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingInfo():
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
    TResult? Function(_CustomerPackagingInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingInfo() when $default != null:
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
    TResult Function(double totalValue, int totalQuantity,
            List<CustomerPackagingItem> items, DateTime? lastTransactionDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingInfo() when $default != null:
        return $default(_that.totalValue, _that.totalQuantity, _that.items,
            _that.lastTransactionDate);
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
    TResult Function(double totalValue, int totalQuantity,
            List<CustomerPackagingItem> items, DateTime? lastTransactionDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingInfo():
        return $default(_that.totalValue, _that.totalQuantity, _that.items,
            _that.lastTransactionDate);
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
    TResult? Function(double totalValue, int totalQuantity,
            List<CustomerPackagingItem> items, DateTime? lastTransactionDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingInfo() when $default != null:
        return $default(_that.totalValue, _that.totalQuantity, _that.items,
            _that.lastTransactionDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerPackagingInfo implements CustomerPackagingInfo {
  const _CustomerPackagingInfo(
      {required this.totalValue,
      required this.totalQuantity,
      required final List<CustomerPackagingItem> items,
      this.lastTransactionDate})
      : _items = items;
  factory _CustomerPackagingInfo.fromJson(Map<String, dynamic> json) =>
      _$CustomerPackagingInfoFromJson(json);

  @override
  final double totalValue;
  @override
  final int totalQuantity;
  final List<CustomerPackagingItem> _items;
  @override
  List<CustomerPackagingItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime? lastTransactionDate;

  /// Create a copy of CustomerPackagingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerPackagingInfoCopyWith<_CustomerPackagingInfo> get copyWith =>
      __$CustomerPackagingInfoCopyWithImpl<_CustomerPackagingInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerPackagingInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerPackagingInfo &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.lastTransactionDate, lastTransactionDate) ||
                other.lastTransactionDate == lastTransactionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalValue, totalQuantity,
      const DeepCollectionEquality().hash(_items), lastTransactionDate);

  @override
  String toString() {
    return 'CustomerPackagingInfo(totalValue: $totalValue, totalQuantity: $totalQuantity, items: $items, lastTransactionDate: $lastTransactionDate)';
  }
}

/// @nodoc
abstract mixin class _$CustomerPackagingInfoCopyWith<$Res>
    implements $CustomerPackagingInfoCopyWith<$Res> {
  factory _$CustomerPackagingInfoCopyWith(_CustomerPackagingInfo value,
          $Res Function(_CustomerPackagingInfo) _then) =
      __$CustomerPackagingInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double totalValue,
      int totalQuantity,
      List<CustomerPackagingItem> items,
      DateTime? lastTransactionDate});
}

/// @nodoc
class __$CustomerPackagingInfoCopyWithImpl<$Res>
    implements _$CustomerPackagingInfoCopyWith<$Res> {
  __$CustomerPackagingInfoCopyWithImpl(this._self, this._then);

  final _CustomerPackagingInfo _self;
  final $Res Function(_CustomerPackagingInfo) _then;

  /// Create a copy of CustomerPackagingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalValue = null,
    Object? totalQuantity = null,
    Object? items = null,
    Object? lastTransactionDate = freezed,
  }) {
    return _then(_CustomerPackagingInfo(
      totalValue: null == totalValue
          ? _self.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: null == totalQuantity
          ? _self.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerPackagingItem>,
      lastTransactionDate: freezed == lastTransactionDate
          ? _self.lastTransactionDate
          : lastTransactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$CustomerPackagingItem {
  String get packagingId;
  String get packagingName;
  int get quantity;
  double get unitValue;
  double get totalValue;

  /// Create a copy of CustomerPackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerPackagingItemCopyWith<CustomerPackagingItem> get copyWith =>
      _$CustomerPackagingItemCopyWithImpl<CustomerPackagingItem>(
          this as CustomerPackagingItem, _$identity);

  /// Serializes this CustomerPackagingItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerPackagingItem &&
            (identical(other.packagingId, packagingId) ||
                other.packagingId == packagingId) &&
            (identical(other.packagingName, packagingName) ||
                other.packagingName == packagingName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitValue, unitValue) ||
                other.unitValue == unitValue) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, packagingId, packagingName, quantity, unitValue, totalValue);

  @override
  String toString() {
    return 'CustomerPackagingItem(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, totalValue: $totalValue)';
  }
}

/// @nodoc
abstract mixin class $CustomerPackagingItemCopyWith<$Res> {
  factory $CustomerPackagingItemCopyWith(CustomerPackagingItem value,
          $Res Function(CustomerPackagingItem) _then) =
      _$CustomerPackagingItemCopyWithImpl;
  @useResult
  $Res call(
      {String packagingId,
      String packagingName,
      int quantity,
      double unitValue,
      double totalValue});
}

/// @nodoc
class _$CustomerPackagingItemCopyWithImpl<$Res>
    implements $CustomerPackagingItemCopyWith<$Res> {
  _$CustomerPackagingItemCopyWithImpl(this._self, this._then);

  final CustomerPackagingItem _self;
  final $Res Function(CustomerPackagingItem) _then;

  /// Create a copy of CustomerPackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packagingId = null,
    Object? packagingName = null,
    Object? quantity = null,
    Object? unitValue = null,
    Object? totalValue = null,
  }) {
    return _then(_self.copyWith(
      packagingId: null == packagingId
          ? _self.packagingId
          : packagingId // ignore: cast_nullable_to_non_nullable
              as String,
      packagingName: null == packagingName
          ? _self.packagingName
          : packagingName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitValue: null == unitValue
          ? _self.unitValue
          : unitValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalValue: null == totalValue
          ? _self.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerPackagingItem].
extension CustomerPackagingItemPatterns on CustomerPackagingItem {
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
    TResult Function(_CustomerPackagingItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingItem() when $default != null:
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
    TResult Function(_CustomerPackagingItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingItem():
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
    TResult? Function(_CustomerPackagingItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingItem() when $default != null:
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
    TResult Function(String packagingId, String packagingName, int quantity,
            double unitValue, double totalValue)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingItem() when $default != null:
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.unitValue, _that.totalValue);
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
    TResult Function(String packagingId, String packagingName, int quantity,
            double unitValue, double totalValue)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingItem():
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.unitValue, _that.totalValue);
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
    TResult? Function(String packagingId, String packagingName, int quantity,
            double unitValue, double totalValue)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingItem() when $default != null:
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.unitValue, _that.totalValue);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerPackagingItem implements CustomerPackagingItem {
  const _CustomerPackagingItem(
      {required this.packagingId,
      required this.packagingName,
      required this.quantity,
      required this.unitValue,
      required this.totalValue});
  factory _CustomerPackagingItem.fromJson(Map<String, dynamic> json) =>
      _$CustomerPackagingItemFromJson(json);

  @override
  final String packagingId;
  @override
  final String packagingName;
  @override
  final int quantity;
  @override
  final double unitValue;
  @override
  final double totalValue;

  /// Create a copy of CustomerPackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerPackagingItemCopyWith<_CustomerPackagingItem> get copyWith =>
      __$CustomerPackagingItemCopyWithImpl<_CustomerPackagingItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerPackagingItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerPackagingItem &&
            (identical(other.packagingId, packagingId) ||
                other.packagingId == packagingId) &&
            (identical(other.packagingName, packagingName) ||
                other.packagingName == packagingName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitValue, unitValue) ||
                other.unitValue == unitValue) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, packagingId, packagingName, quantity, unitValue, totalValue);

  @override
  String toString() {
    return 'CustomerPackagingItem(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, totalValue: $totalValue)';
  }
}

/// @nodoc
abstract mixin class _$CustomerPackagingItemCopyWith<$Res>
    implements $CustomerPackagingItemCopyWith<$Res> {
  factory _$CustomerPackagingItemCopyWith(_CustomerPackagingItem value,
          $Res Function(_CustomerPackagingItem) _then) =
      __$CustomerPackagingItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String packagingId,
      String packagingName,
      int quantity,
      double unitValue,
      double totalValue});
}

/// @nodoc
class __$CustomerPackagingItemCopyWithImpl<$Res>
    implements _$CustomerPackagingItemCopyWith<$Res> {
  __$CustomerPackagingItemCopyWithImpl(this._self, this._then);

  final _CustomerPackagingItem _self;
  final $Res Function(_CustomerPackagingItem) _then;

  /// Create a copy of CustomerPackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? packagingId = null,
    Object? packagingName = null,
    Object? quantity = null,
    Object? unitValue = null,
    Object? totalValue = null,
  }) {
    return _then(_CustomerPackagingItem(
      packagingId: null == packagingId
          ? _self.packagingId
          : packagingId // ignore: cast_nullable_to_non_nullable
              as String,
      packagingName: null == packagingName
          ? _self.packagingName
          : packagingName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitValue: null == unitValue
          ? _self.unitValue
          : unitValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalValue: null == totalValue
          ? _self.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$CustomerStats {
  int get totalOrders;
  int get completedOrders;
  int get cancelledOrders;
  double get totalSpent;
  double get averageOrderValue;
  int get daysAsCustomer;
  double? get averageRating;

  /// Create a copy of CustomerStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerStatsCopyWith<CustomerStats> get copyWith =>
      _$CustomerStatsCopyWithImpl<CustomerStats>(
          this as CustomerStats, _$identity);

  /// Serializes this CustomerStats to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerStats &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.completedOrders, completedOrders) ||
                other.completedOrders == completedOrders) &&
            (identical(other.cancelledOrders, cancelledOrders) ||
                other.cancelledOrders == cancelledOrders) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.daysAsCustomer, daysAsCustomer) ||
                other.daysAsCustomer == daysAsCustomer) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalOrders,
      completedOrders,
      cancelledOrders,
      totalSpent,
      averageOrderValue,
      daysAsCustomer,
      averageRating);

  @override
  String toString() {
    return 'CustomerStats(totalOrders: $totalOrders, completedOrders: $completedOrders, cancelledOrders: $cancelledOrders, totalSpent: $totalSpent, averageOrderValue: $averageOrderValue, daysAsCustomer: $daysAsCustomer, averageRating: $averageRating)';
  }
}

/// @nodoc
abstract mixin class $CustomerStatsCopyWith<$Res> {
  factory $CustomerStatsCopyWith(
          CustomerStats value, $Res Function(CustomerStats) _then) =
      _$CustomerStatsCopyWithImpl;
  @useResult
  $Res call(
      {int totalOrders,
      int completedOrders,
      int cancelledOrders,
      double totalSpent,
      double averageOrderValue,
      int daysAsCustomer,
      double? averageRating});
}

/// @nodoc
class _$CustomerStatsCopyWithImpl<$Res>
    implements $CustomerStatsCopyWith<$Res> {
  _$CustomerStatsCopyWithImpl(this._self, this._then);

  final CustomerStats _self;
  final $Res Function(CustomerStats) _then;

  /// Create a copy of CustomerStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOrders = null,
    Object? completedOrders = null,
    Object? cancelledOrders = null,
    Object? totalSpent = null,
    Object? averageOrderValue = null,
    Object? daysAsCustomer = null,
    Object? averageRating = freezed,
  }) {
    return _then(_self.copyWith(
      totalOrders: null == totalOrders
          ? _self.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _self.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledOrders: null == cancelledOrders
          ? _self.cancelledOrders
          : cancelledOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _self.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      averageOrderValue: null == averageOrderValue
          ? _self.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      daysAsCustomer: null == daysAsCustomer
          ? _self.daysAsCustomer
          : daysAsCustomer // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: freezed == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerStats].
extension CustomerStatsPatterns on CustomerStats {
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
    TResult Function(_CustomerStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerStats() when $default != null:
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
    TResult Function(_CustomerStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerStats():
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
    TResult? Function(_CustomerStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerStats() when $default != null:
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
            int totalOrders,
            int completedOrders,
            int cancelledOrders,
            double totalSpent,
            double averageOrderValue,
            int daysAsCustomer,
            double? averageRating)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerStats() when $default != null:
        return $default(
            _that.totalOrders,
            _that.completedOrders,
            _that.cancelledOrders,
            _that.totalSpent,
            _that.averageOrderValue,
            _that.daysAsCustomer,
            _that.averageRating);
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
            int totalOrders,
            int completedOrders,
            int cancelledOrders,
            double totalSpent,
            double averageOrderValue,
            int daysAsCustomer,
            double? averageRating)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerStats():
        return $default(
            _that.totalOrders,
            _that.completedOrders,
            _that.cancelledOrders,
            _that.totalSpent,
            _that.averageOrderValue,
            _that.daysAsCustomer,
            _that.averageRating);
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
            int totalOrders,
            int completedOrders,
            int cancelledOrders,
            double totalSpent,
            double averageOrderValue,
            int daysAsCustomer,
            double? averageRating)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerStats() when $default != null:
        return $default(
            _that.totalOrders,
            _that.completedOrders,
            _that.cancelledOrders,
            _that.totalSpent,
            _that.averageOrderValue,
            _that.daysAsCustomer,
            _that.averageRating);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerStats implements CustomerStats {
  const _CustomerStats(
      {required this.totalOrders,
      required this.completedOrders,
      required this.cancelledOrders,
      required this.totalSpent,
      required this.averageOrderValue,
      required this.daysAsCustomer,
      this.averageRating});
  factory _CustomerStats.fromJson(Map<String, dynamic> json) =>
      _$CustomerStatsFromJson(json);

  @override
  final int totalOrders;
  @override
  final int completedOrders;
  @override
  final int cancelledOrders;
  @override
  final double totalSpent;
  @override
  final double averageOrderValue;
  @override
  final int daysAsCustomer;
  @override
  final double? averageRating;

  /// Create a copy of CustomerStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerStatsCopyWith<_CustomerStats> get copyWith =>
      __$CustomerStatsCopyWithImpl<_CustomerStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerStatsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerStats &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.completedOrders, completedOrders) ||
                other.completedOrders == completedOrders) &&
            (identical(other.cancelledOrders, cancelledOrders) ||
                other.cancelledOrders == cancelledOrders) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.daysAsCustomer, daysAsCustomer) ||
                other.daysAsCustomer == daysAsCustomer) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalOrders,
      completedOrders,
      cancelledOrders,
      totalSpent,
      averageOrderValue,
      daysAsCustomer,
      averageRating);

  @override
  String toString() {
    return 'CustomerStats(totalOrders: $totalOrders, completedOrders: $completedOrders, cancelledOrders: $cancelledOrders, totalSpent: $totalSpent, averageOrderValue: $averageOrderValue, daysAsCustomer: $daysAsCustomer, averageRating: $averageRating)';
  }
}

/// @nodoc
abstract mixin class _$CustomerStatsCopyWith<$Res>
    implements $CustomerStatsCopyWith<$Res> {
  factory _$CustomerStatsCopyWith(
          _CustomerStats value, $Res Function(_CustomerStats) _then) =
      __$CustomerStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalOrders,
      int completedOrders,
      int cancelledOrders,
      double totalSpent,
      double averageOrderValue,
      int daysAsCustomer,
      double? averageRating});
}

/// @nodoc
class __$CustomerStatsCopyWithImpl<$Res>
    implements _$CustomerStatsCopyWith<$Res> {
  __$CustomerStatsCopyWithImpl(this._self, this._then);

  final _CustomerStats _self;
  final $Res Function(_CustomerStats) _then;

  /// Create a copy of CustomerStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalOrders = null,
    Object? completedOrders = null,
    Object? cancelledOrders = null,
    Object? totalSpent = null,
    Object? averageOrderValue = null,
    Object? daysAsCustomer = null,
    Object? averageRating = freezed,
  }) {
    return _then(_CustomerStats(
      totalOrders: null == totalOrders
          ? _self.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _self.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledOrders: null == cancelledOrders
          ? _self.cancelledOrders
          : cancelledOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _self.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      averageOrderValue: null == averageOrderValue
          ? _self.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      daysAsCustomer: null == daysAsCustomer
          ? _self.daysAsCustomer
          : daysAsCustomer // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: freezed == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$CustomerContact {
  String get id;
  String get name;
  String get role;
  String? get phone;
  String? get email;
  bool get isPrimary;

  /// Create a copy of CustomerContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerContactCopyWith<CustomerContact> get copyWith =>
      _$CustomerContactCopyWithImpl<CustomerContact>(
          this as CustomerContact, _$identity);

  /// Serializes this CustomerContact to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerContact &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, role, phone, email, isPrimary);

  @override
  String toString() {
    return 'CustomerContact(id: $id, name: $name, role: $role, phone: $phone, email: $email, isPrimary: $isPrimary)';
  }
}

/// @nodoc
abstract mixin class $CustomerContactCopyWith<$Res> {
  factory $CustomerContactCopyWith(
          CustomerContact value, $Res Function(CustomerContact) _then) =
      _$CustomerContactCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String role,
      String? phone,
      String? email,
      bool isPrimary});
}

/// @nodoc
class _$CustomerContactCopyWithImpl<$Res>
    implements $CustomerContactCopyWith<$Res> {
  _$CustomerContactCopyWithImpl(this._self, this._then);

  final CustomerContact _self;
  final $Res Function(CustomerContact) _then;

  /// Create a copy of CustomerContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? isPrimary = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: null == isPrimary
          ? _self.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerContact].
extension CustomerContactPatterns on CustomerContact {
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
    TResult Function(_CustomerContact value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerContact() when $default != null:
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
    TResult Function(_CustomerContact value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerContact():
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
    TResult? Function(_CustomerContact value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerContact() when $default != null:
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
    TResult Function(String id, String name, String role, String? phone,
            String? email, bool isPrimary)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerContact() when $default != null:
        return $default(_that.id, _that.name, _that.role, _that.phone,
            _that.email, _that.isPrimary);
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
    TResult Function(String id, String name, String role, String? phone,
            String? email, bool isPrimary)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerContact():
        return $default(_that.id, _that.name, _that.role, _that.phone,
            _that.email, _that.isPrimary);
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
    TResult? Function(String id, String name, String role, String? phone,
            String? email, bool isPrimary)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerContact() when $default != null:
        return $default(_that.id, _that.name, _that.role, _that.phone,
            _that.email, _that.isPrimary);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerContact implements CustomerContact {
  const _CustomerContact(
      {required this.id,
      required this.name,
      required this.role,
      this.phone,
      this.email,
      this.isPrimary = true});
  factory _CustomerContact.fromJson(Map<String, dynamic> json) =>
      _$CustomerContactFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String role;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  @JsonKey()
  final bool isPrimary;

  /// Create a copy of CustomerContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerContactCopyWith<_CustomerContact> get copyWith =>
      __$CustomerContactCopyWithImpl<_CustomerContact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerContactToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerContact &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, role, phone, email, isPrimary);

  @override
  String toString() {
    return 'CustomerContact(id: $id, name: $name, role: $role, phone: $phone, email: $email, isPrimary: $isPrimary)';
  }
}

/// @nodoc
abstract mixin class _$CustomerContactCopyWith<$Res>
    implements $CustomerContactCopyWith<$Res> {
  factory _$CustomerContactCopyWith(
          _CustomerContact value, $Res Function(_CustomerContact) _then) =
      __$CustomerContactCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String role,
      String? phone,
      String? email,
      bool isPrimary});
}

/// @nodoc
class __$CustomerContactCopyWithImpl<$Res>
    implements _$CustomerContactCopyWith<$Res> {
  __$CustomerContactCopyWithImpl(this._self, this._then);

  final _CustomerContact _self;
  final $Res Function(_CustomerContact) _then;

  /// Create a copy of CustomerContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? isPrimary = null,
  }) {
    return _then(_CustomerContact(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: null == isPrimary
          ? _self.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$CustomerSettings {
  bool get emailNotifications;
  bool get smsNotifications;
  bool get pushNotifications;
  bool get orderConfirmations;
  bool get deliveryUpdates;
  bool get paymentReminders;
  bool get promotionalOffers;
  String? get preferredLanguage;
  String? get preferredCurrency;

  /// Create a copy of CustomerSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerSettingsCopyWith<CustomerSettings> get copyWith =>
      _$CustomerSettingsCopyWithImpl<CustomerSettings>(
          this as CustomerSettings, _$identity);

  /// Serializes this CustomerSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerSettings &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.smsNotifications, smsNotifications) ||
                other.smsNotifications == smsNotifications) &&
            (identical(other.pushNotifications, pushNotifications) ||
                other.pushNotifications == pushNotifications) &&
            (identical(other.orderConfirmations, orderConfirmations) ||
                other.orderConfirmations == orderConfirmations) &&
            (identical(other.deliveryUpdates, deliveryUpdates) ||
                other.deliveryUpdates == deliveryUpdates) &&
            (identical(other.paymentReminders, paymentReminders) ||
                other.paymentReminders == paymentReminders) &&
            (identical(other.promotionalOffers, promotionalOffers) ||
                other.promotionalOffers == promotionalOffers) &&
            (identical(other.preferredLanguage, preferredLanguage) ||
                other.preferredLanguage == preferredLanguage) &&
            (identical(other.preferredCurrency, preferredCurrency) ||
                other.preferredCurrency == preferredCurrency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailNotifications,
      smsNotifications,
      pushNotifications,
      orderConfirmations,
      deliveryUpdates,
      paymentReminders,
      promotionalOffers,
      preferredLanguage,
      preferredCurrency);

  @override
  String toString() {
    return 'CustomerSettings(emailNotifications: $emailNotifications, smsNotifications: $smsNotifications, pushNotifications: $pushNotifications, orderConfirmations: $orderConfirmations, deliveryUpdates: $deliveryUpdates, paymentReminders: $paymentReminders, promotionalOffers: $promotionalOffers, preferredLanguage: $preferredLanguage, preferredCurrency: $preferredCurrency)';
  }
}

/// @nodoc
abstract mixin class $CustomerSettingsCopyWith<$Res> {
  factory $CustomerSettingsCopyWith(
          CustomerSettings value, $Res Function(CustomerSettings) _then) =
      _$CustomerSettingsCopyWithImpl;
  @useResult
  $Res call(
      {bool emailNotifications,
      bool smsNotifications,
      bool pushNotifications,
      bool orderConfirmations,
      bool deliveryUpdates,
      bool paymentReminders,
      bool promotionalOffers,
      String? preferredLanguage,
      String? preferredCurrency});
}

/// @nodoc
class _$CustomerSettingsCopyWithImpl<$Res>
    implements $CustomerSettingsCopyWith<$Res> {
  _$CustomerSettingsCopyWithImpl(this._self, this._then);

  final CustomerSettings _self;
  final $Res Function(CustomerSettings) _then;

  /// Create a copy of CustomerSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailNotifications = null,
    Object? smsNotifications = null,
    Object? pushNotifications = null,
    Object? orderConfirmations = null,
    Object? deliveryUpdates = null,
    Object? paymentReminders = null,
    Object? promotionalOffers = null,
    Object? preferredLanguage = freezed,
    Object? preferredCurrency = freezed,
  }) {
    return _then(_self.copyWith(
      emailNotifications: null == emailNotifications
          ? _self.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      smsNotifications: null == smsNotifications
          ? _self.smsNotifications
          : smsNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _self.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      orderConfirmations: null == orderConfirmations
          ? _self.orderConfirmations
          : orderConfirmations // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryUpdates: null == deliveryUpdates
          ? _self.deliveryUpdates
          : deliveryUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentReminders: null == paymentReminders
          ? _self.paymentReminders
          : paymentReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      promotionalOffers: null == promotionalOffers
          ? _self.promotionalOffers
          : promotionalOffers // ignore: cast_nullable_to_non_nullable
              as bool,
      preferredLanguage: freezed == preferredLanguage
          ? _self.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredCurrency: freezed == preferredCurrency
          ? _self.preferredCurrency
          : preferredCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerSettings].
extension CustomerSettingsPatterns on CustomerSettings {
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
    TResult Function(_CustomerSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerSettings() when $default != null:
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
    TResult Function(_CustomerSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerSettings():
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
    TResult? Function(_CustomerSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerSettings() when $default != null:
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
            bool emailNotifications,
            bool smsNotifications,
            bool pushNotifications,
            bool orderConfirmations,
            bool deliveryUpdates,
            bool paymentReminders,
            bool promotionalOffers,
            String? preferredLanguage,
            String? preferredCurrency)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerSettings() when $default != null:
        return $default(
            _that.emailNotifications,
            _that.smsNotifications,
            _that.pushNotifications,
            _that.orderConfirmations,
            _that.deliveryUpdates,
            _that.paymentReminders,
            _that.promotionalOffers,
            _that.preferredLanguage,
            _that.preferredCurrency);
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
            bool emailNotifications,
            bool smsNotifications,
            bool pushNotifications,
            bool orderConfirmations,
            bool deliveryUpdates,
            bool paymentReminders,
            bool promotionalOffers,
            String? preferredLanguage,
            String? preferredCurrency)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerSettings():
        return $default(
            _that.emailNotifications,
            _that.smsNotifications,
            _that.pushNotifications,
            _that.orderConfirmations,
            _that.deliveryUpdates,
            _that.paymentReminders,
            _that.promotionalOffers,
            _that.preferredLanguage,
            _that.preferredCurrency);
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
            bool emailNotifications,
            bool smsNotifications,
            bool pushNotifications,
            bool orderConfirmations,
            bool deliveryUpdates,
            bool paymentReminders,
            bool promotionalOffers,
            String? preferredLanguage,
            String? preferredCurrency)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerSettings() when $default != null:
        return $default(
            _that.emailNotifications,
            _that.smsNotifications,
            _that.pushNotifications,
            _that.orderConfirmations,
            _that.deliveryUpdates,
            _that.paymentReminders,
            _that.promotionalOffers,
            _that.preferredLanguage,
            _that.preferredCurrency);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerSettings implements CustomerSettings {
  const _CustomerSettings(
      {this.emailNotifications = true,
      this.smsNotifications = true,
      this.pushNotifications = true,
      this.orderConfirmations = true,
      this.deliveryUpdates = true,
      this.paymentReminders = true,
      this.promotionalOffers = true,
      this.preferredLanguage,
      this.preferredCurrency});
  factory _CustomerSettings.fromJson(Map<String, dynamic> json) =>
      _$CustomerSettingsFromJson(json);

  @override
  @JsonKey()
  final bool emailNotifications;
  @override
  @JsonKey()
  final bool smsNotifications;
  @override
  @JsonKey()
  final bool pushNotifications;
  @override
  @JsonKey()
  final bool orderConfirmations;
  @override
  @JsonKey()
  final bool deliveryUpdates;
  @override
  @JsonKey()
  final bool paymentReminders;
  @override
  @JsonKey()
  final bool promotionalOffers;
  @override
  final String? preferredLanguage;
  @override
  final String? preferredCurrency;

  /// Create a copy of CustomerSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerSettingsCopyWith<_CustomerSettings> get copyWith =>
      __$CustomerSettingsCopyWithImpl<_CustomerSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerSettings &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.smsNotifications, smsNotifications) ||
                other.smsNotifications == smsNotifications) &&
            (identical(other.pushNotifications, pushNotifications) ||
                other.pushNotifications == pushNotifications) &&
            (identical(other.orderConfirmations, orderConfirmations) ||
                other.orderConfirmations == orderConfirmations) &&
            (identical(other.deliveryUpdates, deliveryUpdates) ||
                other.deliveryUpdates == deliveryUpdates) &&
            (identical(other.paymentReminders, paymentReminders) ||
                other.paymentReminders == paymentReminders) &&
            (identical(other.promotionalOffers, promotionalOffers) ||
                other.promotionalOffers == promotionalOffers) &&
            (identical(other.preferredLanguage, preferredLanguage) ||
                other.preferredLanguage == preferredLanguage) &&
            (identical(other.preferredCurrency, preferredCurrency) ||
                other.preferredCurrency == preferredCurrency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailNotifications,
      smsNotifications,
      pushNotifications,
      orderConfirmations,
      deliveryUpdates,
      paymentReminders,
      promotionalOffers,
      preferredLanguage,
      preferredCurrency);

  @override
  String toString() {
    return 'CustomerSettings(emailNotifications: $emailNotifications, smsNotifications: $smsNotifications, pushNotifications: $pushNotifications, orderConfirmations: $orderConfirmations, deliveryUpdates: $deliveryUpdates, paymentReminders: $paymentReminders, promotionalOffers: $promotionalOffers, preferredLanguage: $preferredLanguage, preferredCurrency: $preferredCurrency)';
  }
}

/// @nodoc
abstract mixin class _$CustomerSettingsCopyWith<$Res>
    implements $CustomerSettingsCopyWith<$Res> {
  factory _$CustomerSettingsCopyWith(
          _CustomerSettings value, $Res Function(_CustomerSettings) _then) =
      __$CustomerSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool emailNotifications,
      bool smsNotifications,
      bool pushNotifications,
      bool orderConfirmations,
      bool deliveryUpdates,
      bool paymentReminders,
      bool promotionalOffers,
      String? preferredLanguage,
      String? preferredCurrency});
}

/// @nodoc
class __$CustomerSettingsCopyWithImpl<$Res>
    implements _$CustomerSettingsCopyWith<$Res> {
  __$CustomerSettingsCopyWithImpl(this._self, this._then);

  final _CustomerSettings _self;
  final $Res Function(_CustomerSettings) _then;

  /// Create a copy of CustomerSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? emailNotifications = null,
    Object? smsNotifications = null,
    Object? pushNotifications = null,
    Object? orderConfirmations = null,
    Object? deliveryUpdates = null,
    Object? paymentReminders = null,
    Object? promotionalOffers = null,
    Object? preferredLanguage = freezed,
    Object? preferredCurrency = freezed,
  }) {
    return _then(_CustomerSettings(
      emailNotifications: null == emailNotifications
          ? _self.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      smsNotifications: null == smsNotifications
          ? _self.smsNotifications
          : smsNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _self.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      orderConfirmations: null == orderConfirmations
          ? _self.orderConfirmations
          : orderConfirmations // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryUpdates: null == deliveryUpdates
          ? _self.deliveryUpdates
          : deliveryUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentReminders: null == paymentReminders
          ? _self.paymentReminders
          : paymentReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      promotionalOffers: null == promotionalOffers
          ? _self.promotionalOffers
          : promotionalOffers // ignore: cast_nullable_to_non_nullable
              as bool,
      preferredLanguage: freezed == preferredLanguage
          ? _self.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredCurrency: freezed == preferredCurrency
          ? _self.preferredCurrency
          : preferredCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
