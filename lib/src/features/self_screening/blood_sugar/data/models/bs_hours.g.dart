// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bs_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BsHoursImpl _$$BsHoursImplFromJson(Map<String, dynamic> json) =>
    _$BsHoursImpl(
      time: json['time'] as String?,
      level: (json['level'] as num?)?.toDouble(),
      condition: json['condition'] as String?,
    );

Map<String, dynamic> _$$BsHoursImplToJson(_$BsHoursImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'level': instance.level,
      'condition': instance.condition,
    };
