import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'medication.freezed.dart';
part 'medication.g.dart';

@Freezed()
class Medication with _$Medication {
  const factory Medication({
    required String uuid,
    required String name,
    String? onsetDate,
    required String dateRecorded,
    required String value,
  }) = _Medication;

  factory Medication.fromJson(Map<String, dynamic> json)=> _$MedicationFromJson(json);
}