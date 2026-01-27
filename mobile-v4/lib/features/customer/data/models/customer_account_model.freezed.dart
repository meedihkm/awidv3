// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerAccountModel _$CustomerAccountModelFromJson(Map<String, dynamic> json) {
  return _CustomerAccountModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerAccountModel {
  String get id => throw _privateConstructorUsedError;
  String get organizationId => throw _privateConstructorUsedError;
  String get organizationName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  CustomerCreditInfoModel get creditInfo => throw _privateConstructorUsedError;
  CustomerPackagingInfoModel get packagingInfo =>
      throw _privateConstructorUsedError;
  CustomerStatsModel get stats => throw _privateConstructorUsedError;
  List<CustomerContactModel>? get contacts =>
      throw _privateConstructorUsedError;
  CustomerSettingsModel? get settings => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get lastOrderDate => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CustomerAccountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerAccountModelCopyWith<CustomerAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerAccountModelCopyWith<$Res> {
  factory $CustomerAccountModelCopyWith(CustomerAccountModel value,
          $Res Function(CustomerAccountModel) then) =
      _$CustomerAccountModelCopyWithImpl<$Res, CustomerAccountModel>;
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
      CustomerCreditInfoModel creditInfo,
      CustomerPackagingInfoModel packagingInfo,
      CustomerStatsModel stats,
      List<CustomerContactModel>? contacts,
      CustomerSettingsModel? settings,
      bool isActive,
      DateTime? lastOrderDate,
      DateTime? createdAt,
      DateTime? updatedAt});

  $CustomerCreditInfoModelCopyWith<$Res> get creditInfo;
  $CustomerPackagingInfoModelCopyWith<$Res> get packagingInfo;
  $CustomerStatsModelCopyWith<$Res> get stats;
  $CustomerSettingsModelCopyWith<$Res>? get settings;
}

