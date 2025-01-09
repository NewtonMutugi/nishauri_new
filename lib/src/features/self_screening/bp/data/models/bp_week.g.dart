// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BpWeekImpl _$$BpWeekImplFromJson(Map<String, dynamic> json) => _$BpWeekImpl(
      dayName: json['dayName'] as String,
      date: json['date'] as String?,
      systolic: (json['systolic'] as num?)?.toDouble(),
      diastolic: (json['diastolic'] as num?)?.toDouble(),
      pulse_rate: (json['pulse_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$BpWeekImplToJson(_$BpWeekImpl instance) =>
    <String, dynamic>{
      'dayName': instance.dayName,
      'date': instance.date,
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'pulse_rate': instance.pulse_rate,
    };
