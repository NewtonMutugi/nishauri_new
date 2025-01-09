import 'package:freezed_annotation/freezed_annotation.dart';

part 'bp_six_months.freezed.dart';
part 'bp_six_months.g.dart';

@Freezed()
class BpSixMonths with _$BpSixMonths {

  const factory BpSixMonths({
    String? month,
    double? avg_systolic,
    double? avg_diastolic,
    double? avg_pulse_rate,
  }) = _BpSixMonths;

  factory BpSixMonths.fromJson(Map<String, Object?> json)
  => _$BpSixMonthsFromJson(json);
}
