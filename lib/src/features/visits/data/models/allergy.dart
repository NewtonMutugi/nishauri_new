import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'allergy.freezed.dart';
part 'allergy.g.dart';

@Freezed()
class Allergy with _$Allergy {
  const factory Allergy({
    String? uuid,
    String? allergen,
    String? reaction,
    String? onsetDate,
    String? dateRecorded,
    String? severity,
  }) = _Allergy;

  factory Allergy.fromJson(Map<String, dynamic> json)=> _$AllergyFromJson(json);
}