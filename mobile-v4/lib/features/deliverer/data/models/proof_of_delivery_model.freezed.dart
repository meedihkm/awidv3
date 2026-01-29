// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proof_of_delivery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProofOfDeliveryModel {
  String get id;
  @JsonKey(name: 'delivery_id')
  String get deliveryId;
  @JsonKey(name: 'deliverer_id')
  String get delivererId;
  @JsonKey(name: 'customer_id')
  String get customerId;
  DateTime get timestamp;
  double get latitude;
  double get longitude;
  @JsonKey(name: 'signatory_name')
  String get signatoryName;
  @JsonKey(name: 'signature_image_path')
  String get signatureImagePath;
  @JsonKey(name: 'photos_paths')
  List<String> get photosPaths;
  String? get notes;
  @JsonKey(name: 'customer_feedback')
  String? get customerFeedback;
  @JsonKey(name: 'is_uploaded')
  bool get isUploaded;
  @JsonKey(name: 'uploaded_at')
  DateTime? get uploadedAt;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of ProofOfDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProofOfDeliveryModelCopyWith<ProofOfDeliveryModel> get copyWith =>
      _$ProofOfDeliveryModelCopyWithImpl<ProofOfDeliveryModel>(
          this as ProofOfDeliveryModel, _$identity);

  /// Serializes this ProofOfDeliveryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProofOfDeliveryModel &&
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
                .equals(other.photosPaths, photosPaths) &&
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
      const DeepCollectionEquality().hash(photosPaths),
      notes,
      customerFeedback,
      isUploaded,
      uploadedAt,
      createdAt);

  @override
  String toString() {
    return 'ProofOfDeliveryModel(id: $id, deliveryId: $deliveryId, delivererId: $delivererId, customerId: $customerId, timestamp: $timestamp, latitude: $latitude, longitude: $longitude, signatoryName: $signatoryName, signatureImagePath: $signatureImagePath, photosPaths: $photosPaths, notes: $notes, customerFeedback: $customerFeedback, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $ProofOfDeliveryModelCopyWith<$Res> {
  factory $ProofOfDeliveryModelCopyWith(ProofOfDeliveryModel value,
          $Res Function(ProofOfDeliveryModel) _then) =
      _$ProofOfDeliveryModelCopyWithImpl;
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
class _$ProofOfDeliveryModelCopyWithImpl<$Res>
    implements $ProofOfDeliveryModelCopyWith<$Res> {
  _$ProofOfDeliveryModelCopyWithImpl(this._self, this._then);

  final ProofOfDeliveryModel _self;
  final $Res Function(ProofOfDeliveryModel) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryId: null == deliveryId
          ? _self.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      signatoryName: null == signatoryName
          ? _self.signatoryName
          : signatoryName // ignore: cast_nullable_to_non_nullable
              as String,
      signatureImagePath: null == signatureImagePath
          ? _self.signatureImagePath
          : signatureImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      photosPaths: null == photosPaths
          ? _self.photosPaths
          : photosPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      customerFeedback: freezed == customerFeedback
          ? _self.customerFeedback
          : customerFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploaded: null == isUploaded
          ? _self.isUploaded
          : isUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadedAt: freezed == uploadedAt
          ? _self.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProofOfDeliveryModel].
extension ProofOfDeliveryModelPatterns on ProofOfDeliveryModel {
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
    TResult Function(_ProofOfDeliveryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProofOfDeliveryModel() when $default != null:
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
    TResult Function(_ProofOfDeliveryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProofOfDeliveryModel():
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
    TResult? Function(_ProofOfDeliveryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProofOfDeliveryModel() when $default != null:
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
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProofOfDeliveryModel() when $default != null:
        return $default(
            _that.id,
            _that.deliveryId,
            _that.delivererId,
            _that.customerId,
            _that.timestamp,
            _that.latitude,
            _that.longitude,
            _that.signatoryName,
            _that.signatureImagePath,
            _that.photosPaths,
            _that.notes,
            _that.customerFeedback,
            _that.isUploaded,
            _that.uploadedAt,
            _that.createdAt);
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
            @JsonKey(name: 'created_at') DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProofOfDeliveryModel():
        return $default(
            _that.id,
            _that.deliveryId,
            _that.delivererId,
            _that.customerId,
            _that.timestamp,
            _that.latitude,
            _that.longitude,
            _that.signatoryName,
            _that.signatureImagePath,
            _that.photosPaths,
            _that.notes,
            _that.customerFeedback,
            _that.isUploaded,
            _that.uploadedAt,
            _that.createdAt);
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
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProofOfDeliveryModel() when $default != null:
        return $default(
            _that.id,
            _that.deliveryId,
            _that.delivererId,
            _that.customerId,
            _that.timestamp,
            _that.latitude,
            _that.longitude,
            _that.signatoryName,
            _that.signatureImagePath,
            _that.photosPaths,
            _that.notes,
            _that.customerFeedback,
            _that.isUploaded,
            _that.uploadedAt,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProofOfDeliveryModel implements ProofOfDeliveryModel {
  const _ProofOfDeliveryModel(
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
  factory _ProofOfDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$ProofOfDeliveryModelFromJson(json);

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

  /// Create a copy of ProofOfDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProofOfDeliveryModelCopyWith<_ProofOfDeliveryModel> get copyWith =>
      __$ProofOfDeliveryModelCopyWithImpl<_ProofOfDeliveryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProofOfDeliveryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProofOfDeliveryModel &&
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

  @override
  String toString() {
    return 'ProofOfDeliveryModel(id: $id, deliveryId: $deliveryId, delivererId: $delivererId, customerId: $customerId, timestamp: $timestamp, latitude: $latitude, longitude: $longitude, signatoryName: $signatoryName, signatureImagePath: $signatureImagePath, photosPaths: $photosPaths, notes: $notes, customerFeedback: $customerFeedback, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$ProofOfDeliveryModelCopyWith<$Res>
    implements $ProofOfDeliveryModelCopyWith<$Res> {
  factory _$ProofOfDeliveryModelCopyWith(_ProofOfDeliveryModel value,
          $Res Function(_ProofOfDeliveryModel) _then) =
      __$ProofOfDeliveryModelCopyWithImpl;
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
class __$ProofOfDeliveryModelCopyWithImpl<$Res>
    implements _$ProofOfDeliveryModelCopyWith<$Res> {
  __$ProofOfDeliveryModelCopyWithImpl(this._self, this._then);

  final _ProofOfDeliveryModel _self;
  final $Res Function(_ProofOfDeliveryModel) _then;

  /// Create a copy of ProofOfDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_ProofOfDeliveryModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryId: null == deliveryId
          ? _self.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      signatoryName: null == signatoryName
          ? _self.signatoryName
          : signatoryName // ignore: cast_nullable_to_non_nullable
              as String,
      signatureImagePath: null == signatureImagePath
          ? _self.signatureImagePath
          : signatureImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      photosPaths: null == photosPaths
          ? _self._photosPaths
          : photosPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      customerFeedback: freezed == customerFeedback
          ? _self.customerFeedback
          : customerFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploaded: null == isUploaded
          ? _self.isUploaded
          : isUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadedAt: freezed == uploadedAt
          ? _self.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$UploadProofRequest {
  @JsonKey(name: 'delivery_id')
  String get deliveryId;
  @JsonKey(name: 'deliverer_id')
  String get delivererId;
  @JsonKey(name: 'customer_id')
  String get customerId;
  DateTime get timestamp;
  double get latitude;
  double get longitude;
  @JsonKey(name: 'signatory_name')
  String get signatoryName;
  @JsonKey(name: 'signature_image')
  String get signatureImageBase64;
  @JsonKey(name: 'photos')
  List<String> get photosBase64;
  String? get notes;
  @JsonKey(name: 'customer_feedback')
  String? get customerFeedback;

  /// Create a copy of UploadProofRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UploadProofRequestCopyWith<UploadProofRequest> get copyWith =>
      _$UploadProofRequestCopyWithImpl<UploadProofRequest>(
          this as UploadProofRequest, _$identity);

  /// Serializes this UploadProofRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UploadProofRequest &&
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
                .equals(other.photosBase64, photosBase64) &&
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
      const DeepCollectionEquality().hash(photosBase64),
      notes,
      customerFeedback);

  @override
  String toString() {
    return 'UploadProofRequest(deliveryId: $deliveryId, delivererId: $delivererId, customerId: $customerId, timestamp: $timestamp, latitude: $latitude, longitude: $longitude, signatoryName: $signatoryName, signatureImageBase64: $signatureImageBase64, photosBase64: $photosBase64, notes: $notes, customerFeedback: $customerFeedback)';
  }
}

/// @nodoc
abstract mixin class $UploadProofRequestCopyWith<$Res> {
  factory $UploadProofRequestCopyWith(
          UploadProofRequest value, $Res Function(UploadProofRequest) _then) =
      _$UploadProofRequestCopyWithImpl;
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
class _$UploadProofRequestCopyWithImpl<$Res>
    implements $UploadProofRequestCopyWith<$Res> {
  _$UploadProofRequestCopyWithImpl(this._self, this._then);

  final UploadProofRequest _self;
  final $Res Function(UploadProofRequest) _then;

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
    return _then(_self.copyWith(
      deliveryId: null == deliveryId
          ? _self.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      signatoryName: null == signatoryName
          ? _self.signatoryName
          : signatoryName // ignore: cast_nullable_to_non_nullable
              as String,
      signatureImageBase64: null == signatureImageBase64
          ? _self.signatureImageBase64
          : signatureImageBase64 // ignore: cast_nullable_to_non_nullable
              as String,
      photosBase64: null == photosBase64
          ? _self.photosBase64
          : photosBase64 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      customerFeedback: freezed == customerFeedback
          ? _self.customerFeedback
          : customerFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UploadProofRequest].
extension UploadProofRequestPatterns on UploadProofRequest {
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
    TResult Function(_UploadProofRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadProofRequest() when $default != null:
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
    TResult Function(_UploadProofRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadProofRequest():
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
    TResult? Function(_UploadProofRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadProofRequest() when $default != null:
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
            @JsonKey(name: 'delivery_id') String deliveryId,
            @JsonKey(name: 'deliverer_id') String delivererId,
            @JsonKey(name: 'customer_id') String customerId,
            DateTime timestamp,
            double latitude,
            double longitude,
            @JsonKey(name: 'signatory_name') String signatoryName,
            @JsonKey(name: 'signature_image') String signatureImageBase64,
            @JsonKey(name: 'photos') List<String> photosBase64,
            String? notes,
            @JsonKey(name: 'customer_feedback') String? customerFeedback)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadProofRequest() when $default != null:
        return $default(
            _that.deliveryId,
            _that.delivererId,
            _that.customerId,
            _that.timestamp,
            _that.latitude,
            _that.longitude,
            _that.signatoryName,
            _that.signatureImageBase64,
            _that.photosBase64,
            _that.notes,
            _that.customerFeedback);
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
            @JsonKey(name: 'delivery_id') String deliveryId,
            @JsonKey(name: 'deliverer_id') String delivererId,
            @JsonKey(name: 'customer_id') String customerId,
            DateTime timestamp,
            double latitude,
            double longitude,
            @JsonKey(name: 'signatory_name') String signatoryName,
            @JsonKey(name: 'signature_image') String signatureImageBase64,
            @JsonKey(name: 'photos') List<String> photosBase64,
            String? notes,
            @JsonKey(name: 'customer_feedback') String? customerFeedback)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadProofRequest():
        return $default(
            _that.deliveryId,
            _that.delivererId,
            _that.customerId,
            _that.timestamp,
            _that.latitude,
            _that.longitude,
            _that.signatoryName,
            _that.signatureImageBase64,
            _that.photosBase64,
            _that.notes,
            _that.customerFeedback);
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
            @JsonKey(name: 'delivery_id') String deliveryId,
            @JsonKey(name: 'deliverer_id') String delivererId,
            @JsonKey(name: 'customer_id') String customerId,
            DateTime timestamp,
            double latitude,
            double longitude,
            @JsonKey(name: 'signatory_name') String signatoryName,
            @JsonKey(name: 'signature_image') String signatureImageBase64,
            @JsonKey(name: 'photos') List<String> photosBase64,
            String? notes,
            @JsonKey(name: 'customer_feedback') String? customerFeedback)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadProofRequest() when $default != null:
        return $default(
            _that.deliveryId,
            _that.delivererId,
            _that.customerId,
            _that.timestamp,
            _that.latitude,
            _that.longitude,
            _that.signatoryName,
            _that.signatureImageBase64,
            _that.photosBase64,
            _that.notes,
            _that.customerFeedback);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UploadProofRequest implements UploadProofRequest {
  const _UploadProofRequest(
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
  factory _UploadProofRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadProofRequestFromJson(json);

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

  /// Create a copy of UploadProofRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UploadProofRequestCopyWith<_UploadProofRequest> get copyWith =>
      __$UploadProofRequestCopyWithImpl<_UploadProofRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UploadProofRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UploadProofRequest &&
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

  @override
  String toString() {
    return 'UploadProofRequest(deliveryId: $deliveryId, delivererId: $delivererId, customerId: $customerId, timestamp: $timestamp, latitude: $latitude, longitude: $longitude, signatoryName: $signatoryName, signatureImageBase64: $signatureImageBase64, photosBase64: $photosBase64, notes: $notes, customerFeedback: $customerFeedback)';
  }
}

/// @nodoc
abstract mixin class _$UploadProofRequestCopyWith<$Res>
    implements $UploadProofRequestCopyWith<$Res> {
  factory _$UploadProofRequestCopyWith(
          _UploadProofRequest value, $Res Function(_UploadProofRequest) _then) =
      __$UploadProofRequestCopyWithImpl;
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
class __$UploadProofRequestCopyWithImpl<$Res>
    implements _$UploadProofRequestCopyWith<$Res> {
  __$UploadProofRequestCopyWithImpl(this._self, this._then);

  final _UploadProofRequest _self;
  final $Res Function(_UploadProofRequest) _then;

  /// Create a copy of UploadProofRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_UploadProofRequest(
      deliveryId: null == deliveryId
          ? _self.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      signatoryName: null == signatoryName
          ? _self.signatoryName
          : signatoryName // ignore: cast_nullable_to_non_nullable
              as String,
      signatureImageBase64: null == signatureImageBase64
          ? _self.signatureImageBase64
          : signatureImageBase64 // ignore: cast_nullable_to_non_nullable
              as String,
      photosBase64: null == photosBase64
          ? _self._photosBase64
          : photosBase64 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      customerFeedback: freezed == customerFeedback
          ? _self.customerFeedback
          : customerFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$UploadProofResponse {
  String get id;
  String get status;
  String get message;
  @JsonKey(name: 'uploaded_at')
  DateTime get uploadedAt;
  @JsonKey(name: 'signature_url')
  String? get signatureUrl;
  @JsonKey(name: 'photos_urls')
  List<String>? get photosUrls;

  /// Create a copy of UploadProofResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UploadProofResponseCopyWith<UploadProofResponse> get copyWith =>
      _$UploadProofResponseCopyWithImpl<UploadProofResponse>(
          this as UploadProofResponse, _$identity);

  /// Serializes this UploadProofResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UploadProofResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.signatureUrl, signatureUrl) ||
                other.signatureUrl == signatureUrl) &&
            const DeepCollectionEquality()
                .equals(other.photosUrls, photosUrls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, message, uploadedAt,
      signatureUrl, const DeepCollectionEquality().hash(photosUrls));

  @override
  String toString() {
    return 'UploadProofResponse(id: $id, status: $status, message: $message, uploadedAt: $uploadedAt, signatureUrl: $signatureUrl, photosUrls: $photosUrls)';
  }
}

/// @nodoc
abstract mixin class $UploadProofResponseCopyWith<$Res> {
  factory $UploadProofResponseCopyWith(
          UploadProofResponse value, $Res Function(UploadProofResponse) _then) =
      _$UploadProofResponseCopyWithImpl;
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
class _$UploadProofResponseCopyWithImpl<$Res>
    implements $UploadProofResponseCopyWith<$Res> {
  _$UploadProofResponseCopyWithImpl(this._self, this._then);

  final UploadProofResponse _self;
  final $Res Function(UploadProofResponse) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _self.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      signatureUrl: freezed == signatureUrl
          ? _self.signatureUrl
          : signatureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      photosUrls: freezed == photosUrls
          ? _self.photosUrls
          : photosUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UploadProofResponse].
extension UploadProofResponsePatterns on UploadProofResponse {
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
    TResult Function(_UploadProofResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadProofResponse() when $default != null:
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
    TResult Function(_UploadProofResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadProofResponse():
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
    TResult? Function(_UploadProofResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadProofResponse() when $default != null:
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
            String status,
            String message,
            @JsonKey(name: 'uploaded_at') DateTime uploadedAt,
            @JsonKey(name: 'signature_url') String? signatureUrl,
            @JsonKey(name: 'photos_urls') List<String>? photosUrls)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadProofResponse() when $default != null:
        return $default(_that.id, _that.status, _that.message, _that.uploadedAt,
            _that.signatureUrl, _that.photosUrls);
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
            String status,
            String message,
            @JsonKey(name: 'uploaded_at') DateTime uploadedAt,
            @JsonKey(name: 'signature_url') String? signatureUrl,
            @JsonKey(name: 'photos_urls') List<String>? photosUrls)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadProofResponse():
        return $default(_that.id, _that.status, _that.message, _that.uploadedAt,
            _that.signatureUrl, _that.photosUrls);
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
            String status,
            String message,
            @JsonKey(name: 'uploaded_at') DateTime uploadedAt,
            @JsonKey(name: 'signature_url') String? signatureUrl,
            @JsonKey(name: 'photos_urls') List<String>? photosUrls)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadProofResponse() when $default != null:
        return $default(_that.id, _that.status, _that.message, _that.uploadedAt,
            _that.signatureUrl, _that.photosUrls);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UploadProofResponse implements UploadProofResponse {
  const _UploadProofResponse(
      {required this.id,
      required this.status,
      required this.message,
      @JsonKey(name: 'uploaded_at') required this.uploadedAt,
      @JsonKey(name: 'signature_url') this.signatureUrl,
      @JsonKey(name: 'photos_urls') final List<String>? photosUrls})
      : _photosUrls = photosUrls;
  factory _UploadProofResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadProofResponseFromJson(json);

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

  /// Create a copy of UploadProofResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UploadProofResponseCopyWith<_UploadProofResponse> get copyWith =>
      __$UploadProofResponseCopyWithImpl<_UploadProofResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UploadProofResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UploadProofResponse &&
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

  @override
  String toString() {
    return 'UploadProofResponse(id: $id, status: $status, message: $message, uploadedAt: $uploadedAt, signatureUrl: $signatureUrl, photosUrls: $photosUrls)';
  }
}

/// @nodoc
abstract mixin class _$UploadProofResponseCopyWith<$Res>
    implements $UploadProofResponseCopyWith<$Res> {
  factory _$UploadProofResponseCopyWith(_UploadProofResponse value,
          $Res Function(_UploadProofResponse) _then) =
      __$UploadProofResponseCopyWithImpl;
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
class __$UploadProofResponseCopyWithImpl<$Res>
    implements _$UploadProofResponseCopyWith<$Res> {
  __$UploadProofResponseCopyWithImpl(this._self, this._then);

  final _UploadProofResponse _self;
  final $Res Function(_UploadProofResponse) _then;

  /// Create a copy of UploadProofResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? message = null,
    Object? uploadedAt = null,
    Object? signatureUrl = freezed,
    Object? photosUrls = freezed,
  }) {
    return _then(_UploadProofResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _self.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      signatureUrl: freezed == signatureUrl
          ? _self.signatureUrl
          : signatureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      photosUrls: freezed == photosUrls
          ? _self._photosUrls
          : photosUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
