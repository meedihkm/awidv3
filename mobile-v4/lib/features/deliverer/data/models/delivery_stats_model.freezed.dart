// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryStatsModel _$DeliveryStatsModelFromJson(Map<String, dynamic> json) {
  return _DeliveryStatsModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryStatsModel {
  @JsonKey(name: 'total_deliveries')
  int get totalDeliveries => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_today')
  int get completedToday => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_deliveries')
  int get pendingDeliveries => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_progress_deliveries')
  int get inProgressDeliveries => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_earnings')
  double get totalEarnings => throw _privateConstructorUsedError;
  @JsonKey(name: 'today_earnings')
  double get todayEarnings => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_rating')
  double get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_ratings')
  int get totalRatings => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_delivery_time')
  double? get averageDeliveryTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'on_time_deliveries')
  int? get onTimeDeliveries => throw _privateConstructorUsedError;
  @JsonKey(name: 'late_deliveries')
  int? get lateDeliveries => throw _privateConstructorUsedError;

  /// Serializes this DeliveryStatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryStatsModelCopyWith<DeliveryStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryStatsModelCopyWith<$Res> {
  factory $DeliveryStatsModelCopyWith(
          DeliveryStatsModel value, $Res Function(DeliveryStatsModel) then) =
      _$DeliveryStatsModelCopyWithImpl<$Res, DeliveryStatsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_deliveries') int totalDeliveries,
      @JsonKey(name: 'completed_today') int completedToday,
      @JsonKey(name: 'pending_deliveries') int pendingDeliveries,
      @JsonKey(name: 'in_progress_deliveries') int inProgressDeliveries,
      @JsonKey(name: 'total_earnings') double totalEarnings,
      @JsonKey(name: 'today_earnings') double todayEarnings,
      @JsonKey(name: 'average_rating') double averageRating,
      @JsonKey(name: 'total_ratings') int totalRatings,
      @JsonKey(name: 'average_delivery_time') double? averageDeliveryTime,
      @JsonKey(name: 'on_time_deliveries') int? onTimeDeliveries,
      @JsonKey(name: 'late_deliveries') int? lateDeliveries});
}

