import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'complaint.freezed.dart';
part 'complaint.g.dart';

@Freezed()
class Medication with _$Complaint {
  const factory Medication({
    required String uuid,
    required String name,
    String? onsetDate,
    required String dateRecorded,
    required String value,
  }) = _Complaint;

  factory Medication.fromJson(Map<String, dynamic> json)=> _$ComplaintFromJson(json);
}