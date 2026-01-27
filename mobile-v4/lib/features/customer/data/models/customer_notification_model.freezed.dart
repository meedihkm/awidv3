// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerNotificationModel _$CustomerNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _CustomerNotificationModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerNotificationModel {
  String get id => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;
  String? get priority => throw _privateConstructorUsedError;
  String? get actionUrl => throw _privateConstructorUsedError;
  String? get actionLabel => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  String? get relatedOrderId => throw _privateConstructorUsedError;
  String? get relatedDeliveryId => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this CustomerNotificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerNotificationModelCopyWith<CustomerNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerNotificationModelCopyWith<$Res> {
  factory $CustomerNotificationModelCopyWith(CustomerNotificationModel value,
          $Res Function(CustomerNotificationModel) then) =
      _$CustomerNotificationModelCopyWithImpl<$Res, CustomerNotificationModel>;
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
class _$CustomerNotificationModelCopyWithImpl<$Res,
        $Val extends CustomerNotificationModel>
    implements $CustomerNotificationModelCopyWith<$Res> {
  _$CustomerNotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionLabel: freezed == actionLabel
          ? _value.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      relatedOrderId: freezed == relatedOrderId
          ? _value.relatedOrderId
          : relatedOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedDeliveryId: freezed == relatedDeliveryId
          ? _value.relatedDeliveryId
          : relatedDeliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerNotificationModelImplCopyWith<$Res>
    implements $CustomerNotificationModelCopyWith<$Res> {
  factory _$$CustomerNotificationModelImplCopyWith(
          _$CustomerNotificationModelImpl value,
          $Res Function(_$CustomerNotificationModelImpl) then) =
      __$$CustomerNotificationModelImplCopyWithImpl<$Res>;
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
class __$$CustomerNotificationModelImplCopyWithImpl<$Res>
    extends _$CustomerNotificationModelCopyWithImpl<$Res,
        _$CustomerNotificationModelImpl>
    implements _$$CustomerNotificationModelImplCopyWith<$Res> {
  __$$CustomerNotificationModelImplCopyWithImpl(
      _$CustomerNotificationModelImpl _value,
      $Res Function(_$CustomerNotificationModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$CustomerNotificationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionLabel: freezed == actionLabel
          ? _value.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      relatedOrderId: freezed == relatedOrderId
          ? _value.relatedOrderId
          : relatedOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedDeliveryId: freezed == relatedDeliveryId
          ? _value.relatedDeliveryId
          : relatedDeliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerNotificationModelImpl implements _CustomerNotificationModel {
  const _$CustomerNotificationModelImpl(
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

  factory _$CustomerNotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerNotificationModelImplFromJson(json);

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

  @override
  String toString() {
    return 'CustomerNotificationModel(id: $id, customerId: $customerId, type: $type, title: $title, message: $message, createdAt: $createdAt, isRead: $isRead, readAt: $readAt, priority: $priority, actionUrl: $actionUrl, actionLabel: $actionLabel, data: $data, relatedOrderId: $relatedOrderId, relatedDeliveryId: $relatedDeliveryId, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerNotificationModelImpl &&
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

  /// Create a copy of CustomerNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerNotificationModelImplCopyWith<_$CustomerNotificationModelImpl>
      get copyWith => __$$CustomerNotificationModelImplCopyWithImpl<
          _$CustomerNotificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerNotificationModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerNotificationModel implements CustomerNotificationModel {
  const factory _CustomerNotificationModel(
      {required final String id,
      required final String customerId,
      required final String type,
      required final String title,
      required final String message,
      required final DateTime createdAt,
      final bool isRead,
      final DateTime? readAt,
      final String? priority,
      final String? actionUrl,
      final String? actionLabel,
      final Map<String, dynamic>? data,
      final String? relatedOrderId,
      final String? relatedDeliveryId,
      final String? imageUrl}) = _$CustomerNotificationModelImpl;

  factory _CustomerNotificationModel.fromJson(Map<String, dynamic> json) =
      _$CustomerNotificationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get customerId;
  @override
  String get type;
  @override
  String get title;
  @override
  String get message;
  @override
  DateTime get createdAt;
  @override
  bool get isRead;
  @override
  DateTime? get readAt;
  @override
  String? get priority;
  @override
  String? get actionUrl;
  @override
  String? get actionLabel;
  @override
  Map<String, dynamic>? get data;
  @override
  String? get relatedOrderId;
  @override
  String? get relatedDeliveryId;
  @override
  String? get imageUrl;

  /// Create a copy of CustomerNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerNotificationModelImplCopyWith<_$CustomerNotificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
