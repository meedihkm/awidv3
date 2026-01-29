// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'packaging_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackagingTransactionModel {
  String get id;
  @JsonKey(name: 'deliverer_id')
  String get delivererId;
  @JsonKey(name: 'customer_id')
  String get customerId;
  @JsonKey(name: 'customer_name')
  String get customerName;
  PackagingTransactionType get type;
  List<PackagingItemModel> get items;
  @JsonKey(name: 'transaction_date')
  DateTime get transactionDate;
  String? get notes;
  @JsonKey(name: 'qr_code_data')
  String? get qrCodeData;
  @JsonKey(name: 'is_uploaded')
  bool get isUploaded;
  @JsonKey(name: 'uploaded_at')
  DateTime? get uploadedAt;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of PackagingTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PackagingTransactionModelCopyWith<PackagingTransactionModel> get copyWith =>
      _$PackagingTransactionModelCopyWithImpl<PackagingTransactionModel>(
          this as PackagingTransactionModel, _$identity);

  /// Serializes this PackagingTransactionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PackagingTransactionModel &&
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
    return 'PackagingTransactionModel(id: $id, delivererId: $delivererId, customerId: $customerId, customerName: $customerName, type: $type, items: $items, transactionDate: $transactionDate, notes: $notes, qrCodeData: $qrCodeData, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $PackagingTransactionModelCopyWith<$Res> {
  factory $PackagingTransactionModelCopyWith(PackagingTransactionModel value,
          $Res Function(PackagingTransactionModel) _then) =
      _$PackagingTransactionModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'deliverer_id') String delivererId,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      PackagingTransactionType type,
      List<PackagingItemModel> items,
      @JsonKey(name: 'transaction_date') DateTime transactionDate,
      String? notes,
      @JsonKey(name: 'qr_code_data') String? qrCodeData,
      @JsonKey(name: 'is_uploaded') bool isUploaded,
      @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$PackagingTransactionModelCopyWithImpl<$Res>
    implements $PackagingTransactionModelCopyWith<$Res> {
  _$PackagingTransactionModelCopyWithImpl(this._self, this._then);

  final PackagingTransactionModel _self;
  final $Res Function(PackagingTransactionModel) _then;

  /// Create a copy of PackagingTransactionModel
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
              as List<PackagingItemModel>,
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

/// Adds pattern-matching-related methods to [PackagingTransactionModel].
extension PackagingTransactionModelPatterns on PackagingTransactionModel {
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
    TResult Function(_PackagingTransactionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingTransactionModel() when $default != null:
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
    TResult Function(_PackagingTransactionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingTransactionModel():
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
    TResult? Function(_PackagingTransactionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingTransactionModel() when $default != null:
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
            @JsonKey(name: 'deliverer_id') String delivererId,
            @JsonKey(name: 'customer_id') String customerId,
            @JsonKey(name: 'customer_name') String customerName,
            PackagingTransactionType type,
            List<PackagingItemModel> items,
            @JsonKey(name: 'transaction_date') DateTime transactionDate,
            String? notes,
            @JsonKey(name: 'qr_code_data') String? qrCodeData,
            @JsonKey(name: 'is_uploaded') bool isUploaded,
            @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingTransactionModel() when $default != null:
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
            @JsonKey(name: 'deliverer_id') String delivererId,
            @JsonKey(name: 'customer_id') String customerId,
            @JsonKey(name: 'customer_name') String customerName,
            PackagingTransactionType type,
            List<PackagingItemModel> items,
            @JsonKey(name: 'transaction_date') DateTime transactionDate,
            String? notes,
            @JsonKey(name: 'qr_code_data') String? qrCodeData,
            @JsonKey(name: 'is_uploaded') bool isUploaded,
            @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
            @JsonKey(name: 'created_at') DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingTransactionModel():
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
            @JsonKey(name: 'deliverer_id') String delivererId,
            @JsonKey(name: 'customer_id') String customerId,
            @JsonKey(name: 'customer_name') String customerName,
            PackagingTransactionType type,
            List<PackagingItemModel> items,
            @JsonKey(name: 'transaction_date') DateTime transactionDate,
            String? notes,
            @JsonKey(name: 'qr_code_data') String? qrCodeData,
            @JsonKey(name: 'is_uploaded') bool isUploaded,
            @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingTransactionModel() when $default != null:
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
class _PackagingTransactionModel implements PackagingTransactionModel {
  const _PackagingTransactionModel(
      {required this.id,
      @JsonKey(name: 'deliverer_id') required this.delivererId,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName,
      required this.type,
      required final List<PackagingItemModel> items,
      @JsonKey(name: 'transaction_date') required this.transactionDate,
      this.notes,
      @JsonKey(name: 'qr_code_data') this.qrCodeData,
      @JsonKey(name: 'is_uploaded') this.isUploaded = false,
      @JsonKey(name: 'uploaded_at') this.uploadedAt,
      @JsonKey(name: 'created_at') this.createdAt})
      : _items = items;
  factory _PackagingTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$PackagingTransactionModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'deliverer_id')
  final String delivererId;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  final PackagingTransactionType type;
  final List<PackagingItemModel> _items;
  @override
  List<PackagingItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'transaction_date')
  final DateTime transactionDate;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'qr_code_data')
  final String? qrCodeData;
  @override
  @JsonKey(name: 'is_uploaded')
  final bool isUploaded;
  @override
  @JsonKey(name: 'uploaded_at')
  final DateTime? uploadedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  /// Create a copy of PackagingTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PackagingTransactionModelCopyWith<_PackagingTransactionModel>
      get copyWith =>
          __$PackagingTransactionModelCopyWithImpl<_PackagingTransactionModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PackagingTransactionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackagingTransactionModel &&
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
    return 'PackagingTransactionModel(id: $id, delivererId: $delivererId, customerId: $customerId, customerName: $customerName, type: $type, items: $items, transactionDate: $transactionDate, notes: $notes, qrCodeData: $qrCodeData, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$PackagingTransactionModelCopyWith<$Res>
    implements $PackagingTransactionModelCopyWith<$Res> {
  factory _$PackagingTransactionModelCopyWith(_PackagingTransactionModel value,
          $Res Function(_PackagingTransactionModel) _then) =
      __$PackagingTransactionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'deliverer_id') String delivererId,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      PackagingTransactionType type,
      List<PackagingItemModel> items,
      @JsonKey(name: 'transaction_date') DateTime transactionDate,
      String? notes,
      @JsonKey(name: 'qr_code_data') String? qrCodeData,
      @JsonKey(name: 'is_uploaded') bool isUploaded,
      @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$PackagingTransactionModelCopyWithImpl<$Res>
    implements _$PackagingTransactionModelCopyWith<$Res> {
  __$PackagingTransactionModelCopyWithImpl(this._self, this._then);

  final _PackagingTransactionModel _self;
  final $Res Function(_PackagingTransactionModel) _then;

  /// Create a copy of PackagingTransactionModel
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
    return _then(_PackagingTransactionModel(
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
              as List<PackagingItemModel>,
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
mixin _$PackagingItemModel {
  @JsonKey(name: 'packaging_id')
  String get packagingId;
  @JsonKey(name: 'packaging_name')
  String get packagingName;
  int get quantity;
  @JsonKey(name: 'unit_value')
  double get unitValue;
  String? get description;

  /// Create a copy of PackagingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PackagingItemModelCopyWith<PackagingItemModel> get copyWith =>
      _$PackagingItemModelCopyWithImpl<PackagingItemModel>(
          this as PackagingItemModel, _$identity);

  /// Serializes this PackagingItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PackagingItemModel &&
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
    return 'PackagingItemModel(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, description: $description)';
  }
}

/// @nodoc
abstract mixin class $PackagingItemModelCopyWith<$Res> {
  factory $PackagingItemModelCopyWith(
          PackagingItemModel value, $Res Function(PackagingItemModel) _then) =
      _$PackagingItemModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'packaging_id') String packagingId,
      @JsonKey(name: 'packaging_name') String packagingName,
      int quantity,
      @JsonKey(name: 'unit_value') double unitValue,
      String? description});
}

/// @nodoc
class _$PackagingItemModelCopyWithImpl<$Res>
    implements $PackagingItemModelCopyWith<$Res> {
  _$PackagingItemModelCopyWithImpl(this._self, this._then);

  final PackagingItemModel _self;
  final $Res Function(PackagingItemModel) _then;

  /// Create a copy of PackagingItemModel
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

/// Adds pattern-matching-related methods to [PackagingItemModel].
extension PackagingItemModelPatterns on PackagingItemModel {
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
    TResult Function(_PackagingItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingItemModel() when $default != null:
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
    TResult Function(_PackagingItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingItemModel():
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
    TResult? Function(_PackagingItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingItemModel() when $default != null:
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
            @JsonKey(name: 'packaging_id') String packagingId,
            @JsonKey(name: 'packaging_name') String packagingName,
            int quantity,
            @JsonKey(name: 'unit_value') double unitValue,
            String? description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingItemModel() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'packaging_id') String packagingId,
            @JsonKey(name: 'packaging_name') String packagingName,
            int quantity,
            @JsonKey(name: 'unit_value') double unitValue,
            String? description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingItemModel():
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
    TResult? Function(
            @JsonKey(name: 'packaging_id') String packagingId,
            @JsonKey(name: 'packaging_name') String packagingName,
            int quantity,
            @JsonKey(name: 'unit_value') double unitValue,
            String? description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingItemModel() when $default != null:
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.unitValue, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PackagingItemModel implements PackagingItemModel {
  const _PackagingItemModel(
      {@JsonKey(name: 'packaging_id') required this.packagingId,
      @JsonKey(name: 'packaging_name') required this.packagingName,
      required this.quantity,
      @JsonKey(name: 'unit_value') required this.unitValue,
      this.description});
  factory _PackagingItemModel.fromJson(Map<String, dynamic> json) =>
      _$PackagingItemModelFromJson(json);

  @override
  @JsonKey(name: 'packaging_id')
  final String packagingId;
  @override
  @JsonKey(name: 'packaging_name')
  final String packagingName;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'unit_value')
  final double unitValue;
  @override
  final String? description;

  /// Create a copy of PackagingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PackagingItemModelCopyWith<_PackagingItemModel> get copyWith =>
      __$PackagingItemModelCopyWithImpl<_PackagingItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PackagingItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackagingItemModel &&
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
    return 'PackagingItemModel(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$PackagingItemModelCopyWith<$Res>
    implements $PackagingItemModelCopyWith<$Res> {
  factory _$PackagingItemModelCopyWith(
          _PackagingItemModel value, $Res Function(_PackagingItemModel) _then) =
      __$PackagingItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'packaging_id') String packagingId,
      @JsonKey(name: 'packaging_name') String packagingName,
      int quantity,
      @JsonKey(name: 'unit_value') double unitValue,
      String? description});
}

/// @nodoc
class __$PackagingItemModelCopyWithImpl<$Res>
    implements _$PackagingItemModelCopyWith<$Res> {
  __$PackagingItemModelCopyWithImpl(this._self, this._then);

  final _PackagingItemModel _self;
  final $Res Function(_PackagingItemModel) _then;

  /// Create a copy of PackagingItemModel
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
    return _then(_PackagingItemModel(
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

/// @nodoc
mixin _$UploadPackagingTransactionRequest {
  @JsonKey(name: 'deliverer_id')
  String get delivererId;
  @JsonKey(name: 'customer_id')
  String get customerId;
  @JsonKey(name: 'customer_name')
  String get customerName;
  String get type;
  List<Map<String, dynamic>> get items;
  @JsonKey(name: 'transaction_date')
  DateTime get transactionDate;
  String? get notes;
  @JsonKey(name: 'qr_code_data')
  String? get qrCodeData;

  /// Create a copy of UploadPackagingTransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UploadPackagingTransactionRequestCopyWith<UploadPackagingTransactionRequest>
      get copyWith => _$UploadPackagingTransactionRequestCopyWithImpl<
              UploadPackagingTransactionRequest>(
          this as UploadPackagingTransactionRequest, _$identity);

  /// Serializes this UploadPackagingTransactionRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UploadPackagingTransactionRequest &&
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
                other.qrCodeData == qrCodeData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      delivererId,
      customerId,
      customerName,
      type,
      const DeepCollectionEquality().hash(items),
      transactionDate,
      notes,
      qrCodeData);

  @override
  String toString() {
    return 'UploadPackagingTransactionRequest(delivererId: $delivererId, customerId: $customerId, customerName: $customerName, type: $type, items: $items, transactionDate: $transactionDate, notes: $notes, qrCodeData: $qrCodeData)';
  }
}

/// @nodoc
abstract mixin class $UploadPackagingTransactionRequestCopyWith<$Res> {
  factory $UploadPackagingTransactionRequestCopyWith(
          UploadPackagingTransactionRequest value,
          $Res Function(UploadPackagingTransactionRequest) _then) =
      _$UploadPackagingTransactionRequestCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'deliverer_id') String delivererId,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      String type,
      List<Map<String, dynamic>> items,
      @JsonKey(name: 'transaction_date') DateTime transactionDate,
      String? notes,
      @JsonKey(name: 'qr_code_data') String? qrCodeData});
}

/// @nodoc
class _$UploadPackagingTransactionRequestCopyWithImpl<$Res>
    implements $UploadPackagingTransactionRequestCopyWith<$Res> {
  _$UploadPackagingTransactionRequestCopyWithImpl(this._self, this._then);

  final UploadPackagingTransactionRequest _self;
  final $Res Function(UploadPackagingTransactionRequest) _then;

  /// Create a copy of UploadPackagingTransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delivererId = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? type = null,
    Object? items = null,
    Object? transactionDate = null,
    Object? notes = freezed,
    Object? qrCodeData = freezed,
  }) {
    return _then(_self.copyWith(
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
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
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
    ));
  }
}

/// Adds pattern-matching-related methods to [UploadPackagingTransactionRequest].
extension UploadPackagingTransactionRequestPatterns
    on UploadPackagingTransactionRequest {
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
    TResult Function(_UploadPackagingTransactionRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadPackagingTransactionRequest() when $default != null:
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
    TResult Function(_UploadPackagingTransactionRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPackagingTransactionRequest():
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
    TResult? Function(_UploadPackagingTransactionRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPackagingTransactionRequest() when $default != null:
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
            @JsonKey(name: 'deliverer_id') String delivererId,
            @JsonKey(name: 'customer_id') String customerId,
            @JsonKey(name: 'customer_name') String customerName,
            String type,
            List<Map<String, dynamic>> items,
            @JsonKey(name: 'transaction_date') DateTime transactionDate,
            String? notes,
            @JsonKey(name: 'qr_code_data') String? qrCodeData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadPackagingTransactionRequest() when $default != null:
        return $default(
            _that.delivererId,
            _that.customerId,
            _that.customerName,
            _that.type,
            _that.items,
            _that.transactionDate,
            _that.notes,
            _that.qrCodeData);
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
            @JsonKey(name: 'deliverer_id') String delivererId,
            @JsonKey(name: 'customer_id') String customerId,
            @JsonKey(name: 'customer_name') String customerName,
            String type,
            List<Map<String, dynamic>> items,
            @JsonKey(name: 'transaction_date') DateTime transactionDate,
            String? notes,
            @JsonKey(name: 'qr_code_data') String? qrCodeData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPackagingTransactionRequest():
        return $default(
            _that.delivererId,
            _that.customerId,
            _that.customerName,
            _that.type,
            _that.items,
            _that.transactionDate,
            _that.notes,
            _that.qrCodeData);
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
            @JsonKey(name: 'deliverer_id') String delivererId,
            @JsonKey(name: 'customer_id') String customerId,
            @JsonKey(name: 'customer_name') String customerName,
            String type,
            List<Map<String, dynamic>> items,
            @JsonKey(name: 'transaction_date') DateTime transactionDate,
            String? notes,
            @JsonKey(name: 'qr_code_data') String? qrCodeData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPackagingTransactionRequest() when $default != null:
        return $default(
            _that.delivererId,
            _that.customerId,
            _that.customerName,
            _that.type,
            _that.items,
            _that.transactionDate,
            _that.notes,
            _that.qrCodeData);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UploadPackagingTransactionRequest
    implements UploadPackagingTransactionRequest {
  const _UploadPackagingTransactionRequest(
      {@JsonKey(name: 'deliverer_id') required this.delivererId,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName,
      required this.type,
      required final List<Map<String, dynamic>> items,
      @JsonKey(name: 'transaction_date') required this.transactionDate,
      this.notes,
      @JsonKey(name: 'qr_code_data') this.qrCodeData})
      : _items = items;
  factory _UploadPackagingTransactionRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UploadPackagingTransactionRequestFromJson(json);

  @override
  @JsonKey(name: 'deliverer_id')
  final String delivererId;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  final String type;
  final List<Map<String, dynamic>> _items;
  @override
  List<Map<String, dynamic>> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'transaction_date')
  final DateTime transactionDate;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'qr_code_data')
  final String? qrCodeData;

  /// Create a copy of UploadPackagingTransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UploadPackagingTransactionRequestCopyWith<
          _UploadPackagingTransactionRequest>
      get copyWith => __$UploadPackagingTransactionRequestCopyWithImpl<
          _UploadPackagingTransactionRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UploadPackagingTransactionRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UploadPackagingTransactionRequest &&
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
                other.qrCodeData == qrCodeData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      delivererId,
      customerId,
      customerName,
      type,
      const DeepCollectionEquality().hash(_items),
      transactionDate,
      notes,
      qrCodeData);

  @override
  String toString() {
    return 'UploadPackagingTransactionRequest(delivererId: $delivererId, customerId: $customerId, customerName: $customerName, type: $type, items: $items, transactionDate: $transactionDate, notes: $notes, qrCodeData: $qrCodeData)';
  }
}

/// @nodoc
abstract mixin class _$UploadPackagingTransactionRequestCopyWith<$Res>
    implements $UploadPackagingTransactionRequestCopyWith<$Res> {
  factory _$UploadPackagingTransactionRequestCopyWith(
          _UploadPackagingTransactionRequest value,
          $Res Function(_UploadPackagingTransactionRequest) _then) =
      __$UploadPackagingTransactionRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'deliverer_id') String delivererId,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      String type,
      List<Map<String, dynamic>> items,
      @JsonKey(name: 'transaction_date') DateTime transactionDate,
      String? notes,
      @JsonKey(name: 'qr_code_data') String? qrCodeData});
}

