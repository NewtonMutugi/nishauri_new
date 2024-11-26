// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'six_months.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SixMonthsImpl _$$SixMonthsImplFromJson(Map<String, dynamic> json) =>
    _$SixMonthsImpl(
      month: json['month'] as String,
      avgWeight: (json['avgWeight'] as num?)?.toDouble(),
      avgHeight: (json['avgHeight'] as num?)?.toDouble(),
      avgResults: (json['avgResults'] as num).toDouble(),
    );

Map<String, dynamic> _$$SixMonthsImplToJson(_$SixMonthsImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'avgWeight': instance.avgWeight,
      'avgHeight': instance.avgHeight,
      'avgResults': instance.avgResults,
    };
