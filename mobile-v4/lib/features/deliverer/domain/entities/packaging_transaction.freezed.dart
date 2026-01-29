// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'packaging_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackagingTransaction {
  String get id;
  String get delivererId;
  String get customerId;
  String get customerName;
  PackagingTransactionType get type;
  List<PackagingItem> get items;
  DateTime get transactionDate;
  String? get notes;
  String? get qrCodeData;
  bool get isUploaded;
  DateTime? get uploadedAt;
  DateTime? get createdAt;

  /// Create a copy of PackagingTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PackagingTransactionCopyWith<PackagingTransaction> get copyWith =>
      _$PackagingTransactionCopyWithImpl<PackagingTransaction>(
          this as PackagingTransaction, _$identity);

  /// Serializes this PackagingTransaction to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PackagingTransaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.delivererId, delivererId) ||
                other.delivererId == delivererId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.qrCodeData, qrCodeData) ||
                other.qrCodeData == qrCodeData) &&
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
      delivererId,
      customerId,
      customerName,
      type,
      const DeepCollectionEquality().hash(items),
      transactionDate,
      notes,
      qrCodeData,
      isUploaded,
      uploadedAt,
      createdAt);

  @override
  String toString() {
    return 'PackagingTransaction(id: $id, delivererId: $delivererId, customerId: $customerId, customerName: $customerName, type: $type, items: $items, transactionDate: $transactionDate, notes: $notes, qrCodeData: $qrCodeData, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $PackagingTransactionCopyWith<$Res> {
  factory $PackagingTransactionCopyWith(PackagingTransaction value,
          $Res Function(PackagingTransaction) _then) =
      _$PackagingTransactionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String delivererId,
      String customerId,
      String customerName,
      PackagingTransactionType type,
      List<PackagingItem> items,
      DateTime transactionDate,
      String? notes,
      String? qrCodeData,
      bool isUploaded,
      DateTime? uploadedAt,
      DateTime? createdAt});
}

