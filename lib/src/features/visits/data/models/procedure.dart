import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'procedure.freezed.dart';
part 'procedure.g.dart';

@Freezed()
class Procedure with _$Procedure {
  const factory Procedure({
    required String uuid,
    required String name,
    required String dateRecorded,
    required String value,
  }) = _Procedure;

  factory Procedure.fromJson(Map<String, dynamic> json)=> _$ProcedureFromJson(json);
}