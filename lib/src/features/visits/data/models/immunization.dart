import 'package:freezed_annotation/freezed_annotation.dart';
part 'immunization.freezed.dart';
part 'immunization.g.dart';

@Freezed()
class Immunization with _$Immunization {
  const factory Immunization({
    String? uuid,
    String? name,
    String? immunizationDate,
    String? manufacturer,
    String? lot,
  }) = _Immunization;

  factory Immunization.fromJson(Map<String, dynamic> json)=> _$ImmunizationFromJson(json);
}