/// @nodoc
class _$DeliveryStatsModelCopyWithImpl<$Res, $Val extends DeliveryStatsModel>
    implements $DeliveryStatsModelCopyWith<$Res> {
  _$DeliveryStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDeliveries = null,
    Object? completedToday = null,
    Object? pendingDeliveries = null,
    Object? inProgressDeliveries = null,
    Object? totalEarnings = null,
    Object? todayEarnings = null,
    Object? averageRating = null,
    Object? totalRatings = null,
    Object? averageDeliveryTime = freezed,
    Object? onTimeDeliveries = freezed,
    Object? lateDeliveries = freezed,
  }) {
    return _then(_value.copyWith(
      totalDeliveries: null == totalDeliveries
          ? _value.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      completedToday: null == completedToday
          ? _value.completedToday
          : completedToday // ignore: cast_nullable_to_non_nullable
              as int,
      pendingDeliveries: null == pendingDeliveries
          ? _value.pendingDeliveries
          : pendingDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      inProgressDeliveries: null == inProgressDeliveries
          ? _value.inProgressDeliveries
          : inProgressDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      totalEarnings: null == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      todayEarnings: null == todayEarnings
          ? _value.todayEarnings
          : todayEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalRatings: null == totalRatings
          ? _value.totalRatings
          : totalRatings // ignore: cast_nullable_to_non_nullable
              as int,
      averageDeliveryTime: freezed == averageDeliveryTime
          ? _value.averageDeliveryTime
          : averageDeliveryTime // ignore: cast_nullable_to_non_nullable
              as double?,
      onTimeDeliveries: freezed == onTimeDeliveries
          ? _value.onTimeDeliveries
          : onTimeDeliveries // ignore: cast_nullable_to_non_nullable
              as int?,
      lateDeliveries: freezed == lateDeliveries
          ? _value.lateDeliveries
          : lateDeliveries // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryStatsModelImplCopyWith<$Res>
    implements $DeliveryStatsModelCopyWith<$Res> {
  factory _$$DeliveryStatsModelImplCopyWith(_$DeliveryStatsModelImpl value,
          $Res Function(_$DeliveryStatsModelImpl) then) =
      __$$DeliveryStatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_deliveries') int totalDeliveries,
      @JsonKey(name: 'completed_today') int completedToday,
      @JsonKey(name: 'pending_deliveries') int pendingDeliveries,
      @JsonKey(name: 'in_progress_deliveries') int inProgressDeliveries,
      @JsonKey(name: 'total_earnings') double totalEarnings,
      @JsonKey(name: 'today_earnings') double todayEarnings,
      @JsonKey(name: 'average_rating') double averageRating,
      @JsonKey(name: 'total_ratings') int totalRatings,
      @JsonKey(name: 'average_delivery_time') double? averageDeliveryTime,
      @JsonKey(name: 'on_time_deliveries') int? onTimeDeliveries,
      @JsonKey(name: 'late_deliveries') int? lateDeliveries});
}

/// @nodoc
class __$$DeliveryStatsModelImplCopyWithImpl<$Res>
    extends _$DeliveryStatsModelCopyWithImpl<$Res, _$DeliveryStatsModelImpl>
    implements _$$DeliveryStatsModelImplCopyWith<$Res> {
  __$$DeliveryStatsModelImplCopyWithImpl(_$DeliveryStatsModelImpl _value,
      $Res Function(_$DeliveryStatsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDeliveries = null,
    Object? completedToday = null,
    Object? pendingDeliveries = null,
    Object? inProgressDeliveries = null,
    Object? totalEarnings = null,
    Object? todayEarnings = null,
    Object? averageRating = null,
    Object? totalRatings = null,
    Object? averageDeliveryTime = freezed,
    Object? onTimeDeliveries = freezed,
    Object? lateDeliveries = freezed,
  }) {
    return _then(_$DeliveryStatsModelImpl(
      totalDeliveries: null == totalDeliveries
          ? _value.totalDeliveries
          : totalDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      completedToday: null == completedToday
          ? _value.completedToday
          : completedToday // ignore: cast_nullable_to_non_nullable
              as int,
      pendingDeliveries: null == pendingDeliveries
          ? _value.pendingDeliveries
          : pendingDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      inProgressDeliveries: null == inProgressDeliveries
          ? _value.inProgressDeliveries
          : inProgressDeliveries // ignore: cast_nullable_to_non_nullable
              as int,
      totalEarnings: null == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      todayEarnings: null == todayEarnings
          ? _value.todayEarnings
          : todayEarnings // ignore: cast_nullable_to_non_nullable
              as double,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalRatings: null == totalRatings
          ? _value.totalRatings
          : totalRatings // ignore: cast_nullable_to_non_nullable
              as int,
      averageDeliveryTime: freezed == averageDeliveryTime
          ? _value.averageDeliveryTime
          : averageDeliveryTime // ignore: cast_nullable_to_non_nullable
              as double?,
      onTimeDeliveries: freezed == onTimeDeliveries
          ? _value.onTimeDeliveries
          : onTimeDeliveries // ignore: cast_nullable_to_non_nullable
              as int?,
      lateDeliveries: freezed == lateDeliveries
          ? _value.lateDeliveries
          : lateDeliveries // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryStatsModelImpl extends _DeliveryStatsModel {
  const _$DeliveryStatsModelImpl(
      {@JsonKey(name: 'total_deliveries') required this.totalDeliveries,
      @JsonKey(name: 'completed_today') required this.completedToday,
      @JsonKey(name: 'pending_deliveries') required this.pendingDeliveries,
      @JsonKey(name: 'in_progress_deliveries')
      required this.inProgressDeliveries,
      @JsonKey(name: 'total_earnings') required this.totalEarnings,
      @JsonKey(name: 'today_earnings') required this.todayEarnings,
      @JsonKey(name: 'average_rating') required this.averageRating,
      @JsonKey(name: 'total_ratings') required this.totalRatings,
      @JsonKey(name: 'average_delivery_time') this.averageDeliveryTime,
      @JsonKey(name: 'on_time_deliveries') this.onTimeDeliveries,
      @JsonKey(name: 'late_deliveries') this.lateDeliveries})
      : super._();

  factory _$DeliveryStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryStatsModelImplFromJson(json);

  @override
  @JsonKey(name: 'total_deliveries')
  final int totalDeliveries;
  @override
  @JsonKey(name: 'completed_today')
  final int completedToday;
  @override
  @JsonKey(name: 'pending_deliveries')
  final int pendingDeliveries;
  @override
  @JsonKey(name: 'in_progress_deliveries')
  final int inProgressDeliveries;
  @override
  @JsonKey(name: 'total_earnings')
  final double totalEarnings;
  @override
  @JsonKey(name: 'today_earnings')
  final double todayEarnings;
  @override
  @JsonKey(name: 'average_rating')
  final double averageRating;
  @override
  @JsonKey(name: 'total_ratings')
  final int totalRatings;
  @override
  @JsonKey(name: 'average_delivery_time')
  final double? averageDeliveryTime;
  @override
  @JsonKey(name: 'on_time_deliveries')
  final int? onTimeDeliveries;
  @override
  @JsonKey(name: 'late_deliveries')
  final int? lateDeliveries;

  @override
  String toString() {
    return 'DeliveryStatsModel(totalDeliveries: $totalDeliveries, completedToday: $completedToday, pendingDeliveries: $pendingDeliveries, inProgressDeliveries: $inProgressDeliveries, totalEarnings: $totalEarnings, todayEarnings: $todayEarnings, averageRating: $averageRating, totalRatings: $totalRatings, averageDeliveryTime: $averageDeliveryTime, onTimeDeliveries: $onTimeDeliveries, lateDeliveries: $lateDeliveries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryStatsModelImpl &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.completedToday, completedToday) ||
                other.completedToday == completedToday) &&
            (identical(other.pendingDeliveries, pendingDeliveries) ||
                other.pendingDeliveries == pendingDeliveries) &&
            (identical(other.inProgressDeliveries, inProgressDeliveries) ||
                other.inProgressDeliveries == inProgressDeliveries) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.todayEarnings, todayEarnings) ||
                other.todayEarnings == todayEarnings) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalRatings, totalRatings) ||
                other.totalRatings == totalRatings) &&
            (identical(other.averageDeliveryTime, averageDeliveryTime) ||
                other.averageDeliveryTime == averageDeliveryTime) &&
            (identical(other.onTimeDeliveries, onTimeDeliveries) ||
                other.onTimeDeliveries == onTimeDeliveries) &&
            (identical(other.lateDeliveries, lateDeliveries) ||
                other.lateDeliveries == lateDeliveries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalDeliveries,
      completedToday,
      pendingDeliveries,
      inProgressDeliveries,
      totalEarnings,
      todayEarnings,
      averageRating,
      totalRatings,
      averageDeliveryTime,
      onTimeDeliveries,
      lateDeliveries);

  /// Create a copy of DeliveryStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryStatsModelImplCopyWith<_$DeliveryStatsModelImpl> get copyWith =>
      __$$DeliveryStatsModelImplCopyWithImpl<_$DeliveryStatsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryStatsModelImplToJson(
      this,
    );
  }
}