/// @nodoc
class __$UploadPackagingTransactionRequestCopyWithImpl<$Res>
    implements _$UploadPackagingTransactionRequestCopyWith<$Res> {
  __$UploadPackagingTransactionRequestCopyWithImpl(this._self, this._then);

  final _UploadPackagingTransactionRequest _self;
  final $Res Function(_UploadPackagingTransactionRequest) _then;

  /// Create a copy of UploadPackagingTransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? delivererId = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? type = null,
    Object? items = null,
    Object? transactionDate = null,
    Object? notes = freezed,
    Object? qrCodeData = freezed,
  }) {
    return _then(_UploadPackagingTransactionRequest(
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
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
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
    ));
  }
}

/// @nodoc
mixin _$UploadPackagingTransactionResponse {
  String get id;
  String get status;
  String get message;
  @JsonKey(name: 'uploaded_at')
  DateTime get uploadedAt;
  @JsonKey(name: 'new_balance')
  double? get newBalance;
  @JsonKey(name: 'balance_items')
  List<Map<String, dynamic>>? get balanceItems;

  /// Create a copy of UploadPackagingTransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UploadPackagingTransactionResponseCopyWith<
          UploadPackagingTransactionResponse>
      get copyWith => _$UploadPackagingTransactionResponseCopyWithImpl<
              UploadPackagingTransactionResponse>(
          this as UploadPackagingTransactionResponse, _$identity);

  /// Serializes this UploadPackagingTransactionResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UploadPackagingTransactionResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.newBalance, newBalance) ||
                other.newBalance == newBalance) &&
            const DeepCollectionEquality()
                .equals(other.balanceItems, balanceItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, message, uploadedAt,
      newBalance, const DeepCollectionEquality().hash(balanceItems));

  @override
  String toString() {
    return 'UploadPackagingTransactionResponse(id: $id, status: $status, message: $message, uploadedAt: $uploadedAt, newBalance: $newBalance, balanceItems: $balanceItems)';
  }
}

