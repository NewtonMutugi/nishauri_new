import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'condition.freezed.dart';
part 'condition.g.dart';

@Freezed()
class Condition with _$Condition {
  const factory Condition({
    String? uuid,
    String? name,
    String? onsetDate,
    String? dateRecorded,
    String? status,
    String? value,
  }) = _Condition;

  factory Condition.fromJson(Map<String, dynamic> json)=> _$ConditionFromJson(json);
}