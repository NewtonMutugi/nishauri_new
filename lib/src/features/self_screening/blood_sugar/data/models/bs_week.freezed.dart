// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bs_week.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BsWeek _$BsWeekFromJson(Map<String, dynamic> json) {
  return _BsWeek.fromJson(json);
}

/// @nodoc
mixin _$BsWeek {
  String get dayName => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  double? get level => throw _privateConstructorUsedError;
  String? get condition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BsWeekCopyWith<BsWeek> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsWeekCopyWith<$Res> {
  factory $BsWeekCopyWith(BsWeek value, $Res Function(BsWeek) then) =
      _$BsWeekCopyWithImpl<$Res, BsWeek>;
  @useResult
  $Res call({String dayName, String? date, double? level, String? condition});
}

/// @nodoc
class _$BsWeekCopyWithImpl<$Res, $Val extends BsWeek>
    implements $BsWeekCopyWith<$Res> {
  _$BsWeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayName = null,
    Object? date = freezed,
    Object? level = freezed,
    Object? condition = freezed,
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
abstract class _$$BsWeekImplCopyWith<$Res> implements $BsWeekCopyWith<$Res> {
  factory _$$BsWeekImplCopyWith(
          _$BsWeekImpl value, $Res Function(_$BsWeekImpl) then) =
      __$$BsWeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dayName, String? date, double? level, String? condition});
}

/// @nodoc
class __$$BsWeekImplCopyWithImpl<$Res>
    extends _$BsWeekCopyWithImpl<$Res, _$BsWeekImpl>
    implements _$$BsWeekImplCopyWith<$Res> {
  __$$BsWeekImplCopyWithImpl(
      _$BsWeekImpl _value, $Res Function(_$BsWeekImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayName = null,
    Object? date = freezed,
    Object? level = freezed,
    Object? condition = freezed,
  }) {
    return _then(_$BsWeekImpl(
      dayName: null == dayName
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
class _$BsWeekImpl implements _BsWeek {
  const _$BsWeekImpl(
      {required this.dayName, this.date, this.level, this.condition});

  factory _$BsWeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$BsWeekImplFromJson(json);

  @override
  final String dayName;
  @override
  final String? date;
  @override
  final double? level;
  @override
  final String? condition;

  @override
  String toString() {
    return 'BsWeek(dayName: $dayName, date: $date, level: $level, condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsWeekImpl &&
            (identical(other.dayName, dayName) || other.dayName == dayName) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dayName, date, level, condition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BsWeekImplCopyWith<_$BsWeekImpl> get copyWith =>
      __$$BsWeekImplCopyWithImpl<_$BsWeekImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BsWeekImplToJson(
      this,
    );
  }
}

abstract class _BsWeek implements BsWeek {
  const factory _BsWeek(
      {required final String dayName,
      final String? date,
      final double? level,
      final String? condition}) = _$BsWeekImpl;

  factory _BsWeek.fromJson(Map<String, dynamic> json) = _$BsWeekImpl.fromJson;

  @override
  String get dayName;
  @override
  String? get date;
  @override
  double? get level;
  @override
  String? get condition;
  @override
  @JsonKey(ignore: true)
  _$$BsWeekImplCopyWith<_$BsWeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
