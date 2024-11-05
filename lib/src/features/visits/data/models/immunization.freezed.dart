// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'immunization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Immunization _$ImmunizationFromJson(Map<String, dynamic> json) {
  return _Immunization.fromJson(json);
}

/// @nodoc
mixin _$Immunization {
  String? get uuid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get immunizationDate => throw _privateConstructorUsedError;
  String? get manufacturer => throw _privateConstructorUsedError;
  String? get lot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImmunizationCopyWith<Immunization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImmunizationCopyWith<$Res> {
  factory $ImmunizationCopyWith(
          Immunization value, $Res Function(Immunization) then) =
      _$ImmunizationCopyWithImpl<$Res, Immunization>;
  @useResult
  $Res call(
      {String? uuid,
      String? name,
      String? immunizationDate,
      String? manufacturer,
      String? lot});
}

/// @nodoc
class _$ImmunizationCopyWithImpl<$Res, $Val extends Immunization>
    implements $ImmunizationCopyWith<$Res> {
  _$ImmunizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? name = freezed,
    Object? immunizationDate = freezed,
    Object? manufacturer = freezed,
    Object? lot = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      immunizationDate: freezed == immunizationDate
          ? _value.immunizationDate
          : immunizationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      lot: freezed == lot
          ? _value.lot
          : lot // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImmunizationImplCopyWith<$Res>
    implements $ImmunizationCopyWith<$Res> {
  factory _$$ImmunizationImplCopyWith(
          _$ImmunizationImpl value, $Res Function(_$ImmunizationImpl) then) =
      __$$ImmunizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
      String? name,
      String? immunizationDate,
      String? manufacturer,
      String? lot});
}

/// @nodoc
class __$$ImmunizationImplCopyWithImpl<$Res>
    extends _$ImmunizationCopyWithImpl<$Res, _$ImmunizationImpl>
    implements _$$ImmunizationImplCopyWith<$Res> {
  __$$ImmunizationImplCopyWithImpl(
      _$ImmunizationImpl _value, $Res Function(_$ImmunizationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? name = freezed,
    Object? immunizationDate = freezed,
    Object? manufacturer = freezed,
    Object? lot = freezed,
  }) {
    return _then(_$ImmunizationImpl(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      immunizationDate: freezed == immunizationDate
          ? _value.immunizationDate
          : immunizationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      lot: freezed == lot
          ? _value.lot
          : lot // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImmunizationImpl implements _Immunization {
  const _$ImmunizationImpl(
      {this.uuid,
      this.name,
      this.immunizationDate,
      this.manufacturer,
      this.lot});

  factory _$ImmunizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImmunizationImplFromJson(json);

  @override
  final String? uuid;
  @override
  final String? name;
  @override
  final String? immunizationDate;
  @override
  final String? manufacturer;
  @override
  final String? lot;

  @override
  String toString() {
    return 'Immunization(uuid: $uuid, name: $name, immunizationDate: $immunizationDate, manufacturer: $manufacturer, lot: $lot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImmunizationImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.immunizationDate, immunizationDate) ||
                other.immunizationDate == immunizationDate) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.lot, lot) || other.lot == lot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, name, immunizationDate, manufacturer, lot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImmunizationImplCopyWith<_$ImmunizationImpl> get copyWith =>
      __$$ImmunizationImplCopyWithImpl<_$ImmunizationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImmunizationImplToJson(
      this,
    );
  }
}

abstract class _Immunization implements Immunization {
  const factory _Immunization(
      {final String? uuid,
      final String? name,
      final String? immunizationDate,
      final String? manufacturer,
      final String? lot}) = _$ImmunizationImpl;

  factory _Immunization.fromJson(Map<String, dynamic> json) =
      _$ImmunizationImpl.fromJson;

  @override
  String? get uuid;
  @override
  String? get name;
  @override
  String? get immunizationDate;
  @override
  String? get manufacturer;
  @override
  String? get lot;
  @override
  @JsonKey(ignore: true)
  _$$ImmunizationImplCopyWith<_$ImmunizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
