// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerAccountModel {
  String get id;
  String get organizationId;
  String get organizationName;
  String get name;
  String get email;
  String? get phone;
  String? get address;
  double? get latitude;
  double? get longitude;
  CustomerCreditInfoModel get creditInfo;
  CustomerPackagingInfoModel get packagingInfo;
  CustomerStatsModel get stats;
  List<CustomerContactModel>? get contacts;
  CustomerSettingsModel? get settings;
  bool get isActive;
  DateTime? get lastOrderDate;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerAccountModelCopyWith<CustomerAccountModel> get copyWith =>
      _$CustomerAccountModelCopyWithImpl<CustomerAccountModel>(
          this as CustomerAccountModel, _$identity);

  /// Serializes this CustomerAccountModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerAccountModel &&
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
    return 'CustomerAccountModel(id: $id, organizationId: $organizationId, organizationName: $organizationName, name: $name, email: $email, phone: $phone, address: $address, latitude: $latitude, longitude: $longitude, creditInfo: $creditInfo, packagingInfo: $packagingInfo, stats: $stats, contacts: $contacts, settings: $settings, isActive: $isActive, lastOrderDate: $lastOrderDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $CustomerAccountModelCopyWith<$Res> {
  factory $CustomerAccountModelCopyWith(CustomerAccountModel value,
          $Res Function(CustomerAccountModel) _then) =
      _$CustomerAccountModelCopyWithImpl;
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
class _$CustomerAccountModelCopyWithImpl<$Res>
    implements $CustomerAccountModelCopyWith<$Res> {
  _$CustomerAccountModelCopyWithImpl(this._self, this._then);

  final CustomerAccountModel _self;
  final $Res Function(CustomerAccountModel) _then;

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
              as CustomerCreditInfoModel,
      packagingInfo: null == packagingInfo
          ? _self.packagingInfo
          : packagingInfo // ignore: cast_nullable_to_non_nullable
              as CustomerPackagingInfoModel,
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CustomerStatsModel,
      contacts: freezed == contacts
          ? _self.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<CustomerContactModel>?,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as CustomerSettingsModel?,
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

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCreditInfoModelCopyWith<$Res> get creditInfo {
    return $CustomerCreditInfoModelCopyWith<$Res>(_self.creditInfo, (value) {
      return _then(_self.copyWith(creditInfo: value));
    });
  }

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerPackagingInfoModelCopyWith<$Res> get packagingInfo {
    return $CustomerPackagingInfoModelCopyWith<$Res>(_self.packagingInfo,
        (value) {
      return _then(_self.copyWith(packagingInfo: value));
    });
  }

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerStatsModelCopyWith<$Res> get stats {
    return $CustomerStatsModelCopyWith<$Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerSettingsModelCopyWith<$Res>? get settings {
    if (_self.settings == null) {
      return null;
    }

    return $CustomerSettingsModelCopyWith<$Res>(_self.settings!, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CustomerAccountModel].
extension CustomerAccountModelPatterns on CustomerAccountModel {
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
    TResult Function(_CustomerAccountModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerAccountModel() when $default != null:
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
    TResult Function(_CustomerAccountModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerAccountModel():
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
    TResult? Function(_CustomerAccountModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerAccountModel() when $default != null:
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
            CustomerCreditInfoModel creditInfo,
            CustomerPackagingInfoModel packagingInfo,
            CustomerStatsModel stats,
            List<CustomerContactModel>? contacts,
            CustomerSettingsModel? settings,
            bool isActive,
            DateTime? lastOrderDate,
            DateTime? createdAt,
            DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerAccountModel() when $default != null:
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
            CustomerCreditInfoModel creditInfo,
            CustomerPackagingInfoModel packagingInfo,
            CustomerStatsModel stats,
            List<CustomerContactModel>? contacts,
            CustomerSettingsModel? settings,
            bool isActive,
            DateTime? lastOrderDate,
            DateTime? createdAt,
            DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerAccountModel():
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
            CustomerCreditInfoModel creditInfo,
            CustomerPackagingInfoModel packagingInfo,
            CustomerStatsModel stats,
            List<CustomerContactModel>? contacts,
            CustomerSettingsModel? settings,
            bool isActive,
            DateTime? lastOrderDate,
            DateTime? createdAt,
            DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerAccountModel() when $default != null:
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
class _CustomerAccountModel implements CustomerAccountModel {
  const _CustomerAccountModel(
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
  factory _CustomerAccountModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerAccountModelFromJson(json);

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

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerAccountModelCopyWith<_CustomerAccountModel> get copyWith =>
      __$CustomerAccountModelCopyWithImpl<_CustomerAccountModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerAccountModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerAccountModel &&
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
    return 'CustomerAccountModel(id: $id, organizationId: $organizationId, organizationName: $organizationName, name: $name, email: $email, phone: $phone, address: $address, latitude: $latitude, longitude: $longitude, creditInfo: $creditInfo, packagingInfo: $packagingInfo, stats: $stats, contacts: $contacts, settings: $settings, isActive: $isActive, lastOrderDate: $lastOrderDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$CustomerAccountModelCopyWith<$Res>
    implements $CustomerAccountModelCopyWith<$Res> {
  factory _$CustomerAccountModelCopyWith(_CustomerAccountModel value,
          $Res Function(_CustomerAccountModel) _then) =
      __$CustomerAccountModelCopyWithImpl;
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
class __$CustomerAccountModelCopyWithImpl<$Res>
    implements _$CustomerAccountModelCopyWith<$Res> {
  __$CustomerAccountModelCopyWithImpl(this._self, this._then);

  final _CustomerAccountModel _self;
  final $Res Function(_CustomerAccountModel) _then;

  /// Create a copy of CustomerAccountModel
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
    return _then(_CustomerAccountModel(
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
              as CustomerCreditInfoModel,
      packagingInfo: null == packagingInfo
          ? _self.packagingInfo
          : packagingInfo // ignore: cast_nullable_to_non_nullable
              as CustomerPackagingInfoModel,
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CustomerStatsModel,
      contacts: freezed == contacts
          ? _self._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<CustomerContactModel>?,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as CustomerSettingsModel?,
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

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCreditInfoModelCopyWith<$Res> get creditInfo {
    return $CustomerCreditInfoModelCopyWith<$Res>(_self.creditInfo, (value) {
      return _then(_self.copyWith(creditInfo: value));
    });
  }

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerPackagingInfoModelCopyWith<$Res> get packagingInfo {
    return $CustomerPackagingInfoModelCopyWith<$Res>(_self.packagingInfo,
        (value) {
      return _then(_self.copyWith(packagingInfo: value));
    });
  }

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerStatsModelCopyWith<$Res> get stats {
    return $CustomerStatsModelCopyWith<$Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }

  /// Create a copy of CustomerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerSettingsModelCopyWith<$Res>? get settings {
    if (_self.settings == null) {
      return null;
    }

    return $CustomerSettingsModelCopyWith<$Res>(_self.settings!, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

/// @nodoc
mixin _$CustomerCreditInfoModel {
  double get creditLimit;
  double get currentBalance;
  double get availableCredit;
  int get daysOverdue;
  DateTime? get lastPaymentDate;
  double get lastPaymentAmount;
  bool get isCreditBlocked;
  String? get blockReason;

  /// Create a copy of CustomerCreditInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerCreditInfoModelCopyWith<CustomerCreditInfoModel> get copyWith =>
      _$CustomerCreditInfoModelCopyWithImpl<CustomerCreditInfoModel>(
          this as CustomerCreditInfoModel, _$identity);

  /// Serializes this CustomerCreditInfoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerCreditInfoModel &&
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
    return 'CustomerCreditInfoModel(creditLimit: $creditLimit, currentBalance: $currentBalance, availableCredit: $availableCredit, daysOverdue: $daysOverdue, lastPaymentDate: $lastPaymentDate, lastPaymentAmount: $lastPaymentAmount, isCreditBlocked: $isCreditBlocked, blockReason: $blockReason)';
  }
}

/// @nodoc
abstract mixin class $CustomerCreditInfoModelCopyWith<$Res> {
  factory $CustomerCreditInfoModelCopyWith(CustomerCreditInfoModel value,
          $Res Function(CustomerCreditInfoModel) _then) =
      _$CustomerCreditInfoModelCopyWithImpl;
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
class _$CustomerCreditInfoModelCopyWithImpl<$Res>
    implements $CustomerCreditInfoModelCopyWith<$Res> {
  _$CustomerCreditInfoModelCopyWithImpl(this._self, this._then);

  final CustomerCreditInfoModel _self;
  final $Res Function(CustomerCreditInfoModel) _then;

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

/// Adds pattern-matching-related methods to [CustomerCreditInfoModel].
extension CustomerCreditInfoModelPatterns on CustomerCreditInfoModel {
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
    TResult Function(_CustomerCreditInfoModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerCreditInfoModel() when $default != null:
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
    TResult Function(_CustomerCreditInfoModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerCreditInfoModel():
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
    TResult? Function(_CustomerCreditInfoModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerCreditInfoModel() when $default != null:
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
      case _CustomerCreditInfoModel() when $default != null:
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
      case _CustomerCreditInfoModel():
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
      case _CustomerCreditInfoModel() when $default != null:
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
class _CustomerCreditInfoModel implements CustomerCreditInfoModel {
  const _CustomerCreditInfoModel(
      {required this.creditLimit,
      required this.currentBalance,
      required this.availableCredit,
      required this.daysOverdue,
      this.lastPaymentDate,
      required this.lastPaymentAmount,
      this.isCreditBlocked = false,
      this.blockReason});
  factory _CustomerCreditInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreditInfoModelFromJson(json);

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

  /// Create a copy of CustomerCreditInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerCreditInfoModelCopyWith<_CustomerCreditInfoModel> get copyWith =>
      __$CustomerCreditInfoModelCopyWithImpl<_CustomerCreditInfoModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerCreditInfoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerCreditInfoModel &&
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
    return 'CustomerCreditInfoModel(creditLimit: $creditLimit, currentBalance: $currentBalance, availableCredit: $availableCredit, daysOverdue: $daysOverdue, lastPaymentDate: $lastPaymentDate, lastPaymentAmount: $lastPaymentAmount, isCreditBlocked: $isCreditBlocked, blockReason: $blockReason)';
  }
}

/// @nodoc
abstract mixin class _$CustomerCreditInfoModelCopyWith<$Res>
    implements $CustomerCreditInfoModelCopyWith<$Res> {
  factory _$CustomerCreditInfoModelCopyWith(_CustomerCreditInfoModel value,
          $Res Function(_CustomerCreditInfoModel) _then) =
      __$CustomerCreditInfoModelCopyWithImpl;
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
class __$CustomerCreditInfoModelCopyWithImpl<$Res>
    implements _$CustomerCreditInfoModelCopyWith<$Res> {
  __$CustomerCreditInfoModelCopyWithImpl(this._self, this._then);

  final _CustomerCreditInfoModel _self;
  final $Res Function(_CustomerCreditInfoModel) _then;

  /// Create a copy of CustomerCreditInfoModel
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
    return _then(_CustomerCreditInfoModel(
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
mixin _$CustomerPackagingInfoModel {
  double get totalValue;
  int get totalQuantity;
  List<CustomerPackagingItemModel> get items;
  DateTime? get lastTransactionDate;

  /// Create a copy of CustomerPackagingInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerPackagingInfoModelCopyWith<CustomerPackagingInfoModel>
      get copyWith =>
          _$CustomerPackagingInfoModelCopyWithImpl<CustomerPackagingInfoModel>(
              this as CustomerPackagingInfoModel, _$identity);

  /// Serializes this CustomerPackagingInfoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerPackagingInfoModel &&
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
    return 'CustomerPackagingInfoModel(totalValue: $totalValue, totalQuantity: $totalQuantity, items: $items, lastTransactionDate: $lastTransactionDate)';
  }
}

/// @nodoc
abstract mixin class $CustomerPackagingInfoModelCopyWith<$Res> {
  factory $CustomerPackagingInfoModelCopyWith(CustomerPackagingInfoModel value,
          $Res Function(CustomerPackagingInfoModel) _then) =
      _$CustomerPackagingInfoModelCopyWithImpl;
  @useResult
  $Res call(
      {double totalValue,
      int totalQuantity,
      List<CustomerPackagingItemModel> items,
      DateTime? lastTransactionDate});
}

/// @nodoc
class _$CustomerPackagingInfoModelCopyWithImpl<$Res>
    implements $CustomerPackagingInfoModelCopyWith<$Res> {
  _$CustomerPackagingInfoModelCopyWithImpl(this._self, this._then);

  final CustomerPackagingInfoModel _self;
  final $Res Function(CustomerPackagingInfoModel) _then;

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
              as List<CustomerPackagingItemModel>,
      lastTransactionDate: freezed == lastTransactionDate
          ? _self.lastTransactionDate
          : lastTransactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerPackagingInfoModel].
extension CustomerPackagingInfoModelPatterns on CustomerPackagingInfoModel {
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
    TResult Function(_CustomerPackagingInfoModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingInfoModel() when $default != null:
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
    TResult Function(_CustomerPackagingInfoModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingInfoModel():
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
    TResult? Function(_CustomerPackagingInfoModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingInfoModel() when $default != null:
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
            double totalValue,
            int totalQuantity,
            List<CustomerPackagingItemModel> items,
            DateTime? lastTransactionDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingInfoModel() when $default != null:
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
    TResult Function(
            double totalValue,
            int totalQuantity,
            List<CustomerPackagingItemModel> items,
            DateTime? lastTransactionDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingInfoModel():
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
    TResult? Function(
            double totalValue,
            int totalQuantity,
            List<CustomerPackagingItemModel> items,
            DateTime? lastTransactionDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingInfoModel() when $default != null:
        return $default(_that.totalValue, _that.totalQuantity, _that.items,
            _that.lastTransactionDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerPackagingInfoModel implements CustomerPackagingInfoModel {
  const _CustomerPackagingInfoModel(
      {required this.totalValue,
      required this.totalQuantity,
      required final List<CustomerPackagingItemModel> items,
      this.lastTransactionDate})
      : _items = items;
  factory _CustomerPackagingInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerPackagingInfoModelFromJson(json);

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

  /// Create a copy of CustomerPackagingInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerPackagingInfoModelCopyWith<_CustomerPackagingInfoModel>
      get copyWith => __$CustomerPackagingInfoModelCopyWithImpl<
          _CustomerPackagingInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerPackagingInfoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerPackagingInfoModel &&
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
    return 'CustomerPackagingInfoModel(totalValue: $totalValue, totalQuantity: $totalQuantity, items: $items, lastTransactionDate: $lastTransactionDate)';
  }
}

/// @nodoc
abstract mixin class _$CustomerPackagingInfoModelCopyWith<$Res>
    implements $CustomerPackagingInfoModelCopyWith<$Res> {
  factory _$CustomerPackagingInfoModelCopyWith(
          _CustomerPackagingInfoModel value,
          $Res Function(_CustomerPackagingInfoModel) _then) =
      __$CustomerPackagingInfoModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double totalValue,
      int totalQuantity,
      List<CustomerPackagingItemModel> items,
      DateTime? lastTransactionDate});
}

/// @nodoc
class __$CustomerPackagingInfoModelCopyWithImpl<$Res>
    implements _$CustomerPackagingInfoModelCopyWith<$Res> {
  __$CustomerPackagingInfoModelCopyWithImpl(this._self, this._then);

  final _CustomerPackagingInfoModel _self;
  final $Res Function(_CustomerPackagingInfoModel) _then;

  /// Create a copy of CustomerPackagingInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalValue = null,
    Object? totalQuantity = null,
    Object? items = null,
    Object? lastTransactionDate = freezed,
  }) {
    return _then(_CustomerPackagingInfoModel(
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
              as List<CustomerPackagingItemModel>,
      lastTransactionDate: freezed == lastTransactionDate
          ? _self.lastTransactionDate
          : lastTransactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$CustomerPackagingItemModel {
  String get packagingId;
  String get packagingName;
  int get quantity;
  double get unitValue;
  double get totalValue;

  /// Create a copy of CustomerPackagingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerPackagingItemModelCopyWith<CustomerPackagingItemModel>
      get copyWith =>
          _$CustomerPackagingItemModelCopyWithImpl<CustomerPackagingItemModel>(
              this as CustomerPackagingItemModel, _$identity);

  /// Serializes this CustomerPackagingItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerPackagingItemModel &&
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
    return 'CustomerPackagingItemModel(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, totalValue: $totalValue)';
  }
}

/// @nodoc
abstract mixin class $CustomerPackagingItemModelCopyWith<$Res> {
  factory $CustomerPackagingItemModelCopyWith(CustomerPackagingItemModel value,
          $Res Function(CustomerPackagingItemModel) _then) =
      _$CustomerPackagingItemModelCopyWithImpl;
  @useResult
  $Res call(
      {String packagingId,
      String packagingName,
      int quantity,
      double unitValue,
      double totalValue});
}

/// @nodoc
class _$CustomerPackagingItemModelCopyWithImpl<$Res>
    implements $CustomerPackagingItemModelCopyWith<$Res> {
  _$CustomerPackagingItemModelCopyWithImpl(this._self, this._then);

  final CustomerPackagingItemModel _self;
  final $Res Function(CustomerPackagingItemModel) _then;

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

/// Adds pattern-matching-related methods to [CustomerPackagingItemModel].
extension CustomerPackagingItemModelPatterns on CustomerPackagingItemModel {
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
    TResult Function(_CustomerPackagingItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingItemModel() when $default != null:
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
    TResult Function(_CustomerPackagingItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingItemModel():
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
    TResult? Function(_CustomerPackagingItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerPackagingItemModel() when $default != null:
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
      case _CustomerPackagingItemModel() when $default != null:
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
      case _CustomerPackagingItemModel():
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
      case _CustomerPackagingItemModel() when $default != null:
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.unitValue, _that.totalValue);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerPackagingItemModel implements CustomerPackagingItemModel {
  const _CustomerPackagingItemModel(
      {required this.packagingId,
      required this.packagingName,
      required this.quantity,
      required this.unitValue,
      required this.totalValue});
  factory _CustomerPackagingItemModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerPackagingItemModelFromJson(json);

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

  /// Create a copy of CustomerPackagingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerPackagingItemModelCopyWith<_CustomerPackagingItemModel>
      get copyWith => __$CustomerPackagingItemModelCopyWithImpl<
          _CustomerPackagingItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerPackagingItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerPackagingItemModel &&
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
    return 'CustomerPackagingItemModel(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, totalValue: $totalValue)';
  }
}

/// @nodoc
abstract mixin class _$CustomerPackagingItemModelCopyWith<$Res>
    implements $CustomerPackagingItemModelCopyWith<$Res> {
  factory _$CustomerPackagingItemModelCopyWith(
          _CustomerPackagingItemModel value,
          $Res Function(_CustomerPackagingItemModel) _then) =
      __$CustomerPackagingItemModelCopyWithImpl;
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
class __$CustomerPackagingItemModelCopyWithImpl<$Res>
    implements _$CustomerPackagingItemModelCopyWith<$Res> {
  __$CustomerPackagingItemModelCopyWithImpl(this._self, this._then);

  final _CustomerPackagingItemModel _self;
  final $Res Function(_CustomerPackagingItemModel) _then;

  /// Create a copy of CustomerPackagingItemModel
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
    return _then(_CustomerPackagingItemModel(
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
mixin _$CustomerStatsModel {
  int get totalOrders;
  int get completedOrders;
  int get cancelledOrders;
  double get totalSpent;
  double get averageOrderValue;
  int get daysAsCustomer;
  double? get averageRating;

  /// Create a copy of CustomerStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerStatsModelCopyWith<CustomerStatsModel> get copyWith =>
      _$CustomerStatsModelCopyWithImpl<CustomerStatsModel>(
          this as CustomerStatsModel, _$identity);

  /// Serializes this CustomerStatsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerStatsModel &&
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
    return 'CustomerStatsModel(totalOrders: $totalOrders, completedOrders: $completedOrders, cancelledOrders: $cancelledOrders, totalSpent: $totalSpent, averageOrderValue: $averageOrderValue, daysAsCustomer: $daysAsCustomer, averageRating: $averageRating)';
  }
}

/// @nodoc
abstract mixin class $CustomerStatsModelCopyWith<$Res> {
  factory $CustomerStatsModelCopyWith(
          CustomerStatsModel value, $Res Function(CustomerStatsModel) _then) =
      _$CustomerStatsModelCopyWithImpl;
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
class _$CustomerStatsModelCopyWithImpl<$Res>
    implements $CustomerStatsModelCopyWith<$Res> {
  _$CustomerStatsModelCopyWithImpl(this._self, this._then);

  final CustomerStatsModel _self;
  final $Res Function(CustomerStatsModel) _then;

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

/// Adds pattern-matching-related methods to [CustomerStatsModel].
extension CustomerStatsModelPatterns on CustomerStatsModel {
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
    TResult Function(_CustomerStatsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerStatsModel() when $default != null:
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
    TResult Function(_CustomerStatsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerStatsModel():
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
    TResult? Function(_CustomerStatsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerStatsModel() when $default != null:
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
      case _CustomerStatsModel() when $default != null:
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
      case _CustomerStatsModel():
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
      case _CustomerStatsModel() when $default != null:
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
class _CustomerStatsModel implements CustomerStatsModel {
  const _CustomerStatsModel(
      {required this.totalOrders,
      required this.completedOrders,
      required this.cancelledOrders,
      required this.totalSpent,
      required this.averageOrderValue,
      required this.daysAsCustomer,
      this.averageRating});
  factory _CustomerStatsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerStatsModelFromJson(json);

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

  /// Create a copy of CustomerStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerStatsModelCopyWith<_CustomerStatsModel> get copyWith =>
      __$CustomerStatsModelCopyWithImpl<_CustomerStatsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerStatsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerStatsModel &&
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
    return 'CustomerStatsModel(totalOrders: $totalOrders, completedOrders: $completedOrders, cancelledOrders: $cancelledOrders, totalSpent: $totalSpent, averageOrderValue: $averageOrderValue, daysAsCustomer: $daysAsCustomer, averageRating: $averageRating)';
  }
}

/// @nodoc
abstract mixin class _$CustomerStatsModelCopyWith<$Res>
    implements $CustomerStatsModelCopyWith<$Res> {
  factory _$CustomerStatsModelCopyWith(
          _CustomerStatsModel value, $Res Function(_CustomerStatsModel) _then) =
      __$CustomerStatsModelCopyWithImpl;
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
class __$CustomerStatsModelCopyWithImpl<$Res>
    implements _$CustomerStatsModelCopyWith<$Res> {
  __$CustomerStatsModelCopyWithImpl(this._self, this._then);

  final _CustomerStatsModel _self;
  final $Res Function(_CustomerStatsModel) _then;

  /// Create a copy of CustomerStatsModel
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
    return _then(_CustomerStatsModel(
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
mixin _$CustomerContactModel {
  String get id;
  String get name;
  String get role;
  String? get phone;
  String? get email;
  bool get isPrimary;

  /// Create a copy of CustomerContactModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerContactModelCopyWith<CustomerContactModel> get copyWith =>
      _$CustomerContactModelCopyWithImpl<CustomerContactModel>(
          this as CustomerContactModel, _$identity);

  /// Serializes this CustomerContactModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerContactModel &&
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
    return 'CustomerContactModel(id: $id, name: $name, role: $role, phone: $phone, email: $email, isPrimary: $isPrimary)';
  }
}

/// @nodoc
abstract mixin class $CustomerContactModelCopyWith<$Res> {
  factory $CustomerContactModelCopyWith(CustomerContactModel value,
          $Res Function(CustomerContactModel) _then) =
      _$CustomerContactModelCopyWithImpl;
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
class _$CustomerContactModelCopyWithImpl<$Res>
    implements $CustomerContactModelCopyWith<$Res> {
  _$CustomerContactModelCopyWithImpl(this._self, this._then);

  final CustomerContactModel _self;
  final $Res Function(CustomerContactModel) _then;

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

/// Adds pattern-matching-related methods to [CustomerContactModel].
extension CustomerContactModelPatterns on CustomerContactModel {
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
    TResult Function(_CustomerContactModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerContactModel() when $default != null:
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
    TResult Function(_CustomerContactModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerContactModel():
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
    TResult? Function(_CustomerContactModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerContactModel() when $default != null:
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
      case _CustomerContactModel() when $default != null:
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
      case _CustomerContactModel():
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
      case _CustomerContactModel() when $default != null:
        return $default(_that.id, _that.name, _that.role, _that.phone,
            _that.email, _that.isPrimary);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerContactModel implements CustomerContactModel {
  const _CustomerContactModel(
      {required this.id,
      required this.name,
      required this.role,
      this.phone,
      this.email,
      this.isPrimary = true});
  factory _CustomerContactModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerContactModelFromJson(json);

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

  /// Create a copy of CustomerContactModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerContactModelCopyWith<_CustomerContactModel> get copyWith =>
      __$CustomerContactModelCopyWithImpl<_CustomerContactModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerContactModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerContactModel &&
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
    return 'CustomerContactModel(id: $id, name: $name, role: $role, phone: $phone, email: $email, isPrimary: $isPrimary)';
  }
}

/// @nodoc
abstract mixin class _$CustomerContactModelCopyWith<$Res>
    implements $CustomerContactModelCopyWith<$Res> {
  factory _$CustomerContactModelCopyWith(_CustomerContactModel value,
          $Res Function(_CustomerContactModel) _then) =
      __$CustomerContactModelCopyWithImpl;
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
class __$CustomerContactModelCopyWithImpl<$Res>
    implements _$CustomerContactModelCopyWith<$Res> {
  __$CustomerContactModelCopyWithImpl(this._self, this._then);

  final _CustomerContactModel _self;
  final $Res Function(_CustomerContactModel) _then;

  /// Create a copy of CustomerContactModel
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
    return _then(_CustomerContactModel(
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
mixin _$CustomerSettingsModel {
  bool get emailNotifications;
  bool get smsNotifications;
  bool get pushNotifications;
  bool get orderConfirmations;
  bool get deliveryUpdates;
  bool get paymentReminders;
  bool get promotionalOffers;
  String? get preferredLanguage;
  String? get preferredCurrency;

  /// Create a copy of CustomerSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerSettingsModelCopyWith<CustomerSettingsModel> get copyWith =>
      _$CustomerSettingsModelCopyWithImpl<CustomerSettingsModel>(
          this as CustomerSettingsModel, _$identity);

  /// Serializes this CustomerSettingsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerSettingsModel &&
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
    return 'CustomerSettingsModel(emailNotifications: $emailNotifications, smsNotifications: $smsNotifications, pushNotifications: $pushNotifications, orderConfirmations: $orderConfirmations, deliveryUpdates: $deliveryUpdates, paymentReminders: $paymentReminders, promotionalOffers: $promotionalOffers, preferredLanguage: $preferredLanguage, preferredCurrency: $preferredCurrency)';
  }
}

/// @nodoc
abstract mixin class $CustomerSettingsModelCopyWith<$Res> {
  factory $CustomerSettingsModelCopyWith(CustomerSettingsModel value,
          $Res Function(CustomerSettingsModel) _then) =
      _$CustomerSettingsModelCopyWithImpl;
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
class _$CustomerSettingsModelCopyWithImpl<$Res>
    implements $CustomerSettingsModelCopyWith<$Res> {
  _$CustomerSettingsModelCopyWithImpl(this._self, this._then);

  final CustomerSettingsModel _self;
  final $Res Function(CustomerSettingsModel) _then;

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

/// Adds pattern-matching-related methods to [CustomerSettingsModel].
extension CustomerSettingsModelPatterns on CustomerSettingsModel {
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
    TResult Function(_CustomerSettingsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerSettingsModel() when $default != null:
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
    TResult Function(_CustomerSettingsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerSettingsModel():
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
    TResult? Function(_CustomerSettingsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerSettingsModel() when $default != null:
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
      case _CustomerSettingsModel() when $default != null:
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
      case _CustomerSettingsModel():
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
      case _CustomerSettingsModel() when $default != null:
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
class _CustomerSettingsModel implements CustomerSettingsModel {
  const _CustomerSettingsModel(
      {this.emailNotifications = true,
      this.smsNotifications = true,
      this.pushNotifications = true,
      this.orderConfirmations = true,
      this.deliveryUpdates = true,
      this.paymentReminders = true,
      this.promotionalOffers = true,
      this.preferredLanguage,
      this.preferredCurrency});
  factory _CustomerSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerSettingsModelFromJson(json);

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

  /// Create a copy of CustomerSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerSettingsModelCopyWith<_CustomerSettingsModel> get copyWith =>
      __$CustomerSettingsModelCopyWithImpl<_CustomerSettingsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerSettingsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerSettingsModel &&
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
    return 'CustomerSettingsModel(emailNotifications: $emailNotifications, smsNotifications: $smsNotifications, pushNotifications: $pushNotifications, orderConfirmations: $orderConfirmations, deliveryUpdates: $deliveryUpdates, paymentReminders: $paymentReminders, promotionalOffers: $promotionalOffers, preferredLanguage: $preferredLanguage, preferredCurrency: $preferredCurrency)';
  }
}

/// @nodoc
abstract mixin class _$CustomerSettingsModelCopyWith<$Res>
    implements $CustomerSettingsModelCopyWith<$Res> {
  factory _$CustomerSettingsModelCopyWith(_CustomerSettingsModel value,
          $Res Function(_CustomerSettingsModel) _then) =
      __$CustomerSettingsModelCopyWithImpl;
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
class __$CustomerSettingsModelCopyWithImpl<$Res>
    implements _$CustomerSettingsModelCopyWith<$Res> {
  __$CustomerSettingsModelCopyWithImpl(this._self, this._then);

  final _CustomerSettingsModel _self;
  final $Res Function(_CustomerSettingsModel) _then;

  /// Create a copy of CustomerSettingsModel
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
    return _then(_CustomerSettingsModel(
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