/// @nodoc
abstract mixin class $UploadPackagingTransactionResponseCopyWith<$Res> {
  factory $UploadPackagingTransactionResponseCopyWith(
          UploadPackagingTransactionResponse value,
          $Res Function(UploadPackagingTransactionResponse) _then) =
      _$UploadPackagingTransactionResponseCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String status,
      String message,
      @JsonKey(name: 'uploaded_at') DateTime uploadedAt,
      @JsonKey(name: 'new_balance') double? newBalance,
      @JsonKey(name: 'balance_items')
      List<Map<String, dynamic>>? balanceItems});
}

/// @nodoc
class _$UploadPackagingTransactionResponseCopyWithImpl<$Res>
    implements $UploadPackagingTransactionResponseCopyWith<$Res> {
  _$UploadPackagingTransactionResponseCopyWithImpl(this._self, this._then);

  final UploadPackagingTransactionResponse _self;
  final $Res Function(UploadPackagingTransactionResponse) _then;

  /// Create a copy of UploadPackagingTransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? message = null,
    Object? uploadedAt = null,
    Object? newBalance = freezed,
    Object? balanceItems = freezed,
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
      newBalance: freezed == newBalance
          ? _self.newBalance
          : newBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceItems: freezed == balanceItems
          ? _self.balanceItems
          : balanceItems // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UploadPackagingTransactionResponse].
extension UploadPackagingTransactionResponsePatterns
    on UploadPackagingTransactionResponse {
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
    TResult Function(_UploadPackagingTransactionResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadPackagingTransactionResponse() when $default != null:
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
    TResult Function(_UploadPackagingTransactionResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPackagingTransactionResponse():
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
    TResult? Function(_UploadPackagingTransactionResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPackagingTransactionResponse() when $default != null:
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
            @JsonKey(name: 'new_balance') double? newBalance,
            @JsonKey(name: 'balance_items')
            List<Map<String, dynamic>>? balanceItems)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadPackagingTransactionResponse() when $default != null:
        return $default(_that.id, _that.status, _that.message, _that.uploadedAt,
            _that.newBalance, _that.balanceItems);
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
            @JsonKey(name: 'new_balance') double? newBalance,
            @JsonKey(name: 'balance_items')
            List<Map<String, dynamic>>? balanceItems)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPackagingTransactionResponse():
        return $default(_that.id, _that.status, _that.message, _that.uploadedAt,
            _that.newBalance, _that.balanceItems);
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
            @JsonKey(name: 'new_balance') double? newBalance,
            @JsonKey(name: 'balance_items')
            List<Map<String, dynamic>>? balanceItems)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadPackagingTransactionResponse() when $default != null:
        return $default(_that.id, _that.status, _that.message, _that.uploadedAt,
            _that.newBalance, _that.balanceItems);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UploadPackagingTransactionResponse
    implements UploadPackagingTransactionResponse {
  const _UploadPackagingTransactionResponse(
      {required this.id,
      required this.status,
      required this.message,
      @JsonKey(name: 'uploaded_at') required this.uploadedAt,
      @JsonKey(name: 'new_balance') this.newBalance,
      @JsonKey(name: 'balance_items')
      final List<Map<String, dynamic>>? balanceItems})
      : _balanceItems = balanceItems;
  factory _UploadPackagingTransactionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UploadPackagingTransactionResponseFromJson(json);

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
  @JsonKey(name: 'new_balance')
  final double? newBalance;
  final List<Map<String, dynamic>>? _balanceItems;
  @override
  @JsonKey(name: 'balance_items')
  List<Map<String, dynamic>>? get balanceItems {
    final value = _balanceItems;
    if (value == null) return null;
    if (_balanceItems is EqualUnmodifiableListView) return _balanceItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of UploadPackagingTransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UploadPackagingTransactionResponseCopyWith<
          _UploadPackagingTransactionResponse>
      get copyWith => __$UploadPackagingTransactionResponseCopyWithImpl<
          _UploadPackagingTransactionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UploadPackagingTransactionResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UploadPackagingTransactionResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.newBalance, newBalance) ||
                other.newBalance == newBalance) &&
            const DeepCollectionEquality()
                .equals(other._balanceItems, _balanceItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, message, uploadedAt,
      newBalance, const DeepCollectionEquality().hash(_balanceItems));

  @override
  String toString() {
    return 'UploadPackagingTransactionResponse(id: $id, status: $status, message: $message, uploadedAt: $uploadedAt, newBalance: $newBalance, balanceItems: $balanceItems)';
  }
}

/// @nodoc
abstract mixin class _$UploadPackagingTransactionResponseCopyWith<$Res>
    implements $UploadPackagingTransactionResponseCopyWith<$Res> {
  factory _$UploadPackagingTransactionResponseCopyWith(
          _UploadPackagingTransactionResponse value,
          $Res Function(_UploadPackagingTransactionResponse) _then) =
      __$UploadPackagingTransactionResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String status,
      String message,
      @JsonKey(name: 'uploaded_at') DateTime uploadedAt,
      @JsonKey(name: 'new_balance') double? newBalance,
      @JsonKey(name: 'balance_items')
      List<Map<String, dynamic>>? balanceItems});
}

