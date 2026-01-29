// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryHistoryItem {
  String get id;
  String get orderNumber;
  String get customerName;
  String get customerAddress;
  DateTime get deliveryDate;
  DeliveryHistoryStatus get status;
  double get orderAmount;
  double? get deliveryFee;
  double? get tip;
  String? get notes;
  String? get rating;
  String? get feedback;
  DateTime? get completedAt;
  int? get deliveryDuration;

  /// Create a copy of DeliveryHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeliveryHistoryItemCopyWith<DeliveryHistoryItem> get copyWith =>
      _$DeliveryHistoryItemCopyWithImpl<DeliveryHistoryItem>(
          this as DeliveryHistoryItem, _$identity);

  /// Serializes this DeliveryHistoryItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeliveryHistoryItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerAddress, customerAddress) ||
                other.customerAddress == customerAddress) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderAmount, orderAmount) ||
                other.orderAmount == orderAmount) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.tip, tip) || other.tip == tip) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.deliveryDuration, deliveryDuration) ||
                other.deliveryDuration == deliveryDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderNumber,
      customerName,
      customerAddress,
      deliveryDate,
      status,
      orderAmount,
      deliveryFee,
      tip,
      notes,
      rating,
      feedback,
      completedAt,
      deliveryDuration);

  @override
  String toString() {
    return 'DeliveryHistoryItem(id: $id, orderNumber: $orderNumber, customerName: $customerName, customerAddress: $customerAddress, deliveryDate: $deliveryDate, status: $status, orderAmount: $orderAmount, deliveryFee: $deliveryFee, tip: $tip, notes: $notes, rating: $rating, feedback: $feedback, completedAt: $completedAt, deliveryDuration: $deliveryDuration)';
  }
}

/// @nodoc
abstract mixin class $DeliveryHistoryItemCopyWith<$Res> {
  factory $DeliveryHistoryItemCopyWith(
          DeliveryHistoryItem value, $Res Function(DeliveryHistoryItem) _then) =
      _$DeliveryHistoryItemCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String customerName,
      String customerAddress,
      DateTime deliveryDate,
      DeliveryHistoryStatus status,
      double orderAmount,
      double? deliveryFee,
      double? tip,
      String? notes,
      String? rating,
      String? feedback,
      DateTime? completedAt,
      int? deliveryDuration});
}

