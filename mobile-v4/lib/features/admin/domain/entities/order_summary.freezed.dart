// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderSummary {
  String get id;
  String get customerName;
  String get customerOrganization;
  String get status;
  double get totalAmount;
  int get itemsCount;
  DateTime get createdAt;
  String? get delivererName;
  DateTime? get deliveryTime;

  /// Create a copy of OrderSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderSummaryCopyWith<OrderSummary> get copyWith =>
      _$OrderSummaryCopyWithImpl<OrderSummary>(
          this as OrderSummary, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderSummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerOrganization, customerOrganization) ||
                other.customerOrganization == customerOrganization) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.delivererName, delivererName) ||
                other.delivererName == delivererName) &&
            (identical(other.deliveryTime, deliveryTime) ||
                other.deliveryTime == deliveryTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerName,
      customerOrganization,
      status,
      totalAmount,
      itemsCount,
      createdAt,
      delivererName,
      deliveryTime);

  @override
  String toString() {
    return 'OrderSummary(id: $id, customerName: $customerName, customerOrganization: $customerOrganization, status: $status, totalAmount: $totalAmount, itemsCount: $itemsCount, createdAt: $createdAt, delivererName: $delivererName, deliveryTime: $deliveryTime)';
  }
}

/// @nodoc
abstract mixin class $OrderSummaryCopyWith<$Res> {
  factory $OrderSummaryCopyWith(
          OrderSummary value, $Res Function(OrderSummary) _then) =
      _$OrderSummaryCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String customerName,
      String customerOrganization,
      String status,
      double totalAmount,
      int itemsCount,
      DateTime createdAt,
      String? delivererName,
      DateTime? deliveryTime});
}

/// @nodoc
class _$OrderSummaryCopyWithImpl<$Res> implements $OrderSummaryCopyWith<$Res> {
  _$OrderSummaryCopyWithImpl(this._self, this._then);

  final OrderSummary _self;
  final $Res Function(OrderSummary) _then;

  /// Create a copy of OrderSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerName = null,
    Object? customerOrganization = null,
    Object? status = null,
    Object? totalAmount = null,
    Object? itemsCount = null,
    Object? createdAt = null,
    Object? delivererName = freezed,
    Object? deliveryTime = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerOrganization: null == customerOrganization
          ? _self.customerOrganization
          : customerOrganization // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      itemsCount: null == itemsCount
          ? _self.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      delivererName: freezed == delivererName
          ? _self.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryTime: freezed == deliveryTime
          ? _self.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderSummary].
extension OrderSummaryPatterns on OrderSummary {
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
    TResult Function(_OrderSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderSummary() when $default != null:
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
    TResult Function(_OrderSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderSummary():
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
    TResult? Function(_OrderSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderSummary() when $default != null:
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
            String customerName,
            String customerOrganization,
            String status,
            double totalAmount,
            int itemsCount,
            DateTime createdAt,
            String? delivererName,
            DateTime? deliveryTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderSummary() when $default != null:
        return $default(
            _that.id,
            _that.customerName,
            _that.customerOrganization,
            _that.status,
            _that.totalAmount,
            _that.itemsCount,
            _that.createdAt,
            _that.delivererName,
            _that.deliveryTime);
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
            String customerName,
            String customerOrganization,
            String status,
            double totalAmount,
            int itemsCount,
            DateTime createdAt,
            String? delivererName,
            DateTime? deliveryTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderSummary():
        return $default(
            _that.id,
            _that.customerName,
            _that.customerOrganization,
            _that.status,
            _that.totalAmount,
            _that.itemsCount,
            _that.createdAt,
            _that.delivererName,
            _that.deliveryTime);
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
            String customerName,
            String customerOrganization,
            String status,
            double totalAmount,
            int itemsCount,
            DateTime createdAt,
            String? delivererName,
            DateTime? deliveryTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderSummary() when $default != null:
        return $default(
            _that.id,
            _that.customerName,
            _that.customerOrganization,
            _that.status,
            _that.totalAmount,
            _that.itemsCount,
            _that.createdAt,
            _that.delivererName,
            _that.deliveryTime);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrderSummary extends OrderSummary {
  const _OrderSummary(
      {required this.id,
      required this.customerName,
      required this.customerOrganization,
      required this.status,
      required this.totalAmount,
      required this.itemsCount,
      required this.createdAt,
      this.delivererName,
      this.deliveryTime})
      : super._();

  @override
  final String id;
  @override
  final String customerName;
  @override
  final String customerOrganization;
  @override
  final String status;
  @override
  final double totalAmount;
  @override
  final int itemsCount;
  @override
  final DateTime createdAt;
  @override
  final String? delivererName;
  @override
  final DateTime? deliveryTime;

  /// Create a copy of OrderSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderSummaryCopyWith<_OrderSummary> get copyWith =>
      __$OrderSummaryCopyWithImpl<_OrderSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderSummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerOrganization, customerOrganization) ||
                other.customerOrganization == customerOrganization) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.delivererName, delivererName) ||
                other.delivererName == delivererName) &&
            (identical(other.deliveryTime, deliveryTime) ||
                other.deliveryTime == deliveryTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerName,
      customerOrganization,
      status,
      totalAmount,
      itemsCount,
      createdAt,
      delivererName,
      deliveryTime);

  @override
  String toString() {
    return 'OrderSummary(id: $id, customerName: $customerName, customerOrganization: $customerOrganization, status: $status, totalAmount: $totalAmount, itemsCount: $itemsCount, createdAt: $createdAt, delivererName: $delivererName, deliveryTime: $deliveryTime)';
  }
}

/// @nodoc
abstract mixin class _$OrderSummaryCopyWith<$Res>
    implements $OrderSummaryCopyWith<$Res> {
  factory _$OrderSummaryCopyWith(
          _OrderSummary value, $Res Function(_OrderSummary) _then) =
      __$OrderSummaryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String customerName,
      String customerOrganization,
      String status,
      double totalAmount,
      int itemsCount,
      DateTime createdAt,
      String? delivererName,
      DateTime? deliveryTime});
}

/// @nodoc
class __$OrderSummaryCopyWithImpl<$Res>
    implements _$OrderSummaryCopyWith<$Res> {
  __$OrderSummaryCopyWithImpl(this._self, this._then);

  final _OrderSummary _self;
  final $Res Function(_OrderSummary) _then;

  /// Create a copy of OrderSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? customerName = null,
    Object? customerOrganization = null,
    Object? status = null,
    Object? totalAmount = null,
    Object? itemsCount = null,
    Object? createdAt = null,
    Object? delivererName = freezed,
    Object? deliveryTime = freezed,
  }) {
    return _then(_OrderSummary(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerOrganization: null == customerOrganization
          ? _self.customerOrganization
          : customerOrganization // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      itemsCount: null == itemsCount
          ? _self.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      delivererName: freezed == delivererName
          ? _self.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryTime: freezed == deliveryTime
          ? _self.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
