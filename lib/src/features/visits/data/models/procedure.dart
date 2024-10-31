import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'diagnosis.freezed.dart';
part 'diagnosis.g.dart';

@Freezed()
class Procedure with _$Diagnosis {
  const factory Procedure({
    required String uuid,
    required String name,
    required String dateRecorded,
    required String value,
  }) = _Diagnosis;

  factory Procedure.fromJson(Map<String, dynamic> json)=> _$DiagnosisFromJson(json);
}