abstract class _DeliveryStatsModel extends DeliveryStatsModel {
  const factory _DeliveryStatsModel(
      {@JsonKey(name: 'total_deliveries') required final int totalDeliveries,
      @JsonKey(name: 'completed_today') required final int completedToday,
      @JsonKey(name: 'pending_deliveries') required final int pendingDeliveries,
      @JsonKey(name: 'in_progress_deliveries')
      required final int inProgressDeliveries,
      @JsonKey(name: 'total_earnings') required final double totalEarnings,
      @JsonKey(name: 'today_earnings') required final double todayEarnings,
      @JsonKey(name: 'average_rating') required final double averageRating,
      @JsonKey(name: 'total_ratings') required final int totalRatings,
      @JsonKey(name: 'average_delivery_time') final double? averageDeliveryTime,
      @JsonKey(name: 'on_time_deliveries') final int? onTimeDeliveries,
      @JsonKey(name: 'late_deliveries')
      final int? lateDeliveries}) = _$DeliveryStatsModelImpl;
  const _DeliveryStatsModel._() : super._();

  factory _DeliveryStatsModel.fromJson(Map<String, dynamic> json) =
      _$DeliveryStatsModelImpl.fromJson;

  @override
  @JsonKey(name: 'total_deliveries')
  int get totalDeliveries;
  @override
  @JsonKey(name: 'completed_today')
  int get completedToday;
  @override
  @JsonKey(name: 'pending_deliveries')
  int get pendingDeliveries;
  @override
  @JsonKey(name: 'in_progress_deliveries')
  int get inProgressDeliveries;
  @override
  @JsonKey(name: 'total_earnings')
  double get totalEarnings;
  @override
  @JsonKey(name: 'today_earnings')
  double get todayEarnings;
  @override
  @JsonKey(name: 'average_rating')
  double get averageRating;
  @override
  @JsonKey(name: 'total_ratings')
  int get totalRatings;
  @override
  @JsonKey(name: 'average_delivery_time')
  double? get averageDeliveryTime;
  @override
  @JsonKey(name: 'on_time_deliveries')
  int? get onTimeDeliveries;
  @override
  @JsonKey(name: 'late_deliveries')
  int? get lateDeliveries;

  /// Create a copy of DeliveryStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryStatsModelImplCopyWith<_$DeliveryStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
