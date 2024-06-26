// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Program {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get facility_name => throw _privateConstructorUsedError;
  List<PatientObservation> get obs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgramCopyWith<Program> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramCopyWith<$Res> {
  factory $ProgramCopyWith(Program value, $Res Function(Program) then) =
      _$ProgramCopyWithImpl<$Res, Program>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? facility_name,
      List<PatientObservation> obs});
}

/// @nodoc
class _$ProgramCopyWithImpl<$Res, $Val extends Program>
    implements $ProgramCopyWith<$Res> {
  _$ProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? facility_name = freezed,
    Object? obs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      facility_name: freezed == facility_name
          ? _value.facility_name
          : facility_name // ignore: cast_nullable_to_non_nullable
              as String?,
      obs: null == obs
          ? _value.obs
          : obs // ignore: cast_nullable_to_non_nullable
              as List<PatientObservation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgramImplCopyWith<$Res> implements $ProgramCopyWith<$Res> {
  factory _$$ProgramImplCopyWith(
          _$ProgramImpl value, $Res Function(_$ProgramImpl) then) =
      __$$ProgramImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? facility_name,
      List<PatientObservation> obs});
}

/// @nodoc
class __$$ProgramImplCopyWithImpl<$Res>
    extends _$ProgramCopyWithImpl<$Res, _$ProgramImpl>
    implements _$$ProgramImplCopyWith<$Res> {
  __$$ProgramImplCopyWithImpl(
      _$ProgramImpl _value, $Res Function(_$ProgramImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? facility_name = freezed,
    Object? obs = null,
  }) {
    return _then(_$ProgramImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      facility_name: freezed == facility_name
          ? _value.facility_name
          : facility_name // ignore: cast_nullable_to_non_nullable
              as String?,
      obs: null == obs
          ? _value._obs
          : obs // ignore: cast_nullable_to_non_nullable
              as List<PatientObservation>,
    ));
  }
}

/// @nodoc

class _$ProgramImpl implements _Program {
  const _$ProgramImpl(
      {required this.id,
      required this.name,
      this.facility_name,
      required final List<PatientObservation> obs})
      : _obs = obs;

  @override
  final String id;
  @override
  final String name;
  @override
  final String? facility_name;
  final List<PatientObservation> _obs;
  @override
  List<PatientObservation> get obs {
    if (_obs is EqualUnmodifiableListView) return _obs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_obs);
  }

  @override
  String toString() {
    return 'Program(id: $id, name: $name, facility_name: $facility_name, obs: $obs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.facility_name, facility_name) ||
                other.facility_name == facility_name) &&
            const DeepCollectionEquality().equals(other._obs, _obs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, facility_name,
      const DeepCollectionEquality().hash(_obs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramImplCopyWith<_$ProgramImpl> get copyWith =>
      __$$ProgramImplCopyWithImpl<_$ProgramImpl>(this, _$identity);
}

abstract class _Program implements Program {
  const factory _Program(
      {required final String id,
      required final String name,
      final String? facility_name,
      required final List<PatientObservation> obs}) = _$ProgramImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get facility_name;
  @override
  List<PatientObservation> get obs;
  @override
  @JsonKey(ignore: true)
  _$$ProgramImplCopyWith<_$ProgramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
