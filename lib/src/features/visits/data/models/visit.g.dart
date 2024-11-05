// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisitImpl _$$VisitImplFromJson(Map<String, dynamic> json) => _$VisitImpl(
      uuid: json['uuid'] as String,
      allergies: (json['allergies'] as List<dynamic>?)
              ?.map((e) => Allergy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      medications: (json['medications'] as List<dynamic>?)
              ?.map((e) => Medication.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      conditions: (json['conditions'] as List<dynamic>?)
              ?.map((e) => Condition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      procedures: (json['procedures'] as List<dynamic>?)
              ?.map((e) => Procedure.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      labResults: (json['labResults'] as List<dynamic>?)
              ?.map((e) => LabResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      vitals: (json['vitals'] as List<dynamic>?)
              ?.map((e) => Vital.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      immunization: (json['immunization'] as List<dynamic>?)
              ?.map((e) => Immunization.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      facility: json['facility'] as String?,
      visitDate: json['visitDate'] as String,
    );

Map<String, dynamic> _$$VisitImplToJson(_$VisitImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'allergies': instance.allergies,
      'medications': instance.medications,
      'conditions': instance.conditions,
      'procedures': instance.procedures,
      'labResults': instance.labResults,
      'vitals': instance.vitals,
      'immunization': instance.immunization,
      'facility': instance.facility,
      'visitDate': instance.visitDate,
    };
