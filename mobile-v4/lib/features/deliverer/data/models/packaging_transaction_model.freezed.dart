// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'packaging_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PackagingTransactionModel _$PackagingTransactionModelFromJson(
    Map<String, dynamic> json) {
  return _PackagingTransactionModel.fromJson(json);
}

/// @nodoc
mixin _$PackagingTransactionModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliverer_id')
  String get delivererId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  PackagingTransactionType get type => throw _privateConstructorUsedError;
  List<PackagingItemModel> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date')
  DateTime get transactionDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code_data')
  String? get qrCodeData => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_uploaded')
  bool get isUploaded => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_at')
  DateTime? get uploadedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PackagingTransactionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackagingTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackagingTransactionModelCopyWith<PackagingTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackagingTransactionModelCopyWith<$Res> {
  factory $PackagingTransactionModelCopyWith(PackagingTransactionModel value,
          $Res Function(PackagingTransactionModel) then) =
      _$PackagingTransactionModelCopyWithImpl<$Res, PackagingTransactionModel>;
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
class _$PackagingTransactionModelCopyWithImpl<$Res,
        $Val extends PackagingTransactionModel>
    implements $PackagingTransactionModelCopyWith<$Res> {
  _$PackagingTransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as List<PackagingItemModel>,
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
abstract class _$$PackagingTransactionModelImplCopyWith<$Res>
    implements $PackagingTransactionModelCopyWith<$Res> {
  factory _$$PackagingTransactionModelImplCopyWith(
          _$PackagingTransactionModelImpl value,
          $Res Function(_$PackagingTransactionModelImpl) then) =
      __$$PackagingTransactionModelImplCopyWithImpl<$Res>;
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
class __$$PackagingTransactionModelImplCopyWithImpl<$Res>
    extends _$PackagingTransactionModelCopyWithImpl<$Res,
        _$PackagingTransactionModelImpl>
    implements _$$PackagingTransactionModelImplCopyWith<$Res> {
  __$$PackagingTransactionModelImplCopyWithImpl(
      _$PackagingTransactionModelImpl _value,
      $Res Function(_$PackagingTransactionModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$PackagingTransactionModelImpl(
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
              as List<PackagingItemModel>,
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
class _$PackagingTransactionModelImpl implements _PackagingTransactionModel {
  const _$PackagingTransactionModelImpl(
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

  factory _$PackagingTransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackagingTransactionModelImplFromJson(json);

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

  @override
  String toString() {
    return 'PackagingTransactionModel(id: $id, delivererId: $delivererId, customerId: $customerId, customerName: $customerName, type: $type, items: $items, transactionDate: $transactionDate, notes: $notes, qrCodeData: $qrCodeData, isUploaded: $isUploaded, uploadedAt: $uploadedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackagingTransactionModelImpl &&
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

  /// Create a copy of PackagingTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackagingTransactionModelImplCopyWith<_$PackagingTransactionModelImpl>
      get copyWith => __$$PackagingTransactionModelImplCopyWithImpl<
          _$PackagingTransactionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackagingTransactionModelImplToJson(
      this,
    );
  }
}

abstract class _PackagingTransactionModel implements PackagingTransactionModel {
  const factory _PackagingTransactionModel(
          {required final String id,
          @JsonKey(name: 'deliverer_id') required final String delivererId,
          @JsonKey(name: 'customer_id') required final String customerId,
          @JsonKey(name: 'customer_name') required final String customerName,
          required final PackagingTransactionType type,
          required final List<PackagingItemModel> items,
          @JsonKey(name: 'transaction_date')
          required final DateTime transactionDate,
          final String? notes,
          @JsonKey(name: 'qr_code_data') final String? qrCodeData,
          @JsonKey(name: 'is_uploaded') final bool isUploaded,
          @JsonKey(name: 'uploaded_at') final DateTime? uploadedAt,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$PackagingTransactionModelImpl;

  factory _PackagingTransactionModel.fromJson(Map<String, dynamic> json) =
      _$PackagingTransactionModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'deliverer_id')
  String get delivererId;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  PackagingTransactionType get type;
  @override
  List<PackagingItemModel> get items;
  @override
  @JsonKey(name: 'transaction_date')
  DateTime get transactionDate;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'qr_code_data')
  String? get qrCodeData;
  @override
  @JsonKey(name: 'is_uploaded')
  bool get isUploaded;
  @override
  @JsonKey(name: 'uploaded_at')
  DateTime? get uploadedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of PackagingTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackagingTransactionModelImplCopyWith<_$PackagingTransactionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PackagingItemModel _$PackagingItemModelFromJson(Map<String, dynamic> json) {
  return _PackagingItemModel.fromJson(json);
}

/// @nodoc
mixin _$PackagingItemModel {
  @JsonKey(name: 'packaging_id')
  String get packagingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'packaging_name')
  String get packagingName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_value')
  double get unitValue => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this PackagingItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackagingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackagingItemModelCopyWith<PackagingItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackagingItemModelCopyWith<$Res> {
  factory $PackagingItemModelCopyWith(
          PackagingItemModel value, $Res Function(PackagingItemModel) then) =
      _$PackagingItemModelCopyWithImpl<$Res, PackagingItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'packaging_id') String packagingId,
      @JsonKey(name: 'packaging_name') String packagingName,
      int quantity,
      @JsonKey(name: 'unit_value') double unitValue,
      String? description});
}

/// @nodoc
class _$PackagingItemModelCopyWithImpl<$Res, $Val extends PackagingItemModel>
    implements $PackagingItemModelCopyWith<$Res> {
  _$PackagingItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$PackagingItemModelImplCopyWith<$Res>
    implements $PackagingItemModelCopyWith<$Res> {
  factory _$$PackagingItemModelImplCopyWith(_$PackagingItemModelImpl value,
          $Res Function(_$PackagingItemModelImpl) then) =
      __$$PackagingItemModelImplCopyWithImpl<$Res>;
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
class __$$PackagingItemModelImplCopyWithImpl<$Res>
    extends _$PackagingItemModelCopyWithImpl<$Res, _$PackagingItemModelImpl>
    implements _$$PackagingItemModelImplCopyWith<$Res> {
  __$$PackagingItemModelImplCopyWithImpl(_$PackagingItemModelImpl _value,
      $Res Function(_$PackagingItemModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$PackagingItemModelImpl(
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
class _$PackagingItemModelImpl implements _PackagingItemModel {
  const _$PackagingItemModelImpl(
      {@JsonKey(name: 'packaging_id') required this.packagingId,
      @JsonKey(name: 'packaging_name') required this.packagingName,
      required this.quantity,
      @JsonKey(name: 'unit_value') required this.unitValue,
      this.description});

  factory _$PackagingItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackagingItemModelImplFromJson(json);

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

  @override
  String toString() {
    return 'PackagingItemModel(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackagingItemModelImpl &&
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

  /// Create a copy of PackagingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackagingItemModelImplCopyWith<_$PackagingItemModelImpl> get copyWith =>
      __$$PackagingItemModelImplCopyWithImpl<_$PackagingItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackagingItemModelImplToJson(
      this,
    );
  }
}

abstract class _PackagingItemModel implements PackagingItemModel {
  const factory _PackagingItemModel(
      {@JsonKey(name: 'packaging_id') required final String packagingId,
      @JsonKey(name: 'packaging_name') required final String packagingName,
      required final int quantity,
      @JsonKey(name: 'unit_value') required final double unitValue,
      final String? description}) = _$PackagingItemModelImpl;

  factory _PackagingItemModel.fromJson(Map<String, dynamic> json) =
      _$PackagingItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'packaging_id')
  String get packagingId;
  @override
  @JsonKey(name: 'packaging_name')
  String get packagingName;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'unit_value')
  double get unitValue;
  @override
  String? get description;

  /// Create a copy of PackagingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackagingItemModelImplCopyWith<_$PackagingItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadPackagingTransactionRequest _$UploadPackagingTransactionRequestFromJson(
    Map<String, dynamic> json) {
  return _UploadPackagingTransactionRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadPackagingTransactionRequest {
  @JsonKey(name: 'deliverer_id')
  String get delivererId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date')
  DateTime get transactionDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code_data')
  String? get qrCodeData => throw _privateConstructorUsedError;

  /// Serializes this UploadPackagingTransactionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadPackagingTransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadPackagingTransactionRequestCopyWith<UploadPackagingTransactionRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadPackagingTransactionRequestCopyWith<$Res> {
  factory $UploadPackagingTransactionRequestCopyWith(
          UploadPackagingTransactionRequest value,
          $Res Function(UploadPackagingTransactionRequest) then) =
      _$UploadPackagingTransactionRequestCopyWithImpl<$Res,
          UploadPackagingTransactionRequest>;
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
class _$UploadPackagingTransactionRequestCopyWithImpl<$Res,
        $Val extends UploadPackagingTransactionRequest>
    implements $UploadPackagingTransactionRequestCopyWith<$Res> {
  _$UploadPackagingTransactionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
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
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadPackagingTransactionRequestImplCopyWith<$Res>
    implements $UploadPackagingTransactionRequestCopyWith<$Res> {
  factory _$$UploadPackagingTransactionRequestImplCopyWith(
          _$UploadPackagingTransactionRequestImpl value,
          $Res Function(_$UploadPackagingTransactionRequestImpl) then) =
      __$$UploadPackagingTransactionRequestImplCopyWithImpl<$Res>;
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
class __$$UploadPackagingTransactionRequestImplCopyWithImpl<$Res>
    extends _$UploadPackagingTransactionRequestCopyWithImpl<$Res,
        _$UploadPackagingTransactionRequestImpl>
    implements _$$UploadPackagingTransactionRequestImplCopyWith<$Res> {
  __$$UploadPackagingTransactionRequestImplCopyWithImpl(
      _$UploadPackagingTransactionRequestImpl _value,
      $Res Function(_$UploadPackagingTransactionRequestImpl) _then)
      : super(_value, _then);

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
    return _then(_$UploadPackagingTransactionRequestImpl(
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
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadPackagingTransactionRequestImpl
    implements _UploadPackagingTransactionRequest {
  const _$UploadPackagingTransactionRequestImpl(
      {@JsonKey(name: 'deliverer_id') required this.delivererId,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName,
      required this.type,
      required final List<Map<String, dynamic>> items,
      @JsonKey(name: 'transaction_date') required this.transactionDate,
      this.notes,
      @JsonKey(name: 'qr_code_data') this.qrCodeData})
      : _items = items;

  factory _$UploadPackagingTransactionRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UploadPackagingTransactionRequestImplFromJson(json);

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

  @override
  String toString() {
    return 'UploadPackagingTransactionRequest(delivererId: $delivererId, customerId: $customerId, customerName: $customerName, type: $type, items: $items, transactionDate: $transactionDate, notes: $notes, qrCodeData: $qrCodeData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadPackagingTransactionRequestImpl &&
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

  /// Create a copy of UploadPackagingTransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadPackagingTransactionRequestImplCopyWith<
          _$UploadPackagingTransactionRequestImpl>
      get copyWith => __$$UploadPackagingTransactionRequestImplCopyWithImpl<
          _$UploadPackagingTransactionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadPackagingTransactionRequestImplToJson(
      this,
    );
  }
}

abstract class _UploadPackagingTransactionRequest
    implements UploadPackagingTransactionRequest {
  const factory _UploadPackagingTransactionRequest(
          {@JsonKey(name: 'deliverer_id') required final String delivererId,
          @JsonKey(name: 'customer_id') required final String customerId,
          @JsonKey(name: 'customer_name') required final String customerName,
          required final String type,
          required final List<Map<String, dynamic>> items,
          @JsonKey(name: 'transaction_date')
          required final DateTime transactionDate,
          final String? notes,
          @JsonKey(name: 'qr_code_data') final String? qrCodeData}) =
      _$UploadPackagingTransactionRequestImpl;

  factory _UploadPackagingTransactionRequest.fromJson(
          Map<String, dynamic> json) =
      _$UploadPackagingTransactionRequestImpl.fromJson;

  @override
  @JsonKey(name: 'deliverer_id')
  String get delivererId;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  String get type;
  @override
  List<Map<String, dynamic>> get items;
  @override
  @JsonKey(name: 'transaction_date')
  DateTime get transactionDate;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'qr_code_data')
  String? get qrCodeData;

  /// Create a copy of UploadPackagingTransactionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadPackagingTransactionRequestImplCopyWith<
          _$UploadPackagingTransactionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UploadPackagingTransactionResponse _$UploadPackagingTransactionResponseFromJson(
    Map<String, dynamic> json) {
  return _UploadPackagingTransactionResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadPackagingTransactionResponse {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_at')
  DateTime get uploadedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_balance')
  double? get newBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance_items')
  List<Map<String, dynamic>>? get balanceItems =>
      throw _privateConstructorUsedError;

  /// Serializes this UploadPackagingTransactionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadPackagingTransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadPackagingTransactionResponseCopyWith<
          UploadPackagingTransactionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadPackagingTransactionResponseCopyWith<$Res> {
  factory $UploadPackagingTransactionResponseCopyWith(
          UploadPackagingTransactionResponse value,
          $Res Function(UploadPackagingTransactionResponse) then) =
      _$UploadPackagingTransactionResponseCopyWithImpl<$Res,
          UploadPackagingTransactionResponse>;
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
class _$UploadPackagingTransactionResponseCopyWithImpl<$Res,
        $Val extends UploadPackagingTransactionResponse>
    implements $UploadPackagingTransactionResponseCopyWith<$Res> {
  _$UploadPackagingTransactionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      newBalance: freezed == newBalance
          ? _value.newBalance
          : newBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceItems: freezed == balanceItems
          ? _value.balanceItems
          : balanceItems // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadPackagingTransactionResponseImplCopyWith<$Res>
    implements $UploadPackagingTransactionResponseCopyWith<$Res> {
  factory _$$UploadPackagingTransactionResponseImplCopyWith(
          _$UploadPackagingTransactionResponseImpl value,
          $Res Function(_$UploadPackagingTransactionResponseImpl) then) =
      __$$UploadPackagingTransactionResponseImplCopyWithImpl<$Res>;
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
class __$$UploadPackagingTransactionResponseImplCopyWithImpl<$Res>
    extends _$UploadPackagingTransactionResponseCopyWithImpl<$Res,
        _$UploadPackagingTransactionResponseImpl>
    implements _$$UploadPackagingTransactionResponseImplCopyWith<$Res> {
  __$$UploadPackagingTransactionResponseImplCopyWithImpl(
      _$UploadPackagingTransactionResponseImpl _value,
      $Res Function(_$UploadPackagingTransactionResponseImpl) _then)
      : super(_value, _then);

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
    return _then(_$UploadPackagingTransactionResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      newBalance: freezed == newBalance
          ? _value.newBalance
          : newBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceItems: freezed == balanceItems
          ? _value._balanceItems
          : balanceItems // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadPackagingTransactionResponseImpl
    implements _UploadPackagingTransactionResponse {
  const _$UploadPackagingTransactionResponseImpl(
      {required this.id,
      required this.status,
      required this.message,
      @JsonKey(name: 'uploaded_at') required this.uploadedAt,
      @JsonKey(name: 'new_balance') this.newBalance,
      @JsonKey(name: 'balance_items')
      final List<Map<String, dynamic>>? balanceItems})
      : _balanceItems = balanceItems;

  factory _$UploadPackagingTransactionResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UploadPackagingTransactionResponseImplFromJson(json);

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

  @override
  String toString() {
    return 'UploadPackagingTransactionResponse(id: $id, status: $status, message: $message, uploadedAt: $uploadedAt, newBalance: $newBalance, balanceItems: $balanceItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadPackagingTransactionResponseImpl &&
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

  /// Create a copy of UploadPackagingTransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadPackagingTransactionResponseImplCopyWith<
          _$UploadPackagingTransactionResponseImpl>
      get copyWith => __$$UploadPackagingTransactionResponseImplCopyWithImpl<
          _$UploadPackagingTransactionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadPackagingTransactionResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadPackagingTransactionResponse
    implements UploadPackagingTransactionResponse {
  const factory _UploadPackagingTransactionResponse(
          {required final String id,
          required final String status,
          required final String message,
          @JsonKey(name: 'uploaded_at') required final DateTime uploadedAt,
          @JsonKey(name: 'new_balance') final double? newBalance,
          @JsonKey(name: 'balance_items')
          final List<Map<String, dynamic>>? balanceItems}) =
      _$UploadPackagingTransactionResponseImpl;

  factory _UploadPackagingTransactionResponse.fromJson(
          Map<String, dynamic> json) =
      _$UploadPackagingTransactionResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String get message;
  @override
  @JsonKey(name: 'uploaded_at')
  DateTime get uploadedAt;
  @override
  @JsonKey(name: 'new_balance')
  double? get newBalance;
  @override
  @JsonKey(name: 'balance_items')
  List<Map<String, dynamic>>? get balanceItems;

  /// Create a copy of UploadPackagingTransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadPackagingTransactionResponseImplCopyWith<
          _$UploadPackagingTransactionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PackagingBalanceModel _$PackagingBalanceModelFromJson(
    Map<String, dynamic> json) {
  return _PackagingBalanceModel.fromJson(json);
}

/// @nodoc
mixin _$PackagingBalanceModel {
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  List<PackagingBalanceItemModel> get items =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'total_value')
  double get totalValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated')
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this PackagingBalanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackagingBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackagingBalanceModelCopyWith<PackagingBalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackagingBalanceModelCopyWith<$Res> {
  factory $PackagingBalanceModelCopyWith(PackagingBalanceModel value,
          $Res Function(PackagingBalanceModel) then) =
      _$PackagingBalanceModelCopyWithImpl<$Res, PackagingBalanceModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      List<PackagingBalanceItemModel> items,
      @JsonKey(name: 'total_value') double totalValue,
      @JsonKey(name: 'last_updated') DateTime lastUpdated});
}

/// @nodoc
class _$PackagingBalanceModelCopyWithImpl<$Res,
        $Val extends PackagingBalanceModel>
    implements $PackagingBalanceModelCopyWith<$Res> {
  _$PackagingBalanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PackagingBalanceItemModel>,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackagingBalanceModelImplCopyWith<$Res>
    implements $PackagingBalanceModelCopyWith<$Res> {
  factory _$$PackagingBalanceModelImplCopyWith(
          _$PackagingBalanceModelImpl value,
          $Res Function(_$PackagingBalanceModelImpl) then) =
      __$$PackagingBalanceModelImplCopyWithImpl<$Res>;
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
class __$$PackagingBalanceModelImplCopyWithImpl<$Res>
    extends _$PackagingBalanceModelCopyWithImpl<$Res,
        _$PackagingBalanceModelImpl>
    implements _$$PackagingBalanceModelImplCopyWith<$Res> {
  __$$PackagingBalanceModelImplCopyWithImpl(_$PackagingBalanceModelImpl _value,
      $Res Function(_$PackagingBalanceModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$PackagingBalanceModelImpl(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PackagingBalanceItemModel>,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackagingBalanceModelImpl implements _PackagingBalanceModel {
  const _$PackagingBalanceModelImpl(
      {@JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName,
      required final List<PackagingBalanceItemModel> items,
      @JsonKey(name: 'total_value') required this.totalValue,
      @JsonKey(name: 'last_updated') required this.lastUpdated})
      : _items = items;

  factory _$PackagingBalanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackagingBalanceModelImplFromJson(json);

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

  @override
  String toString() {
    return 'PackagingBalanceModel(customerId: $customerId, customerName: $customerName, items: $items, totalValue: $totalValue, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackagingBalanceModelImpl &&
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

  /// Create a copy of PackagingBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackagingBalanceModelImplCopyWith<_$PackagingBalanceModelImpl>
      get copyWith => __$$PackagingBalanceModelImplCopyWithImpl<
          _$PackagingBalanceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackagingBalanceModelImplToJson(
      this,
    );
  }
}

abstract class _PackagingBalanceModel implements PackagingBalanceModel {
  const factory _PackagingBalanceModel(
          {@JsonKey(name: 'customer_id') required final String customerId,
          @JsonKey(name: 'customer_name') required final String customerName,
          required final List<PackagingBalanceItemModel> items,
          @JsonKey(name: 'total_value') required final double totalValue,
          @JsonKey(name: 'last_updated') required final DateTime lastUpdated}) =
      _$PackagingBalanceModelImpl;

  factory _PackagingBalanceModel.fromJson(Map<String, dynamic> json) =
      _$PackagingBalanceModelImpl.fromJson;

  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  List<PackagingBalanceItemModel> get items;
  @override
  @JsonKey(name: 'total_value')
  double get totalValue;
  @override
  @JsonKey(name: 'last_updated')
  DateTime get lastUpdated;

  /// Create a copy of PackagingBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackagingBalanceModelImplCopyWith<_$PackagingBalanceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PackagingBalanceItemModel _$PackagingBalanceItemModelFromJson(
    Map<String, dynamic> json) {
  return _PackagingBalanceItemModel.fromJson(json);
}

/// @nodoc
mixin _$PackagingBalanceItemModel {
  @JsonKey(name: 'packaging_id')
  String get packagingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'packaging_name')
  String get packagingName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_value')
  double get unitValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_value')
  double get totalValue => throw _privateConstructorUsedError;

  /// Serializes this PackagingBalanceItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackagingBalanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackagingBalanceItemModelCopyWith<PackagingBalanceItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackagingBalanceItemModelCopyWith<$Res> {
  factory $PackagingBalanceItemModelCopyWith(PackagingBalanceItemModel value,
          $Res Function(PackagingBalanceItemModel) then) =
      _$PackagingBalanceItemModelCopyWithImpl<$Res, PackagingBalanceItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'packaging_id') String packagingId,
      @JsonKey(name: 'packaging_name') String packagingName,
      int quantity,
      @JsonKey(name: 'unit_value') double unitValue,
      @JsonKey(name: 'total_value') double totalValue});
}

/// @nodoc
class _$PackagingBalanceItemModelCopyWithImpl<$Res,
        $Val extends PackagingBalanceItemModel>
    implements $PackagingBalanceItemModelCopyWith<$Res> {
  _$PackagingBalanceItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackagingBalanceItemModelImplCopyWith<$Res>
    implements $PackagingBalanceItemModelCopyWith<$Res> {
  factory _$$PackagingBalanceItemModelImplCopyWith(
          _$PackagingBalanceItemModelImpl value,
          $Res Function(_$PackagingBalanceItemModelImpl) then) =
      __$$PackagingBalanceItemModelImplCopyWithImpl<$Res>;
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
class __$$PackagingBalanceItemModelImplCopyWithImpl<$Res>
    extends _$PackagingBalanceItemModelCopyWithImpl<$Res,
        _$PackagingBalanceItemModelImpl>
    implements _$$PackagingBalanceItemModelImplCopyWith<$Res> {
  __$$PackagingBalanceItemModelImplCopyWithImpl(
      _$PackagingBalanceItemModelImpl _value,
      $Res Function(_$PackagingBalanceItemModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$PackagingBalanceItemModelImpl(
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
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackagingBalanceItemModelImpl implements _PackagingBalanceItemModel {
  const _$PackagingBalanceItemModelImpl(
      {@JsonKey(name: 'packaging_id') required this.packagingId,
      @JsonKey(name: 'packaging_name') required this.packagingName,
      required this.quantity,
      @JsonKey(name: 'unit_value') required this.unitValue,
      @JsonKey(name: 'total_value') required this.totalValue});

  factory _$PackagingBalanceItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackagingBalanceItemModelImplFromJson(json);

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

  @override
  String toString() {
    return 'PackagingBalanceItemModel(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, unitValue: $unitValue, totalValue: $totalValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackagingBalanceItemModelImpl &&
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

  /// Create a copy of PackagingBalanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackagingBalanceItemModelImplCopyWith<_$PackagingBalanceItemModelImpl>
      get copyWith => __$$PackagingBalanceItemModelImplCopyWithImpl<
          _$PackagingBalanceItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackagingBalanceItemModelImplToJson(
      this,
    );
  }
}

abstract class _PackagingBalanceItemModel implements PackagingBalanceItemModel {
  const factory _PackagingBalanceItemModel(
          {@JsonKey(name: 'packaging_id') required final String packagingId,
          @JsonKey(name: 'packaging_name') required final String packagingName,
          required final int quantity,
          @JsonKey(name: 'unit_value') required final double unitValue,
          @JsonKey(name: 'total_value') required final double totalValue}) =
      _$PackagingBalanceItemModelImpl;

  factory _PackagingBalanceItemModel.fromJson(Map<String, dynamic> json) =
      _$PackagingBalanceItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'packaging_id')
  String get packagingId;
  @override
  @JsonKey(name: 'packaging_name')
  String get packagingName;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'unit_value')
  double get unitValue;
  @override
  @JsonKey(name: 'total_value')
  double get totalValue;

  /// Create a copy of PackagingBalanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackagingBalanceItemModelImplCopyWith<_$PackagingBalanceItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PackagingTypeModel _$PackagingTypeModelFromJson(Map<String, dynamic> json) {
  return _PackagingTypeModel.fromJson(json);
}

/// @nodoc
mixin _$PackagingTypeModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code_pattern')
  String? get qrCodePattern => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this PackagingTypeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackagingTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackagingTypeModelCopyWith<PackagingTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackagingTypeModelCopyWith<$Res> {
  factory $PackagingTypeModelCopyWith(
          PackagingTypeModel value, $Res Function(PackagingTypeModel) then) =
      _$PackagingTypeModelCopyWithImpl<$Res, PackagingTypeModel>;
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
class _$PackagingTypeModelCopyWithImpl<$Res, $Val extends PackagingTypeModel>
    implements $PackagingTypeModelCopyWith<$Res> {
  _$PackagingTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      qrCodePattern: freezed == qrCodePattern
          ? _value.qrCodePattern
          : qrCodePattern // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackagingTypeModelImplCopyWith<$Res>
    implements $PackagingTypeModelCopyWith<$Res> {
  factory _$$PackagingTypeModelImplCopyWith(_$PackagingTypeModelImpl value,
          $Res Function(_$PackagingTypeModelImpl) then) =
      __$$PackagingTypeModelImplCopyWithImpl<$Res>;
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
class __$$PackagingTypeModelImplCopyWithImpl<$Res>
    extends _$PackagingTypeModelCopyWithImpl<$Res, _$PackagingTypeModelImpl>
    implements _$$PackagingTypeModelImplCopyWith<$Res> {
  __$$PackagingTypeModelImplCopyWithImpl(_$PackagingTypeModelImpl _value,
      $Res Function(_$PackagingTypeModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$PackagingTypeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      qrCodePattern: freezed == qrCodePattern
          ? _value.qrCodePattern
          : qrCodePattern // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackagingTypeModelImpl implements _PackagingTypeModel {
  const _$PackagingTypeModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.value,
      @JsonKey(name: 'qr_code_pattern') this.qrCodePattern,
      @JsonKey(name: 'is_active') required this.isActive});

  factory _$PackagingTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackagingTypeModelImplFromJson(json);

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

  @override
  String toString() {
    return 'PackagingTypeModel(id: $id, name: $name, description: $description, value: $value, qrCodePattern: $qrCodePattern, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackagingTypeModelImpl &&
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

  /// Create a copy of PackagingTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackagingTypeModelImplCopyWith<_$PackagingTypeModelImpl> get copyWith =>
      __$$PackagingTypeModelImplCopyWithImpl<_$PackagingTypeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackagingTypeModelImplToJson(
      this,
    );
  }
}

abstract class _PackagingTypeModel implements PackagingTypeModel {
  const factory _PackagingTypeModel(
          {required final String id,
          required final String name,
          required final String description,
          required final double value,
          @JsonKey(name: 'qr_code_pattern') final String? qrCodePattern,
          @JsonKey(name: 'is_active') required final bool isActive}) =
      _$PackagingTypeModelImpl;

  factory _PackagingTypeModel.fromJson(Map<String, dynamic> json) =
      _$PackagingTypeModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get value;
  @override
  @JsonKey(name: 'qr_code_pattern')
  String? get qrCodePattern;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;

  /// Create a copy of PackagingTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackagingTypeModelImplCopyWith<_$PackagingTypeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PackagingQrDataModel _$PackagingQrDataModelFromJson(Map<String, dynamic> json) {
  return _PackagingQrDataModel.fromJson(json);
}

/// @nodoc
mixin _$PackagingQrDataModel {
  @JsonKey(name: 'packaging_id')
  String get packagingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'packaging_name')
  String get packagingName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_number')
  String? get batchNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry_date')
  DateTime? get expiryDate => throw _privateConstructorUsedError;

  /// Serializes this PackagingQrDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackagingQrDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackagingQrDataModelCopyWith<PackagingQrDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackagingQrDataModelCopyWith<$Res> {
  factory $PackagingQrDataModelCopyWith(PackagingQrDataModel value,
          $Res Function(PackagingQrDataModel) then) =
      _$PackagingQrDataModelCopyWithImpl<$Res, PackagingQrDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'packaging_id') String packagingId,
      @JsonKey(name: 'packaging_name') String packagingName,
      int quantity,
      @JsonKey(name: 'batch_number') String? batchNumber,
      @JsonKey(name: 'expiry_date') DateTime? expiryDate});
}

/// @nodoc
class _$PackagingQrDataModelCopyWithImpl<$Res,
        $Val extends PackagingQrDataModel>
    implements $PackagingQrDataModelCopyWith<$Res> {
  _$PackagingQrDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
      batchNumber: freezed == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackagingQrDataModelImplCopyWith<$Res>
    implements $PackagingQrDataModelCopyWith<$Res> {
  factory _$$PackagingQrDataModelImplCopyWith(_$PackagingQrDataModelImpl value,
          $Res Function(_$PackagingQrDataModelImpl) then) =
      __$$PackagingQrDataModelImplCopyWithImpl<$Res>;
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
class __$$PackagingQrDataModelImplCopyWithImpl<$Res>
    extends _$PackagingQrDataModelCopyWithImpl<$Res, _$PackagingQrDataModelImpl>
    implements _$$PackagingQrDataModelImplCopyWith<$Res> {
  __$$PackagingQrDataModelImplCopyWithImpl(_$PackagingQrDataModelImpl _value,
      $Res Function(_$PackagingQrDataModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$PackagingQrDataModelImpl(
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
      batchNumber: freezed == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackagingQrDataModelImpl implements _PackagingQrDataModel {
  const _$PackagingQrDataModelImpl(
      {@JsonKey(name: 'packaging_id') required this.packagingId,
      @JsonKey(name: 'packaging_name') required this.packagingName,
      required this.quantity,
      @JsonKey(name: 'batch_number') this.batchNumber,
      @JsonKey(name: 'expiry_date') this.expiryDate});

  factory _$PackagingQrDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackagingQrDataModelImplFromJson(json);

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

  @override
  String toString() {
    return 'PackagingQrDataModel(packagingId: $packagingId, packagingName: $packagingName, quantity: $quantity, batchNumber: $batchNumber, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackagingQrDataModelImpl &&
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

  /// Create a copy of PackagingQrDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackagingQrDataModelImplCopyWith<_$PackagingQrDataModelImpl>
      get copyWith =>
          __$$PackagingQrDataModelImplCopyWithImpl<_$PackagingQrDataModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackagingQrDataModelImplToJson(
      this,
    );
  }
}

abstract class _PackagingQrDataModel implements PackagingQrDataModel {
  const factory _PackagingQrDataModel(
          {@JsonKey(name: 'packaging_id') required final String packagingId,
          @JsonKey(name: 'packaging_name') required final String packagingName,
          required final int quantity,
          @JsonKey(name: 'batch_number') final String? batchNumber,
          @JsonKey(name: 'expiry_date') final DateTime? expiryDate}) =
      _$PackagingQrDataModelImpl;

  factory _PackagingQrDataModel.fromJson(Map<String, dynamic> json) =
      _$PackagingQrDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'packaging_id')
  String get packagingId;
  @override
  @JsonKey(name: 'packaging_name')
  String get packagingName;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'batch_number')
  String? get batchNumber;
  @override
  @JsonKey(name: 'expiry_date')
  DateTime? get expiryDate;

  /// Create a copy of PackagingQrDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackagingQrDataModelImplCopyWith<_$PackagingQrDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
