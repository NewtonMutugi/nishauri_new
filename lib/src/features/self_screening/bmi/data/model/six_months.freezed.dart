// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'six_months.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SixMonths _$SixMonthsFromJson(Map<String, dynamic> json) {
  return _SixMonths.fromJson(json);
}

/// @nodoc
mixin _$SixMonths {
  String get month => throw _privateConstructorUsedError;
  double? get avgWeight => throw _privateConstructorUsedError;
  double? get avgHeight => throw _privateConstructorUsedError;
  double get avgResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SixMonthsCopyWith<SixMonths> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SixMonthsCopyWith<$Res> {
  factory $SixMonthsCopyWith(SixMonths value, $Res Function(SixMonths) then) =
      _$SixMonthsCopyWithImpl<$Res, SixMonths>;
  @useResult
  $Res call(
      {String month, double? avgWeight, double? avgHeight, double avgResults});
}

/// @nodoc
class _$SixMonthsCopyWithImpl<$Res, $Val extends SixMonths>
    implements $SixMonthsCopyWith<$Res> {
  _$SixMonthsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? avgWeight = freezed,
    Object? avgHeight = freezed,
    Object? avgResults = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      avgWeight: freezed == avgWeight
          ? _value.avgWeight
          : avgWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      avgHeight: freezed == avgHeight
          ? _value.avgHeight
          : avgHeight // ignore: cast_nullable_to_non_nullable
              as double?,
      avgResults: null == avgResults
          ? _value.avgResults
          : avgResults // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SixMonthsImplCopyWith<$Res>
    implements $SixMonthsCopyWith<$Res> {
  factory _$$SixMonthsImplCopyWith(
          _$SixMonthsImpl value, $Res Function(_$SixMonthsImpl) then) =
      __$$SixMonthsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String month, double? avgWeight, double? avgHeight, double avgResults});
}

/// @nodoc
class __$$SixMonthsImplCopyWithImpl<$Res>
    extends _$SixMonthsCopyWithImpl<$Res, _$SixMonthsImpl>
    implements _$$SixMonthsImplCopyWith<$Res> {
  __$$SixMonthsImplCopyWithImpl(
      _$SixMonthsImpl _value, $Res Function(_$SixMonthsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? avgWeight = freezed,
    Object? avgHeight = freezed,
    Object? avgResults = null,
  }) {
    return _then(_$SixMonthsImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      avgWeight: freezed == avgWeight
          ? _value.avgWeight
          : avgWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      avgHeight: freezed == avgHeight
          ? _value.avgHeight
          : avgHeight // ignore: cast_nullable_to_non_nullable
              as double?,
      avgResults: null == avgResults
          ? _value.avgResults
          : avgResults // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SixMonthsImpl implements _SixMonths {
  const _$SixMonthsImpl(
      {required this.month,
      this.avgWeight,
      this.avgHeight,
      required this.avgResults});

  factory _$SixMonthsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SixMonthsImplFromJson(json);

  @override
  final String month;
  @override
  final double? avgWeight;
  @override
  final double? avgHeight;
  @override
  final double avgResults;

  @override
  String toString() {
    return 'SixMonths(month: $month, avgWeight: $avgWeight, avgHeight: $avgHeight, avgResults: $avgResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SixMonthsImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.avgWeight, avgWeight) ||
                other.avgWeight == avgWeight) &&
            (identical(other.avgHeight, avgHeight) ||
                other.avgHeight == avgHeight) &&
            (identical(other.avgResults, avgResults) ||
                other.avgResults == avgResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, month, avgWeight, avgHeight, avgResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SixMonthsImplCopyWith<_$SixMonthsImpl> get copyWith =>
      __$$SixMonthsImplCopyWithImpl<_$SixMonthsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SixMonthsImplToJson(
      this,
    );
  }
}

abstract class _SixMonths implements SixMonths {
  const factory _SixMonths(
      {required final String month,
      final double? avgWeight,
      final double? avgHeight,
      required final double avgResults}) = _$SixMonthsImpl;

  factory _SixMonths.fromJson(Map<String, dynamic> json) =
      _$SixMonthsImpl.fromJson;

  @override
  String get month;
  @override
  double? get avgWeight;
  @override
  double? get avgHeight;
  @override
  double get avgResults;
  @override
  @JsonKey(ignore: true)
  _$$SixMonthsImplCopyWith<_$SixMonthsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
