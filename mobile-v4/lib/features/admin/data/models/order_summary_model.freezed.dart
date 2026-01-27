// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderSummaryModel _$OrderSummaryModelFromJson(Map<String, dynamic> json) {
  return _OrderSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$OrderSummaryModel {
  String get id => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get customerOrganization => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  int get itemsCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get delivererName => throw _privateConstructorUsedError;
  DateTime? get deliveryTime => throw _privateConstructorUsedError;

  /// Serializes this OrderSummaryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderSummaryModelCopyWith<OrderSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryModelCopyWith<$Res> {
  factory $OrderSummaryModelCopyWith(
          OrderSummaryModel value, $Res Function(OrderSummaryModel) then) =
      _$OrderSummaryModelCopyWithImpl<$Res, OrderSummaryModel>;
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
class _$OrderSummaryModelCopyWithImpl<$Res, $Val extends OrderSummaryModel>
    implements $OrderSummaryModelCopyWith<$Res> {
  _$OrderSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderSummaryModel
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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerOrganization: null == customerOrganization
          ? _value.customerOrganization
          : customerOrganization // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      delivererName: freezed == delivererName
          ? _value.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryTime: freezed == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderSummaryModelImplCopyWith<$Res>
    implements $OrderSummaryModelCopyWith<$Res> {
  factory _$$OrderSummaryModelImplCopyWith(_$OrderSummaryModelImpl value,
          $Res Function(_$OrderSummaryModelImpl) then) =
      __$$OrderSummaryModelImplCopyWithImpl<$Res>;
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
class __$$OrderSummaryModelImplCopyWithImpl<$Res>
    extends _$OrderSummaryModelCopyWithImpl<$Res, _$OrderSummaryModelImpl>
    implements _$$OrderSummaryModelImplCopyWith<$Res> {
  __$$OrderSummaryModelImplCopyWithImpl(_$OrderSummaryModelImpl _value,
      $Res Function(_$OrderSummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderSummaryModel
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
    return _then(_$OrderSummaryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerOrganization: null == customerOrganization
          ? _value.customerOrganization
          : customerOrganization // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      delivererName: freezed == delivererName
          ? _value.delivererName
          : delivererName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryTime: freezed == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderSummaryModelImpl extends _OrderSummaryModel {
  const _$OrderSummaryModelImpl(
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

  factory _$OrderSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderSummaryModelImplFromJson(json);

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

  @override
  String toString() {
    return 'OrderSummaryModel(id: $id, customerName: $customerName, customerOrganization: $customerOrganization, status: $status, totalAmount: $totalAmount, itemsCount: $itemsCount, createdAt: $createdAt, delivererName: $delivererName, deliveryTime: $deliveryTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSummaryModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of OrderSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSummaryModelImplCopyWith<_$OrderSummaryModelImpl> get copyWith =>
      __$$OrderSummaryModelImplCopyWithImpl<_$OrderSummaryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderSummaryModelImplToJson(
      this,
    );
  }
}

abstract class _OrderSummaryModel extends OrderSummaryModel {
  const factory _OrderSummaryModel(
      {required final String id,
      required final String customerName,
      required final String customerOrganization,
      required final String status,
      required final double totalAmount,
      required final int itemsCount,
      required final DateTime createdAt,
      final String? delivererName,
      final DateTime? deliveryTime}) = _$OrderSummaryModelImpl;
  const _OrderSummaryModel._() : super._();

  factory _OrderSummaryModel.fromJson(Map<String, dynamic> json) =
      _$OrderSummaryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get customerName;
  @override
  String get customerOrganization;
  @override
  String get status;
  @override
  double get totalAmount;
  @override
  int get itemsCount;
  @override
  DateTime get createdAt;
  @override
  String? get delivererName;
  @override
  DateTime? get deliveryTime;

  /// Create a copy of OrderSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderSummaryModelImplCopyWith<_$OrderSummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
