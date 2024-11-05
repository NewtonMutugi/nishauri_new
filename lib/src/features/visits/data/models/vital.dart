import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'vital.freezed.dart';
part 'vital.g.dart';

@Freezed()
class Vital with _$Vital {
  const factory Vital({
    String? uuid,
    String? name,
    String? dateRecorded,
    String? weight,
    String? temp,
    String? systolic,
    String? diastolic,
    String? respiratory,
    String? oxygenSaturation,
    String? height,
    String? complain,
  }) = _Vital;

  factory Vital.fromJson(Map<String, dynamic> json)=> _$VitalFromJson(json);
}