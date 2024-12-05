// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bs_six_months.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BsSixMonths _$BsSixMonthsFromJson(Map<String, dynamic> json) {
  return _BsSixMonths.fromJson(json);
}

/// @nodoc
mixin _$BsSixMonths {
  String? get month => throw _privateConstructorUsedError;
  double? get avg_level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BsSixMonthsCopyWith<BsSixMonths> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsSixMonthsCopyWith<$Res> {
  factory $BsSixMonthsCopyWith(
          BsSixMonths value, $Res Function(BsSixMonths) then) =
      _$BsSixMonthsCopyWithImpl<$Res, BsSixMonths>;
  @useResult
  $Res call({String? month, double? avg_level});
}

/// @nodoc
class _$BsSixMonthsCopyWithImpl<$Res, $Val extends BsSixMonths>
    implements $BsSixMonthsCopyWith<$Res> {
  _$BsSixMonthsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = freezed,
    Object? avg_level = freezed,
  }) {
    return _then(_value.copyWith(
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_level: freezed == avg_level
          ? _value.avg_level
          : avg_level // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BsSixMonthsImplCopyWith<$Res>
    implements $BsSixMonthsCopyWith<$Res> {
  factory _$$BsSixMonthsImplCopyWith(
          _$BsSixMonthsImpl value, $Res Function(_$BsSixMonthsImpl) then) =
      __$$BsSixMonthsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? month, double? avg_level});
}

/// @nodoc
class __$$BsSixMonthsImplCopyWithImpl<$Res>
    extends _$BsSixMonthsCopyWithImpl<$Res, _$BsSixMonthsImpl>
    implements _$$BsSixMonthsImplCopyWith<$Res> {
  __$$BsSixMonthsImplCopyWithImpl(
      _$BsSixMonthsImpl _value, $Res Function(_$BsSixMonthsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = freezed,
    Object? avg_level = freezed,
  }) {
    return _then(_$BsSixMonthsImpl(
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      avg_level: freezed == avg_level
          ? _value.avg_level
          : avg_level // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BsSixMonthsImpl implements _BsSixMonths {
  const _$BsSixMonthsImpl({this.month, this.avg_level});

  factory _$BsSixMonthsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BsSixMonthsImplFromJson(json);

  @override
  final String? month;
  @override
  final double? avg_level;

  @override
  String toString() {
    return 'BsSixMonths(month: $month, avg_level: $avg_level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsSixMonthsImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.avg_level, avg_level) ||
                other.avg_level == avg_level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, month, avg_level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BsSixMonthsImplCopyWith<_$BsSixMonthsImpl> get copyWith =>
      __$$BsSixMonthsImplCopyWithImpl<_$BsSixMonthsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BsSixMonthsImplToJson(
      this,
    );
  }
}

abstract class _BsSixMonths implements BsSixMonths {
  const factory _BsSixMonths({final String? month, final double? avg_level}) =
      _$BsSixMonthsImpl;

  factory _BsSixMonths.fromJson(Map<String, dynamic> json) =
      _$BsSixMonthsImpl.fromJson;

  @override
  String? get month;
  @override
  double? get avg_level;
  @override
  @JsonKey(ignore: true)
  _$$BsSixMonthsImplCopyWith<_$BsSixMonthsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