/// @nodoc
class __$UploadPackagingTransactionResponseCopyWithImpl<$Res>
    implements _$UploadPackagingTransactionResponseCopyWith<$Res> {
  __$UploadPackagingTransactionResponseCopyWithImpl(this._self, this._then);

  final _UploadPackagingTransactionResponse _self;
  final $Res Function(_UploadPackagingTransactionResponse) _then;

  /// Create a copy of UploadPackagingTransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? message = null,
    Object? uploadedAt = null,
    Object? newBalance = freezed,
    Object? balanceItems = freezed,
  }) {
    return _then(_UploadPackagingTransactionResponse(
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
      newBalance: freezed == newBalance
          ? _self.newBalance
          : newBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceItems: freezed == balanceItems
          ? _self._balanceItems
          : balanceItems // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
mixin _$PackagingBalanceModel {
  @JsonKey(name: 'customer_id')
  String get customerId;
  @JsonKey(name: 'customer_name')
  String get customerName;
  List<PackagingBalanceItemModel> get items;
  @JsonKey(name: 'total_value')
  double get totalValue;
  @JsonKey(name: 'last_updated')
  DateTime get lastUpdated;

  /// Create a copy of PackagingBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PackagingBalanceModelCopyWith<PackagingBalanceModel> get copyWith =>
      _$PackagingBalanceModelCopyWithImpl<PackagingBalanceModel>(
          this as PackagingBalanceModel, _$identity);

  /// Serializes this PackagingBalanceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PackagingBalanceModel &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customerId, customerName,
      const DeepCollectionEquality().hash(items), totalValue, lastUpdated);

  @override
  String toString() {
    return 'PackagingBalanceModel(customerId: $customerId, customerName: $customerName, items: $items, totalValue: $totalValue, lastUpdated: $lastUpdated)';
  }
}

/// @nodoc
abstract mixin class $PackagingBalanceModelCopyWith<$Res> {
  factory $PackagingBalanceModelCopyWith(PackagingBalanceModel value,
          $Res Function(PackagingBalanceModel) _then) =
      _$PackagingBalanceModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      List<PackagingBalanceItemModel> items,
      @JsonKey(name: 'total_value') double totalValue,
      @JsonKey(name: 'last_updated') DateTime lastUpdated});
}

