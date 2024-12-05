// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeekImpl _$$WeekImplFromJson(Map<String, dynamic> json) => _$WeekImpl(
      dayName: json['dayName'] as String?,
      date: json['date'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      results: (json['results'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WeekImplToJson(_$WeekImpl instance) =>
    <String, dynamic>{
      'dayName': instance.dayName,
      'date': instance.date,
      'weight': instance.weight,
      'height': instance.height,
      'results': instance.results,
    };
