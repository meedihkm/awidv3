// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proof_of_delivery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProofOfDeliveryModel _$ProofOfDeliveryModelFromJson(Map<String, dynamic> json) {
  return _ProofOfDeliveryModel.fromJson(json);
}

/// @nodoc
mixin _$ProofOfDeliveryModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_id')
  String get deliveryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliverer_id')
  String get delivererId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'signatory_name')
  String get signatoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'signature_image_path')
  String get signatureImagePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'photos_paths')
  List<String> get photosPaths => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_feedback')
  String? get customerFeedback => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_uploaded')
  bool get isUploaded => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_at')
  DateTime? get uploadedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ProofOfDeliveryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProofOfDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProofOfDeliveryModelCopyWith<ProofOfDeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProofOfDeliveryModelCopyWith<$Res> {
  factory $ProofOfDeliveryModelCopyWith(ProofOfDeliveryModel value,
          $Res Function(ProofOfDeliveryModel) then) =
      _$ProofOfDeliveryModelCopyWithImpl<$Res, ProofOfDeliveryModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'delivery_id') String deliveryId,
      @JsonKey(name: 'deliverer_id') String delivererId,
      @JsonKey(name: 'customer_id') String customerId,
      DateTime timestamp,
      double latitude,
      double longitude,
      @JsonKey(name: 'signatory_name') String signatoryName,
      @JsonKey(name: 'signature_image_path') String signatureImagePath,
      @JsonKey(name: 'photos_paths') List<String> photosPaths,
      String? notes,
      @JsonKey(name: 'customer_feedback') String? customerFeedback,
      @JsonKey(name: 'is_uploaded') bool isUploaded,
      @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$ProofOfDeliveryModelCopyWithImpl<$Res,
        $Val extends ProofOfDeliveryModel>
    implements $ProofOfDeliveryModelCopyWith<$Res> {
  _$ProofOfDeliveryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProofOfDeliveryModel
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
abstract class _$$ProofOfDeliveryModelImplCopyWith<$Res>
    implements $ProofOfDeliveryModelCopyWith<$Res> {
  factory _$$ProofOfDeliveryModelImplCopyWith(_$ProofOfDeliveryModelImpl value,
          $Res Function(_$ProofOfDeliveryModelImpl) then) =
      __$$ProofOfDeliveryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'delivery_id') String deliveryId,
      @JsonKey(name: 'deliverer_id') String delivererId,
      @JsonKey(name: 'customer_id') String customerId,
      DateTime timestamp,
      double latitude,
      double longitude,
      @JsonKey(name: 'signatory_name') String signatoryName,
      @JsonKey(name: 'signature_image_path') String signatureImagePath,
      @JsonKey(name: 'photos_paths') List<String> photosPaths,
      String? notes,
      @JsonKey(name: 'customer_feedback') String? customerFeedback,
      @JsonKey(name: 'is_uploaded') bool isUploaded,
      @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$ProofOfDeliveryModelImplCopyWithImpl<$Res>
    extends _$ProofOfDeliveryModelCopyWithImpl<$Res, _$ProofOfDeliveryModelImpl>
    implements _$$ProofOfDeliveryModelImplCopyWith<$Res> {
  __$$ProofOfDeliveryModelImplCopyWithImpl(_$ProofOfDeliveryModelImpl _value,
      $Res Function(_$ProofOfDeliveryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProofOfDeliveryModel
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
    return _then(_$ProofOfDeliveryModelImpl(
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
class _$ProofOfDeliveryModelImpl implements _ProofOfDeliveryModel {
  const _$ProofOfDeliveryModelImpl(
      {required this.id,
      @JsonKey(name: 'delivery_id') required this.deliveryId,
      @JsonKey(name: 'deliverer_id') required this.delivererId,
      @JsonKey(name: 'customer_id') required this.customerId,
      required this.timestamp,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'signatory_name') required this.signatoryName,
      @JsonKey(name: 'signature_image_path') required this.signatureImagePath,
      @JsonKey(name: 'photos_paths') required final List<String> photosPaths,
      this.notes,
      @JsonKey(name: 'customer_feedback') this.customerFeedback,
      @JsonKey(name: 'is_uploaded') this.isUploaded = false,
      @JsonKey(name: 'uploaded_at') this.uploadedAt,
      @JsonKey(name: 'created_at') this.createdAt})
      : _photosPaths = photosPaths;

  factory _$ProofOfDeliveryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProofOfDeliveryModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'delivery_id')
  final String deliveryId;
  @override
  @JsonKey(name: 'deliverer_id')
  final String delivererId;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  final DateTime timestamp;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey(name: 'signatory_name')
  final String signatoryName;
  @override
  @JsonKey(name: 'signature_image_path')
  final String signatureImagePath;
  final List<String> _photosPaths;
  @override
  @JsonKey(name: 'photos_paths')
  List<String> get photosPaths {
    if (_photosPaths is EqualUnmodifiableListView) return _photosPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photosPaths);
  }

  @override
  final String? notes;
  @override
  @JsonKey(name: 'customer_feedback')
  final String? customerFeedback;
  @override
  @JsonKey(name: 'is_uploaded')
  final bool isUploaded;
  @override
  @JsonKey(name: 'uploaded_at')
  final DateTime? uploadedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ProofOfDeliveryModel(id: $id, deliveryId: $deliveryId, delivererId: $delivererId, customerId: $customerId, timestamp: $timestamp, latitude: $latitude, longitude: $longitude, signatoryName: $signatoryName, signatureImagePath: $signatureImagePath, photosPaths: $photosPaths, notes: $notes, customerFeedback: $customerFeedback, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProofOfDeliveryModelImpl &&
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

  /// Create a copy of ProofOfDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProofOfDeliveryModelImplCopyWith<_$ProofOfDeliveryModelImpl>
      get copyWith =>
          __$$ProofOfDeliveryModelImplCopyWithImpl<_$ProofOfDeliveryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProofOfDeliveryModelImplToJson(
      this,
    );
  }
}

abstract class _ProofOfDeliveryModel implements ProofOfDeliveryModel {
  const factory _ProofOfDeliveryModel(
      {required final String id,
      @JsonKey(name: 'delivery_id') required final String deliveryId,
      @JsonKey(name: 'deliverer_id') required final String delivererId,
      @JsonKey(name: 'customer_id') required final String customerId,
      required final DateTime timestamp,
      required final double latitude,
      required final double longitude,
      @JsonKey(name: 'signatory_name') required final String signatoryName,
      @JsonKey(name: 'signature_image_path')
      required final String signatureImagePath,
      @JsonKey(name: 'photos_paths') required final List<String> photosPaths,
      final String? notes,
      @JsonKey(name: 'customer_feedback') final String? customerFeedback,
      @JsonKey(name: 'is_uploaded') final bool isUploaded,
      @JsonKey(name: 'uploaded_at') final DateTime? uploadedAt,
      @JsonKey(name: 'created_at')
      final DateTime? createdAt}) = _$ProofOfDeliveryModelImpl;

  factory _ProofOfDeliveryModel.fromJson(Map<String, dynamic> json) =
      _$ProofOfDeliveryModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'delivery_id')
  String get deliveryId;
  @override
  @JsonKey(name: 'deliverer_id')
  String get delivererId;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  DateTime get timestamp;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(name: 'signatory_name')
  String get signatoryName;
  @override
  @JsonKey(name: 'signature_image_path')
  String get signatureImagePath;
  @override
  @JsonKey(name: 'photos_paths')
  List<String> get photosPaths;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'customer_feedback')
  String? get customerFeedback;
  @override
  @JsonKey(name: 'is_uploaded')
  bool get isUploaded;
  @override
  @JsonKey(name: 'uploaded_at')
  DateTime? get uploadedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of ProofOfDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProofOfDeliveryModelImplCopyWith<_$ProofOfDeliveryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UploadProofRequest _$UploadProofRequestFromJson(Map<String, dynamic> json) {
  return _UploadProofRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadProofRequest {
  @JsonKey(name: 'delivery_id')
  String get deliveryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliverer_id')
  String get delivererId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'signatory_name')
  String get signatoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'signature_image')
  String get signatureImageBase64 => throw _privateConstructorUsedError;
  @JsonKey(name: 'photos')
  List<String> get photosBase64 => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_feedback')
  String? get customerFeedback => throw _privateConstructorUsedError;

  /// Serializes this UploadProofRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadProofRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadProofRequestCopyWith<UploadProofRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadProofRequestCopyWith<$Res> {
  factory $UploadProofRequestCopyWith(
          UploadProofRequest value, $Res Function(UploadProofRequest) then) =
      _$UploadProofRequestCopyWithImpl<$Res, UploadProofRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_id') String deliveryId,
      @JsonKey(name: 'deliverer_id') String delivererId,
      @JsonKey(name: 'customer_id') String customerId,
      DateTime timestamp,
      double latitude,
      double longitude,
      @JsonKey(name: 'signatory_name') String signatoryName,
      @JsonKey(name: 'signature_image') String signatureImageBase64,
      @JsonKey(name: 'photos') List<String> photosBase64,
      String? notes,
      @JsonKey(name: 'customer_feedback') String? customerFeedback});
}

