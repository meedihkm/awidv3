// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerAccount _$CustomerAccountFromJson(Map<String, dynamic> json) {
  return _CustomerAccount.fromJson(json);
}

/// @nodoc
mixin _$CustomerAccount {
  String get id => throw _privateConstructorUsedError;
  String get organizationId => throw _privateConstructorUsedError;
  String get organizationName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  CustomerCreditInfo get creditInfo => throw _privateConstructorUsedError;
  CustomerPackagingInfo get packagingInfo => throw _privateConstructorUsedError;
  CustomerStats get stats => throw _privateConstructorUsedError;
  List<CustomerContact>? get contacts => throw _privateConstructorUsedError;
  CustomerSettings? get settings => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get lastOrderDate => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CustomerAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerAccountCopyWith<CustomerAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerAccountCopyWith<$Res> {
  factory $CustomerAccountCopyWith(
          CustomerAccount value, $Res Function(CustomerAccount) then) =
      _$CustomerAccountCopyWithImpl<$Res, CustomerAccount>;
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
class _$CustomerAccountCopyWithImpl<$Res, $Val extends CustomerAccount>
    implements $CustomerAccountCopyWith<$Res> {
  _$CustomerAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      creditInfo: null == creditInfo
          ? _value.creditInfo
          : creditInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCreditInfo,
      packagingInfo: null == packagingInfo
          ? _value.packagingInfo
          : packagingInfo // ignore: cast_nullable_to_non_nullable
              as CustomerPackagingInfo,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CustomerStats,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<CustomerContact>?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as CustomerSettings?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastOrderDate: freezed == lastOrderDate
          ? _value.lastOrderDate
          : lastOrderDate // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCreditInfoCopyWith<$Res> get creditInfo {
    return $CustomerCreditInfoCopyWith<$Res>(_value.creditInfo, (value) {
      return _then(_value.copyWith(creditInfo: value) as $Val);
    });
  }

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerPackagingInfoCopyWith<$Res> get packagingInfo {
    return $CustomerPackagingInfoCopyWith<$Res>(_value.packagingInfo, (value) {
      return _then(_value.copyWith(packagingInfo: value) as $Val);
    });
  }

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerStatsCopyWith<$Res> get stats {
    return $CustomerStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerSettingsCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $CustomerSettingsCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerAccountImplCopyWith<$Res>
    implements $CustomerAccountCopyWith<$Res> {
  factory _$$CustomerAccountImplCopyWith(_$CustomerAccountImpl value,
          $Res Function(_$CustomerAccountImpl) then) =
      __$$CustomerAccountImplCopyWithImpl<$Res>;
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
class __$$CustomerAccountImplCopyWithImpl<$Res>
    extends _$CustomerAccountCopyWithImpl<$Res, _$CustomerAccountImpl>
    implements _$$CustomerAccountImplCopyWith<$Res> {
  __$$CustomerAccountImplCopyWithImpl(
      _$CustomerAccountImpl _value, $Res Function(_$CustomerAccountImpl) _then)
      : super(_value, _then);

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
    return _then(_$CustomerAccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      creditInfo: null == creditInfo
          ? _value.creditInfo
          : creditInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCreditInfo,
      packagingInfo: null == packagingInfo
          ? _value.packagingInfo
          : packagingInfo // ignore: cast_nullable_to_non_nullable
              as CustomerPackagingInfo,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CustomerStats,
      contacts: freezed == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<CustomerContact>?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as CustomerSettings?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastOrderDate: freezed == lastOrderDate
          ? _value.lastOrderDate
          : lastOrderDate // ignore: cast_nullable_to_non_nullable
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
class _$CustomerAccountImpl implements _CustomerAccount {
  const _$CustomerAccountImpl(
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

  factory _$CustomerAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerAccountImplFromJson(json);

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

  @override
  String toString() {
    return 'CustomerAccount(id: $id, organizationId: $organizationId, organizationName: $organizationName, name: $name, email: $email, phone: $phone, address: $address, latitude: $latitude, longitude: $longitude, creditInfo: $creditInfo, packagingInfo: $packagingInfo, stats: $stats, contacts: $contacts, settings: $settings, isActive: $isActive, lastOrderDate: $lastOrderDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerAccountImpl &&
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

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerAccountImplCopyWith<_$CustomerAccountImpl> get copyWith =>
      __$$CustomerAccountImplCopyWithImpl<_$CustomerAccountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerAccountImplToJson(
      this,
    );
  }
}

abstract class _CustomerAccount implements CustomerAccount {
  const factory _CustomerAccount(
      {required final String id,
      required final String organizationId,
      required final String organizationName,
      required final String name,
      required final String email,
      final String? phone,
      final String? address,
      final double? latitude,
      final double? longitude,
      required final CustomerCreditInfo creditInfo,
      required final CustomerPackagingInfo packagingInfo,
      required final CustomerStats stats,
      final List<CustomerContact>? contacts,
      final CustomerSettings? settings,
      final bool isActive,
      final DateTime? lastOrderDate,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CustomerAccountImpl;

  factory _CustomerAccount.fromJson(Map<String, dynamic> json) =
      _$CustomerAccountImpl.fromJson;

  @override
  String get id;
  @override
  String get organizationId;
  @override
  String get organizationName;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  CustomerCreditInfo get creditInfo;
  @override
  CustomerPackagingInfo get packagingInfo;
  @override
  CustomerStats get stats;
  @override
  List<CustomerContact>? get contacts;
  @override
  CustomerSettings? get settings;
  @override
  bool get isActive;
  @override
  DateTime? get lastOrderDate;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CustomerAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerAccountImplCopyWith<_$CustomerAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerCreditInfo _$CustomerCreditInfoFromJson(Map<String, dynamic> json) {
  return _CustomerCreditInfo.fromJson(json);
}

/// @nodoc
mixin _$CustomerCreditInfo {
  double get creditLimit => throw _privateConstructorUsedError;
  double get currentBalance => throw _privateConstructorUsedError;
  double get availableCredit => throw _privateConstructorUsedError;
  int get daysOverdue => throw _privateConstructorUsedError;
  DateTime? get lastPaymentDate => throw _privateConstructorUsedError;
  double get lastPaymentAmount => throw _privateConstructorUsedError;
  bool get isCreditBlocked => throw _privateConstructorUsedError;
  String? get blockReason => throw _privateConstructorUsedError;

  /// Serializes this CustomerCreditInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerCreditInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerCreditInfoCopyWith<CustomerCreditInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCreditInfoCopyWith<$Res> {
  factory $CustomerCreditInfoCopyWith(
          CustomerCreditInfo value, $Res Function(CustomerCreditInfo) then) =
      _$CustomerCreditInfoCopyWithImpl<$Res, CustomerCreditInfo>;
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
class _$CustomerCreditInfoCopyWithImpl<$Res, $Val extends CustomerCreditInfo>
    implements $CustomerCreditInfoCopyWith<$Res> {
  _$CustomerCreditInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as double,
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      availableCredit: null == availableCredit
          ? _value.availableCredit
          : availableCredit // ignore: cast_nullable_to_non_nullable
              as double,
      daysOverdue: null == daysOverdue
          ? _value.daysOverdue
          : daysOverdue // ignore: cast_nullable_to_non_nullable
              as int,
      lastPaymentDate: freezed == lastPaymentDate
          ? _value.lastPaymentDate
          : lastPaymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastPaymentAmount: null == lastPaymentAmount
          ? _value.lastPaymentAmount
          : lastPaymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isCreditBlocked: null == isCreditBlocked
          ? _value.isCreditBlocked
          : isCreditBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockReason: freezed == blockReason
          ? _value.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerCreditInfoImplCopyWith<$Res>
    implements $CustomerCreditInfoCopyWith<$Res> {
  factory _$$CustomerCreditInfoImplCopyWith(_$CustomerCreditInfoImpl value,
          $Res Function(_$CustomerCreditInfoImpl) then) =
      __$$CustomerCreditInfoImplCopyWithImpl<$Res>;
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
class __$$CustomerCreditInfoImplCopyWithImpl<$Res>
    extends _$CustomerCreditInfoCopyWithImpl<$Res, _$CustomerCreditInfoImpl>
    implements _$$CustomerCreditInfoImplCopyWith<$Res> {
  __$$CustomerCreditInfoImplCopyWithImpl(_$CustomerCreditInfoImpl _value,
      $Res Function(_$CustomerCreditInfoImpl) _then)
      : super(_value, _then);

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
    return _then(_$CustomerCreditInfoImpl(
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as double,
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      availableCredit: null == availableCredit
          ? _value.availableCredit
          : availableCredit // ignore: cast_nullable_to_non_nullable
              as double,
      daysOverdue: null == daysOverdue
          ? _value.daysOverdue
          : daysOverdue // ignore: cast_nullable_to_non_nullable
              as int,
      lastPaymentDate: freezed == lastPaymentDate
          ? _value.lastPaymentDate
          : lastPaymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastPaymentAmount: null == lastPaymentAmount
          ? _value.lastPaymentAmount
          : lastPaymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isCreditBlocked: null == isCreditBlocked
          ? _value.isCreditBlocked
          : isCreditBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockReason: freezed == blockReason
          ? _value.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerCreditInfoImpl implements _CustomerCreditInfo {
  const _$CustomerCreditInfoImpl(
      {required this.creditLimit,
      required this.currentBalance,
      required this.availableCredit,
      required this.daysOverdue,
      this.lastPaymentDate,
      required this.lastPaymentAmount,
      this.isCreditBlocked = false,
      this.blockReason});

  factory _$CustomerCreditInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerCreditInfoImplFromJson(json);

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

  @override
  String toString() {
    return 'CustomerCreditInfo(creditLimit: $creditLimit, currentBalance: $currentBalance, availableCredit: $availableCredit, daysOverdue: $daysOverdue, lastPaymentDate: $lastPaymentDate, lastPaymentAmount: $lastPaymentAmount, isCreditBlocked: $isCreditBlocked, blockReason: $blockReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerCreditInfoImpl &&
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

  /// Create a copy of CustomerCreditInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerCreditInfoImplCopyWith<_$CustomerCreditInfoImpl> get copyWith =>
      __$$CustomerCreditInfoImplCopyWithImpl<_$CustomerCreditInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerCreditInfoImplToJson(
      this,
    );
  }
}

abstract class _CustomerCreditInfo implements CustomerCreditInfo {
  const factory _CustomerCreditInfo(
      {required final double creditLimit,
      required final double currentBalance,
      required final double availableCredit,
      required final int daysOverdue,
      final DateTime? lastPaymentDate,
      required final double lastPaymentAmount,
      final bool isCreditBlocked,
      final String? blockReason}) = _$CustomerCreditInfoImpl;

  factory _CustomerCreditInfo.fromJson(Map<String, dynamic> json) =
      _$CustomerCreditInfoImpl.fromJson;

  @override
  double get creditLimit;
  @override
  double get currentBalance;
  @override
  double get availableCredit;
  @override
  int get daysOverdue;
  @override
  DateTime? get lastPaymentDate;
  @override
  double get lastPaymentAmount;
  @override
  bool get isCreditBlocked;
  @override
  String? get blockReason;

  /// Create a copy of CustomerCreditInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerCreditInfoImplCopyWith<_$CustomerCreditInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerPackagingInfo _$CustomerPackagingInfoFromJson(
    Map<String, dynamic> json) {
  return _CustomerPackagingInfo.fromJson(json);
}

/// @nodoc
mixin _$CustomerPackagingInfo {
  double get totalValue => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  List<CustomerPackagingItem> get items => throw _privateConstructorUsedError;
  DateTime? get lastTransactionDate => throw _privateConstructorUsedError;

  /// Serializes this CustomerPackagingInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerPackagingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerPackagingInfoCopyWith<CustomerPackagingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPackagingInfoCopyWith<$Res> {
  factory $CustomerPackagingInfoCopyWith(CustomerPackagingInfo value,
          $Res Function(CustomerPackagingInfo) then) =
      _$CustomerPackagingInfoCopyWithImpl<$Res, CustomerPackagingInfo>;
  @useResult
  $Res call(
      {double totalValue,
      int totalQuantity,
      List<CustomerPackagingItem> items,
      DateTime? lastTransactionDate});
}

/// @nodoc
class _$CustomerPackagingInfoCopyWithImpl<$Res,
        $Val extends CustomerPackagingInfo>
    implements $CustomerPackagingInfoCopyWith<$Res> {
  _$CustomerPackagingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerPackagingItem>,
      lastTransactionDate: freezed == lastTransactionDate
          ? _value.lastTransactionDate
          : lastTransactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerPackagingInfoImplCopyWith<$Res>
    implements $CustomerPackagingInfoCopyWith<$Res> {
  factory _$$CustomerPackagingInfoImplCopyWith(
          _$CustomerPackagingInfoImpl value,
          $Res Function(_$CustomerPackagingInfoImpl) then) =
      __$$CustomerPackagingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalValue,
      int totalQuantity,
      List<CustomerPackagingItem> items,
      DateTime? lastTransactionDate});
}

/// @nodoc
class __$$CustomerPackagingInfoImplCopyWithImpl<$Res>
    extends _$CustomerPackagingInfoCopyWithImpl<$Res,
        _$CustomerPackagingInfoImpl>
    implements _$$CustomerPackagingInfoImplCopyWith<$Res> {
  __$$CustomerPackagingInfoImplCopyWithImpl(_$CustomerPackagingInfoImpl _value,
      $Res Function(_$CustomerPackagingInfoImpl) _then)
      : super(_value, _then);

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
    return _then(_$CustomerPackagingInfoImpl(
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerPackagingItem>,
      lastTransactionDate: freezed == lastTransactionDate
          ? _value.lastTransactionDate
          : lastTransactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerPackagingInfoImpl implements _CustomerPackagingInfo {
  const _$CustomerPackagingInfoImpl(
      {required this.totalValue,
      required this.totalQuantity,
      required final List<CustomerPackagingItem> items,
      this.lastTransactionDate})
      : _items = items;

  factory _$CustomerPackagingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerPackagingInfoImplFromJson(json);

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

  @override
  String toString() {
    return 'CustomerPackagingInfo(totalValue: $totalValue, totalQuantity: $totalQuantity, items: $items, lastTransactionDate: $lastTransactionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerPackagingInfoImpl &&
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

  /// Create a copy of CustomerPackagingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerPackagingInfoImplCopyWith<_$CustomerPackagingInfoImpl>
      get copyWith => __$$CustomerPackagingInfoImplCopyWithImpl<
          _$CustomerPackagingInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerPackagingInfoImplToJson(
      this,
    );
  }
}

abstract class _CustomerPackagingInfo implements CustomerPackagingInfo {
  const factory _CustomerPackagingInfo(
      {required final double totalValue,
      required final int totalQuantity,
      required final List<CustomerPackagingItem> items,
      final DateTime? lastTransactionDate}) = _$CustomerPackagingInfoImpl;

  factory _CustomerPackagingInfo.fromJson(Map<String, dynamic> json) =
      _$CustomerPackagingInfoImpl.fromJson;

  @override
  double get totalValue;
  @override
  int get totalQuantity;
  @override
  List<CustomerPackagingItem> get items;
  @override
  DateTime? get lastTransactionDate;

  /// Create a copy of CustomerPackagingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerPackagingInfoImplCopyWith<_$CustomerPackagingInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomerPackagingItem _$CustomerPackagingItemFromJson(
    Map<String, dynamic> json) {
  return _CustomerPackagingItem.fromJson(json);
}

/// @nodoc
mixin _$CustomerPackagingItem {
  String get packagingId => throw _privateConstructorUsedError;
  String get packagingName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitValue => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;

  /// Serializes this CustomerPackagingItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerPackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerPackagingItemCopyWith<CustomerPackagingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPackagingItemCopyWith<$Res> {
  factory $CustomerPackagingItemCopyWith(CustomerPackagingItem value,
          $Res Function(CustomerPackagingItem) then) =
      _$CustomerPackagingItemCopyWithImpl<$Res, CustomerPackagingItem>;
  @useResult
  $Res call(
      {String packagingId,
      String packagingName,
      int quantity,
      double unitValue,
      double totalValue});
}

/// @nodoc
class _$CustomerPackagingItemCopyWithImpl<$Res,
        $Val extends CustomerPackagingItem>
    implements $CustomerPackagingItemCopyWith<$Res> {
  _$CustomerPackagingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      packagingId: null == packagingId
          ? _value.packagingId
          : packagingId // ignore: cast_nullable_to_non_nullable
              as String,
      packagingName: null == packagingName
          ? _value.packagingName
          : packagingName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitValue: null == unitValue
          ? _value.unitValue
          : unitValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerPackagingItemImplCopyWith<$Res>
    implements $CustomerPackagingItemCopyWith<$Res> {
  factory _$$CustomerPackagingItemImplCopyWith(
          _$CustomerPackagingItemImpl value,
          $Res Function(_$CustomerPackagingItemImpl) then) =
      __$$CustomerPackagingItemImplCopyWithImpl<$Res>;
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
class __$$CustomerPackagingItemImplCopyWithImpl<$Res>
    extends _$CustomerPackagingItemCopyWithImpl<$Res,
        _$CustomerPackagingItemImpl>
    implements _$$CustomerPackagingItemImplCopyWith<$Res> {
  __$$CustomerPackagingItemImplCopyWithImpl(_$CustomerPackagingItemImpl _value,
      $Res Function(_$CustomerPackagingItemImpl) _then)
      : super(_value, _then);

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
    return _then(_$CustomerPackagingItemImpl(
      packagingId: null == packagingId
          ? _value.packagingId
          : packagingId // ignore: cast_nullable_to_non_nullable
              as String,
      packagingName: null == packagingName
          ? _value.packagingName
          : packagingName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitValue: null == unitValue
          ? _value.unitValue
          : unitValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerPackagingItemImpl implements _CustomerPackagingItem {
  const _$CustomerPackagingItemImpl(
      {required this.packagingId,
      required this.packagingName,
      required this.quantity,
      required this.unitValue,
      required this.totalValue});

  factory _$CustomerPackagingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerPackagingItemImplFromJson(json);

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

  @override
  String toString() {
    return 'CustomerPackagingItem(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, totalValue: $totalValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerPackagingItemImpl &&
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

  /// Create a copy of CustomerPackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerPackagingItemImplCopyWith<_$CustomerPackagingItemImpl>
      get copyWith => __$$CustomerPackagingItemImplCopyWithImpl<
          _$CustomerPackagingItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerPackagingItemImplToJson(
      this,
    );
  }
}

abstract class _CustomerPackagingItem implements CustomerPackagingItem {
  const factory _CustomerPackagingItem(
      {required final String packagingId,
      required final String packagingName,
      required final int quantity,
      required final double unitValue,
      required final double totalValue}) = _$CustomerPackagingItemImpl;

  factory _CustomerPackagingItem.fromJson(Map<String, dynamic> json) =
      _$CustomerPackagingItemImpl.fromJson;

  @override
  String get packagingId;
  @override
  String get packagingName;
  @override
  int get quantity;
  @override
  double get unitValue;
  @override
  double get totalValue;

  /// Create a copy of CustomerPackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerPackagingItemImplCopyWith<_$CustomerPackagingItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomerStats _$CustomerStatsFromJson(Map<String, dynamic> json) {
  return _CustomerStats.fromJson(json);
}

/// @nodoc
mixin _$CustomerStats {
  int get totalOrders => throw _privateConstructorUsedError;
  int get completedOrders => throw _privateConstructorUsedError;
  int get cancelledOrders => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;
  int get daysAsCustomer => throw _privateConstructorUsedError;
  double? get averageRating => throw _privateConstructorUsedError;

  /// Serializes this CustomerStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerStatsCopyWith<CustomerStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerStatsCopyWith<$Res> {
  factory $CustomerStatsCopyWith(
          CustomerStats value, $Res Function(CustomerStats) then) =
      _$CustomerStatsCopyWithImpl<$Res, CustomerStats>;
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
class _$CustomerStatsCopyWithImpl<$Res, $Val extends CustomerStats>
    implements $CustomerStatsCopyWith<$Res> {
  _$CustomerStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledOrders: null == cancelledOrders
          ? _value.cancelledOrders
          : cancelledOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      daysAsCustomer: null == daysAsCustomer
          ? _value.daysAsCustomer
          : daysAsCustomer // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerStatsImplCopyWith<$Res>
    implements $CustomerStatsCopyWith<$Res> {
  factory _$$CustomerStatsImplCopyWith(
          _$CustomerStatsImpl value, $Res Function(_$CustomerStatsImpl) then) =
      __$$CustomerStatsImplCopyWithImpl<$Res>;
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
class __$$CustomerStatsImplCopyWithImpl<$Res>
    extends _$CustomerStatsCopyWithImpl<$Res, _$CustomerStatsImpl>
    implements _$$CustomerStatsImplCopyWith<$Res> {
  __$$CustomerStatsImplCopyWithImpl(
      _$CustomerStatsImpl _value, $Res Function(_$CustomerStatsImpl) _then)
      : super(_value, _then);

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
    return _then(_$CustomerStatsImpl(
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      completedOrders: null == completedOrders
          ? _value.completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledOrders: null == cancelledOrders
          ? _value.cancelledOrders
          : cancelledOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      daysAsCustomer: null == daysAsCustomer
          ? _value.daysAsCustomer
          : daysAsCustomer // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerStatsImpl implements _CustomerStats {
  const _$CustomerStatsImpl(
      {required this.totalOrders,
      required this.completedOrders,
      required this.cancelledOrders,
      required this.totalSpent,
      required this.averageOrderValue,
      required this.daysAsCustomer,
      this.averageRating});

  factory _$CustomerStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerStatsImplFromJson(json);

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

  @override
  String toString() {
    return 'CustomerStats(totalOrders: $totalOrders, completedOrders: $completedOrders, cancelledOrders: $cancelledOrders, totalSpent: $totalSpent, averageOrderValue: $averageOrderValue, daysAsCustomer: $daysAsCustomer, averageRating: $averageRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerStatsImpl &&
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

  /// Create a copy of CustomerStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerStatsImplCopyWith<_$CustomerStatsImpl> get copyWith =>
      __$$CustomerStatsImplCopyWithImpl<_$CustomerStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerStatsImplToJson(
      this,
    );
  }
}

abstract class _CustomerStats implements CustomerStats {
  const factory _CustomerStats(
      {required final int totalOrders,
      required final int completedOrders,
      required final int cancelledOrders,
      required final double totalSpent,
      required final double averageOrderValue,
      required final int daysAsCustomer,
      final double? averageRating}) = _$CustomerStatsImpl;

  factory _CustomerStats.fromJson(Map<String, dynamic> json) =
      _$CustomerStatsImpl.fromJson;

  @override
  int get totalOrders;
  @override
  int get completedOrders;
  @override
  int get cancelledOrders;
  @override
  double get totalSpent;
  @override
  double get averageOrderValue;
  @override
  int get daysAsCustomer;
  @override
  double? get averageRating;

  /// Create a copy of CustomerStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerStatsImplCopyWith<_$CustomerStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerContact _$CustomerContactFromJson(Map<String, dynamic> json) {
  return _CustomerContact.fromJson(json);
}

/// @nodoc
mixin _$CustomerContact {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  bool get isPrimary => throw _privateConstructorUsedError;

  /// Serializes this CustomerContact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerContactCopyWith<CustomerContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerContactCopyWith<$Res> {
  factory $CustomerContactCopyWith(
          CustomerContact value, $Res Function(CustomerContact) then) =
      _$CustomerContactCopyWithImpl<$Res, CustomerContact>;
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
class _$CustomerContactCopyWithImpl<$Res, $Val extends CustomerContact>
    implements $CustomerContactCopyWith<$Res> {
  _$CustomerContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerContactImplCopyWith<$Res>
    implements $CustomerContactCopyWith<$Res> {
  factory _$$CustomerContactImplCopyWith(_$CustomerContactImpl value,
          $Res Function(_$CustomerContactImpl) then) =
      __$$CustomerContactImplCopyWithImpl<$Res>;
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
class __$$CustomerContactImplCopyWithImpl<$Res>
    extends _$CustomerContactCopyWithImpl<$Res, _$CustomerContactImpl>
    implements _$$CustomerContactImplCopyWith<$Res> {
  __$$CustomerContactImplCopyWithImpl(
      _$CustomerContactImpl _value, $Res Function(_$CustomerContactImpl) _then)
      : super(_value, _then);

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
    return _then(_$CustomerContactImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerContactImpl implements _CustomerContact {
  const _$CustomerContactImpl(
      {required this.id,
      required this.name,
      required this.role,
      this.phone,
      this.email,
      this.isPrimary = true});

  factory _$CustomerContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerContactImplFromJson(json);

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

  @override
  String toString() {
    return 'CustomerContact(id: $id, name: $name, role: $role, phone: $phone, email: $email, isPrimary: $isPrimary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerContactImpl &&
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

  /// Create a copy of CustomerContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerContactImplCopyWith<_$CustomerContactImpl> get copyWith =>
      __$$CustomerContactImplCopyWithImpl<_$CustomerContactImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerContactImplToJson(
      this,
    );
  }
}

abstract class _CustomerContact implements CustomerContact {
  const factory _CustomerContact(
      {required final String id,
      required final String name,
      required final String role,
      final String? phone,
      final String? email,
      final bool isPrimary}) = _$CustomerContactImpl;

  factory _CustomerContact.fromJson(Map<String, dynamic> json) =
      _$CustomerContactImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get role;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  bool get isPrimary;

  /// Create a copy of CustomerContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerContactImplCopyWith<_$CustomerContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerSettings _$CustomerSettingsFromJson(Map<String, dynamic> json) {
  return _CustomerSettings.fromJson(json);
}

/// @nodoc
mixin _$CustomerSettings {
  bool get emailNotifications => throw _privateConstructorUsedError;
  bool get smsNotifications => throw _privateConstructorUsedError;
  bool get pushNotifications => throw _privateConstructorUsedError;
  bool get orderConfirmations => throw _privateConstructorUsedError;
  bool get deliveryUpdates => throw _privateConstructorUsedError;
  bool get paymentReminders => throw _privateConstructorUsedError;
  bool get promotionalOffers => throw _privateConstructorUsedError;
  String? get preferredLanguage => throw _privateConstructorUsedError;
  String? get preferredCurrency => throw _privateConstructorUsedError;

  /// Serializes this CustomerSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerSettingsCopyWith<CustomerSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerSettingsCopyWith<$Res> {
  factory $CustomerSettingsCopyWith(
          CustomerSettings value, $Res Function(CustomerSettings) then) =
      _$CustomerSettingsCopyWithImpl<$Res, CustomerSettings>;
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
class _$CustomerSettingsCopyWithImpl<$Res, $Val extends CustomerSettings>
    implements $CustomerSettingsCopyWith<$Res> {
  _$CustomerSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      smsNotifications: null == smsNotifications
          ? _value.smsNotifications
          : smsNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      orderConfirmations: null == orderConfirmations
          ? _value.orderConfirmations
          : orderConfirmations // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryUpdates: null == deliveryUpdates
          ? _value.deliveryUpdates
          : deliveryUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentReminders: null == paymentReminders
          ? _value.paymentReminders
          : paymentReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      promotionalOffers: null == promotionalOffers
          ? _value.promotionalOffers
          : promotionalOffers // ignore: cast_nullable_to_non_nullable
              as bool,
      preferredLanguage: freezed == preferredLanguage
          ? _value.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredCurrency: freezed == preferredCurrency
          ? _value.preferredCurrency
          : preferredCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerSettingsImplCopyWith<$Res>
    implements $CustomerSettingsCopyWith<$Res> {
  factory _$$CustomerSettingsImplCopyWith(_$CustomerSettingsImpl value,
          $Res Function(_$CustomerSettingsImpl) then) =
      __$$CustomerSettingsImplCopyWithImpl<$Res>;
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
class __$$CustomerSettingsImplCopyWithImpl<$Res>
    extends _$CustomerSettingsCopyWithImpl<$Res, _$CustomerSettingsImpl>
    implements _$$CustomerSettingsImplCopyWith<$Res> {
  __$$CustomerSettingsImplCopyWithImpl(_$CustomerSettingsImpl _value,
      $Res Function(_$CustomerSettingsImpl) _then)
      : super(_value, _then);

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
    return _then(_$CustomerSettingsImpl(
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      smsNotifications: null == smsNotifications
          ? _value.smsNotifications
          : smsNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      orderConfirmations: null == orderConfirmations
          ? _value.orderConfirmations
          : orderConfirmations // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryUpdates: null == deliveryUpdates
          ? _value.deliveryUpdates
          : deliveryUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentReminders: null == paymentReminders
          ? _value.paymentReminders
          : paymentReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      promotionalOffers: null == promotionalOffers
          ? _value.promotionalOffers
          : promotionalOffers // ignore: cast_nullable_to_non_nullable
              as bool,
      preferredLanguage: freezed == preferredLanguage
          ? _value.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredCurrency: freezed == preferredCurrency
          ? _value.preferredCurrency
          : preferredCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerSettingsImpl implements _CustomerSettings {
  const _$CustomerSettingsImpl(
      {this.emailNotifications = true,
      this.smsNotifications = true,
      this.pushNotifications = true,
      this.orderConfirmations = true,
      this.deliveryUpdates = true,
      this.paymentReminders = true,
      this.promotionalOffers = true,
      this.preferredLanguage,
      this.preferredCurrency});

  factory _$CustomerSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerSettingsImplFromJson(json);

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

  @override
  String toString() {
    return 'CustomerSettings(emailNotifications: $emailNotifications, smsNotifications: $smsNotifications, pushNotifications: $pushNotifications, orderConfirmations: $orderConfirmations, deliveryUpdates: $deliveryUpdates, paymentReminders: $paymentReminders, promotionalOffers: $promotionalOffers, preferredLanguage: $preferredLanguage, preferredCurrency: $preferredCurrency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSettingsImpl &&
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

  /// Create a copy of CustomerSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSettingsImplCopyWith<_$CustomerSettingsImpl> get copyWith =>
      __$$CustomerSettingsImplCopyWithImpl<_$CustomerSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerSettingsImplToJson(
      this,
    );
  }
}

abstract class _CustomerSettings implements CustomerSettings {
  const factory _CustomerSettings(
      {final bool emailNotifications,
      final bool smsNotifications,
      final bool pushNotifications,
      final bool orderConfirmations,
      final bool deliveryUpdates,
      final bool paymentReminders,
      final bool promotionalOffers,
      final String? preferredLanguage,
      final String? preferredCurrency}) = _$CustomerSettingsImpl;

  factory _CustomerSettings.fromJson(Map<String, dynamic> json) =
      _$CustomerSettingsImpl.fromJson;

  @override
  bool get emailNotifications;
  @override
  bool get smsNotifications;
  @override
  bool get pushNotifications;
  @override
  bool get orderConfirmations;
  @override
  bool get deliveryUpdates;
  @override
  bool get paymentReminders;
  @override
  bool get promotionalOffers;
  @override
  String? get preferredLanguage;
  @override
  String? get preferredCurrency;

  /// Create a copy of CustomerSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerSettingsImplCopyWith<_$CustomerSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
