// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FilterData _$FilterDataFromJson(Map<String, dynamic> json) {
  return _FilterData.fromJson(json);
}

/// @nodoc
mixin _$FilterData {
  List<Week> get week => throw _privateConstructorUsedError;
  List<SixMonths> get sixMonths => throw _privateConstructorUsedError;
  String? get user_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterDataCopyWith<FilterData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterDataCopyWith<$Res> {
  factory $FilterDataCopyWith(
          FilterData value, $Res Function(FilterData) then) =
      _$FilterDataCopyWithImpl<$Res, FilterData>;
  @useResult
  $Res call({List<Week> week, List<SixMonths> sixMonths, String? user_id});
}

/// @nodoc
class _$FilterDataCopyWithImpl<$Res, $Val extends FilterData>
    implements $FilterDataCopyWith<$Res> {
  _$FilterDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? sixMonths = null,
    Object? user_id = freezed,
  }) {
    return _then(_value.copyWith(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as List<Week>,
      sixMonths: null == sixMonths
          ? _value.sixMonths
          : sixMonths // ignore: cast_nullable_to_non_nullable
              as List<SixMonths>,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterDataImplCopyWith<$Res>
    implements $FilterDataCopyWith<$Res> {
  factory _$$FilterDataImplCopyWith(
          _$FilterDataImpl value, $Res Function(_$FilterDataImpl) then) =
      __$$FilterDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Week> week, List<SixMonths> sixMonths, String? user_id});
}

/// @nodoc
class __$$FilterDataImplCopyWithImpl<$Res>
    extends _$FilterDataCopyWithImpl<$Res, _$FilterDataImpl>
    implements _$$FilterDataImplCopyWith<$Res> {
  __$$FilterDataImplCopyWithImpl(
      _$FilterDataImpl _value, $Res Function(_$FilterDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? sixMonths = null,
    Object? user_id = freezed,
  }) {
    return _then(_$FilterDataImpl(
      week: null == week
          ? _value._week
          : week // ignore: cast_nullable_to_non_nullable
              as List<Week>,
      sixMonths: null == sixMonths
          ? _value._sixMonths
          : sixMonths // ignore: cast_nullable_to_non_nullable
              as List<SixMonths>,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterDataImpl implements _FilterData {
  const _$FilterDataImpl(
      {required final List<Week> week,
      required final List<SixMonths> sixMonths,
      this.user_id})
      : _week = week,
        _sixMonths = sixMonths;

  factory _$FilterDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterDataImplFromJson(json);

  final List<Week> _week;
  @override
  List<Week> get week {
    if (_week is EqualUnmodifiableListView) return _week;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_week);
  }

  final List<SixMonths> _sixMonths;
  @override
  List<SixMonths> get sixMonths {
    if (_sixMonths is EqualUnmodifiableListView) return _sixMonths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sixMonths);
  }

  @override
  final String? user_id;

  @override
  String toString() {
    return 'FilterData(week: $week, sixMonths: $sixMonths, user_id: $user_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterDataImpl &&
            const DeepCollectionEquality().equals(other._week, _week) &&
            const DeepCollectionEquality()
                .equals(other._sixMonths, _sixMonths) &&
            (identical(other.user_id, user_id) || other.user_id == user_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_week),
      const DeepCollectionEquality().hash(_sixMonths),
      user_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterDataImplCopyWith<_$FilterDataImpl> get copyWith =>
      __$$FilterDataImplCopyWithImpl<_$FilterDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterDataImplToJson(
      this,
    );
  }
}

abstract class _FilterData implements FilterData {
  const factory _FilterData(
      {required final List<Week> week,
      required final List<SixMonths> sixMonths,
      final String? user_id}) = _$FilterDataImpl;

  factory _FilterData.fromJson(Map<String, dynamic> json) =
      _$FilterDataImpl.fromJson;

  @override
  List<Week> get week;
  @override
  List<SixMonths> get sixMonths;
  @override
  String? get user_id;
  @override
  @JsonKey(ignore: true)
  _$$FilterDataImplCopyWith<_$FilterDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