/// @nodoc
class _$UploadProofRequestCopyWithImpl<$Res, $Val extends UploadProofRequest>
    implements $UploadProofRequestCopyWith<$Res> {
  _$UploadProofRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadProofRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryId = null,
    Object? delivererId = null,
    Object? customerId = null,
    Object? timestamp = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? signatoryName = null,
    Object? signatureImageBase64 = null,
    Object? photosBase64 = null,
    Object? notes = freezed,
    Object? customerFeedback = freezed,
  }) {
    return _then(_value.copyWith(
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
      signatureImageBase64: null == signatureImageBase64
          ? _value.signatureImageBase64
          : signatureImageBase64 // ignore: cast_nullable_to_non_nullable
              as String,
      photosBase64: null == photosBase64
          ? _value.photosBase64
          : photosBase64 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      customerFeedback: freezed == customerFeedback
          ? _value.customerFeedback
          : customerFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadProofRequestImplCopyWith<$Res>
    implements $UploadProofRequestCopyWith<$Res> {
  factory _$$UploadProofRequestImplCopyWith(_$UploadProofRequestImpl value,
          $Res Function(_$UploadProofRequestImpl) then) =
      __$$UploadProofRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_id') String deliveryId,
      @JsonKey(name: 'deliverer_id') String delivererId,
      @JsonKey(name: 'customer_id') String customerId,
      DateTime timestamp,
      double latitude,
      double longitude,
      @JsonKey(name: 'signatory_name') String signatoryName,
      @JsonKey(name: 'signature_image') String signatureImageBase64,
      @JsonKey(name: 'photos') List<String> photosBase64,
      String? notes,
      @JsonKey(name: 'customer_feedback') String? customerFeedback});
}

/// @nodoc
class __$$UploadProofRequestImplCopyWithImpl<$Res>
    extends _$UploadProofRequestCopyWithImpl<$Res, _$UploadProofRequestImpl>
    implements _$$UploadProofRequestImplCopyWith<$Res> {
  __$$UploadProofRequestImplCopyWithImpl(_$UploadProofRequestImpl _value,
      $Res Function(_$UploadProofRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadProofRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryId = null,
    Object? delivererId = null,
    Object? customerId = null,
    Object? timestamp = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? signatoryName = null,
    Object? signatureImageBase64 = null,
    Object? photosBase64 = null,
    Object? notes = freezed,
    Object? customerFeedback = freezed,
  }) {
    return _then(_$UploadProofRequestImpl(
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
      signatureImageBase64: null == signatureImageBase64
          ? _value.signatureImageBase64
          : signatureImageBase64 // ignore: cast_nullable_to_non_nullable
              as String,
      photosBase64: null == photosBase64
          ? _value._photosBase64
          : photosBase64 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      customerFeedback: freezed == customerFeedback
          ? _value.customerFeedback
          : customerFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadProofRequestImpl implements _UploadProofRequest {
  const _$UploadProofRequestImpl(
      {@JsonKey(name: 'delivery_id') required this.deliveryId,
      @JsonKey(name: 'deliverer_id') required this.delivererId,
      @JsonKey(name: 'customer_id') required this.customerId,
      required this.timestamp,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'signatory_name') required this.signatoryName,
      @JsonKey(name: 'signature_image') required this.signatureImageBase64,
      @JsonKey(name: 'photos') required final List<String> photosBase64,
      this.notes,
      @JsonKey(name: 'customer_feedback') this.customerFeedback})
      : _photosBase64 = photosBase64;

  factory _$UploadProofRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadProofRequestImplFromJson(json);

  @override
  @JsonKey(name: 'delivery_id')
  final String deliveryId;
  @override
  @JsonKey(name: 'deliverer_id')
  final String delivererId;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  final DateTime timestamp;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey(name: 'signatory_name')
  final String signatoryName;
  @override
  @JsonKey(name: 'signature_image')
  final String signatureImageBase64;
  final List<String> _photosBase64;
  @override
  @JsonKey(name: 'photos')
  List<String> get photosBase64 {
    if (_photosBase64 is EqualUnmodifiableListView) return _photosBase64;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photosBase64);
  }

  @override
  final String? notes;
  @override
  @JsonKey(name: 'customer_feedback')
  final String? customerFeedback;

  @override
  String toString() {
    return 'UploadProofRequest(deliveryId: $deliveryId, delivererId: $delivererId, customerId: $customerId, timestamp: $timestamp, latitude: $latitude, longitude: $longitude, signatoryName: $signatoryName, signatureImageBase64: $signatureImageBase64, photosBase64: $photosBase64, notes: $notes, customerFeedback: $customerFeedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadProofRequestImpl &&
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
            (identical(other.signatureImageBase64, signatureImageBase64) ||
                other.signatureImageBase64 == signatureImageBase64) &&
            const DeepCollectionEquality()
                .equals(other._photosBase64, _photosBase64) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.customerFeedback, customerFeedback) ||
                other.customerFeedback == customerFeedback));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deliveryId,
      delivererId,
      customerId,
      timestamp,
      latitude,
      longitude,
      signatoryName,
      signatureImageBase64,
      const DeepCollectionEquality().hash(_photosBase64),
      notes,
      customerFeedback);

  /// Create a copy of UploadProofRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadProofRequestImplCopyWith<_$UploadProofRequestImpl> get copyWith =>
      __$$UploadProofRequestImplCopyWithImpl<_$UploadProofRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadProofRequestImplToJson(
      this,
    );
  }
}

