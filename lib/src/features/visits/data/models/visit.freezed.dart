// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Visit _$VisitFromJson(Map<String, dynamic> json) {
  return _Visit.fromJson(json);
}

/// @nodoc
mixin _$Visit {
  String get uuid => throw _privateConstructorUsedError;
  List<Allergy> get allergies => throw _privateConstructorUsedError;
  List<Medication> get medications => throw _privateConstructorUsedError;
  List<Condition> get conditions => throw _privateConstructorUsedError;
  List<Procedure> get procedures => throw _privateConstructorUsedError;
  List<LabResult> get labResults => throw _privateConstructorUsedError;
  List<Vital> get vitals => throw _privateConstructorUsedError;
  List<Immunization> get immunization => throw _privateConstructorUsedError;
  String? get facility => throw _privateConstructorUsedError;
  String get visitDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitCopyWith<Visit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitCopyWith<$Res> {
  factory $VisitCopyWith(Visit value, $Res Function(Visit) then) =
      _$VisitCopyWithImpl<$Res, Visit>;
  @useResult
  $Res call(
      {String uuid,
      List<Allergy> allergies,
      List<Medication> medications,
      List<Condition> conditions,
      List<Procedure> procedures,
      List<LabResult> labResults,
      List<Vital> vitals,
      List<Immunization> immunization,
      String? facility,
      String visitDate});
}

/// @nodoc
class _$VisitCopyWithImpl<$Res, $Val extends Visit>
    implements $VisitCopyWith<$Res> {
  _$VisitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? allergies = null,
    Object? medications = null,
    Object? conditions = null,
    Object? procedures = null,
    Object? labResults = null,
    Object? vitals = null,
    Object? immunization = null,
    Object? facility = freezed,
    Object? visitDate = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      allergies: null == allergies
          ? _value.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as List<Allergy>,
      medications: null == medications
          ? _value.medications
          : medications // ignore: cast_nullable_to_non_nullable
              as List<Medication>,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<Condition>,
      procedures: null == procedures
          ? _value.procedures
          : procedures // ignore: cast_nullable_to_non_nullable
              as List<Procedure>,
      labResults: null == labResults
          ? _value.labResults
          : labResults // ignore: cast_nullable_to_non_nullable
              as List<LabResult>,
      vitals: null == vitals
          ? _value.vitals
          : vitals // ignore: cast_nullable_to_non_nullable
              as List<Vital>,
      immunization: null == immunization
          ? _value.immunization
          : immunization // ignore: cast_nullable_to_non_nullable
              as List<Immunization>,
      facility: freezed == facility
          ? _value.facility
          : facility // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDate: null == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisitImplCopyWith<$Res> implements $VisitCopyWith<$Res> {
  factory _$$VisitImplCopyWith(
          _$VisitImpl value, $Res Function(_$VisitImpl) then) =
      __$$VisitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      List<Allergy> allergies,
      List<Medication> medications,
      List<Condition> conditions,
      List<Procedure> procedures,
      List<LabResult> labResults,
      List<Vital> vitals,
      List<Immunization> immunization,
      String? facility,
      String visitDate});
}

