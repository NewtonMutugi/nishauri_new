// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LabResultImpl _$$LabResultImplFromJson(Map<String, dynamic> json) =>
    _$LabResultImpl(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      results: json['results'] as String?,
      orderedDate: json['orderedDate'] as String?,
      status: json['status'] as String?,
      plot: (json['plot'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LabResultImplToJson(_$LabResultImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'results': instance.results,
      'orderedDate': instance.orderedDate,
      'status': instance.status,
      'plot': instance.plot,
    };
