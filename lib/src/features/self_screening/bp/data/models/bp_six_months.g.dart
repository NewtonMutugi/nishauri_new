// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_six_months.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BpSixMonthsImpl _$$BpSixMonthsImplFromJson(Map<String, dynamic> json) =>
    _$BpSixMonthsImpl(
      month: json['month'] as String?,
      avg_systolic: (json['avg_systolic'] as num?)?.toDouble(),
      avg_diastolic: (json['avg_diastolic'] as num?)?.toDouble(),
      avg_pulse_rate: (json['avg_pulse_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$BpSixMonthsImplToJson(_$BpSixMonthsImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'avg_systolic': instance.avg_systolic,
      'avg_diastolic': instance.avg_diastolic,
      'avg_pulse_rate': instance.avg_pulse_rate,
    };
