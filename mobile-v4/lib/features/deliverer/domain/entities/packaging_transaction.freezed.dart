// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'packaging_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PackagingTransaction _$PackagingTransactionFromJson(Map<String, dynamic> json) {
  return _PackagingTransaction.fromJson(json);
}

/// @nodoc
mixin _$PackagingTransaction {
  String get id => throw _privateConstructorUsedError;
  String get delivererId => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  PackagingTransactionType get type => throw _privateConstructorUsedError;
  List<PackagingItem> get items => throw _privateConstructorUsedError;
  DateTime get transactionDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get qrCodeData => throw _privateConstructorUsedError;
  bool get isUploaded => throw _privateConstructorUsedError;
  DateTime? get uploadedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PackagingTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackagingTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackagingTransactionCopyWith<PackagingTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackagingTransactionCopyWith<$Res> {
  factory $PackagingTransactionCopyWith(PackagingTransaction value,
          $Res Function(PackagingTransaction) then) =
      _$PackagingTransactionCopyWithImpl<$Res, PackagingTransaction>;
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
class _$PackagingTransactionCopyWithImpl<$Res,
        $Val extends PackagingTransaction>
    implements $PackagingTransactionCopyWith<$Res> {
  _$PackagingTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _value.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PackagingTransactionType,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PackagingItem>,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeData: freezed == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploaded: null == isUploaded
          ? _value.isUploaded
          : isUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackagingTransactionImplCopyWith<$Res>
    implements $PackagingTransactionCopyWith<$Res> {
  factory _$$PackagingTransactionImplCopyWith(_$PackagingTransactionImpl value,
          $Res Function(_$PackagingTransactionImpl) then) =
      __$$PackagingTransactionImplCopyWithImpl<$Res>;
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
class __$$PackagingTransactionImplCopyWithImpl<$Res>
    extends _$PackagingTransactionCopyWithImpl<$Res, _$PackagingTransactionImpl>
    implements _$$PackagingTransactionImplCopyWith<$Res> {
  __$$PackagingTransactionImplCopyWithImpl(_$PackagingTransactionImpl _value,
      $Res Function(_$PackagingTransactionImpl) _then)
      : super(_value, _then);

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
    return _then(_$PackagingTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      delivererId: null == delivererId
          ? _value.delivererId
          : delivererId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PackagingTransactionType,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PackagingItem>,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeData: freezed == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploaded: null == isUploaded
          ? _value.isUploaded
          : isUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackagingTransactionImpl implements _PackagingTransaction {
  const _$PackagingTransactionImpl(
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

  factory _$PackagingTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackagingTransactionImplFromJson(json);

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

  @override
  String toString() {
    return 'PackagingTransaction(id: $id, delivererId: $delivererId, customerId: $customerId, customerName: $customerName, type: $type, items: $items, transactionDate: $transactionDate, notes: $notes, qrCodeData: $qrCodeData, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackagingTransactionImpl &&
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

  /// Create a copy of PackagingTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackagingTransactionImplCopyWith<_$PackagingTransactionImpl>
      get copyWith =>
          __$$PackagingTransactionImplCopyWithImpl<_$PackagingTransactionImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackagingTransactionImplToJson(
      this,
    );
  }
}

abstract class _PackagingTransaction implements PackagingTransaction {
  const factory _PackagingTransaction(
      {required final String id,
      required final String delivererId,
      required final String customerId,
      required final String customerName,
      required final PackagingTransactionType type,
      required final List<PackagingItem> items,
      required final DateTime transactionDate,
      final String? notes,
      final String? qrCodeData,
      final bool isUploaded,
      final DateTime? uploadedAt,
      final DateTime? createdAt}) = _$PackagingTransactionImpl;

  factory _PackagingTransaction.fromJson(Map<String, dynamic> json) =
      _$PackagingTransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get delivererId;
  @override
  String get customerId;
  @override
  String get customerName;
  @override
  PackagingTransactionType get type;
  @override
  List<PackagingItem> get items;
  @override
  DateTime get transactionDate;
  @override
  String? get notes;
  @override
  String? get qrCodeData;
  @override
  bool get isUploaded;
  @override
  DateTime? get uploadedAt;
  @override
  DateTime? get createdAt;

  /// Create a copy of PackagingTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackagingTransactionImplCopyWith<_$PackagingTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PackagingItem _$PackagingItemFromJson(Map<String, dynamic> json) {
  return _PackagingItem.fromJson(json);
}

/// @nodoc
mixin _$PackagingItem {
  String get packagingId => throw _privateConstructorUsedError;
  String get packagingName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitValue =>
      throw _privateConstructorUsedError; // Valeur unitaire de la consigne
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this PackagingItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackagingItemCopyWith<PackagingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackagingItemCopyWith<$Res> {
  factory $PackagingItemCopyWith(
          PackagingItem value, $Res Function(PackagingItem) then) =
      _$PackagingItemCopyWithImpl<$Res, PackagingItem>;
  @useResult
  $Res call(
      {String packagingId,
      String packagingName,
      int quantity,
      double unitValue,
      String? description});
}

/// @nodoc
class _$PackagingItemCopyWithImpl<$Res, $Val extends PackagingItem>
    implements $PackagingItemCopyWith<$Res> {
  _$PackagingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      packagingId: null == packagingId
          ? _value.packagingId
          : packagingId // ignore: cast_nullable_to_non_nullable
              as String,
      packagingName: null == packagingName
          ? _value.packagingName
          : packagingName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitValue: null == unitValue
          ? _value.unitValue
          : unitValue // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackagingItemImplCopyWith<$Res>
    implements $PackagingItemCopyWith<$Res> {
  factory _$$PackagingItemImplCopyWith(
          _$PackagingItemImpl value, $Res Function(_$PackagingItemImpl) then) =
      __$$PackagingItemImplCopyWithImpl<$Res>;
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
class __$$PackagingItemImplCopyWithImpl<$Res>
    extends _$PackagingItemCopyWithImpl<$Res, _$PackagingItemImpl>
    implements _$$PackagingItemImplCopyWith<$Res> {
  __$$PackagingItemImplCopyWithImpl(
      _$PackagingItemImpl _value, $Res Function(_$PackagingItemImpl) _then)
      : super(_value, _then);

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
    return _then(_$PackagingItemImpl(
      packagingId: null == packagingId
          ? _value.packagingId
          : packagingId // ignore: cast_nullable_to_non_nullable
              as String,
      packagingName: null == packagingName
          ? _value.packagingName
          : packagingName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitValue: null == unitValue
          ? _value.unitValue
          : unitValue // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackagingItemImpl implements _PackagingItem {
  const _$PackagingItemImpl(
      {required this.packagingId,
      required this.packagingName,
      required this.quantity,
      required this.unitValue,
      this.description});

  factory _$PackagingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackagingItemImplFromJson(json);

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

  @override
  String toString() {
    return 'PackagingItem(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackagingItemImpl &&
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

  /// Create a copy of PackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackagingItemImplCopyWith<_$PackagingItemImpl> get copyWith =>
      __$$PackagingItemImplCopyWithImpl<_$PackagingItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackagingItemImplToJson(
      this,
    );
  }
}

abstract class _PackagingItem implements PackagingItem {
  const factory _PackagingItem(
      {required final String packagingId,
      required final String packagingName,
      required final int quantity,
      required final double unitValue,
      final String? description}) = _$PackagingItemImpl;

  factory _PackagingItem.fromJson(Map<String, dynamic> json) =
      _$PackagingItemImpl.fromJson;

  @override
  String get packagingId;
  @override
  String get packagingName;
  @override
  int get quantity;
  @override
  double get unitValue; // Valeur unitaire de la consigne
  @override
  String? get description;

  /// Create a copy of PackagingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackagingItemImplCopyWith<_$PackagingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
