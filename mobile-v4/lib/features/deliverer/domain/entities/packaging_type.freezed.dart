// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'packaging_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackagingType {
  String get id;
  String get name;
  double get unitValue;
  String? get description;
  String? get imageUrl;
  bool get isActive;

  /// Create a copy of PackagingType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PackagingTypeCopyWith<PackagingType> get copyWith =>
      _$PackagingTypeCopyWithImpl<PackagingType>(
          this as PackagingType, _$identity);

  /// Serializes this PackagingType to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PackagingType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unitValue, unitValue) ||
                other.unitValue == unitValue) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, unitValue, description, imageUrl, isActive);

  @override
  String toString() {
    return 'PackagingType(id: $id, name: $name, unitValue: $unitValue, description: $description, imageUrl: $imageUrl, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class $PackagingTypeCopyWith<$Res> {
  factory $PackagingTypeCopyWith(
          PackagingType value, $Res Function(PackagingType) _then) =
      _$PackagingTypeCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      double unitValue,
      String? description,
      String? imageUrl,
      bool isActive});
}

/// @nodoc
class _$PackagingTypeCopyWithImpl<$Res>
    implements $PackagingTypeCopyWith<$Res> {
  _$PackagingTypeCopyWithImpl(this._self, this._then);

  final PackagingType _self;
  final $Res Function(PackagingType) _then;

  /// Create a copy of PackagingType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? unitValue = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? isActive = null,
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
      unitValue: null == unitValue
          ? _self.unitValue
          : unitValue // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PackagingType].
extension PackagingTypePatterns on PackagingType {
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
    TResult Function(_PackagingType value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingType() when $default != null:
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
    TResult Function(_PackagingType value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingType():
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
    TResult? Function(_PackagingType value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingType() when $default != null:
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
    TResult Function(String id, String name, double unitValue,
            String? description, String? imageUrl, bool isActive)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingType() when $default != null:
        return $default(_that.id, _that.name, _that.unitValue,
            _that.description, _that.imageUrl, _that.isActive);
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
    TResult Function(String id, String name, double unitValue,
            String? description, String? imageUrl, bool isActive)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingType():
        return $default(_that.id, _that.name, _that.unitValue,
            _that.description, _that.imageUrl, _that.isActive);
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
    TResult? Function(String id, String name, double unitValue,
            String? description, String? imageUrl, bool isActive)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingType() when $default != null:
        return $default(_that.id, _that.name, _that.unitValue,
            _that.description, _that.imageUrl, _that.isActive);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PackagingType extends PackagingType {
  const _PackagingType(
      {required this.id,
      required this.name,
      required this.unitValue,
      this.description,
      this.imageUrl,
      this.isActive = true})
      : super._();
  factory _PackagingType.fromJson(Map<String, dynamic> json) =>
      _$PackagingTypeFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double unitValue;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final bool isActive;

  /// Create a copy of PackagingType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PackagingTypeCopyWith<_PackagingType> get copyWith =>
      __$PackagingTypeCopyWithImpl<_PackagingType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PackagingTypeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackagingType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unitValue, unitValue) ||
                other.unitValue == unitValue) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, unitValue, description, imageUrl, isActive);

  @override
  String toString() {
    return 'PackagingType(id: $id, name: $name, unitValue: $unitValue, description: $description, imageUrl: $imageUrl, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class _$PackagingTypeCopyWith<$Res>
    implements $PackagingTypeCopyWith<$Res> {
  factory _$PackagingTypeCopyWith(
          _PackagingType value, $Res Function(_PackagingType) _then) =
      __$PackagingTypeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double unitValue,
      String? description,
      String? imageUrl,
      bool isActive});
}

/// @nodoc
class __$PackagingTypeCopyWithImpl<$Res>
    implements _$PackagingTypeCopyWith<$Res> {
  __$PackagingTypeCopyWithImpl(this._self, this._then);

  final _PackagingType _self;
  final $Res Function(_PackagingType) _then;

  /// Create a copy of PackagingType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? unitValue = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? isActive = null,
  }) {
    return _then(_PackagingType(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unitValue: null == unitValue
          ? _self.unitValue
          : unitValue // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$PackagingBalance {
  String get customerId;
  List<PackagingBalanceItem> get items;
  double get totalValue;
  DateTime? get lastUpdated;

  /// Create a copy of PackagingBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PackagingBalanceCopyWith<PackagingBalance> get copyWith =>
      _$PackagingBalanceCopyWithImpl<PackagingBalance>(
          this as PackagingBalance, _$identity);

  /// Serializes this PackagingBalance to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PackagingBalance &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customerId,
      const DeepCollectionEquality().hash(items), totalValue, lastUpdated);

  @override
  String toString() {
    return 'PackagingBalance(customerId: $customerId, items: $items, totalValue: $totalValue, lastUpdated: $lastUpdated)';
  }
}

/// @nodoc
abstract mixin class $PackagingBalanceCopyWith<$Res> {
  factory $PackagingBalanceCopyWith(
          PackagingBalance value, $Res Function(PackagingBalance) _then) =
      _$PackagingBalanceCopyWithImpl;
  @useResult
  $Res call(
      {String customerId,
      List<PackagingBalanceItem> items,
      double totalValue,
      DateTime? lastUpdated});
}

/// @nodoc
class _$PackagingBalanceCopyWithImpl<$Res>
    implements $PackagingBalanceCopyWith<$Res> {
  _$PackagingBalanceCopyWithImpl(this._self, this._then);

  final PackagingBalance _self;
  final $Res Function(PackagingBalance) _then;

  /// Create a copy of PackagingBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? items = null,
    Object? totalValue = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_self.copyWith(
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PackagingBalanceItem>,
      totalValue: null == totalValue
          ? _self.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: freezed == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PackagingBalance].
extension PackagingBalancePatterns on PackagingBalance {
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
    TResult Function(_PackagingBalance value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingBalance() when $default != null:
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
    TResult Function(_PackagingBalance value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalance():
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
    TResult? Function(_PackagingBalance value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalance() when $default != null:
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
    TResult Function(String customerId, List<PackagingBalanceItem> items,
            double totalValue, DateTime? lastUpdated)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingBalance() when $default != null:
        return $default(
            _that.customerId, _that.items, _that.totalValue, _that.lastUpdated);
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
    TResult Function(String customerId, List<PackagingBalanceItem> items,
            double totalValue, DateTime? lastUpdated)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalance():
        return $default(
            _that.customerId, _that.items, _that.totalValue, _that.lastUpdated);
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
    TResult? Function(String customerId, List<PackagingBalanceItem> items,
            double totalValue, DateTime? lastUpdated)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalance() when $default != null:
        return $default(
            _that.customerId, _that.items, _that.totalValue, _that.lastUpdated);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PackagingBalance extends PackagingBalance {
  const _PackagingBalance(
      {required this.customerId,
      required final List<PackagingBalanceItem> items,
      required this.totalValue,
      this.lastUpdated})
      : _items = items,
        super._();
  factory _PackagingBalance.fromJson(Map<String, dynamic> json) =>
      _$PackagingBalanceFromJson(json);

  @override
  final String customerId;
  final List<PackagingBalanceItem> _items;
  @override
  List<PackagingBalanceItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double totalValue;
  @override
  final DateTime? lastUpdated;

  /// Create a copy of PackagingBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PackagingBalanceCopyWith<_PackagingBalance> get copyWith =>
      __$PackagingBalanceCopyWithImpl<_PackagingBalance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PackagingBalanceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackagingBalance &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customerId,
      const DeepCollectionEquality().hash(_items), totalValue, lastUpdated);

  @override
  String toString() {
    return 'PackagingBalance(customerId: $customerId, items: $items, totalValue: $totalValue, lastUpdated: $lastUpdated)';
  }
}

/// @nodoc
abstract mixin class _$PackagingBalanceCopyWith<$Res>
    implements $PackagingBalanceCopyWith<$Res> {
  factory _$PackagingBalanceCopyWith(
          _PackagingBalance value, $Res Function(_PackagingBalance) _then) =
      __$PackagingBalanceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String customerId,
      List<PackagingBalanceItem> items,
      double totalValue,
      DateTime? lastUpdated});
}

/// @nodoc
class __$PackagingBalanceCopyWithImpl<$Res>
    implements _$PackagingBalanceCopyWith<$Res> {
  __$PackagingBalanceCopyWithImpl(this._self, this._then);

  final _PackagingBalance _self;
  final $Res Function(_PackagingBalance) _then;

  /// Create a copy of PackagingBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customerId = null,
    Object? items = null,
    Object? totalValue = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_PackagingBalance(
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PackagingBalanceItem>,
      totalValue: null == totalValue
          ? _self.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: freezed == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$PackagingBalanceItem {
  String get packagingId;
  String get packagingName;
  int get quantity;
  double get unitValue;
  double get totalValue;

  /// Create a copy of PackagingBalanceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PackagingBalanceItemCopyWith<PackagingBalanceItem> get copyWith =>
      _$PackagingBalanceItemCopyWithImpl<PackagingBalanceItem>(
          this as PackagingBalanceItem, _$identity);

  /// Serializes this PackagingBalanceItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PackagingBalanceItem &&
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
    return 'PackagingBalanceItem(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, totalValue: $totalValue)';
  }
}

/// @nodoc
abstract mixin class $PackagingBalanceItemCopyWith<$Res> {
  factory $PackagingBalanceItemCopyWith(PackagingBalanceItem value,
          $Res Function(PackagingBalanceItem) _then) =
      _$PackagingBalanceItemCopyWithImpl;
  @useResult
  $Res call(
      {String packagingId,
      String packagingName,
      int quantity,
      double unitValue,
      double totalValue});
}

/// @nodoc
class _$PackagingBalanceItemCopyWithImpl<$Res>
    implements $PackagingBalanceItemCopyWith<$Res> {
  _$PackagingBalanceItemCopyWithImpl(this._self, this._then);

  final PackagingBalanceItem _self;
  final $Res Function(PackagingBalanceItem) _then;

  /// Create a copy of PackagingBalanceItem
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

/// Adds pattern-matching-related methods to [PackagingBalanceItem].
extension PackagingBalanceItemPatterns on PackagingBalanceItem {
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
    TResult Function(_PackagingBalanceItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceItem() when $default != null:
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
    TResult Function(_PackagingBalanceItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceItem():
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
    TResult? Function(_PackagingBalanceItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceItem() when $default != null:
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
      case _PackagingBalanceItem() when $default != null:
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
      case _PackagingBalanceItem():
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
      case _PackagingBalanceItem() when $default != null:
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.unitValue, _that.totalValue);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PackagingBalanceItem extends PackagingBalanceItem {
  const _PackagingBalanceItem(
      {required this.packagingId,
      required this.packagingName,
      required this.quantity,
      required this.unitValue,
      required this.totalValue})
      : super._();
  factory _PackagingBalanceItem.fromJson(Map<String, dynamic> json) =>
      _$PackagingBalanceItemFromJson(json);

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

  /// Create a copy of PackagingBalanceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PackagingBalanceItemCopyWith<_PackagingBalanceItem> get copyWith =>
      __$PackagingBalanceItemCopyWithImpl<_PackagingBalanceItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PackagingBalanceItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackagingBalanceItem &&
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
    return 'PackagingBalanceItem(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, totalValue: $totalValue)';
  }
}

/// @nodoc
abstract mixin class _$PackagingBalanceItemCopyWith<$Res>
    implements $PackagingBalanceItemCopyWith<$Res> {
  factory _$PackagingBalanceItemCopyWith(_PackagingBalanceItem value,
          $Res Function(_PackagingBalanceItem) _then) =
      __$PackagingBalanceItemCopyWithImpl;
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
class __$PackagingBalanceItemCopyWithImpl<$Res>
    implements _$PackagingBalanceItemCopyWith<$Res> {
  __$PackagingBalanceItemCopyWithImpl(this._self, this._then);

  final _PackagingBalanceItem _self;
  final $Res Function(_PackagingBalanceItem) _then;

  /// Create a copy of PackagingBalanceItem
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
    return _then(_PackagingBalanceItem(
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

// dart format on