/// @nodoc
class _$PackagingBalanceModelCopyWithImpl<$Res>
    implements $PackagingBalanceModelCopyWith<$Res> {
  _$PackagingBalanceModelCopyWithImpl(this._self, this._then);

  final PackagingBalanceModel _self;
  final $Res Function(PackagingBalanceModel) _then;

  /// Create a copy of PackagingBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? customerName = null,
    Object? items = null,
    Object? totalValue = null,
    Object? lastUpdated = null,
  }) {
    return _then(_self.copyWith(
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PackagingBalanceItemModel>,
      totalValue: null == totalValue
          ? _self.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [PackagingBalanceModel].
extension PackagingBalanceModelPatterns on PackagingBalanceModel {
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
    TResult Function(_PackagingBalanceModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceModel() when $default != null:
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
    TResult Function(_PackagingBalanceModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceModel():
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
    TResult? Function(_PackagingBalanceModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceModel() when $default != null:
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
            @JsonKey(name: 'customer_id') String customerId,
            @JsonKey(name: 'customer_name') String customerName,
            List<PackagingBalanceItemModel> items,
            @JsonKey(name: 'total_value') double totalValue,
            @JsonKey(name: 'last_updated') DateTime lastUpdated)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceModel() when $default != null:
        return $default(_that.customerId, _that.customerName, _that.items,
            _that.totalValue, _that.lastUpdated);
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
            @JsonKey(name: 'customer_id') String customerId,
            @JsonKey(name: 'customer_name') String customerName,
            List<PackagingBalanceItemModel> items,
            @JsonKey(name: 'total_value') double totalValue,
            @JsonKey(name: 'last_updated') DateTime lastUpdated)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceModel():
        return $default(_that.customerId, _that.customerName, _that.items,
            _that.totalValue, _that.lastUpdated);
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
            @JsonKey(name: 'customer_id') String customerId,
            @JsonKey(name: 'customer_name') String customerName,
            List<PackagingBalanceItemModel> items,
            @JsonKey(name: 'total_value') double totalValue,
            @JsonKey(name: 'last_updated') DateTime lastUpdated)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceModel() when $default != null:
        return $default(_that.customerId, _that.customerName, _that.items,
            _that.totalValue, _that.lastUpdated);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PackagingBalanceModel implements PackagingBalanceModel {
  const _PackagingBalanceModel(
      {@JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName,
      required final List<PackagingBalanceItemModel> items,
      @JsonKey(name: 'total_value') required this.totalValue,
      @JsonKey(name: 'last_updated') required this.lastUpdated})
      : _items = items;
  factory _PackagingBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$PackagingBalanceModelFromJson(json);

  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  final List<PackagingBalanceItemModel> _items;
  @override
  List<PackagingBalanceItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'total_value')
  final double totalValue;
  @override
  @JsonKey(name: 'last_updated')
  final DateTime lastUpdated;

  /// Create a copy of PackagingBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PackagingBalanceModelCopyWith<_PackagingBalanceModel> get copyWith =>
      __$PackagingBalanceModelCopyWithImpl<_PackagingBalanceModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PackagingBalanceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackagingBalanceModel &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customerId, customerName,
      const DeepCollectionEquality().hash(_items), totalValue, lastUpdated);

  @override
  String toString() {
    return 'PackagingBalanceModel(customerId: $customerId, customerName: $customerName, items: $items, totalValue: $totalValue, lastUpdated: $lastUpdated)';
  }
}

/// @nodoc
abstract mixin class _$PackagingBalanceModelCopyWith<$Res>
    implements $PackagingBalanceModelCopyWith<$Res> {
  factory _$PackagingBalanceModelCopyWith(_PackagingBalanceModel value,
          $Res Function(_PackagingBalanceModel) _then) =
      __$PackagingBalanceModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      List<PackagingBalanceItemModel> items,
      @JsonKey(name: 'total_value') double totalValue,
      @JsonKey(name: 'last_updated') DateTime lastUpdated});
}

