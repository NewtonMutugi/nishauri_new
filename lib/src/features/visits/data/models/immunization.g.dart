// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'immunization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImmunizationImpl _$$ImmunizationImplFromJson(Map<String, dynamic> json) =>
    _$ImmunizationImpl(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      immunizationDate: json['immunizationDate'] as String?,
      manufacturer: json['manufacturer'] as String?,
      lot: json['lot'] as String?,
    );

Map<String, dynamic> _$$ImmunizationImplToJson(_$ImmunizationImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'immunizationDate': instance.immunizationDate,
      'manufacturer': instance.manufacturer,
      'lot': instance.lot,
    };
