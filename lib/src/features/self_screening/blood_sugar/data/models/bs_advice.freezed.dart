// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bs_advice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BsAdvice _$BsAdviceFromJson(Map<String, dynamic> json) {
  return _BsAdvice.fromJson(json);
}

/// @nodoc
mixin _$BsAdvice {
  String? get label => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get advice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BsAdviceCopyWith<BsAdvice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsAdviceCopyWith<$Res> {
  factory $BsAdviceCopyWith(BsAdvice value, $Res Function(BsAdvice) then) =
      _$BsAdviceCopyWithImpl<$Res, BsAdvice>;
  @useResult
  $Res call({String? label, String? description, String? advice});
}

/// @nodoc
class _$BsAdviceCopyWithImpl<$Res, $Val extends BsAdvice>
    implements $BsAdviceCopyWith<$Res> {
  _$BsAdviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? description = freezed,
    Object? advice = freezed,
  }) {
    return _then(_value.copyWith(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      advice: freezed == advice
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BsAdviceImplCopyWith<$Res>
    implements $BsAdviceCopyWith<$Res> {
  factory _$$BsAdviceImplCopyWith(
          _$BsAdviceImpl value, $Res Function(_$BsAdviceImpl) then) =
      __$$BsAdviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? label, String? description, String? advice});
}

/// @nodoc
class __$$BsAdviceImplCopyWithImpl<$Res>
    extends _$BsAdviceCopyWithImpl<$Res, _$BsAdviceImpl>
    implements _$$BsAdviceImplCopyWith<$Res> {
  __$$BsAdviceImplCopyWithImpl(
      _$BsAdviceImpl _value, $Res Function(_$BsAdviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? description = freezed,
    Object? advice = freezed,
  }) {
    return _then(_$BsAdviceImpl(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
class _$BsAdviceImpl implements _BsAdvice {
  const _$BsAdviceImpl({this.label, this.description, this.advice});

  factory _$BsAdviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BsAdviceImplFromJson(json);

  @override
  final String? label;
  @override
  final String? description;
  @override
  final String? advice;

  @override
  String toString() {
    return 'BsAdvice(label: $label, description: $description, advice: $advice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsAdviceImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.advice, advice) || other.advice == advice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, description, advice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BsAdviceImplCopyWith<_$BsAdviceImpl> get copyWith =>
      __$$BsAdviceImplCopyWithImpl<_$BsAdviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BsAdviceImplToJson(
      this,
    );
  }
}

abstract class _BsAdvice implements BsAdvice {
  const factory _BsAdvice(
      {final String? label,
      final String? description,
      final String? advice}) = _$BsAdviceImpl;

  factory _BsAdvice.fromJson(Map<String, dynamic> json) =
      _$BsAdviceImpl.fromJson;

  @override
  String? get label;
  @override
  String? get description;
  @override
  String? get advice;
  @override
  @JsonKey(ignore: true)
  _$$BsAdviceImplCopyWith<_$BsAdviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
