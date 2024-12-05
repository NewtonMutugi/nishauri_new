import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/bs_hours.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/bs_six_months.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/bs_week.dart';

part 'filter_bs.freezed.dart';
// part 'filter_bs.g.dart';

@Freezed()
class FilterBs with _$FilterBs {

  const factory FilterBs({
    required List<BsHours> hourly,
    required List<BsWeek> weekly,
    required List<BsSixMonths> sixMonthly,
  }) = _FilterBs;

  factory FilterBs.fromJson(Map<String, dynamic> json) {
    return FilterBs(
      hourly: (json['hourly'] as List<dynamic>? ?? []).map((hr) => BsHours.fromJson(hr)).toList(),
      weekly: (json['weekly'] as List<dynamic>? ?? []).map((wk) => BsWeek.fromJson(wk)).toList(),
      sixMonthly: (json['sixMonthly']as List<dynamic>? ?? []).map((mnth) => BsSixMonths.fromJson(mnth)).toList(),
    );
  }
}