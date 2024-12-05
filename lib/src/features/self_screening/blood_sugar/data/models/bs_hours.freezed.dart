// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bs_hours.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BsHours _$BsHoursFromJson(Map<String, dynamic> json) {
  return _BsHours.fromJson(json);
}

/// @nodoc
mixin _$BsHours {
  String? get time => throw _privateConstructorUsedError;
  double? get level => throw _privateConstructorUsedError;
  String? get condition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BsHoursCopyWith<BsHours> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsHoursCopyWith<$Res> {
  factory $BsHoursCopyWith(BsHours value, $Res Function(BsHours) then) =
      _$BsHoursCopyWithImpl<$Res, BsHours>;
  @useResult
  $Res call({String? time, double? level, String? condition});
}

/// @nodoc
class _$BsHoursCopyWithImpl<$Res, $Val extends BsHours>
    implements $BsHoursCopyWith<$Res> {
  _$BsHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? level = freezed,
    Object? condition = freezed,
  }) {
    return _then(_value.copyWith(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double?,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BsHoursImplCopyWith<$Res> implements $BsHoursCopyWith<$Res> {
  factory _$$BsHoursImplCopyWith(
          _$BsHoursImpl value, $Res Function(_$BsHoursImpl) then) =
      __$$BsHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? time, double? level, String? condition});
}

/// @nodoc
class __$$BsHoursImplCopyWithImpl<$Res>
    extends _$BsHoursCopyWithImpl<$Res, _$BsHoursImpl>
    implements _$$BsHoursImplCopyWith<$Res> {
  __$$BsHoursImplCopyWithImpl(
      _$BsHoursImpl _value, $Res Function(_$BsHoursImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? level = freezed,
    Object? condition = freezed,
  }) {
    return _then(_$BsHoursImpl(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double?,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BsHoursImpl implements _BsHours {
  const _$BsHoursImpl({this.time, this.level, this.condition});

  factory _$BsHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$BsHoursImplFromJson(json);

  @override
  final String? time;
  @override
  final double? level;
  @override
  final String? condition;

  @override
  String toString() {
    return 'BsHours(time: $time, level: $level, condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsHoursImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, level, condition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BsHoursImplCopyWith<_$BsHoursImpl> get copyWith =>
      __$$BsHoursImplCopyWithImpl<_$BsHoursImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BsHoursImplToJson(
      this,
    );
  }
}

abstract class _BsHours implements BsHours {
  const factory _BsHours(
      {final String? time,
      final double? level,
      final String? condition}) = _$BsHoursImpl;

  factory _BsHours.fromJson(Map<String, dynamic> json) = _$BsHoursImpl.fromJson;

  @override
  String? get time;
  @override
  double? get level;
  @override
  String? get condition;
  @override
  @JsonKey(ignore: true)
  _$$BsHoursImplCopyWith<_$BsHoursImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