abstract class _UploadProofRequest implements UploadProofRequest {
  const factory _UploadProofRequest(
          {@JsonKey(name: 'delivery_id') required final String deliveryId,
          @JsonKey(name: 'deliverer_id') required final String delivererId,
          @JsonKey(name: 'customer_id') required final String customerId,
          required final DateTime timestamp,
          required final double latitude,
          required final double longitude,
          @JsonKey(name: 'signatory_name') required final String signatoryName,
          @JsonKey(name: 'signature_image')
          required final String signatureImageBase64,
          @JsonKey(name: 'photos') required final List<String> photosBase64,
          final String? notes,
          @JsonKey(name: 'customer_feedback') final String? customerFeedback}) =
      _$UploadProofRequestImpl;

  factory _UploadProofRequest.fromJson(Map<String, dynamic> json) =
      _$UploadProofRequestImpl.fromJson;

  @override
  @JsonKey(name: 'delivery_id')
  String get deliveryId;
  @override
  @JsonKey(name: 'deliverer_id')
  String get delivererId;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  DateTime get timestamp;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(name: 'signatory_name')
  String get signatoryName;
  @override
  @JsonKey(name: 'signature_image')
  String get signatureImageBase64;
  @override
  @JsonKey(name: 'photos')
  List<String> get photosBase64;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'customer_feedback')
  String? get customerFeedback;

  /// Create a copy of UploadProofRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadProofRequestImplCopyWith<_$UploadProofRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadProofResponse _$UploadProofResponseFromJson(Map<String, dynamic> json) {
  return _UploadProofResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadProofResponse {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_at')
  DateTime get uploadedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'signature_url')
  String? get signatureUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'photos_urls')
  List<String>? get photosUrls => throw _privateConstructorUsedError;

  /// Serializes this UploadProofResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadProofResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadProofResponseCopyWith<UploadProofResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadProofResponseCopyWith<$Res> {
  factory $UploadProofResponseCopyWith(
          UploadProofResponse value, $Res Function(UploadProofResponse) then) =
      _$UploadProofResponseCopyWithImpl<$Res, UploadProofResponse>;
  @useResult
  $Res call(
      {String id,
      String status,
      String message,
      @JsonKey(name: 'uploaded_at') DateTime uploadedAt,
      @JsonKey(name: 'signature_url') String? signatureUrl,
      @JsonKey(name: 'photos_urls') List<String>? photosUrls});
}

