// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proof_of_delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProofOfDelivery _$ProofOfDeliveryFromJson(Map<String, dynamic> json) {
  return _ProofOfDelivery.fromJson(json);
}

/// @nodoc
mixin _$ProofOfDelivery {
  String get id => throw _privateConstructorUsedError;
  String get deliveryId => throw _privateConstructorUsedError;
  String get delivererId => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get signatoryName => throw _privateConstructorUsedError;
  String get signatureImagePath => throw _privateConstructorUsedError;
  List<String> get photosPaths => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get customerFeedback => throw _privateConstructorUsedError;
  bool get isUploaded => throw _privateConstructorUsedError;
  DateTime? get uploadedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ProofOfDelivery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProofOfDelivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProofOfDeliveryCopyWith<ProofOfDelivery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProofOfDeliveryCopyWith<$Res> {
  factory $ProofOfDeliveryCopyWith(
          ProofOfDelivery value, $Res Function(ProofOfDelivery) then) =
      _$ProofOfDeliveryCopyWithImpl<$Res, ProofOfDelivery>;
  @useResult
  $Res call(
      {String id,
      String deliveryId,
      String delivererId,
      String customerId,
      DateTime timestamp,
      double latitude,
      double longitude,
      String signatoryName,
      String signatureImagePath,
      List<String> photosPaths,
      String? notes,
      String? customerFeedback,
      bool isUploaded,
      DateTime? uploadedAt,
      DateTime? createdAt});
}

/// @nodoc
class _$ProofOfDeliveryCopyWithImpl<$Res, $Val extends ProofOfDelivery>
    implements $ProofOfDeliveryCopyWith<$Res> {
  _$ProofOfDeliveryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProofOfDelivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deliveryId = null,
    Object? delivererId = null,
    Object? customerId = null,
    Object? timestamp = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? signatoryName = null,
    Object? signatureImagePath = null,
    Object? photosPaths = null,
    Object? notes = freezed,
    Object? customerFeedback = freezed,
    Object? isUploaded = null,
    Object? uploadedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryId: null == deliveryId
          ? _value.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _value.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      signatoryName: null == signatoryName
          ? _value.signatoryName
          : signatoryName // ignore: cast_nullable_to_non_nullable
              as String,
      signatureImagePath: null == signatureImagePath
          ? _value.signatureImagePath
          : signatureImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      photosPaths: null == photosPaths
          ? _value.photosPaths
          : photosPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      customerFeedback: freezed == customerFeedback
          ? _value.customerFeedback
          : customerFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploaded: null == isUploaded
          ? _value.isUploaded
          : isUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProofOfDeliveryImplCopyWith<$Res>
    implements $ProofOfDeliveryCopyWith<$Res> {
  factory _$$ProofOfDeliveryImplCopyWith(_$ProofOfDeliveryImpl value,
          $Res Function(_$ProofOfDeliveryImpl) then) =
      __$$ProofOfDeliveryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String deliveryId,
      String delivererId,
      String customerId,
      DateTime timestamp,
      double latitude,
      double longitude,
      String signatoryName,
      String signatureImagePath,
      List<String> photosPaths,
      String? notes,
      String? customerFeedback,
      bool isUploaded,
      DateTime? uploadedAt,
      DateTime? createdAt});
}