/// @nodoc
class __$PackagingBalanceModelCopyWithImpl<$Res>
    implements _$PackagingBalanceModelCopyWith<$Res> {
  __$PackagingBalanceModelCopyWithImpl(this._self, this._then);

  final _PackagingBalanceModel _self;
  final $Res Function(_PackagingBalanceModel) _then;

  /// Create a copy of PackagingBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customerId = null,
    Object? customerName = null,
    Object? items = null,
    Object? totalValue = null,
    Object? lastUpdated = null,
  }) {
    return _then(_PackagingBalanceModel(
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PackagingBalanceItemModel>,
      totalValue: null == totalValue
          ? _self.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$PackagingBalanceItemModel {
  @JsonKey(name: 'packaging_id')
  String get packagingId;
  @JsonKey(name: 'packaging_name')
  String get packagingName;
  int get quantity;
  @JsonKey(name: 'unit_value')
  double get unitValue;
  @JsonKey(name: 'total_value')
  double get totalValue;

  /// Create a copy of PackagingBalanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PackagingBalanceItemModelCopyWith<PackagingBalanceItemModel> get copyWith =>
      _$PackagingBalanceItemModelCopyWithImpl<PackagingBalanceItemModel>(
          this as PackagingBalanceItemModel, _$identity);

  /// Serializes this PackagingBalanceItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PackagingBalanceItemModel &&
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
    return 'PackagingBalanceItemModel(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, totalValue: $totalValue)';
  }
}

/// @nodoc
abstract mixin class $PackagingBalanceItemModelCopyWith<$Res> {
  factory $PackagingBalanceItemModelCopyWith(PackagingBalanceItemModel value,
          $Res Function(PackagingBalanceItemModel) _then) =
      _$PackagingBalanceItemModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'packaging_id') String packagingId,
      @JsonKey(name: 'packaging_name') String packagingName,
      int quantity,
      @JsonKey(name: 'unit_value') double unitValue,
      @JsonKey(name: 'total_value') double totalValue});
}

/// @nodoc
class _$PackagingBalanceItemModelCopyWithImpl<$Res>
    implements $PackagingBalanceItemModelCopyWith<$Res> {
  _$PackagingBalanceItemModelCopyWithImpl(this._self, this._then);

  final PackagingBalanceItemModel _self;
  final $Res Function(PackagingBalanceItemModel) _then;

  /// Create a copy of PackagingBalanceItemModel
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

/// Adds pattern-matching-related methods to [PackagingBalanceItemModel].
extension PackagingBalanceItemModelPatterns on PackagingBalanceItemModel {
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
    TResult Function(_PackagingBalanceItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceItemModel() when $default != null:
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
    TResult Function(_PackagingBalanceItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceItemModel():
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
    TResult? Function(_PackagingBalanceItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceItemModel() when $default != null:
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
            @JsonKey(name: 'packaging_id') String packagingId,
            @JsonKey(name: 'packaging_name') String packagingName,
            int quantity,
            @JsonKey(name: 'unit_value') double unitValue,
            @JsonKey(name: 'total_value') double totalValue)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceItemModel() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'packaging_id') String packagingId,
            @JsonKey(name: 'packaging_name') String packagingName,
            int quantity,
            @JsonKey(name: 'unit_value') double unitValue,
            @JsonKey(name: 'total_value') double totalValue)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceItemModel():
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
    TResult? Function(
            @JsonKey(name: 'packaging_id') String packagingId,
            @JsonKey(name: 'packaging_name') String packagingName,
            int quantity,
            @JsonKey(name: 'unit_value') double unitValue,
            @JsonKey(name: 'total_value') double totalValue)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingBalanceItemModel() when $default != null:
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.unitValue, _that.totalValue);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PackagingBalanceItemModel implements PackagingBalanceItemModel {
  const _PackagingBalanceItemModel(
      {@JsonKey(name: 'packaging_id') required this.packagingId,
      @JsonKey(name: 'packaging_name') required this.packagingName,
      required this.quantity,
      @JsonKey(name: 'unit_value') required this.unitValue,
      @JsonKey(name: 'total_value') required this.totalValue});
  factory _PackagingBalanceItemModel.fromJson(Map<String, dynamic> json) =>
      _$PackagingBalanceItemModelFromJson(json);

  @override
  @JsonKey(name: 'packaging_id')
  final String packagingId;
  @override
  @JsonKey(name: 'packaging_name')
  final String packagingName;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'unit_value')
  final double unitValue;
  @override
  @JsonKey(name: 'total_value')
  final double totalValue;

  /// Create a copy of PackagingBalanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PackagingBalanceItemModelCopyWith<_PackagingBalanceItemModel>
      get copyWith =>
          __$PackagingBalanceItemModelCopyWithImpl<_PackagingBalanceItemModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PackagingBalanceItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackagingBalanceItemModel &&
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
    return 'PackagingBalanceItemModel(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, totalValue: $totalValue)';
  }
}

