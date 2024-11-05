// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bp_advice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BpAdvice _$BpAdviceFromJson(Map<String, dynamic> json) {
  return _BpAdvice.fromJson(json);
}

/// @nodoc
mixin _$BpAdvice {
  String? get status => throw _privateConstructorUsedError;
  String? get advice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BpAdviceCopyWith<BpAdvice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BpAdviceCopyWith<$Res> {
  factory $BpAdviceCopyWith(BpAdvice value, $Res Function(BpAdvice) then) =
      _$BpAdviceCopyWithImpl<$Res, BpAdvice>;
  @useResult
  $Res call({String? status, String? advice});
}

/// @nodoc
class _$BpAdviceCopyWithImpl<$Res, $Val extends BpAdvice>
    implements $BpAdviceCopyWith<$Res> {
  _$BpAdviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? advice = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      advice: freezed == advice
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BpAdviceImplCopyWith<$Res>
    implements $BpAdviceCopyWith<$Res> {
  factory _$$BpAdviceImplCopyWith(
          _$BpAdviceImpl value, $Res Function(_$BpAdviceImpl) then) =
      __$$BpAdviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? advice});
}

/// @nodoc
class __$$BpAdviceImplCopyWithImpl<$Res>
    extends _$BpAdviceCopyWithImpl<$Res, _$BpAdviceImpl>
    implements _$$BpAdviceImplCopyWith<$Res> {
  __$$BpAdviceImplCopyWithImpl(
      _$BpAdviceImpl _value, $Res Function(_$BpAdviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? advice = freezed,
  }) {
    return _then(_$BpAdviceImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      advice: freezed == advice
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BpAdviceImpl implements _BpAdvice {
  const _$BpAdviceImpl({this.status, this.advice});

  factory _$BpAdviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BpAdviceImplFromJson(json);

  @override
  final String? status;
  @override
  final String? advice;

  @override
  String toString() {
    return 'BpAdvice(status: $status, advice: $advice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BpAdviceImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.advice, advice) || other.advice == advice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, advice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BpAdviceImplCopyWith<_$BpAdviceImpl> get copyWith =>
      __$$BpAdviceImplCopyWithImpl<_$BpAdviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BpAdviceImplToJson(
      this,
    );
  }
}

abstract class _BpAdvice implements BpAdvice {
  const factory _BpAdvice({final String? status, final String? advice}) =
      _$BpAdviceImpl;

  factory _BpAdvice.fromJson(Map<String, dynamic> json) =
      _$BpAdviceImpl.fromJson;

  @override
  String? get status;
  @override
  String? get advice;
  @override
  @JsonKey(ignore: true)
  _$$BpAdviceImplCopyWith<_$BpAdviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
