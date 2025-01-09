// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bp_hours.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BpHours _$BpHoursFromJson(Map<String, dynamic> json) {
  return _BpHours.fromJson(json);
}

/// @nodoc
mixin _$BpHours {
  String? get time => throw _privateConstructorUsedError;
  double? get systolic => throw _privateConstructorUsedError;
  double? get diastolic => throw _privateConstructorUsedError;
  double? get pulse_rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BpHoursCopyWith<BpHours> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BpHoursCopyWith<$Res> {
  factory $BpHoursCopyWith(BpHours value, $Res Function(BpHours) then) =
      _$BpHoursCopyWithImpl<$Res, BpHours>;
  @useResult
  $Res call(
      {String? time, double? systolic, double? diastolic, double? pulse_rate});
}

/// @nodoc
class _$BpHoursCopyWithImpl<$Res, $Val extends BpHours>
    implements $BpHoursCopyWith<$Res> {
  _$BpHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? systolic = freezed,
    Object? diastolic = freezed,
    Object? pulse_rate = freezed,
  }) {
    return _then(_value.copyWith(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      systolic: freezed == systolic
          ? _value.systolic
          : systolic // ignore: cast_nullable_to_non_nullable
              as double?,
      diastolic: freezed == diastolic
          ? _value.diastolic
          : diastolic // ignore: cast_nullable_to_non_nullable
              as double?,
      pulse_rate: freezed == pulse_rate
          ? _value.pulse_rate
          : pulse_rate // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BpHoursImplCopyWith<$Res> implements $BpHoursCopyWith<$Res> {
  factory _$$BpHoursImplCopyWith(
          _$BpHoursImpl value, $Res Function(_$BpHoursImpl) then) =
      __$$BpHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? time, double? systolic, double? diastolic, double? pulse_rate});
}

/// @nodoc
class __$$BpHoursImplCopyWithImpl<$Res>
    extends _$BpHoursCopyWithImpl<$Res, _$BpHoursImpl>
    implements _$$BpHoursImplCopyWith<$Res> {
  __$$BpHoursImplCopyWithImpl(
      _$BpHoursImpl _value, $Res Function(_$BpHoursImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? systolic = freezed,
    Object? diastolic = freezed,
    Object? pulse_rate = freezed,
  }) {
    return _then(_$BpHoursImpl(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      systolic: freezed == systolic
          ? _value.systolic
          : systolic // ignore: cast_nullable_to_non_nullable
              as double?,
      diastolic: freezed == diastolic
          ? _value.diastolic
          : diastolic // ignore: cast_nullable_to_non_nullable
              as double?,
      pulse_rate: freezed == pulse_rate
          ? _value.pulse_rate
          : pulse_rate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BpHoursImpl implements _BpHours {
  const _$BpHoursImpl(
      {this.time, this.systolic, this.diastolic, this.pulse_rate});

  factory _$BpHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$BpHoursImplFromJson(json);

  @override
  final String? time;
  @override
  final double? systolic;
  @override
  final double? diastolic;
  @override
  final double? pulse_rate;

  @override
  String toString() {
    return 'BpHours(time: $time, systolic: $systolic, diastolic: $diastolic, pulse_rate: $pulse_rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BpHoursImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.systolic, systolic) ||
                other.systolic == systolic) &&
            (identical(other.diastolic, diastolic) ||
                other.diastolic == diastolic) &&
            (identical(other.pulse_rate, pulse_rate) ||
                other.pulse_rate == pulse_rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, time, systolic, diastolic, pulse_rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BpHoursImplCopyWith<_$BpHoursImpl> get copyWith =>
      __$$BpHoursImplCopyWithImpl<_$BpHoursImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BpHoursImplToJson(
      this,
    );
  }
}

abstract class _BpHours implements BpHours {
  const factory _BpHours(
      {final String? time,
      final double? systolic,
      final double? diastolic,
      final double? pulse_rate}) = _$BpHoursImpl;

  factory _BpHours.fromJson(Map<String, dynamic> json) = _$BpHoursImpl.fromJson;

  @override
  String? get time;
  @override
  double? get systolic;
  @override
  double? get diastolic;
  @override
  double? get pulse_rate;
  @override
  @JsonKey(ignore: true)
  _$$BpHoursImplCopyWith<_$BpHoursImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