/// @nodoc
class _$DeliveryHistoryItemCopyWithImpl<$Res>
    implements $DeliveryHistoryItemCopyWith<$Res> {
  _$DeliveryHistoryItemCopyWithImpl(this._self, this._then);

  final DeliveryHistoryItem _self;
  final $Res Function(DeliveryHistoryItem) _then;

  /// Create a copy of DeliveryHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customerName = null,
    Object? customerAddress = null,
    Object? deliveryDate = null,
    Object? status = null,
    Object? orderAmount = null,
    Object? deliveryFee = freezed,
    Object? tip = freezed,
    Object? notes = freezed,
    Object? rating = freezed,
    Object? feedback = freezed,
    Object? completedAt = freezed,
    Object? deliveryDuration = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerAddress: null == customerAddress
          ? _self.customerAddress
          : customerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _self.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryHistoryStatus,
      orderAmount: null == orderAmount
          ? _self.orderAmount
          : orderAmount // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: freezed == deliveryFee
          ? _self.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double?,
      tip: freezed == tip
          ? _self.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      feedback: freezed == feedback
          ? _self.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryDuration: freezed == deliveryDuration
          ? _self.deliveryDuration
          : deliveryDuration // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeliveryHistoryItem].
extension DeliveryHistoryItemPatterns on DeliveryHistoryItem {
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
    TResult Function(_DeliveryHistoryItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryHistoryItem() when $default != null:
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
    TResult Function(_DeliveryHistoryItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryHistoryItem():
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
    TResult? Function(_DeliveryHistoryItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryHistoryItem() when $default != null:
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
            String orderNumber,
            String customerName,
            String customerAddress,
            DateTime deliveryDate,
            DeliveryHistoryStatus status,
            double orderAmount,
            double? deliveryFee,
            double? tip,
            String? notes,
            String? rating,
            String? feedback,
            DateTime? completedAt,
            int? deliveryDuration)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryHistoryItem() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.customerName,
            _that.customerAddress,
            _that.deliveryDate,
            _that.status,
            _that.orderAmount,
            _that.deliveryFee,
            _that.tip,
            _that.notes,
            _that.rating,
            _that.feedback,
            _that.completedAt,
            _that.deliveryDuration);
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
            String orderNumber,
            String customerName,
            String customerAddress,
            DateTime deliveryDate,
            DeliveryHistoryStatus status,
            double orderAmount,
            double? deliveryFee,
            double? tip,
            String? notes,
            String? rating,
            String? feedback,
            DateTime? completedAt,
            int? deliveryDuration)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryHistoryItem():
        return $default(
            _that.id,
            _that.orderNumber,
            _that.customerName,
            _that.customerAddress,
            _that.deliveryDate,
            _that.status,
            _that.orderAmount,
            _that.deliveryFee,
            _that.tip,
            _that.notes,
            _that.rating,
            _that.feedback,
            _that.completedAt,
            _that.deliveryDuration);
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
            String orderNumber,
            String customerName,
            String customerAddress,
            DateTime deliveryDate,
            DeliveryHistoryStatus status,
            double orderAmount,
            double? deliveryFee,
            double? tip,
            String? notes,
            String? rating,
            String? feedback,
            DateTime? completedAt,
            int? deliveryDuration)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryHistoryItem() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.customerName,
            _that.customerAddress,
            _that.deliveryDate,
            _that.status,
            _that.orderAmount,
            _that.deliveryFee,
            _that.tip,
            _that.notes,
            _that.rating,
            _that.feedback,
            _that.completedAt,
            _that.deliveryDuration);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeliveryHistoryItem extends DeliveryHistoryItem {
  const _DeliveryHistoryItem(
      {required this.id,
      required this.orderNumber,
      required this.customerName,
      required this.customerAddress,
      required this.deliveryDate,
      required this.status,
      required this.orderAmount,
      this.deliveryFee,
      this.tip,
      this.notes,
      this.rating,
      this.feedback,
      this.completedAt,
      this.deliveryDuration})
      : super._();
  factory _DeliveryHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$DeliveryHistoryItemFromJson(json);

  @override
  final String id;
  @override
  final String orderNumber;
  @override
  final String customerName;
  @override
  final String customerAddress;
  @override
  final DateTime deliveryDate;
  @override
  final DeliveryHistoryStatus status;
  @override
  final double orderAmount;
  @override
  final double? deliveryFee;
  @override
  final double? tip;
  @override
  final String? notes;
  @override
  final String? rating;
  @override
  final String? feedback;
  @override
  final DateTime? completedAt;
  @override
  final int? deliveryDuration;

  /// Create a copy of DeliveryHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeliveryHistoryItemCopyWith<_DeliveryHistoryItem> get copyWith =>
      __$DeliveryHistoryItemCopyWithImpl<_DeliveryHistoryItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeliveryHistoryItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeliveryHistoryItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerAddress, customerAddress) ||
                other.customerAddress == customerAddress) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderAmount, orderAmount) ||
                other.orderAmount == orderAmount) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.tip, tip) || other.tip == tip) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.deliveryDuration, deliveryDuration) ||
                other.deliveryDuration == deliveryDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderNumber,
      customerName,
      customerAddress,
      deliveryDate,
      status,
      orderAmount,
      deliveryFee,
      tip,
      notes,
      rating,
      feedback,
      completedAt,
      deliveryDuration);

  @override
  String toString() {
    return 'DeliveryHistoryItem(id: $id, orderNumber: $orderNumber, customerName: $customerName, customerAddress: $customerAddress, deliveryDate: $deliveryDate, status: $status, orderAmount: $orderAmount, deliveryFee: $deliveryFee, tip: $tip, notes: $notes, rating: $rating, feedback: $feedback, completedAt: $completedAt, deliveryDuration: $deliveryDuration)';
  }
}

/// @nodoc
abstract mixin class _$DeliveryHistoryItemCopyWith<$Res>
    implements $DeliveryHistoryItemCopyWith<$Res> {
  factory _$DeliveryHistoryItemCopyWith(_DeliveryHistoryItem value,
          $Res Function(_DeliveryHistoryItem) _then) =
      __$DeliveryHistoryItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String customerName,
      String customerAddress,
      DateTime deliveryDate,
      DeliveryHistoryStatus status,
      double orderAmount,
      double? deliveryFee,
      double? tip,
      String? notes,
      String? rating,
      String? feedback,
      DateTime? completedAt,
      int? deliveryDuration});
}

/// @nodoc
class __$DeliveryHistoryItemCopyWithImpl<$Res>
    implements _$DeliveryHistoryItemCopyWith<$Res> {
  __$DeliveryHistoryItemCopyWithImpl(this._self, this._then);

  final _DeliveryHistoryItem _self;
  final $Res Function(_DeliveryHistoryItem) _then;

  /// Create a copy of DeliveryHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customerName = null,
    Object? customerAddress = null,
    Object? deliveryDate = null,
    Object? status = null,
    Object? orderAmount = null,
    Object? deliveryFee = freezed,
    Object? tip = freezed,
    Object? notes = freezed,
    Object? rating = freezed,
    Object? feedback = freezed,
    Object? completedAt = freezed,
    Object? deliveryDuration = freezed,
  }) {
    return _then(_DeliveryHistoryItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerAddress: null == customerAddress
          ? _self.customerAddress
          : customerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _self.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryHistoryStatus,
      orderAmount: null == orderAmount
          ? _self.orderAmount
          : orderAmount // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: freezed == deliveryFee
          ? _self.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double?,
      tip: freezed == tip
          ? _self.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      feedback: freezed == feedback
          ? _self.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryDuration: freezed == deliveryDuration
          ? _self.deliveryDuration
          : deliveryDuration // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
