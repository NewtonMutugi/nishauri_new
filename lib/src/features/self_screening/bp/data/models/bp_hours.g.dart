// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BpHoursImpl _$$BpHoursImplFromJson(Map<String, dynamic> json) =>
    _$BpHoursImpl(
      time: json['time'] as String?,
      systolic: (json['systolic'] as num?)?.toDouble(),
      diastolic: (json['diastolic'] as num?)?.toDouble(),
      pulse_rate: (json['pulse_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$BpHoursImplToJson(_$BpHoursImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'pulse_rate': instance.pulse_rate,
    };
