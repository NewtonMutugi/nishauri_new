// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_bs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterBs {
  List<BsHours> get hourly => throw _privateConstructorUsedError;
  List<BsWeek> get weekly => throw _privateConstructorUsedError;
  List<BsSixMonths> get sixMonthly => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterBsCopyWith<FilterBs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterBsCopyWith<$Res> {
  factory $FilterBsCopyWith(FilterBs value, $Res Function(FilterBs) then) =
      _$FilterBsCopyWithImpl<$Res, FilterBs>;
  @useResult
  $Res call(
      {List<BsHours> hourly,
      List<BsWeek> weekly,
      List<BsSixMonths> sixMonthly});
}

/// @nodoc
class _$FilterBsCopyWithImpl<$Res, $Val extends FilterBs>
    implements $FilterBsCopyWith<$Res> {
  _$FilterBsCopyWithImpl(this._value, this._then);

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
              as List<BsHours>,
      weekly: null == weekly
          ? _value.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as List<BsWeek>,
      sixMonthly: null == sixMonthly
          ? _value.sixMonthly
          : sixMonthly // ignore: cast_nullable_to_non_nullable
              as List<BsSixMonths>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterBsImplCopyWith<$Res>
    implements $FilterBsCopyWith<$Res> {
  factory _$$FilterBsImplCopyWith(
          _$FilterBsImpl value, $Res Function(_$FilterBsImpl) then) =
      __$$FilterBsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BsHours> hourly,
      List<BsWeek> weekly,
      List<BsSixMonths> sixMonthly});
}

/// @nodoc
class __$$FilterBsImplCopyWithImpl<$Res>
    extends _$FilterBsCopyWithImpl<$Res, _$FilterBsImpl>
    implements _$$FilterBsImplCopyWith<$Res> {
  __$$FilterBsImplCopyWithImpl(
      _$FilterBsImpl _value, $Res Function(_$FilterBsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourly = null,
    Object? weekly = null,
    Object? sixMonthly = null,
  }) {
    return _then(_$FilterBsImpl(
      hourly: null == hourly
          ? _value._hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<BsHours>,
      weekly: null == weekly
          ? _value._weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as List<BsWeek>,
      sixMonthly: null == sixMonthly
          ? _value._sixMonthly
          : sixMonthly // ignore: cast_nullable_to_non_nullable
              as List<BsSixMonths>,
    ));
  }
}

/// @nodoc

class _$FilterBsImpl implements _FilterBs {
  const _$FilterBsImpl(
      {required final List<BsHours> hourly,
      required final List<BsWeek> weekly,
      required final List<BsSixMonths> sixMonthly})
      : _hourly = hourly,
        _weekly = weekly,
        _sixMonthly = sixMonthly;

  final List<BsHours> _hourly;
  @override
  List<BsHours> get hourly {
    if (_hourly is EqualUnmodifiableListView) return _hourly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourly);
  }

  final List<BsWeek> _weekly;
  @override
  List<BsWeek> get weekly {
    if (_weekly is EqualUnmodifiableListView) return _weekly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekly);
  }

  final List<BsSixMonths> _sixMonthly;
  @override
  List<BsSixMonths> get sixMonthly {
    if (_sixMonthly is EqualUnmodifiableListView) return _sixMonthly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sixMonthly);
  }

  @override
  String toString() {
    return 'FilterBs(hourly: $hourly, weekly: $weekly, sixMonthly: $sixMonthly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterBsImpl &&
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
  _$$FilterBsImplCopyWith<_$FilterBsImpl> get copyWith =>
      __$$FilterBsImplCopyWithImpl<_$FilterBsImpl>(this, _$identity);
}

abstract class _FilterBs implements FilterBs {
  const factory _FilterBs(
      {required final List<BsHours> hourly,
      required final List<BsWeek> weekly,
      required final List<BsSixMonths> sixMonthly}) = _$FilterBsImpl;

  @override
  List<BsHours> get hourly;
  @override
  List<BsWeek> get weekly;
  @override
  List<BsSixMonths> get sixMonthly;
  @override
  @JsonKey(ignore: true)
  _$$FilterBsImplCopyWith<_$FilterBsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
