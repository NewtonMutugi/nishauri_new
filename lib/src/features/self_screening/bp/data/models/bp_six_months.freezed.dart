// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bp_six_months.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BpSixMonths _$BpSixMonthsFromJson(Map<String, dynamic> json) {
  return _BpSixMonths.fromJson(json);
}

/// @nodoc
mixin _$BpSixMonths {
  String? get month => throw _privateConstructorUsedError;
  double? get avg_systolic => throw _privateConstructorUsedError;
  double? get avg_diastolic => throw _privateConstructorUsedError;
  double? get avg_pulse_rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BpSixMonthsCopyWith<BpSixMonths> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BpSixMonthsCopyWith<$Res> {
  factory $BpSixMonthsCopyWith(
          BpSixMonths value, $Res Function(BpSixMonths) then) =
      _$BpSixMonthsCopyWithImpl<$Res, BpSixMonths>;
  @useResult
  $Res call(
      {String? month,
      double? avg_systolic,
      double? avg_diastolic,
      double? avg_pulse_rate});
}

/// @nodoc
class _$BpSixMonthsCopyWithImpl<$Res, $Val extends BpSixMonths>
    implements $BpSixMonthsCopyWith<$Res> {
  _$BpSixMonthsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = freezed,
    Object? avg_systolic = freezed,
    Object? avg_diastolic = freezed,
    Object? avg_pulse_rate = freezed,
  }) {
    return _then(_value.copyWith(
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_systolic: freezed == avg_systolic
          ? _value.avg_systolic
          : avg_systolic // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_diastolic: freezed == avg_diastolic
          ? _value.avg_diastolic
          : avg_diastolic // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_pulse_rate: freezed == avg_pulse_rate
          ? _value.avg_pulse_rate
          : avg_pulse_rate // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BpSixMonthsImplCopyWith<$Res>
    implements $BpSixMonthsCopyWith<$Res> {
  factory _$$BpSixMonthsImplCopyWith(
          _$BpSixMonthsImpl value, $Res Function(_$BpSixMonthsImpl) then) =
      __$$BpSixMonthsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? month,
      double? avg_systolic,
      double? avg_diastolic,
      double? avg_pulse_rate});
}

/// @nodoc
class __$$BpSixMonthsImplCopyWithImpl<$Res>
    extends _$BpSixMonthsCopyWithImpl<$Res, _$BpSixMonthsImpl>
    implements _$$BpSixMonthsImplCopyWith<$Res> {
  __$$BpSixMonthsImplCopyWithImpl(
      _$BpSixMonthsImpl _value, $Res Function(_$BpSixMonthsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = freezed,
    Object? avg_systolic = freezed,
    Object? avg_diastolic = freezed,
    Object? avg_pulse_rate = freezed,
  }) {
    return _then(_$BpSixMonthsImpl(
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_systolic: freezed == avg_systolic
          ? _value.avg_systolic
          : avg_systolic // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_diastolic: freezed == avg_diastolic
          ? _value.avg_diastolic
          : avg_diastolic // ignore: cast_nullable_to_non_nullable
              as double?,
      avg_pulse_rate: freezed == avg_pulse_rate
          ? _value.avg_pulse_rate
          : avg_pulse_rate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BpSixMonthsImpl implements _BpSixMonths {
  const _$BpSixMonthsImpl(
      {this.month, this.avg_systolic, this.avg_diastolic, this.avg_pulse_rate});

  factory _$BpSixMonthsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BpSixMonthsImplFromJson(json);

  @override
  final String? month;
  @override
  final double? avg_systolic;
  @override
  final double? avg_diastolic;
  @override
  final double? avg_pulse_rate;

  @override
  String toString() {
    return 'BpSixMonths(month: $month, avg_systolic: $avg_systolic, avg_diastolic: $avg_diastolic, avg_pulse_rate: $avg_pulse_rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BpSixMonthsImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.avg_systolic, avg_systolic) ||
                other.avg_systolic == avg_systolic) &&
            (identical(other.avg_diastolic, avg_diastolic) ||
                other.avg_diastolic == avg_diastolic) &&
            (identical(other.avg_pulse_rate, avg_pulse_rate) ||
                other.avg_pulse_rate == avg_pulse_rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, month, avg_systolic, avg_diastolic, avg_pulse_rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BpSixMonthsImplCopyWith<_$BpSixMonthsImpl> get copyWith =>
      __$$BpSixMonthsImplCopyWithImpl<_$BpSixMonthsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BpSixMonthsImplToJson(
      this,
    );
  }
}

abstract class _BpSixMonths implements BpSixMonths {
  const factory _BpSixMonths(
      {final String? month,
      final double? avg_systolic,
      final double? avg_diastolic,
      final double? avg_pulse_rate}) = _$BpSixMonthsImpl;

  factory _BpSixMonths.fromJson(Map<String, dynamic> json) =
      _$BpSixMonthsImpl.fromJson;

  @override
  String? get month;
  @override
  double? get avg_systolic;
  @override
  double? get avg_diastolic;
  @override
  double? get avg_pulse_rate;
  @override
  @JsonKey(ignore: true)
  _$$BpSixMonthsImplCopyWith<_$BpSixMonthsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
