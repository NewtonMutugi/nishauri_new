import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nishauri/src/features/self_screening/bp/data/models/bp_hours.dart';
import 'package:nishauri/src/features/self_screening/bp/data/models/bp_six_months.dart';
import 'package:nishauri/src/features/self_screening/bp/data/models/bp_week.dart';

part 'filter_bp.freezed.dart';

@Freezed()
class FilterBp with _$FilterBp {

  const factory FilterBp({
    required List<BpHours> hourly,
    required List<BpWeek> weekly,
    required List<BpSixMonths> sixMonthly,
  }) = _FilterBp;

  factory FilterBp.fromJson(Map<String, dynamic> json) {
    return FilterBp(
      hourly: (json['hourly'] as List<dynamic>? ?? []).map((hr) => BpHours.fromJson(hr)).toList(),
      weekly: (json['weekly'] as List<dynamic>? ?? []).map((wk) => BpWeek.fromJson(wk)).toList(),
      sixMonthly: (json['sixMonthly']as List<dynamic>? ?? []).map((mnth) => BpSixMonths.fromJson(mnth)).toList(),
    );
  }
}