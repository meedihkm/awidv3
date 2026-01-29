// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerNotificationModel {
  String get id;
  String get customerId;
  String get type;
  String get title;
  String get message;
  DateTime get createdAt;
  bool get isRead;
  DateTime? get readAt;
  String? get priority;
  String? get actionUrl;
  String? get actionLabel;
  Map<String, dynamic>? get data;
  String? get relatedOrderId;
  String? get relatedDeliveryId;
  String? get imageUrl;

  /// Create a copy of CustomerNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerNotificationModelCopyWith<CustomerNotificationModel> get copyWith =>
      _$CustomerNotificationModelCopyWithImpl<CustomerNotificationModel>(
          this as CustomerNotificationModel, _$identity);

  /// Serializes this CustomerNotificationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerNotificationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.actionLabel, actionLabel) ||
                other.actionLabel == actionLabel) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.relatedOrderId, relatedOrderId) ||
                other.relatedOrderId == relatedOrderId) &&
            (identical(other.relatedDeliveryId, relatedDeliveryId) ||
                other.relatedDeliveryId == relatedDeliveryId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerId,
      type,
      title,
      message,
      createdAt,
      isRead,
      readAt,
      priority,
      actionUrl,
      actionLabel,
      const DeepCollectionEquality().hash(data),
      relatedOrderId,
      relatedDeliveryId,
      imageUrl);

  @override
  String toString() {
    return 'CustomerNotificationModel(id: $id, customerId: $customerId, type: $type, title: $title, message: $message, createdAt: $createdAt, isRead: $isRead, readAt: $readAt, priority: $priority, actionUrl: $actionUrl, actionLabel: $actionLabel, data: $data, relatedOrderId: $relatedOrderId, relatedDeliveryId: $relatedDeliveryId, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $CustomerNotificationModelCopyWith<$Res> {
  factory $CustomerNotificationModelCopyWith(CustomerNotificationModel value,
          $Res Function(CustomerNotificationModel) _then) =
      _$CustomerNotificationModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String customerId,
      String type,
      String title,
      String message,
      DateTime createdAt,
      bool isRead,
      DateTime? readAt,
      String? priority,
      String? actionUrl,
      String? actionLabel,
      Map<String, dynamic>? data,
      String? relatedOrderId,
      String? relatedDeliveryId,
      String? imageUrl});
}

/// @nodoc
class _$CustomerNotificationModelCopyWithImpl<$Res>
    implements $CustomerNotificationModelCopyWith<$Res> {
  _$CustomerNotificationModelCopyWithImpl(this._self, this._then);

  final CustomerNotificationModel _self;
  final $Res Function(CustomerNotificationModel) _then;

  /// Create a copy of CustomerNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? createdAt = null,
    Object? isRead = null,
    Object? readAt = freezed,
    Object? priority = freezed,
    Object? actionUrl = freezed,
    Object? actionLabel = freezed,
    Object? data = freezed,
    Object? relatedOrderId = freezed,
    Object? relatedDeliveryId = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      readAt: freezed == readAt
          ? _self.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _self.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionLabel: freezed == actionLabel
          ? _self.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      relatedOrderId: freezed == relatedOrderId
          ? _self.relatedOrderId
          : relatedOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedDeliveryId: freezed == relatedDeliveryId
          ? _self.relatedDeliveryId
          : relatedDeliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerNotificationModel].
