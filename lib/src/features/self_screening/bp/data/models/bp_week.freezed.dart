// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bp_week.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BpWeek _$BpWeekFromJson(Map<String, dynamic> json) {
  return _BpWeek.fromJson(json);
}

/// @nodoc
mixin _$BpWeek {
  String get dayName => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  double? get systolic => throw _privateConstructorUsedError;
  double? get diastolic => throw _privateConstructorUsedError;
  double? get pulse_rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BpWeekCopyWith<BpWeek> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BpWeekCopyWith<$Res> {
  factory $BpWeekCopyWith(BpWeek value, $Res Function(BpWeek) then) =
      _$BpWeekCopyWithImpl<$Res, BpWeek>;
  @useResult
  $Res call(
      {String dayName,
      String? date,
      double? systolic,
      double? diastolic,
      double? pulse_rate});
}

/// @nodoc
class _$BpWeekCopyWithImpl<$Res, $Val extends BpWeek>
    implements $BpWeekCopyWith<$Res> {
  _$BpWeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayName = null,
    Object? date = freezed,
    Object? systolic = freezed,
    Object? diastolic = freezed,
    Object? pulse_rate = freezed,
  }) {
    return _then(_value.copyWith(
      dayName: null == dayName
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
abstract class _$$BpWeekImplCopyWith<$Res> implements $BpWeekCopyWith<$Res> {
  factory _$$BpWeekImplCopyWith(
          _$BpWeekImpl value, $Res Function(_$BpWeekImpl) then) =
      __$$BpWeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dayName,
      String? date,
      double? systolic,
      double? diastolic,
      double? pulse_rate});
}

/// @nodoc
class __$$BpWeekImplCopyWithImpl<$Res>
    extends _$BpWeekCopyWithImpl<$Res, _$BpWeekImpl>
    implements _$$BpWeekImplCopyWith<$Res> {
  __$$BpWeekImplCopyWithImpl(
      _$BpWeekImpl _value, $Res Function(_$BpWeekImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayName = null,
    Object? date = freezed,
    Object? systolic = freezed,
    Object? diastolic = freezed,
    Object? pulse_rate = freezed,
  }) {
    return _then(_$BpWeekImpl(
      dayName: null == dayName
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
class _$BpWeekImpl implements _BpWeek {
  const _$BpWeekImpl(
      {required this.dayName,
      this.date,
      this.systolic,
      this.diastolic,
      this.pulse_rate});

  factory _$BpWeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$BpWeekImplFromJson(json);

  @override
  final String dayName;
  @override
  final String? date;
  @override
  final double? systolic;
  @override
  final double? diastolic;
  @override
  final double? pulse_rate;

  @override
  String toString() {
    return 'BpWeek(dayName: $dayName, date: $date, systolic: $systolic, diastolic: $diastolic, pulse_rate: $pulse_rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BpWeekImpl &&
            (identical(other.dayName, dayName) || other.dayName == dayName) &&
            (identical(other.date, date) || other.date == date) &&
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
      Object.hash(runtimeType, dayName, date, systolic, diastolic, pulse_rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BpWeekImplCopyWith<_$BpWeekImpl> get copyWith =>
      __$$BpWeekImplCopyWithImpl<_$BpWeekImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BpWeekImplToJson(
      this,
    );
  }
}

abstract class _BpWeek implements BpWeek {
  const factory _BpWeek(
      {required final String dayName,
      final String? date,
      final double? systolic,
      final double? diastolic,
      final double? pulse_rate}) = _$BpWeekImpl;

  factory _BpWeek.fromJson(Map<String, dynamic> json) = _$BpWeekImpl.fromJson;

  @override
  String get dayName;
  @override
  String? get date;
  @override
  double? get systolic;
  @override
  double? get diastolic;
  @override
  double? get pulse_rate;
  @override
  @JsonKey(ignore: true)
  _$$BpWeekImplCopyWith<_$BpWeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
