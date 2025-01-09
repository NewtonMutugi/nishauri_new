// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_bp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterBp {
  List<BpHours> get hourly => throw _privateConstructorUsedError;
  List<BpWeek> get weekly => throw _privateConstructorUsedError;
  List<BpSixMonths> get sixMonthly => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterBpCopyWith<FilterBp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterBpCopyWith<$Res> {
  factory $FilterBpCopyWith(FilterBp value, $Res Function(FilterBp) then) =
      _$FilterBpCopyWithImpl<$Res, FilterBp>;
  @useResult
  $Res call(
      {List<BpHours> hourly,
      List<BpWeek> weekly,
      List<BpSixMonths> sixMonthly});
}

/// @nodoc
class _$FilterBpCopyWithImpl<$Res, $Val extends FilterBp>
    implements $FilterBpCopyWith<$Res> {
  _$FilterBpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourly = null,
    Object? weekly = null,
    Object? sixMonthly = null,
  }) {
    return _then(_value.copyWith(
      hourly: null == hourly
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<BpHours>,
      weekly: null == weekly
          ? _value.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as List<BpWeek>,
      sixMonthly: null == sixMonthly
          ? _value.sixMonthly
          : sixMonthly // ignore: cast_nullable_to_non_nullable
              as List<BpSixMonths>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterBpImplCopyWith<$Res>
    implements $FilterBpCopyWith<$Res> {
  factory _$$FilterBpImplCopyWith(
          _$FilterBpImpl value, $Res Function(_$FilterBpImpl) then) =
      __$$FilterBpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BpHours> hourly,
      List<BpWeek> weekly,
      List<BpSixMonths> sixMonthly});
}

/// @nodoc
class __$$FilterBpImplCopyWithImpl<$Res>
    extends _$FilterBpCopyWithImpl<$Res, _$FilterBpImpl>
    implements _$$FilterBpImplCopyWith<$Res> {
  __$$FilterBpImplCopyWithImpl(
      _$FilterBpImpl _value, $Res Function(_$FilterBpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourly = null,
    Object? weekly = null,
    Object? sixMonthly = null,
  }) {
    return _then(_$FilterBpImpl(
      hourly: null == hourly
          ? _value._hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<BpHours>,
      weekly: null == weekly
          ? _value._weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as List<BpWeek>,
      sixMonthly: null == sixMonthly
          ? _value._sixMonthly
          : sixMonthly // ignore: cast_nullable_to_non_nullable
              as List<BpSixMonths>,
    ));
  }
}

/// @nodoc

class _$FilterBpImpl implements _FilterBp {
  const _$FilterBpImpl(
      {required final List<BpHours> hourly,
      required final List<BpWeek> weekly,
      required final List<BpSixMonths> sixMonthly})
      : _hourly = hourly,
        _weekly = weekly,
        _sixMonthly = sixMonthly;

  final List<BpHours> _hourly;
  @override
  List<BpHours> get hourly {
    if (_hourly is EqualUnmodifiableListView) return _hourly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourly);
  }

  final List<BpWeek> _weekly;
  @override
  List<BpWeek> get weekly {
    if (_weekly is EqualUnmodifiableListView) return _weekly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekly);
  }

  final List<BpSixMonths> _sixMonthly;
  @override
  List<BpSixMonths> get sixMonthly {
    if (_sixMonthly is EqualUnmodifiableListView) return _sixMonthly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sixMonthly);
  }

  @override
  String toString() {
    return 'FilterBp(hourly: $hourly, weekly: $weekly, sixMonthly: $sixMonthly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterBpImpl &&
            const DeepCollectionEquality().equals(other._hourly, _hourly) &&
            const DeepCollectionEquality().equals(other._weekly, _weekly) &&
            const DeepCollectionEquality()
                .equals(other._sixMonthly, _sixMonthly));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_hourly),
      const DeepCollectionEquality().hash(_weekly),
      const DeepCollectionEquality().hash(_sixMonthly));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterBpImplCopyWith<_$FilterBpImpl> get copyWith =>
      __$$FilterBpImplCopyWithImpl<_$FilterBpImpl>(this, _$identity);
}

abstract class _FilterBp implements FilterBp {
  const factory _FilterBp(
      {required final List<BpHours> hourly,
      required final List<BpWeek> weekly,
      required final List<BpSixMonths> sixMonthly}) = _$FilterBpImpl;

  @override
  List<BpHours> get hourly;
  @override
  List<BpWeek> get weekly;
  @override
  List<BpSixMonths> get sixMonthly;
  @override
  @JsonKey(ignore: true)
  _$$FilterBpImplCopyWith<_$FilterBpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
