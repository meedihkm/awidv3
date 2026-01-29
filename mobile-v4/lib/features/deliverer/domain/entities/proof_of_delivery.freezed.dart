// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proof_of_delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProofOfDelivery {
  String get id;
  String get deliveryId;
  String get delivererId;
  String get customerId;
  DateTime get timestamp;
  double get latitude;
  double get longitude;
  String get signatoryName;
  String get signatureImagePath;
  List<String> get photosPaths;
  String? get notes;
  String? get customerFeedback;
  bool get isUploaded;
  DateTime? get uploadedAt;
  DateTime? get createdAt;

  /// Create a copy of ProofOfDelivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProofOfDeliveryCopyWith<ProofOfDelivery> get copyWith =>
      _$ProofOfDeliveryCopyWithImpl<ProofOfDelivery>(
          this as ProofOfDelivery, _$identity);

  /// Serializes this ProofOfDelivery to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProofOfDelivery &&
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
    return 'ProofOfDelivery(id: $id, deliveryId: $deliveryId, delivererId: $delivererId, customerId: $customerId, timestamp: $timestamp, latitude: $latitude, longitude: $longitude, signatoryName: $signatoryName, signatureImagePath: $signatureImagePath, photosPaths: $photosPaths, notes: $notes, customerFeedback: $customerFeedback, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $ProofOfDeliveryCopyWith<$Res> {
  factory $ProofOfDeliveryCopyWith(
          ProofOfDelivery value, $Res Function(ProofOfDelivery) _then) =
      _$ProofOfDeliveryCopyWithImpl;
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
class _$ProofOfDeliveryCopyWithImpl<$Res>
    implements $ProofOfDeliveryCopyWith<$Res> {
  _$ProofOfDeliveryCopyWithImpl(this._self, this._then);

  final ProofOfDelivery _self;
  final $Res Function(ProofOfDelivery) _then;

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

/// Adds pattern-matching-related methods to [ProofOfDelivery].
extension ProofOfDeliveryPatterns on ProofOfDelivery {
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
    TResult Function(_ProofOfDelivery value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProofOfDelivery() when $default != null:
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
    TResult Function(_ProofOfDelivery value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProofOfDelivery():
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
    TResult? Function(_ProofOfDelivery value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProofOfDelivery() when $default != null:
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
            DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProofOfDelivery() when $default != null:
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
            DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProofOfDelivery():
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
            DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProofOfDelivery() when $default != null:
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
class _ProofOfDelivery implements ProofOfDelivery {
  const _ProofOfDelivery(
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
  factory _ProofOfDelivery.fromJson(Map<String, dynamic> json) =>
      _$ProofOfDeliveryFromJson(json);

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

  /// Create a copy of ProofOfDelivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProofOfDeliveryCopyWith<_ProofOfDelivery> get copyWith =>
      __$ProofOfDeliveryCopyWithImpl<_ProofOfDelivery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProofOfDeliveryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProofOfDelivery &&
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
    return 'ProofOfDelivery(id: $id, deliveryId: $deliveryId, delivererId: $delivererId, customerId: $customerId, timestamp: $timestamp, latitude: $latitude, longitude: $longitude, signatoryName: $signatoryName, signatureImagePath: $signatureImagePath, photosPaths: $photosPaths, notes: $notes, customerFeedback: $customerFeedback, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$ProofOfDeliveryCopyWith<$Res>
    implements $ProofOfDeliveryCopyWith<$Res> {
  factory _$ProofOfDeliveryCopyWith(
          _ProofOfDelivery value, $Res Function(_ProofOfDelivery) _then) =
      __$ProofOfDeliveryCopyWithImpl;
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
class __$ProofOfDeliveryCopyWithImpl<$Res>
    implements _$ProofOfDeliveryCopyWith<$Res> {
  __$ProofOfDeliveryCopyWithImpl(this._self, this._then);

  final _ProofOfDelivery _self;
  final $Res Function(_ProofOfDelivery) _then;

  /// Create a copy of ProofOfDelivery
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
    return _then(_ProofOfDelivery(
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

// dart format on
