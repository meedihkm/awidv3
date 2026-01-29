// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unpaid_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnpaidOrder {
  String get orderId;
  String get orderNumber;
  DateTime get orderDate;
  double get totalAmount;
  double get paidAmount;
  double get remainingAmount;
  String? get notes;

  /// Create a copy of UnpaidOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnpaidOrderCopyWith<UnpaidOrder> get copyWith =>
      _$UnpaidOrderCopyWithImpl<UnpaidOrder>(this as UnpaidOrder, _$identity);

  /// Serializes this UnpaidOrder to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnpaidOrder &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, orderNumber, orderDate,
      totalAmount, paidAmount, remainingAmount, notes);

  @override
  String toString() {
    return 'UnpaidOrder(orderId: $orderId, orderNumber: $orderNumber, orderDate: $orderDate, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $UnpaidOrderCopyWith<$Res> {
  factory $UnpaidOrderCopyWith(
          UnpaidOrder value, $Res Function(UnpaidOrder) _then) =
      _$UnpaidOrderCopyWithImpl;
  @useResult
  $Res call(
      {String orderId,
      String orderNumber,
      DateTime orderDate,
      double totalAmount,
      double paidAmount,
      double remainingAmount,
      String? notes});
}

/// @nodoc
class _$UnpaidOrderCopyWithImpl<$Res> implements $UnpaidOrderCopyWith<$Res> {
  _$UnpaidOrderCopyWithImpl(this._self, this._then);

  final UnpaidOrder _self;
  final $Res Function(UnpaidOrder) _then;

  /// Create a copy of UnpaidOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderNumber = null,
    Object? orderDate = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingAmount: null == remainingAmount
          ? _self.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UnpaidOrder].
