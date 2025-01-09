import 'package:freezed_annotation/freezed_annotation.dart';

part 'bp_hours.freezed.dart';
part 'bp_hours.g.dart';

@Freezed()
class BpHours with _$BpHours {

  const factory BpHours({
    String? time,
    double? systolic,
    double? diastolic,
    double? pulse_rate,
  }) = _BpHours;

  factory BpHours.fromJson(Map<String, Object?> json)
  => _$BpHoursFromJson(json);
}