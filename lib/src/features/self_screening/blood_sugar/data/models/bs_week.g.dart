// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bs_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BsWeekImpl _$$BsWeekImplFromJson(Map<String, dynamic> json) => _$BsWeekImpl(
      dayName: json['dayName'] as String,
      date: json['date'] as String?,
      level: (json['level'] as num?)?.toDouble(),
      condition: json['condition'] as String?,
    );

Map<String, dynamic> _$$BsWeekImplToJson(_$BsWeekImpl instance) =>
    <String, dynamic>{
      'dayName': instance.dayName,
      'date': instance.date,
      'level': instance.level,
      'condition': instance.condition,
    };