/// @nodoc
class _$UploadProofResponseCopyWithImpl<$Res, $Val extends UploadProofResponse>
    implements $UploadProofResponseCopyWith<$Res> {
  _$UploadProofResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadProofResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? message = null,
    Object? uploadedAt = null,
    Object? signatureUrl = freezed,
    Object? photosUrls = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      signatureUrl: freezed == signatureUrl
          ? _value.signatureUrl
          : signatureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      photosUrls: freezed == photosUrls
          ? _value.photosUrls
          : photosUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadProofResponseImplCopyWith<$Res>
    implements $UploadProofResponseCopyWith<$Res> {
  factory _$$UploadProofResponseImplCopyWith(_$UploadProofResponseImpl value,
          $Res Function(_$UploadProofResponseImpl) then) =
      __$$UploadProofResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String status,
      String message,
      @JsonKey(name: 'uploaded_at') DateTime uploadedAt,
      @JsonKey(name: 'signature_url') String? signatureUrl,
      @JsonKey(name: 'photos_urls') List<String>? photosUrls});
}

/// @nodoc
class __$$UploadProofResponseImplCopyWithImpl<$Res>
    extends _$UploadProofResponseCopyWithImpl<$Res, _$UploadProofResponseImpl>
    implements _$$UploadProofResponseImplCopyWith<$Res> {
  __$$UploadProofResponseImplCopyWithImpl(_$UploadProofResponseImpl _value,
      $Res Function(_$UploadProofResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadProofResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? message = null,
    Object? uploadedAt = null,
    Object? signatureUrl = freezed,
    Object? photosUrls = freezed,
  }) {
    return _then(_$UploadProofResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      signatureUrl: freezed == signatureUrl
          ? _value.signatureUrl
          : signatureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      photosUrls: freezed == photosUrls
          ? _value._photosUrls
          : photosUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadProofResponseImpl implements _UploadProofResponse {
  const _$UploadProofResponseImpl(
      {required this.id,
      required this.status,
      required this.message,
      @JsonKey(name: 'uploaded_at') required this.uploadedAt,
      @JsonKey(name: 'signature_url') this.signatureUrl,
      @JsonKey(name: 'photos_urls') final List<String>? photosUrls})
      : _photosUrls = photosUrls;

  factory _$UploadProofResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadProofResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final String message;
  @override
  @JsonKey(name: 'uploaded_at')
  final DateTime uploadedAt;
  @override
  @JsonKey(name: 'signature_url')
  final String? signatureUrl;
  final List<String>? _photosUrls;
  @override
  @JsonKey(name: 'photos_urls')
  List<String>? get photosUrls {
    final value = _photosUrls;
    if (value == null) return null;
    if (_photosUrls is EqualUnmodifiableListView) return _photosUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UploadProofResponse(id: $id, status: $status, message: $message, uploadedAt: $uploadedAt, signatureUrl: $signatureUrl, photosUrls: $photosUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadProofResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.signatureUrl, signatureUrl) ||
                other.signatureUrl == signatureUrl) &&
            const DeepCollectionEquality()
                .equals(other._photosUrls, _photosUrls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, message, uploadedAt,
      signatureUrl, const DeepCollectionEquality().hash(_photosUrls));

  /// Create a copy of UploadProofResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadProofResponseImplCopyWith<_$UploadProofResponseImpl> get copyWith =>
      __$$UploadProofResponseImplCopyWithImpl<_$UploadProofResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadProofResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadProofResponse implements UploadProofResponse {
  const factory _UploadProofResponse(
          {required final String id,
          required final String status,
          required final String message,
          @JsonKey(name: 'uploaded_at') required final DateTime uploadedAt,
          @JsonKey(name: 'signature_url') final String? signatureUrl,
          @JsonKey(name: 'photos_urls') final List<String>? photosUrls}) =
      _$UploadProofResponseImpl;

  factory _UploadProofResponse.fromJson(Map<String, dynamic> json) =
      _$UploadProofResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String get message;
  @override
  @JsonKey(name: 'uploaded_at')
  DateTime get uploadedAt;
  @override
  @JsonKey(name: 'signature_url')
  String? get signatureUrl;
  @override
  @JsonKey(name: 'photos_urls')
  List<String>? get photosUrls;

  /// Create a copy of UploadProofResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadProofResponseImplCopyWith<_$UploadProofResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
