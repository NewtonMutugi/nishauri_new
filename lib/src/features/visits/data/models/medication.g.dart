// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicationImpl _$$MedicationImplFromJson(Map<String, dynamic> json) =>
    _$MedicationImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      onsetDate: json['onsetDate'] as String?,
      dateRecorded: json['dateRecorded'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$MedicationImplToJson(_$MedicationImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'onsetDate': instance.onsetDate,
      'dateRecorded': instance.dateRecorded,
      'value': instance.value,
    };