/// @nodoc
class _$PackagingTransactionCopyWithImpl<$Res>
    implements $PackagingTransactionCopyWith<$Res> {
  _$PackagingTransactionCopyWithImpl(this._self, this._then);

  final PackagingTransaction _self;
  final $Res Function(PackagingTransaction) _then;

  /// Create a copy of PackagingTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? delivererId = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? type = null,
    Object? items = null,
    Object? transactionDate = null,
    Object? notes = freezed,
    Object? qrCodeData = freezed,
    Object? isUploaded = null,
    Object? uploadedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PackagingTransactionType,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PackagingItem>,
      transactionDate: null == transactionDate
          ? _self.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeData: freezed == qrCodeData
          ? _self.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [PackagingTransaction].
extension PackagingTransactionPatterns on PackagingTransaction {
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
    TResult Function(_PackagingTransaction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingTransaction() when $default != null:
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
    TResult Function(_PackagingTransaction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingTransaction():
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
    TResult? Function(_PackagingTransaction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingTransaction() when $default != null:
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
            String delivererId,
            String customerId,
            String customerName,
            PackagingTransactionType type,
            List<PackagingItem> items,
            DateTime transactionDate,
            String? notes,
            String? qrCodeData,
            bool isUploaded,
            DateTime? uploadedAt,
            DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingTransaction() when $default != null:
        return $default(
            _that.id,
            _that.delivererId,
            _that.customerId,
            _that.customerName,
            _that.type,
            _that.items,
            _that.transactionDate,
            _that.notes,
            _that.qrCodeData,
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
            String delivererId,
            String customerId,
            String customerName,
            PackagingTransactionType type,
            List<PackagingItem> items,
            DateTime transactionDate,
            String? notes,
            String? qrCodeData,
            bool isUploaded,
            DateTime? uploadedAt,
            DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingTransaction():
        return $default(
            _that.id,
            _that.delivererId,
            _that.customerId,
            _that.customerName,
            _that.type,
            _that.items,
            _that.transactionDate,
            _that.notes,
            _that.qrCodeData,
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
            String delivererId,
            String customerId,
            String customerName,
            PackagingTransactionType type,
            List<PackagingItem> items,
            DateTime transactionDate,
            String? notes,
            String? qrCodeData,
            bool isUploaded,
            DateTime? uploadedAt,
            DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingTransaction() when $default != null:
        return $default(
            _that.id,
            _that.delivererId,
            _that.customerId,
            _that.customerName,
            _that.type,
            _that.items,
            _that.transactionDate,
            _that.notes,
            _that.qrCodeData,
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
class _PackagingTransaction implements PackagingTransaction {
  const _PackagingTransaction(
      {required this.id,
      required this.delivererId,
      required this.customerId,
      required this.customerName,
      required this.type,
      required final List<PackagingItem> items,
      required this.transactionDate,
      this.notes,
      this.qrCodeData,
      this.isUploaded = false,
      this.uploadedAt,
      this.createdAt})
      : _items = items;
  factory _PackagingTransaction.fromJson(Map<String, dynamic> json) =>
      _$PackagingTransactionFromJson(json);

  @override
  final String id;
  @override
  final String delivererId;
  @override
  final String customerId;
  @override
  final String customerName;
  @override
  final PackagingTransactionType type;
  final List<PackagingItem> _items;
  @override
  List<PackagingItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime transactionDate;
  @override
  final String? notes;
  @override
  final String? qrCodeData;
  @override
  @JsonKey()
  final bool isUploaded;
  @override
  final DateTime? uploadedAt;
  @override
  final DateTime? createdAt;

  /// Create a copy of PackagingTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PackagingTransactionCopyWith<_PackagingTransaction> get copyWith =>
      __$PackagingTransactionCopyWithImpl<_PackagingTransaction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PackagingTransactionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackagingTransaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.delivererId, delivererId) ||
                other.delivererId == delivererId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.qrCodeData, qrCodeData) ||
                other.qrCodeData == qrCodeData) &&
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
      delivererId,
      customerId,
      customerName,
      type,
      const DeepCollectionEquality().hash(_items),
      transactionDate,
      notes,
      qrCodeData,
      isUploaded,
      uploadedAt,
      createdAt);

  @override
  String toString() {
    return 'PackagingTransaction(id: $id, delivererId: $delivererId, customerId: $customerId, customerName: $customerName, type: $type, items: $items, transactionDate: $transactionDate, notes: $notes, qrCodeData: $qrCodeData, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$PackagingTransactionCopyWith<$Res>
    implements $PackagingTransactionCopyWith<$Res> {
  factory _$PackagingTransactionCopyWith(_PackagingTransaction value,
          $Res Function(_PackagingTransaction) _then) =
      __$PackagingTransactionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String delivererId,
      String customerId,
      String customerName,
      PackagingTransactionType type,
      List<PackagingItem> items,
      DateTime transactionDate,
      String? notes,
      String? qrCodeData,
      bool isUploaded,
      DateTime? uploadedAt,
      DateTime? createdAt});
}

/// @nodoc
class __$PackagingTransactionCopyWithImpl<$Res>
    implements _$PackagingTransactionCopyWith<$Res> {
  __$PackagingTransactionCopyWithImpl(this._self, this._then);

  final _PackagingTransaction _self;
  final $Res Function(_PackagingTransaction) _then;

  /// Create a copy of PackagingTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? delivererId = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? type = null,
    Object? items = null,
    Object? transactionDate = null,
    Object? notes = freezed,
    Object? qrCodeData = freezed,
    Object? isUploaded = null,
    Object? uploadedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_PackagingTransaction(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _self.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PackagingTransactionType,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PackagingItem>,
      transactionDate: null == transactionDate
          ? _self.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeData: freezed == qrCodeData
          ? _self.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
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
mixin _$PackagingItem {
  String get packagingId;
  String get packagingName;
  int get quantity;
  double get unitValue; // Valeur unitaire de la consigne
  String? get description;

  /// Create a copy of PackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PackagingItemCopyWith<PackagingItem> get copyWith =>
      _$PackagingItemCopyWithImpl<PackagingItem>(
          this as PackagingItem, _$identity);

  /// Serializes this PackagingItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PackagingItem &&
            (identical(other.packagingId, packagingId) ||
                other.packagingId == packagingId) &&
            (identical(other.packagingName, packagingName) ||
                other.packagingName == packagingName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitValue, unitValue) ||
                other.unitValue == unitValue) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, packagingId, packagingName,
      quantity, unitValue, description);

  @override
  String toString() {
    return 'PackagingItem(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, description: $description)';
  }
}

/// @nodoc
abstract mixin class $PackagingItemCopyWith<$Res> {
  factory $PackagingItemCopyWith(
          PackagingItem value, $Res Function(PackagingItem) _then) =
      _$PackagingItemCopyWithImpl;
  @useResult
  $Res call(
      {String packagingId,
      String packagingName,
      int quantity,
      double unitValue,
      String? description});
}

/// @nodoc
class _$PackagingItemCopyWithImpl<$Res>
    implements $PackagingItemCopyWith<$Res> {
  _$PackagingItemCopyWithImpl(this._self, this._then);

  final PackagingItem _self;
  final $Res Function(PackagingItem) _then;

  /// Create a copy of PackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packagingId = null,
    Object? packagingName = null,
    Object? quantity = null,
    Object? unitValue = null,
    Object? description = freezed,
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
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PackagingItem].
extension PackagingItemPatterns on PackagingItem {
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
    TResult Function(_PackagingItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingItem() when $default != null:
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
    TResult Function(_PackagingItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingItem():
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
    TResult? Function(_PackagingItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingItem() when $default != null:
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
            double unitValue, String? description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingItem() when $default != null:
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.unitValue, _that.description);
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
            double unitValue, String? description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingItem():
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.unitValue, _that.description);
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
            double unitValue, String? description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingItem() when $default != null:
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.unitValue, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PackagingItem extends PackagingItem {
  const _PackagingItem(
      {required this.packagingId,
      required this.packagingName,
      required this.quantity,
      required this.unitValue,
      this.description})
      : super._();
  factory _PackagingItem.fromJson(Map<String, dynamic> json) =>
      _$PackagingItemFromJson(json);

  @override
  final String packagingId;
  @override
  final String packagingName;
  @override
  final int quantity;
  @override
  final double unitValue;
// Valeur unitaire de la consigne
  @override
  final String? description;

  /// Create a copy of PackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PackagingItemCopyWith<_PackagingItem> get copyWith =>
      __$PackagingItemCopyWithImpl<_PackagingItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PackagingItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackagingItem &&
            (identical(other.packagingId, packagingId) ||
                other.packagingId == packagingId) &&
            (identical(other.packagingName, packagingName) ||
                other.packagingName == packagingName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitValue, unitValue) ||
                other.unitValue == unitValue) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, packagingId, packagingName,
      quantity, unitValue, description);

  @override
  String toString() {
    return 'PackagingItem(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$PackagingItemCopyWith<$Res>
    implements $PackagingItemCopyWith<$Res> {
  factory _$PackagingItemCopyWith(
          _PackagingItem value, $Res Function(_PackagingItem) _then) =
      __$PackagingItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String packagingId,
      String packagingName,
      int quantity,
      double unitValue,
      String? description});
}

/// @nodoc
class __$PackagingItemCopyWithImpl<$Res>
    implements _$PackagingItemCopyWith<$Res> {
  __$PackagingItemCopyWithImpl(this._self, this._then);

  final _PackagingItem _self;
  final $Res Function(_PackagingItem) _then;

  /// Create a copy of PackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? packagingId = null,
    Object? packagingName = null,
    Object? quantity = null,
    Object? unitValue = null,
    Object? description = freezed,
  }) {
    return _then(_PackagingItem(
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
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