/// @nodoc
abstract mixin class _$PackagingBalanceItemModelCopyWith<$Res>
    implements $PackagingBalanceItemModelCopyWith<$Res> {
  factory _$PackagingBalanceItemModelCopyWith(_PackagingBalanceItemModel value,
          $Res Function(_PackagingBalanceItemModel) _then) =
      __$PackagingBalanceItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'packaging_id') String packagingId,
      @JsonKey(name: 'packaging_name') String packagingName,
      int quantity,
      @JsonKey(name: 'unit_value') double unitValue,
      @JsonKey(name: 'total_value') double totalValue});
}

/// @nodoc
class __$PackagingBalanceItemModelCopyWithImpl<$Res>
    implements _$PackagingBalanceItemModelCopyWith<$Res> {
  __$PackagingBalanceItemModelCopyWithImpl(this._self, this._then);

  final _PackagingBalanceItemModel _self;
  final $Res Function(_PackagingBalanceItemModel) _then;

  /// Create a copy of PackagingBalanceItemModel
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
    return _then(_PackagingBalanceItemModel(
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

/// @nodoc
mixin _$PackagingTypeModel {
  String get id;
  String get name;
  String get description;
  double get value;
  @JsonKey(name: 'qr_code_pattern')
  String? get qrCodePattern;
  @JsonKey(name: 'is_active')
  bool get isActive;

  /// Create a copy of PackagingTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PackagingTypeModelCopyWith<PackagingTypeModel> get copyWith =>
      _$PackagingTypeModelCopyWithImpl<PackagingTypeModel>(
          this as PackagingTypeModel, _$identity);

  /// Serializes this PackagingTypeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PackagingTypeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.qrCodePattern, qrCodePattern) ||
                other.qrCodePattern == qrCodePattern) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, value, qrCodePattern, isActive);

  @override
  String toString() {
    return 'PackagingTypeModel(id: $id, name: $name, description: $description, value: $value, qrCodePattern: $qrCodePattern, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class $PackagingTypeModelCopyWith<$Res> {
  factory $PackagingTypeModelCopyWith(
          PackagingTypeModel value, $Res Function(PackagingTypeModel) _then) =
      _$PackagingTypeModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double value,
      @JsonKey(name: 'qr_code_pattern') String? qrCodePattern,
      @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class _$PackagingTypeModelCopyWithImpl<$Res>
    implements $PackagingTypeModelCopyWith<$Res> {
  _$PackagingTypeModelCopyWithImpl(this._self, this._then);

  final PackagingTypeModel _self;
  final $Res Function(PackagingTypeModel) _then;

  /// Create a copy of PackagingTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? value = null,
    Object? qrCodePattern = freezed,
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
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      qrCodePattern: freezed == qrCodePattern
          ? _self.qrCodePattern
          : qrCodePattern // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PackagingTypeModel].
extension PackagingTypeModelPatterns on PackagingTypeModel {
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
    TResult Function(_PackagingTypeModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingTypeModel() when $default != null:
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
    TResult Function(_PackagingTypeModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingTypeModel():
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
    TResult? Function(_PackagingTypeModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingTypeModel() when $default != null:
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
            String name,
            String description,
            double value,
            @JsonKey(name: 'qr_code_pattern') String? qrCodePattern,
            @JsonKey(name: 'is_active') bool isActive)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingTypeModel() when $default != null:
        return $default(_that.id, _that.name, _that.description, _that.value,
            _that.qrCodePattern, _that.isActive);
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
            String name,
            String description,
            double value,
            @JsonKey(name: 'qr_code_pattern') String? qrCodePattern,
            @JsonKey(name: 'is_active') bool isActive)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingTypeModel():
        return $default(_that.id, _that.name, _that.description, _that.value,
            _that.qrCodePattern, _that.isActive);
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
            String name,
            String description,
            double value,
            @JsonKey(name: 'qr_code_pattern') String? qrCodePattern,
            @JsonKey(name: 'is_active') bool isActive)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingTypeModel() when $default != null:
        return $default(_that.id, _that.name, _that.description, _that.value,
            _that.qrCodePattern, _that.isActive);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PackagingTypeModel implements PackagingTypeModel {
  const _PackagingTypeModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.value,
      @JsonKey(name: 'qr_code_pattern') this.qrCodePattern,
      @JsonKey(name: 'is_active') required this.isActive});
  factory _PackagingTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PackagingTypeModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double value;
  @override
  @JsonKey(name: 'qr_code_pattern')
  final String? qrCodePattern;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;

  /// Create a copy of PackagingTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PackagingTypeModelCopyWith<_PackagingTypeModel> get copyWith =>
      __$PackagingTypeModelCopyWithImpl<_PackagingTypeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PackagingTypeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackagingTypeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.qrCodePattern, qrCodePattern) ||
                other.qrCodePattern == qrCodePattern) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, value, qrCodePattern, isActive);

  @override
  String toString() {
    return 'PackagingTypeModel(id: $id, name: $name, description: $description, value: $value, qrCodePattern: $qrCodePattern, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class _$PackagingTypeModelCopyWith<$Res>
    implements $PackagingTypeModelCopyWith<$Res> {
  factory _$PackagingTypeModelCopyWith(
          _PackagingTypeModel value, $Res Function(_PackagingTypeModel) _then) =
      __$PackagingTypeModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double value,
      @JsonKey(name: 'qr_code_pattern') String? qrCodePattern,
      @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class __$PackagingTypeModelCopyWithImpl<$Res>
    implements _$PackagingTypeModelCopyWith<$Res> {
  __$PackagingTypeModelCopyWithImpl(this._self, this._then);

  final _PackagingTypeModel _self;
  final $Res Function(_PackagingTypeModel) _then;

  /// Create a copy of PackagingTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? value = null,
    Object? qrCodePattern = freezed,
    Object? isActive = null,
  }) {
    return _then(_PackagingTypeModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      qrCodePattern: freezed == qrCodePattern
          ? _self.qrCodePattern
          : qrCodePattern // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$PackagingQrDataModel {
  @JsonKey(name: 'packaging_id')
  String get packagingId;
  @JsonKey(name: 'packaging_name')
  String get packagingName;
  int get quantity;
  @JsonKey(name: 'batch_number')
  String? get batchNumber;
  @JsonKey(name: 'expiry_date')
  DateTime? get expiryDate;

  /// Create a copy of PackagingQrDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PackagingQrDataModelCopyWith<PackagingQrDataModel> get copyWith =>
      _$PackagingQrDataModelCopyWithImpl<PackagingQrDataModel>(
          this as PackagingQrDataModel, _$identity);

  /// Serializes this PackagingQrDataModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PackagingQrDataModel &&
            (identical(other.packagingId, packagingId) ||
                other.packagingId == packagingId) &&
            (identical(other.packagingName, packagingName) ||
                other.packagingName == packagingName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, packagingId, packagingName,
      quantity, batchNumber, expiryDate);

  @override
  String toString() {
    return 'PackagingQrDataModel(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, batchNumber: $batchNumber, expiryDate: $expiryDate)';
  }
}

/// @nodoc
abstract mixin class $PackagingQrDataModelCopyWith<$Res> {
  factory $PackagingQrDataModelCopyWith(PackagingQrDataModel value,
          $Res Function(PackagingQrDataModel) _then) =
      _$PackagingQrDataModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'packaging_id') String packagingId,
      @JsonKey(name: 'packaging_name') String packagingName,
      int quantity,
      @JsonKey(name: 'batch_number') String? batchNumber,
      @JsonKey(name: 'expiry_date') DateTime? expiryDate});
}

