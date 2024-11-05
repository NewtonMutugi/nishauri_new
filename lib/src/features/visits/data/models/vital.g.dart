// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VitalImpl _$$VitalImplFromJson(Map<String, dynamic> json) => _$VitalImpl(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      dateRecorded: json['dateRecorded'] as String?,
      weight: json['weight'] as String?,
      temp: json['temp'] as String?,
      systolic: json['systolic'] as String?,
      diastolic: json['diastolic'] as String?,
      respiratory: json['respiratory'] as String?,
      oxygenSaturation: json['oxygenSaturation'] as String?,
      height: json['height'] as String?,
      complain: json['complain'] as String?,
    );

Map<String, dynamic> _$$VitalImplToJson(_$VitalImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'dateRecorded': instance.dateRecorded,
      'weight': instance.weight,
      'temp': instance.temp,
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'respiratory': instance.respiratory,
      'oxygenSaturation': instance.oxygenSaturation,
      'height': instance.height,
      'complain': instance.complain,
    };