extension CustomerNotificationModelPatterns on CustomerNotificationModel {
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
    TResult Function(_CustomerNotificationModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerNotificationModel() when $default != null:
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
    TResult Function(_CustomerNotificationModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerNotificationModel():
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
    TResult? Function(_CustomerNotificationModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerNotificationModel() when $default != null:
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
            String customerId,
            String type,
            String title,
            String message,
            DateTime createdAt,
            bool isRead,
            DateTime? readAt,
            String? priority,
            String? actionUrl,
            String? actionLabel,
            Map<String, dynamic>? data,
            String? relatedOrderId,
            String? relatedDeliveryId,
            String? imageUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerNotificationModel() when $default != null:
        return $default(
            _that.id,
            _that.customerId,
            _that.type,
            _that.title,
            _that.message,
            _that.createdAt,
            _that.isRead,
            _that.readAt,
            _that.priority,
            _that.actionUrl,
            _that.actionLabel,
            _that.data,
            _that.relatedOrderId,
            _that.relatedDeliveryId,
            _that.imageUrl);
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
            String customerId,
            String type,
            String title,
            String message,
            DateTime createdAt,
            bool isRead,
            DateTime? readAt,
            String? priority,
            String? actionUrl,
            String? actionLabel,
            Map<String, dynamic>? data,
            String? relatedOrderId,
            String? relatedDeliveryId,
            String? imageUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerNotificationModel():
        return $default(
            _that.id,
            _that.customerId,
            _that.type,
            _that.title,
            _that.message,
            _that.createdAt,
            _that.isRead,
            _that.readAt,
            _that.priority,
            _that.actionUrl,
            _that.actionLabel,
            _that.data,
            _that.relatedOrderId,
            _that.relatedDeliveryId,
            _that.imageUrl);
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
            String customerId,
            String type,
            String title,
            String message,
            DateTime createdAt,
            bool isRead,
            DateTime? readAt,
            String? priority,
            String? actionUrl,
            String? actionLabel,
            Map<String, dynamic>? data,
            String? relatedOrderId,
            String? relatedDeliveryId,
            String? imageUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerNotificationModel() when $default != null:
        return $default(
            _that.id,
            _that.customerId,
            _that.type,
            _that.title,
            _that.message,
            _that.createdAt,
            _that.isRead,
            _that.readAt,
            _that.priority,
            _that.actionUrl,
            _that.actionLabel,
            _that.data,
            _that.relatedOrderId,
            _that.relatedDeliveryId,
            _that.imageUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerNotificationModel implements CustomerNotificationModel {
  const _CustomerNotificationModel(
      {required this.id,
      required this.customerId,
      required this.type,
      required this.title,
      required this.message,
      required this.createdAt,
      this.isRead = false,
      this.readAt,
      this.priority,
      this.actionUrl,
      this.actionLabel,
      final Map<String, dynamic>? data,
      this.relatedOrderId,
      this.relatedDeliveryId,
      this.imageUrl})
      : _data = data;
  factory _CustomerNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerNotificationModelFromJson(json);

  @override
  final String id;
  @override
  final String customerId;
  @override
  final String type;
  @override
  final String title;
  @override
  final String message;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isRead;
  @override
  final DateTime? readAt;
  @override
  final String? priority;
  @override
  final String? actionUrl;
  @override
  final String? actionLabel;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? relatedOrderId;
  @override
  final String? relatedDeliveryId;
  @override
  final String? imageUrl;

  /// Create a copy of CustomerNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerNotificationModelCopyWith<_CustomerNotificationModel>
      get copyWith =>
          __$CustomerNotificationModelCopyWithImpl<_CustomerNotificationModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerNotificationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerNotificationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.actionLabel, actionLabel) ||
                other.actionLabel == actionLabel) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.relatedOrderId, relatedOrderId) ||
                other.relatedOrderId == relatedOrderId) &&
            (identical(other.relatedDeliveryId, relatedDeliveryId) ||
                other.relatedDeliveryId == relatedDeliveryId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerId,
      type,
      title,
      message,
      createdAt,
      isRead,
      readAt,
      priority,
      actionUrl,
      actionLabel,
      const DeepCollectionEquality().hash(_data),
      relatedOrderId,
      relatedDeliveryId,
      imageUrl);

  @override
  String toString() {
    return 'CustomerNotificationModel(id: $id, customerId: $customerId, type: $type, title: $title, message: $message, createdAt: $createdAt, isRead: $isRead, readAt: $readAt, priority: $priority, actionUrl: $actionUrl, actionLabel: $actionLabel, data: $data, relatedOrderId: $relatedOrderId, relatedDeliveryId: $relatedDeliveryId, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$CustomerNotificationModelCopyWith<$Res>
    implements $CustomerNotificationModelCopyWith<$Res> {
  factory _$CustomerNotificationModelCopyWith(_CustomerNotificationModel value,
          $Res Function(_CustomerNotificationModel) _then) =
      __$CustomerNotificationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String customerId,
      String type,
      String title,
      String message,
      DateTime createdAt,
      bool isRead,
      DateTime? readAt,
      String? priority,
      String? actionUrl,
      String? actionLabel,
      Map<String, dynamic>? data,
      String? relatedOrderId,
      String? relatedDeliveryId,
      String? imageUrl});
}

/// @nodoc
class __$CustomerNotificationModelCopyWithImpl<$Res>
    implements _$CustomerNotificationModelCopyWith<$Res> {
  __$CustomerNotificationModelCopyWithImpl(this._self, this._then);

  final _CustomerNotificationModel _self;
  final $Res Function(_CustomerNotificationModel) _then;

  /// Create a copy of CustomerNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? createdAt = null,
    Object? isRead = null,
    Object? readAt = freezed,
    Object? priority = freezed,
    Object? actionUrl = freezed,
    Object? actionLabel = freezed,
    Object? data = freezed,
    Object? relatedOrderId = freezed,
    Object? relatedDeliveryId = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_CustomerNotificationModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      readAt: freezed == readAt
          ? _self.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _self.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionLabel: freezed == actionLabel
          ? _self.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      relatedOrderId: freezed == relatedOrderId
          ? _self.relatedOrderId
          : relatedOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedDeliveryId: freezed == relatedDeliveryId
          ? _self.relatedDeliveryId
          : relatedDeliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
