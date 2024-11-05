// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcedureImpl _$$ProcedureImplFromJson(Map<String, dynamic> json) =>
    _$ProcedureImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      dateRecorded: json['dateRecorded'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$ProcedureImplToJson(_$ProcedureImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'dateRecorded': instance.dateRecorded,
      'value': instance.value,
    };
