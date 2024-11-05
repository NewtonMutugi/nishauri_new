// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'immunization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImmunizationImpl _$$ImmunizationImplFromJson(Map<String, dynamic> json) =>
    _$ImmunizationImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      dateRecorded: json['dateRecorded'] as String,
      status: json['status'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$ImmunizationImplToJson(_$ImmunizationImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'dateRecorded': instance.dateRecorded,
      'status': instance.status,
      'value': instance.value,
    };
