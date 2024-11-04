import 'package:freezed_annotation/freezed_annotation.dart';
part 'immunization.freezed.dart';
part 'immunization.g.dart';

@Freezed()
class Immunization with _$Immunization {
  const factory Immunization({
    required String uuid,
    required String name,
    required String dateRecorded,
    required String status,
    required String value,
  }) = _Immunization;

  factory Immunization.fromJson(Map<String, dynamic> json)=> _$ImmunizationFromJson(json);
}