/// @nodoc
class _$PackagingQrDataModelCopyWithImpl<$Res>
    implements $PackagingQrDataModelCopyWith<$Res> {
  _$PackagingQrDataModelCopyWithImpl(this._self, this._then);

  final PackagingQrDataModel _self;
  final $Res Function(PackagingQrDataModel) _then;

  /// Create a copy of PackagingQrDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packagingId = null,
    Object? packagingName = null,
    Object? quantity = null,
    Object? batchNumber = freezed,
    Object? expiryDate = freezed,
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
      batchNumber: freezed == batchNumber
          ? _self.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PackagingQrDataModel].
extension PackagingQrDataModelPatterns on PackagingQrDataModel {
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
    TResult Function(_PackagingQrDataModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingQrDataModel() when $default != null:
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
    TResult Function(_PackagingQrDataModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingQrDataModel():
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
    TResult? Function(_PackagingQrDataModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingQrDataModel() when $default != null:
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
            @JsonKey(name: 'packaging_id') String packagingId,
            @JsonKey(name: 'packaging_name') String packagingName,
            int quantity,
            @JsonKey(name: 'batch_number') String? batchNumber,
            @JsonKey(name: 'expiry_date') DateTime? expiryDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PackagingQrDataModel() when $default != null:
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.batchNumber, _that.expiryDate);
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
            @JsonKey(name: 'packaging_id') String packagingId,
            @JsonKey(name: 'packaging_name') String packagingName,
            int quantity,
            @JsonKey(name: 'batch_number') String? batchNumber,
            @JsonKey(name: 'expiry_date') DateTime? expiryDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingQrDataModel():
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.batchNumber, _that.expiryDate);
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
            @JsonKey(name: 'packaging_id') String packagingId,
            @JsonKey(name: 'packaging_name') String packagingName,
            int quantity,
            @JsonKey(name: 'batch_number') String? batchNumber,
            @JsonKey(name: 'expiry_date') DateTime? expiryDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PackagingQrDataModel() when $default != null:
        return $default(_that.packagingId, _that.packagingName, _that.quantity,
            _that.batchNumber, _that.expiryDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PackagingQrDataModel implements PackagingQrDataModel {
  const _PackagingQrDataModel(
      {@JsonKey(name: 'packaging_id') required this.packagingId,
      @JsonKey(name: 'packaging_name') required this.packagingName,
      required this.quantity,
      @JsonKey(name: 'batch_number') this.batchNumber,
      @JsonKey(name: 'expiry_date') this.expiryDate});
  factory _PackagingQrDataModel.fromJson(Map<String, dynamic> json) =>
      _$PackagingQrDataModelFromJson(json);

  @override
  @JsonKey(name: 'packaging_id')
  final String packagingId;
  @override
  @JsonKey(name: 'packaging_name')
  final String packagingName;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'batch_number')
  final String? batchNumber;
  @override
  @JsonKey(name: 'expiry_date')
  final DateTime? expiryDate;

  /// Create a copy of PackagingQrDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PackagingQrDataModelCopyWith<_PackagingQrDataModel> get copyWith =>
      __$PackagingQrDataModelCopyWithImpl<_PackagingQrDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PackagingQrDataModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackagingQrDataModel &&
            (identical(other.packagingId, packagingId) ||
                other.packagingId == packagingId) &&
            (identical(other.packagingName, packagingName) ||
                other.packagingName == packagingName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, packagingId, packagingName,
      quantity, batchNumber, expiryDate);

  @override
  String toString() {
    return 'PackagingQrDataModel(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, batchNumber: $batchNumber, expiryDate: $expiryDate)';
  }
}

/// @nodoc
abstract mixin class _$PackagingQrDataModelCopyWith<$Res>
    implements $PackagingQrDataModelCopyWith<$Res> {
  factory _$PackagingQrDataModelCopyWith(_PackagingQrDataModel value,
          $Res Function(_PackagingQrDataModel) _then) =
      __$PackagingQrDataModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'packaging_id') String packagingId,
      @JsonKey(name: 'packaging_name') String packagingName,
      int quantity,
      @JsonKey(name: 'batch_number') String? batchNumber,
      @JsonKey(name: 'expiry_date') DateTime? expiryDate});
}

/// @nodoc
class __$PackagingQrDataModelCopyWithImpl<$Res>
    implements _$PackagingQrDataModelCopyWith<$Res> {
  __$PackagingQrDataModelCopyWithImpl(this._self, this._then);

  final _PackagingQrDataModel _self;
  final $Res Function(_PackagingQrDataModel) _then;

  /// Create a copy of PackagingQrDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? packagingId = null,
    Object? packagingName = null,
    Object? quantity = null,
    Object? batchNumber = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_PackagingQrDataModel(
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
      batchNumber: freezed == batchNumber
          ? _self.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
