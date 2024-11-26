// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterDataImpl _$$FilterDataImplFromJson(Map<String, dynamic> json) =>
    _$FilterDataImpl(
      week: (json['week'] as List<dynamic>)
          .map((e) => Week.fromJson(e as Map<String, dynamic>))
          .toList(),
      sixMonths: (json['sixMonths'] as List<dynamic>)
          .map((e) => SixMonths.fromJson(e as Map<String, dynamic>))
          .toList(),
      user_id: json['user_id'] as String?,
    );

Map<String, dynamic> _$$FilterDataImplToJson(_$FilterDataImpl instance) =>
    <String, dynamic>{
      'week': instance.week,
      'sixMonths': instance.sixMonths,
      'user_id': instance.user_id,
    };