/// @nodoc
class __$$VisitImplCopyWithImpl<$Res>
    extends _$VisitCopyWithImpl<$Res, _$VisitImpl>
    implements _$$VisitImplCopyWith<$Res> {
  __$$VisitImplCopyWithImpl(
      _$VisitImpl _value, $Res Function(_$VisitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? allergies = null,
    Object? medications = null,
    Object? conditions = null,
    Object? procedures = null,
    Object? labResults = null,
    Object? vitals = null,
    Object? immunization = null,
    Object? facility = freezed,
    Object? visitDate = null,
  }) {
    return _then(_$VisitImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      allergies: null == allergies
          ? _value._allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as List<Allergy>,
      medications: null == medications
          ? _value._medications
          : medications // ignore: cast_nullable_to_non_nullable
              as List<Medication>,
      conditions: null == conditions
          ? _value._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<Condition>,
      procedures: null == procedures
          ? _value._procedures
          : procedures // ignore: cast_nullable_to_non_nullable
              as List<Procedure>,
      labResults: null == labResults
          ? _value._labResults
          : labResults // ignore: cast_nullable_to_non_nullable
              as List<LabResult>,
      vitals: null == vitals
          ? _value._vitals
          : vitals // ignore: cast_nullable_to_non_nullable
              as List<Vital>,
      immunization: null == immunization
          ? _value._immunization
          : immunization // ignore: cast_nullable_to_non_nullable
              as List<Immunization>,
      facility: freezed == facility
          ? _value.facility
          : facility // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDate: null == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VisitImpl with DiagnosticableTreeMixin implements _Visit {
  const _$VisitImpl(
      {required this.uuid,
      final List<Allergy> allergies = const [],
      final List<Medication> medications = const [],
      final List<Condition> conditions = const [],
      final List<Procedure> procedures = const [],
      final List<LabResult> labResults = const [],
      final List<Vital> vitals = const [],
      final List<Immunization> immunization = const [],
      this.facility,
      required this.visitDate})
      : _allergies = allergies,
        _medications = medications,
        _conditions = conditions,
        _procedures = procedures,
        _labResults = labResults,
        _vitals = vitals,
        _immunization = immunization;

  factory _$VisitImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitImplFromJson(json);

  @override
  final String uuid;
  final List<Allergy> _allergies;
  @override
  @JsonKey()
  List<Allergy> get allergies {
    if (_allergies is EqualUnmodifiableListView) return _allergies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergies);
  }

  final List<Medication> _medications;
  @override
  @JsonKey()
  List<Medication> get medications {
    if (_medications is EqualUnmodifiableListView) return _medications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medications);
  }

  final List<Condition> _conditions;
  @override
  @JsonKey()
  List<Condition> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  final List<Procedure> _procedures;
  @override
  @JsonKey()
  List<Procedure> get procedures {
    if (_procedures is EqualUnmodifiableListView) return _procedures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_procedures);
  }

  final List<LabResult> _labResults;
  @override
  @JsonKey()
  List<LabResult> get labResults {
    if (_labResults is EqualUnmodifiableListView) return _labResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labResults);
  }

  final List<Vital> _vitals;
  @override
  @JsonKey()
  List<Vital> get vitals {
    if (_vitals is EqualUnmodifiableListView) return _vitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vitals);
  }

  final List<Immunization> _immunization;
  @override
  @JsonKey()
  List<Immunization> get immunization {
    if (_immunization is EqualUnmodifiableListView) return _immunization;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_immunization);
  }

  @override
  final String? facility;
  @override
  final String visitDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Visit(uuid: $uuid, allergies: $allergies, medications: $medications, conditions: $conditions, procedures: $procedures, labResults: $labResults, vitals: $vitals, immunization: $immunization, facility: $facility, visitDate: $visitDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Visit'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('allergies', allergies))
      ..add(DiagnosticsProperty('medications', medications))
      ..add(DiagnosticsProperty('conditions', conditions))
      ..add(DiagnosticsProperty('procedures', procedures))
      ..add(DiagnosticsProperty('labResults', labResults))
      ..add(DiagnosticsProperty('vitals', vitals))
      ..add(DiagnosticsProperty('immunization', immunization))
      ..add(DiagnosticsProperty('facility', facility))
      ..add(DiagnosticsProperty('visitDate', visitDate));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality()
                .equals(other._allergies, _allergies) &&
            const DeepCollectionEquality()
                .equals(other._medications, _medications) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions) &&
            const DeepCollectionEquality()
                .equals(other._procedures, _procedures) &&
            const DeepCollectionEquality()
                .equals(other._labResults, _labResults) &&
            const DeepCollectionEquality().equals(other._vitals, _vitals) &&
            const DeepCollectionEquality()
                .equals(other._immunization, _immunization) &&
            (identical(other.facility, facility) ||
                other.facility == facility) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      const DeepCollectionEquality().hash(_allergies),
      const DeepCollectionEquality().hash(_medications),
      const DeepCollectionEquality().hash(_conditions),
      const DeepCollectionEquality().hash(_procedures),
      const DeepCollectionEquality().hash(_labResults),
      const DeepCollectionEquality().hash(_vitals),
      const DeepCollectionEquality().hash(_immunization),
      facility,
      visitDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitImplCopyWith<_$VisitImpl> get copyWith =>
      __$$VisitImplCopyWithImpl<_$VisitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitImplToJson(
      this,
    );
  }
}

abstract class _Visit implements Visit {
  const factory _Visit(
      {required final String uuid,
      final List<Allergy> allergies,
      final List<Medication> medications,
      final List<Condition> conditions,
      final List<Procedure> procedures,
      final List<LabResult> labResults,
      final List<Vital> vitals,
      final List<Immunization> immunization,
      final String? facility,
      required final String visitDate}) = _$VisitImpl;

  factory _Visit.fromJson(Map<String, dynamic> json) = _$VisitImpl.fromJson;

  @override
  String get uuid;
  @override
  List<Allergy> get allergies;
  @override
  List<Medication> get medications;
  @override
  List<Condition> get conditions;
  @override
  List<Procedure> get procedures;
  @override
  List<LabResult> get labResults;
  @override
  List<Vital> get vitals;
  @override
  List<Immunization> get immunization;
  @override
  String? get facility;
  @override
  String get visitDate;
  @override
  @JsonKey(ignore: true)
  _$$VisitImplCopyWith<_$VisitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