/// @nodoc
class _$CustomerAccountModelCopyWithImpl<$Res,
        $Val extends CustomerAccountModel>
    implements $CustomerAccountModelCopyWith<$Res> {
  _$CustomerAccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerAccountModel
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
              as CustomerCreditInfoModel,
      packagingInfo: null == packagingInfo
          ? _value.packagingInfo
          : packagingInfo // ignore: cast_nullable_to_non_nullable
              as CustomerPackagingInfoModel,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CustomerStatsModel,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<CustomerContactModel>?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as CustomerSettingsModel?,
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

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCreditInfoModelCopyWith<$Res> get creditInfo {
    return $CustomerCreditInfoModelCopyWith<$Res>(_value.creditInfo, (value) {
      return _then(_value.copyWith(creditInfo: value) as $Val);
    });
  }

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerPackagingInfoModelCopyWith<$Res> get packagingInfo {
    return $CustomerPackagingInfoModelCopyWith<$Res>(_value.packagingInfo,
        (value) {
      return _then(_value.copyWith(packagingInfo: value) as $Val);
    });
  }

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerStatsModelCopyWith<$Res> get stats {
    return $CustomerStatsModelCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerSettingsModelCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $CustomerSettingsModelCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerAccountModelImplCopyWith<$Res>
    implements $CustomerAccountModelCopyWith<$Res> {
  factory _$$CustomerAccountModelImplCopyWith(_$CustomerAccountModelImpl value,
          $Res Function(_$CustomerAccountModelImpl) then) =
      __$$CustomerAccountModelImplCopyWithImpl<$Res>;
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
      CustomerCreditInfoModel creditInfo,
      CustomerPackagingInfoModel packagingInfo,
      CustomerStatsModel stats,
      List<CustomerContactModel>? contacts,
      CustomerSettingsModel? settings,
      bool isActive,
      DateTime? lastOrderDate,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $CustomerCreditInfoModelCopyWith<$Res> get creditInfo;
  @override
  $CustomerPackagingInfoModelCopyWith<$Res> get packagingInfo;
  @override
  $CustomerStatsModelCopyWith<$Res> get stats;
  @override
  $CustomerSettingsModelCopyWith<$Res>? get settings;
}

/// @nodoc
class __$$CustomerAccountModelImplCopyWithImpl<$Res>
    extends _$CustomerAccountModelCopyWithImpl<$Res, _$CustomerAccountModelImpl>
    implements _$$CustomerAccountModelImplCopyWith<$Res> {
  __$$CustomerAccountModelImplCopyWithImpl(_$CustomerAccountModelImpl _value,
      $Res Function(_$CustomerAccountModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerAccountModel
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
    return _then(_$CustomerAccountModelImpl(
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
              as CustomerCreditInfoModel,
      packagingInfo: null == packagingInfo
          ? _value.packagingInfo
          : packagingInfo // ignore: cast_nullable_to_non_nullable
              as CustomerPackagingInfoModel,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CustomerStatsModel,
      contacts: freezed == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<CustomerContactModel>?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as CustomerSettingsModel?,
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
class _$CustomerAccountModelImpl implements _CustomerAccountModel {
  const _$CustomerAccountModelImpl(
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
      final List<CustomerContactModel>? contacts,
      this.settings,
      this.isActive = true,
      this.lastOrderDate,
      this.createdAt,
      this.updatedAt})
      : _contacts = contacts;

  factory _$CustomerAccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerAccountModelImplFromJson(json);

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
  final CustomerCreditInfoModel creditInfo;
  @override
  final CustomerPackagingInfoModel packagingInfo;
  @override
  final CustomerStatsModel stats;
  final List<CustomerContactModel>? _contacts;
  @override
  List<CustomerContactModel>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CustomerSettingsModel? settings;
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
    return 'CustomerAccountModel(id: $id, organizationId: $organizationId, organizationName: $organizationName, name: $name, email: $email, phone: $phone, address: $address, latitude: $latitude, longitude: $longitude, creditInfo: $creditInfo, packagingInfo: $packagingInfo, stats: $stats, contacts: $contacts, settings: $settings, isActive: $isActive, lastOrderDate: $lastOrderDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerAccountModelImpl &&
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

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerAccountModelImplCopyWith<_$CustomerAccountModelImpl>
      get copyWith =>
          __$$CustomerAccountModelImplCopyWithImpl<_$CustomerAccountModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerAccountModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerAccountModel implements CustomerAccountModel {
  const factory _CustomerAccountModel(
      {required final String id,
      required final String organizationId,
      required final String organizationName,
      required final String name,
      required final String email,
      final String? phone,
      final String? address,
      final double? latitude,
      final double? longitude,
      required final CustomerCreditInfoModel creditInfo,
      required final CustomerPackagingInfoModel packagingInfo,
      required final CustomerStatsModel stats,
      final List<CustomerContactModel>? contacts,
      final CustomerSettingsModel? settings,
      final bool isActive,
      final DateTime? lastOrderDate,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CustomerAccountModelImpl;

  factory _CustomerAccountModel.fromJson(Map<String, dynamic> json) =
      _$CustomerAccountModelImpl.fromJson;

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
  CustomerCreditInfoModel get creditInfo;
  @override
  CustomerPackagingInfoModel get packagingInfo;
  @override
  CustomerStatsModel get stats;
  @override
  List<CustomerContactModel>? get contacts;
  @override
  CustomerSettingsModel? get settings;
  @override
  bool get isActive;
  @override
  DateTime? get lastOrderDate;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerAccountModelImplCopyWith<_$CustomerAccountModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomerCreditInfoModel _$CustomerCreditInfoModelFromJson(
    Map<String, dynamic> json) {
  return _CustomerCreditInfoModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerCreditInfoModel {
  double get creditLimit => throw _privateConstructorUsedError;
  double get currentBalance => throw _privateConstructorUsedError;
  double get availableCredit => throw _privateConstructorUsedError;
  int get daysOverdue => throw _privateConstructorUsedError;
  DateTime? get lastPaymentDate => throw _privateConstructorUsedError;
  double get lastPaymentAmount => throw _privateConstructorUsedError;
  bool get isCreditBlocked => throw _privateConstructorUsedError;
  String? get blockReason => throw _privateConstructorUsedError;

  /// Serializes this CustomerCreditInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerCreditInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerCreditInfoModelCopyWith<CustomerCreditInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCreditInfoModelCopyWith<$Res> {
  factory $CustomerCreditInfoModelCopyWith(CustomerCreditInfoModel value,
          $Res Function(CustomerCreditInfoModel) then) =
      _$CustomerCreditInfoModelCopyWithImpl<$Res, CustomerCreditInfoModel>;
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
class _$CustomerCreditInfoModelCopyWithImpl<$Res,
        $Val extends CustomerCreditInfoModel>
    implements $CustomerCreditInfoModelCopyWith<$Res> {
  _$CustomerCreditInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerCreditInfoModel
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
abstract class _$$CustomerCreditInfoModelImplCopyWith<$Res>
    implements $CustomerCreditInfoModelCopyWith<$Res> {
  factory _$$CustomerCreditInfoModelImplCopyWith(
          _$CustomerCreditInfoModelImpl value,
          $Res Function(_$CustomerCreditInfoModelImpl) then) =
      __$$CustomerCreditInfoModelImplCopyWithImpl<$Res>;
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
class __$$CustomerCreditInfoModelImplCopyWithImpl<$Res>
    extends _$CustomerCreditInfoModelCopyWithImpl<$Res,
        _$CustomerCreditInfoModelImpl>
    implements _$$CustomerCreditInfoModelImplCopyWith<$Res> {
  __$$CustomerCreditInfoModelImplCopyWithImpl(
      _$CustomerCreditInfoModelImpl _value,
      $Res Function(_$CustomerCreditInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerCreditInfoModel
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
    return _then(_$CustomerCreditInfoModelImpl(
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
class _$CustomerCreditInfoModelImpl implements _CustomerCreditInfoModel {
  const _$CustomerCreditInfoModelImpl(
      {required this.creditLimit,
      required this.currentBalance,
      required this.availableCredit,
      required this.daysOverdue,
      this.lastPaymentDate,
      required this.lastPaymentAmount,
      this.isCreditBlocked = false,
      this.blockReason});

  factory _$CustomerCreditInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerCreditInfoModelImplFromJson(json);

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
    return 'CustomerCreditInfoModel(creditLimit: $creditLimit, currentBalance: $currentBalance, availableCredit: $availableCredit, daysOverdue: $daysOverdue, lastPaymentDate: $lastPaymentDate, lastPaymentAmount: $lastPaymentAmount, isCreditBlocked: $isCreditBlocked, blockReason: $blockReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerCreditInfoModelImpl &&
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

  /// Create a copy of CustomerCreditInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerCreditInfoModelImplCopyWith<_$CustomerCreditInfoModelImpl>
      get copyWith => __$$CustomerCreditInfoModelImplCopyWithImpl<
          _$CustomerCreditInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerCreditInfoModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerCreditInfoModel implements CustomerCreditInfoModel {
  const factory _CustomerCreditInfoModel(
      {required final double creditLimit,
      required final double currentBalance,
      required final double availableCredit,
      required final int daysOverdue,
      final DateTime? lastPaymentDate,
      required final double lastPaymentAmount,
      final bool isCreditBlocked,
      final String? blockReason}) = _$CustomerCreditInfoModelImpl;

  factory _CustomerCreditInfoModel.fromJson(Map<String, dynamic> json) =
      _$CustomerCreditInfoModelImpl.fromJson;

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

  /// Create a copy of CustomerCreditInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerCreditInfoModelImplCopyWith<_$CustomerCreditInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomerPackagingInfoModel _$CustomerPackagingInfoModelFromJson(
    Map<String, dynamic> json) {
  return _CustomerPackagingInfoModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerPackagingInfoModel {
  double get totalValue => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  List<CustomerPackagingItemModel> get items =>
      throw _privateConstructorUsedError;
  DateTime? get lastTransactionDate => throw _privateConstructorUsedError;

  /// Serializes this CustomerPackagingInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerPackagingInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerPackagingInfoModelCopyWith<CustomerPackagingInfoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPackagingInfoModelCopyWith<$Res> {
  factory $CustomerPackagingInfoModelCopyWith(CustomerPackagingInfoModel value,
          $Res Function(CustomerPackagingInfoModel) then) =
      _$CustomerPackagingInfoModelCopyWithImpl<$Res,
          CustomerPackagingInfoModel>;
  @useResult
  $Res call(
      {double totalValue,
      int totalQuantity,
      List<CustomerPackagingItemModel> items,
      DateTime? lastTransactionDate});
}

/// @nodoc
class _$CustomerPackagingInfoModelCopyWithImpl<$Res,
        $Val extends CustomerPackagingInfoModel>
    implements $CustomerPackagingInfoModelCopyWith<$Res> {
  _$CustomerPackagingInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerPackagingInfoModel
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
              as List<CustomerPackagingItemModel>,
      lastTransactionDate: freezed == lastTransactionDate
          ? _value.lastTransactionDate
          : lastTransactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerPackagingInfoModelImplCopyWith<$Res>
    implements $CustomerPackagingInfoModelCopyWith<$Res> {
  factory _$$CustomerPackagingInfoModelImplCopyWith(
          _$CustomerPackagingInfoModelImpl value,
          $Res Function(_$CustomerPackagingInfoModelImpl) then) =
      __$$CustomerPackagingInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalValue,
      int totalQuantity,
      List<CustomerPackagingItemModel> items,
      DateTime? lastTransactionDate});
}

/// @nodoc
class __$$CustomerPackagingInfoModelImplCopyWithImpl<$Res>
    extends _$CustomerPackagingInfoModelCopyWithImpl<$Res,
        _$CustomerPackagingInfoModelImpl>
    implements _$$CustomerPackagingInfoModelImplCopyWith<$Res> {
  __$$CustomerPackagingInfoModelImplCopyWithImpl(
      _$CustomerPackagingInfoModelImpl _value,
      $Res Function(_$CustomerPackagingInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerPackagingInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalValue = null,
    Object? totalQuantity = null,
    Object? items = null,
    Object? lastTransactionDate = freezed,
  }) {
    return _then(_$CustomerPackagingInfoModelImpl(
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
              as List<CustomerPackagingItemModel>,
      lastTransactionDate: freezed == lastTransactionDate
          ? _value.lastTransactionDate
          : lastTransactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerPackagingInfoModelImpl implements _CustomerPackagingInfoModel {
  const _$CustomerPackagingInfoModelImpl(
      {required this.totalValue,
      required this.totalQuantity,
      required final List<CustomerPackagingItemModel> items,
      this.lastTransactionDate})
      : _items = items;

  factory _$CustomerPackagingInfoModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CustomerPackagingInfoModelImplFromJson(json);

  @override
  final double totalValue;
  @override
  final int totalQuantity;
  final List<CustomerPackagingItemModel> _items;
  @override
  List<CustomerPackagingItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime? lastTransactionDate;

  @override
  String toString() {
    return 'CustomerPackagingInfoModel(totalValue: $totalValue, totalQuantity: $totalQuantity, items: $items, lastTransactionDate: $lastTransactionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerPackagingInfoModelImpl &&
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

  /// Create a copy of CustomerPackagingInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerPackagingInfoModelImplCopyWith<_$CustomerPackagingInfoModelImpl>
      get copyWith => __$$CustomerPackagingInfoModelImplCopyWithImpl<
          _$CustomerPackagingInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerPackagingInfoModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerPackagingInfoModel
    implements CustomerPackagingInfoModel {
  const factory _CustomerPackagingInfoModel(
      {required final double totalValue,
      required final int totalQuantity,
      required final List<CustomerPackagingItemModel> items,
      final DateTime? lastTransactionDate}) = _$CustomerPackagingInfoModelImpl;

  factory _CustomerPackagingInfoModel.fromJson(Map<String, dynamic> json) =
      _$CustomerPackagingInfoModelImpl.fromJson;

  @override
  double get totalValue;
  @override
  int get totalQuantity;
  @override
  List<CustomerPackagingItemModel> get items;
  @override
  DateTime? get lastTransactionDate;

  /// Create a copy of CustomerPackagingInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerPackagingInfoModelImplCopyWith<_$CustomerPackagingInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomerPackagingItemModel _$CustomerPackagingItemModelFromJson(
    Map<String, dynamic> json) {
  return _CustomerPackagingItemModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerPackagingItemModel {
  String get packagingId => throw _privateConstructorUsedError;
  String get packagingName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitValue => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;

  /// Serializes this CustomerPackagingItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerPackagingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerPackagingItemModelCopyWith<CustomerPackagingItemModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPackagingItemModelCopyWith<$Res> {
  factory $CustomerPackagingItemModelCopyWith(CustomerPackagingItemModel value,
          $Res Function(CustomerPackagingItemModel) then) =
      _$CustomerPackagingItemModelCopyWithImpl<$Res,
          CustomerPackagingItemModel>;
  @useResult
  $Res call(
      {String packagingId,
      String packagingName,
      int quantity,
      double unitValue,
      double totalValue});
}

/// @nodoc
class _$CustomerPackagingItemModelCopyWithImpl<$Res,
        $Val extends CustomerPackagingItemModel>
    implements $CustomerPackagingItemModelCopyWith<$Res> {
  _$CustomerPackagingItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerPackagingItemModel
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
abstract class _$$CustomerPackagingItemModelImplCopyWith<$Res>
    implements $CustomerPackagingItemModelCopyWith<$Res> {
  factory _$$CustomerPackagingItemModelImplCopyWith(
          _$CustomerPackagingItemModelImpl value,
          $Res Function(_$CustomerPackagingItemModelImpl) then) =
      __$$CustomerPackagingItemModelImplCopyWithImpl<$Res>;
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
class __$$CustomerPackagingItemModelImplCopyWithImpl<$Res>
    extends _$CustomerPackagingItemModelCopyWithImpl<$Res,
        _$CustomerPackagingItemModelImpl>
    implements _$$CustomerPackagingItemModelImplCopyWith<$Res> {
  __$$CustomerPackagingItemModelImplCopyWithImpl(
      _$CustomerPackagingItemModelImpl _value,
      $Res Function(_$CustomerPackagingItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerPackagingItemModel
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
    return _then(_$CustomerPackagingItemModelImpl(
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
class _$CustomerPackagingItemModelImpl implements _CustomerPackagingItemModel {
  const _$CustomerPackagingItemModelImpl(
      {required this.packagingId,
      required this.packagingName,
      required this.quantity,
      required this.unitValue,
      required this.totalValue});

  factory _$CustomerPackagingItemModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CustomerPackagingItemModelImplFromJson(json);

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
    return 'CustomerPackagingItemModel(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, totalValue: $totalValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerPackagingItemModelImpl &&
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

  /// Create a copy of CustomerPackagingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerPackagingItemModelImplCopyWith<_$CustomerPackagingItemModelImpl>
      get copyWith => __$$CustomerPackagingItemModelImplCopyWithImpl<
          _$CustomerPackagingItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerPackagingItemModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerPackagingItemModel
    implements CustomerPackagingItemModel {
  const factory _CustomerPackagingItemModel(
      {required final String packagingId,
      required final String packagingName,
      required final int quantity,
      required final double unitValue,
      required final double totalValue}) = _$CustomerPackagingItemModelImpl;

  factory _CustomerPackagingItemModel.fromJson(Map<String, dynamic> json) =
      _$CustomerPackagingItemModelImpl.fromJson;

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

  /// Create a copy of CustomerPackagingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerPackagingItemModelImplCopyWith<_$CustomerPackagingItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomerStatsModel _$CustomerStatsModelFromJson(Map<String, dynamic> json) {
  return _CustomerStatsModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerStatsModel {
  int get totalOrders => throw _privateConstructorUsedError;
  int get completedOrders => throw _privateConstructorUsedError;
  int get cancelledOrders => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;
  int get daysAsCustomer => throw _privateConstructorUsedError;
  double? get averageRating => throw _privateConstructorUsedError;

  /// Serializes this CustomerStatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerStatsModelCopyWith<CustomerStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerStatsModelCopyWith<$Res> {
  factory $CustomerStatsModelCopyWith(
          CustomerStatsModel value, $Res Function(CustomerStatsModel) then) =
      _$CustomerStatsModelCopyWithImpl<$Res, CustomerStatsModel>;
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
class _$CustomerStatsModelCopyWithImpl<$Res, $Val extends CustomerStatsModel>
    implements $CustomerStatsModelCopyWith<$Res> {
  _$CustomerStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerStatsModel
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
abstract class _$$CustomerStatsModelImplCopyWith<$Res>
    implements $CustomerStatsModelCopyWith<$Res> {
  factory _$$CustomerStatsModelImplCopyWith(_$CustomerStatsModelImpl value,
          $Res Function(_$CustomerStatsModelImpl) then) =
      __$$CustomerStatsModelImplCopyWithImpl<$Res>;
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
class __$$CustomerStatsModelImplCopyWithImpl<$Res>
    extends _$CustomerStatsModelCopyWithImpl<$Res, _$CustomerStatsModelImpl>
    implements _$$CustomerStatsModelImplCopyWith<$Res> {
  __$$CustomerStatsModelImplCopyWithImpl(_$CustomerStatsModelImpl _value,
      $Res Function(_$CustomerStatsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerStatsModel
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
    return _then(_$CustomerStatsModelImpl(
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
class _$CustomerStatsModelImpl implements _CustomerStatsModel {
  const _$CustomerStatsModelImpl(
      {required this.totalOrders,
      required this.completedOrders,
      required this.cancelledOrders,
      required this.totalSpent,
      required this.averageOrderValue,
      required this.daysAsCustomer,
      this.averageRating});

  factory _$CustomerStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerStatsModelImplFromJson(json);

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
    return 'CustomerStatsModel(totalOrders: $totalOrders, completedOrders: $completedOrders, cancelledOrders: $cancelledOrders, totalSpent: $totalSpent, averageOrderValue: $averageOrderValue, daysAsCustomer: $daysAsCustomer, averageRating: $averageRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerStatsModelImpl &&
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

  /// Create a copy of CustomerStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerStatsModelImplCopyWith<_$CustomerStatsModelImpl> get copyWith =>
      __$$CustomerStatsModelImplCopyWithImpl<_$CustomerStatsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerStatsModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerStatsModel implements CustomerStatsModel {
  const factory _CustomerStatsModel(
      {required final int totalOrders,
      required final int completedOrders,
      required final int cancelledOrders,
      required final double totalSpent,
      required final double averageOrderValue,
      required final int daysAsCustomer,
      final double? averageRating}) = _$CustomerStatsModelImpl;

  factory _CustomerStatsModel.fromJson(Map<String, dynamic> json) =
      _$CustomerStatsModelImpl.fromJson;

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

  /// Create a copy of CustomerStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerStatsModelImplCopyWith<_$CustomerStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerContactModel _$CustomerContactModelFromJson(Map<String, dynamic> json) {
  return _CustomerContactModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerContactModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  bool get isPrimary => throw _privateConstructorUsedError;

  /// Serializes this CustomerContactModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerContactModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerContactModelCopyWith<CustomerContactModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerContactModelCopyWith<$Res> {
  factory $CustomerContactModelCopyWith(CustomerContactModel value,
          $Res Function(CustomerContactModel) then) =
      _$CustomerContactModelCopyWithImpl<$Res, CustomerContactModel>;
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
class _$CustomerContactModelCopyWithImpl<$Res,
        $Val extends CustomerContactModel>
    implements $CustomerContactModelCopyWith<$Res> {
  _$CustomerContactModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerContactModel
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
abstract class _$$CustomerContactModelImplCopyWith<$Res>
    implements $CustomerContactModelCopyWith<$Res> {
  factory _$$CustomerContactModelImplCopyWith(_$CustomerContactModelImpl value,
          $Res Function(_$CustomerContactModelImpl) then) =
      __$$CustomerContactModelImplCopyWithImpl<$Res>;
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
class __$$CustomerContactModelImplCopyWithImpl<$Res>
    extends _$CustomerContactModelCopyWithImpl<$Res, _$CustomerContactModelImpl>
    implements _$$CustomerContactModelImplCopyWith<$Res> {
  __$$CustomerContactModelImplCopyWithImpl(_$CustomerContactModelImpl _value,
      $Res Function(_$CustomerContactModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerContactModel
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
    return _then(_$CustomerContactModelImpl(
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
class _$CustomerContactModelImpl implements _CustomerContactModel {
  const _$CustomerContactModelImpl(
      {required this.id,
      required this.name,
      required this.role,
      this.phone,
      this.email,
      this.isPrimary = true});

  factory _$CustomerContactModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerContactModelImplFromJson(json);

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
    return 'CustomerContactModel(id: $id, name: $name, role: $role, phone: $phone, email: $email, isPrimary: $isPrimary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerContactModelImpl &&
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

  /// Create a copy of CustomerContactModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerContactModelImplCopyWith<_$CustomerContactModelImpl>
      get copyWith =>
          __$$CustomerContactModelImplCopyWithImpl<_$CustomerContactModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerContactModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerContactModel implements CustomerContactModel {
  const factory _CustomerContactModel(
      {required final String id,
      required final String name,
      required final String role,
      final String? phone,
      final String? email,
      final bool isPrimary}) = _$CustomerContactModelImpl;

  factory _CustomerContactModel.fromJson(Map<String, dynamic> json) =
      _$CustomerContactModelImpl.fromJson;

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

  /// Create a copy of CustomerContactModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerContactModelImplCopyWith<_$CustomerContactModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomerSettingsModel _$CustomerSettingsModelFromJson(
    Map<String, dynamic> json) {
  return _CustomerSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerSettingsModel {
  bool get emailNotifications => throw _privateConstructorUsedError;
  bool get smsNotifications => throw _privateConstructorUsedError;
  bool get pushNotifications => throw _privateConstructorUsedError;
  bool get orderConfirmations => throw _privateConstructorUsedError;
  bool get deliveryUpdates => throw _privateConstructorUsedError;
  bool get paymentReminders => throw _privateConstructorUsedError;
  bool get promotionalOffers => throw _privateConstructorUsedError;
  String? get preferredLanguage => throw _privateConstructorUsedError;
  String? get preferredCurrency => throw _privateConstructorUsedError;

  /// Serializes this CustomerSettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerSettingsModelCopyWith<CustomerSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerSettingsModelCopyWith<$Res> {
  factory $CustomerSettingsModelCopyWith(CustomerSettingsModel value,
          $Res Function(CustomerSettingsModel) then) =
      _$CustomerSettingsModelCopyWithImpl<$Res, CustomerSettingsModel>;
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
class _$CustomerSettingsModelCopyWithImpl<$Res,
        $Val extends CustomerSettingsModel>
    implements $CustomerSettingsModelCopyWith<$Res> {
  _$CustomerSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerSettingsModel
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
abstract class _$$CustomerSettingsModelImplCopyWith<$Res>
    implements $CustomerSettingsModelCopyWith<$Res> {
  factory _$$CustomerSettingsModelImplCopyWith(
          _$CustomerSettingsModelImpl value,
          $Res Function(_$CustomerSettingsModelImpl) then) =
      __$$CustomerSettingsModelImplCopyWithImpl<$Res>;
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
class __$$CustomerSettingsModelImplCopyWithImpl<$Res>
    extends _$CustomerSettingsModelCopyWithImpl<$Res,
        _$CustomerSettingsModelImpl>
    implements _$$CustomerSettingsModelImplCopyWith<$Res> {
  __$$CustomerSettingsModelImplCopyWithImpl(_$CustomerSettingsModelImpl _value,
      $Res Function(_$CustomerSettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerSettingsModel
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
    return _then(_$CustomerSettingsModelImpl(
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
class _$CustomerSettingsModelImpl implements _CustomerSettingsModel {
  const _$CustomerSettingsModelImpl(
      {this.emailNotifications = true,
      this.smsNotifications = true,
      this.pushNotifications = true,
      this.orderConfirmations = true,
      this.deliveryUpdates = true,
      this.paymentReminders = true,
      this.promotionalOffers = true,
      this.preferredLanguage,
      this.preferredCurrency});

  factory _$CustomerSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerSettingsModelImplFromJson(json);

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
    return 'CustomerSettingsModel(emailNotifications: $emailNotifications, smsNotifications: $smsNotifications, pushNotifications: $pushNotifications, orderConfirmations: $orderConfirmations, deliveryUpdates: $deliveryUpdates, paymentReminders: $paymentReminders, promotionalOffers: $promotionalOffers, preferredLanguage: $preferredLanguage, preferredCurrency: $preferredCurrency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSettingsModelImpl &&
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

  /// Create a copy of CustomerSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSettingsModelImplCopyWith<_$CustomerSettingsModelImpl>
      get copyWith => __$$CustomerSettingsModelImplCopyWithImpl<
          _$CustomerSettingsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerSettingsModel implements CustomerSettingsModel {
  const factory _CustomerSettingsModel(
      {final bool emailNotifications,
      final bool smsNotifications,
      final bool pushNotifications,
      final bool orderConfirmations,
      final bool deliveryUpdates,
      final bool paymentReminders,
      final bool promotionalOffers,
      final String? preferredLanguage,
      final String? preferredCurrency}) = _$CustomerSettingsModelImpl;

  factory _CustomerSettingsModel.fromJson(Map<String, dynamic> json) =
      _$CustomerSettingsModelImpl.fromJson;

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

  /// Create a copy of CustomerSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerSettingsModelImplCopyWith<_$CustomerSettingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