extension UnpaidOrderPatterns on UnpaidOrder {
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
    TResult Function(_UnpaidOrder value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UnpaidOrder() when $default != null:
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
    TResult Function(_UnpaidOrder value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnpaidOrder():
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
    TResult? Function(_UnpaidOrder value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnpaidOrder() when $default != null:
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
            String orderId,
            String orderNumber,
            DateTime orderDate,
            double totalAmount,
            double paidAmount,
            double remainingAmount,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UnpaidOrder() when $default != null:
        return $default(
            _that.orderId,
            _that.orderNumber,
            _that.orderDate,
            _that.totalAmount,
            _that.paidAmount,
            _that.remainingAmount,
            _that.notes);
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
            String orderId,
            String orderNumber,
            DateTime orderDate,
            double totalAmount,
            double paidAmount,
            double remainingAmount,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnpaidOrder():
        return $default(
            _that.orderId,
            _that.orderNumber,
            _that.orderDate,
            _that.totalAmount,
            _that.paidAmount,
            _that.remainingAmount,
            _that.notes);
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
            String orderId,
            String orderNumber,
            DateTime orderDate,
            double totalAmount,
            double paidAmount,
            double remainingAmount,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnpaidOrder() when $default != null:
        return $default(
            _that.orderId,
            _that.orderNumber,
            _that.orderDate,
            _that.totalAmount,
            _that.paidAmount,
            _that.remainingAmount,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UnpaidOrder extends UnpaidOrder {
  const _UnpaidOrder(
      {required this.orderId,
      required this.orderNumber,
      required this.orderDate,
      required this.totalAmount,
      required this.paidAmount,
      required this.remainingAmount,
      this.notes})
      : super._();
  factory _UnpaidOrder.fromJson(Map<String, dynamic> json) =>
      _$UnpaidOrderFromJson(json);

  @override
  final String orderId;
  @override
  final String orderNumber;
  @override
  final DateTime orderDate;
  @override
  final double totalAmount;
  @override
  final double paidAmount;
  @override
  final double remainingAmount;
  @override
  final String? notes;

  /// Create a copy of UnpaidOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UnpaidOrderCopyWith<_UnpaidOrder> get copyWith =>
      __$UnpaidOrderCopyWithImpl<_UnpaidOrder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UnpaidOrderToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnpaidOrder &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, orderNumber, orderDate,
      totalAmount, paidAmount, remainingAmount, notes);

  @override
  String toString() {
    return 'UnpaidOrder(orderId: $orderId, orderNumber: $orderNumber, orderDate: $orderDate, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$UnpaidOrderCopyWith<$Res>
    implements $UnpaidOrderCopyWith<$Res> {
  factory _$UnpaidOrderCopyWith(
          _UnpaidOrder value, $Res Function(_UnpaidOrder) _then) =
      __$UnpaidOrderCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String orderId,
      String orderNumber,
      DateTime orderDate,
      double totalAmount,
      double paidAmount,
      double remainingAmount,
      String? notes});
}

/// @nodoc
class __$UnpaidOrderCopyWithImpl<$Res> implements _$UnpaidOrderCopyWith<$Res> {
  __$UnpaidOrderCopyWithImpl(this._self, this._then);

  final _UnpaidOrder _self;
  final $Res Function(_UnpaidOrder) _then;

  /// Create a copy of UnpaidOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orderId = null,
    Object? orderNumber = null,
    Object? orderDate = null,
    Object? totalAmount = null,
    Object? paidAmount = null,
    Object? remainingAmount = null,
    Object? notes = freezed,
  }) {
    return _then(_UnpaidOrder(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paidAmount: null == paidAmount
          ? _self.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingAmount: null == remainingAmount
          ? _self.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ManualAllocation {
  String get orderId;
  double get amount;

  /// Create a copy of ManualAllocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ManualAllocationCopyWith<ManualAllocation> get copyWith =>
      _$ManualAllocationCopyWithImpl<ManualAllocation>(
          this as ManualAllocation, _$identity);

  /// Serializes this ManualAllocation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ManualAllocation &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, amount);

  @override
  String toString() {
    return 'ManualAllocation(orderId: $orderId, amount: $amount)';
  }
}

/// @nodoc
abstract mixin class $ManualAllocationCopyWith<$Res> {
  factory $ManualAllocationCopyWith(
          ManualAllocation value, $Res Function(ManualAllocation) _then) =
      _$ManualAllocationCopyWithImpl;
  @useResult
  $Res call({String orderId, double amount});
}

/// @nodoc
class _$ManualAllocationCopyWithImpl<$Res>
    implements $ManualAllocationCopyWith<$Res> {
  _$ManualAllocationCopyWithImpl(this._self, this._then);

  final ManualAllocation _self;
  final $Res Function(ManualAllocation) _then;

  /// Create a copy of ManualAllocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? amount = null,
  }) {
    return _then(_self.copyWith(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [ManualAllocation].
extension ManualAllocationPatterns on ManualAllocation {
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
    TResult Function(_ManualAllocation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManualAllocation() when $default != null:
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
    TResult Function(_ManualAllocation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManualAllocation():
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
    TResult? Function(_ManualAllocation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManualAllocation() when $default != null:
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
    TResult Function(String orderId, double amount)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManualAllocation() when $default != null:
        return $default(_that.orderId, _that.amount);
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
    TResult Function(String orderId, double amount) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManualAllocation():
        return $default(_that.orderId, _that.amount);
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
    TResult? Function(String orderId, double amount)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManualAllocation() when $default != null:
        return $default(_that.orderId, _that.amount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ManualAllocation implements ManualAllocation {
  const _ManualAllocation({required this.orderId, required this.amount});
  factory _ManualAllocation.fromJson(Map<String, dynamic> json) =>
      _$ManualAllocationFromJson(json);

  @override
  final String orderId;
  @override
  final double amount;

  /// Create a copy of ManualAllocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ManualAllocationCopyWith<_ManualAllocation> get copyWith =>
      __$ManualAllocationCopyWithImpl<_ManualAllocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ManualAllocationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ManualAllocation &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, amount);

  @override
  String toString() {
    return 'ManualAllocation(orderId: $orderId, amount: $amount)';
  }
}

/// @nodoc
abstract mixin class _$ManualAllocationCopyWith<$Res>
    implements $ManualAllocationCopyWith<$Res> {
  factory _$ManualAllocationCopyWith(
          _ManualAllocation value, $Res Function(_ManualAllocation) _then) =
      __$ManualAllocationCopyWithImpl;
  @override
  @useResult
  $Res call({String orderId, double amount});
}

/// @nodoc
class __$ManualAllocationCopyWithImpl<$Res>
    implements _$ManualAllocationCopyWith<$Res> {
  __$ManualAllocationCopyWithImpl(this._self, this._then);

  final _ManualAllocation _self;
  final $Res Function(_ManualAllocation) _then;

  /// Create a copy of ManualAllocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orderId = null,
    Object? amount = null,
  }) {
    return _then(_ManualAllocation(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
