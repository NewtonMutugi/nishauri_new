import 'package:freezed_annotation/freezed_annotation.dart';

part 'bp_week.freezed.dart';
part 'bp_week.g.dart';

@Freezed()
class BpWeek with _$BpWeek {

  const factory BpWeek({
    required String dayName,
    String? date,
    double? systolic,
    double? diastolic,
    double? pulse_rate,
  }) = _BpWeek;

  factory BpWeek.fromJson(Map<String, Object?> json)
  => _$BpWeekFromJson(json);
}