/// @nodoc
class __$$ProofOfDeliveryImplCopyWithImpl<$Res>
    extends _$ProofOfDeliveryCopyWithImpl<$Res, _$ProofOfDeliveryImpl>
    implements _$$ProofOfDeliveryImplCopyWith<$Res> {
  __$$ProofOfDeliveryImplCopyWithImpl(
      _$ProofOfDeliveryImpl _value, $Res Function(_$ProofOfDeliveryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProofOfDelivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deliveryId = null,
    Object? delivererId = null,
    Object? customerId = null,
    Object? timestamp = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? signatoryName = null,
    Object? signatureImagePath = null,
    Object? photosPaths = null,
    Object? notes = freezed,
    Object? customerFeedback = freezed,
    Object? isUploaded = null,
    Object? uploadedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ProofOfDeliveryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryId: null == deliveryId
          ? _value.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _value.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      signatoryName: null == signatoryName
          ? _value.signatoryName
          : signatoryName // ignore: cast_nullable_to_non_nullable
              as String,
      signatureImagePath: null == signatureImagePath
          ? _value.signatureImagePath
          : signatureImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      photosPaths: null == photosPaths
          ? _value._photosPaths
          : photosPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      customerFeedback: freezed == customerFeedback
          ? _value.customerFeedback
          : customerFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploaded: null == isUploaded
          ? _value.isUploaded
          : isUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProofOfDeliveryImpl implements _ProofOfDelivery {
  const _$ProofOfDeliveryImpl(
      {required this.id,
      required this.deliveryId,
      required this.delivererId,
      required this.customerId,
      required this.timestamp,
      required this.latitude,
      required this.longitude,
      required this.signatoryName,
      required this.signatureImagePath,
      required final List<String> photosPaths,
      this.notes,
      this.customerFeedback,
      this.isUploaded = false,
      this.uploadedAt,
      this.createdAt})
      : _photosPaths = photosPaths;

  factory _$ProofOfDeliveryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProofOfDeliveryImplFromJson(json);

  @override
  final String id;
  @override
  final String deliveryId;
  @override
  final String delivererId;
  @override
  final String customerId;
  @override
  final DateTime timestamp;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String signatoryName;
  @override
  final String signatureImagePath;
  final List<String> _photosPaths;
  @override
  List<String> get photosPaths {
    if (_photosPaths is EqualUnmodifiableListView) return _photosPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photosPaths);
  }

  @override
  final String? notes;
  @override
  final String? customerFeedback;
  @override
  @JsonKey()
  final bool isUploaded;
  @override
  final DateTime? uploadedAt;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ProofOfDelivery(id: $id, deliveryId: $deliveryId, delivererId: $delivererId, customerId: $customerId, timestamp: $timestamp, latitude: $latitude, longitude: $longitude, signatoryName: $signatoryName, signatureImagePath: $signatureImagePath, photosPaths: $photosPaths, notes: $notes, customerFeedback: $customerFeedback, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProofOfDeliveryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deliveryId, deliveryId) ||
                other.deliveryId == deliveryId) &&
            (identical(other.delivererId, delivererId) ||
                other.delivererId == delivererId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.signatoryName, signatoryName) ||
                other.signatoryName == signatoryName) &&
            (identical(other.signatureImagePath, signatureImagePath) ||
                other.signatureImagePath == signatureImagePath) &&
            const DeepCollectionEquality()
                .equals(other._photosPaths, _photosPaths) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.customerFeedback, customerFeedback) ||
                other.customerFeedback == customerFeedback) &&
            (identical(other.isUploaded, isUploaded) ||
                other.isUploaded == isUploaded) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      deliveryId,
      delivererId,
      customerId,
      timestamp,
      latitude,
      longitude,
      signatoryName,
      signatureImagePath,
      const DeepCollectionEquality().hash(_photosPaths),
      notes,
      customerFeedback,
      isUploaded,
      uploadedAt,
      createdAt);

  /// Create a copy of ProofOfDelivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProofOfDeliveryImplCopyWith<_$ProofOfDeliveryImpl> get copyWith =>
      __$$ProofOfDeliveryImplCopyWithImpl<_$ProofOfDeliveryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProofOfDeliveryImplToJson(
      this,
    );
  }
}

abstract class _ProofOfDelivery implements ProofOfDelivery {
  const factory _ProofOfDelivery(
      {required final String id,
      required final String deliveryId,
      required final String delivererId,
      required final String customerId,
      required final DateTime timestamp,
      required final double latitude,
      required final double longitude,
      required final String signatoryName,
      required final String signatureImagePath,
      required final List<String> photosPaths,
      final String? notes,
      final String? customerFeedback,
      final bool isUploaded,
      final DateTime? uploadedAt,
      final DateTime? createdAt}) = _$ProofOfDeliveryImpl;

  factory _ProofOfDelivery.fromJson(Map<String, dynamic> json) =
      _$ProofOfDeliveryImpl.fromJson;

  @override
  String get id;
  @override
  String get deliveryId;
  @override
  String get delivererId;
  @override
  String get customerId;
  @override
  DateTime get timestamp;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get signatoryName;
  @override
  String get signatureImagePath;
  @override
  List<String> get photosPaths;
  @override
  String? get notes;
  @override
  String? get customerFeedback;
  @override
  bool get isUploaded;
  @override
  DateTime? get uploadedAt;
  @override
  DateTime? get createdAt;

  /// Create a copy of ProofOfDelivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProofOfDeliveryImplCopyWith<_$ProofOfDeliveryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
