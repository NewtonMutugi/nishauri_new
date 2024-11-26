import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'lab_result.freezed.dart';
part 'lab_result.g.dart';

@Freezed()
class LabResult with _$LabResult {
  const factory LabResult({
    String? uuid,
    String? name,
    String? results,
    String? orderedDate,
    String? status,
    double? plot,
  }) = _LabResult;

  factory LabResult.fromJson(Map<String, dynamic> json)=> _$LabResultFromJson(json);
}