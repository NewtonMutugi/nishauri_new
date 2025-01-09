import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/model/six_months.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/model/week.dart';

part 'filter_data.freezed.dart';

@Freezed()
class FilterData with _$FilterData {

  const factory FilterData({
    required List<Week> week,
    required List<SixMonths> sixMonths,
    String? user_id,
  }) = _FilterData;

  factory FilterData.fromJson(Map<String, dynamic> json){
    return FilterData(
        week: (json['weekly'] as List<dynamic>? ?? []).map((wk) => Week.fromJson(wk)).toList(),
        sixMonths: (json['sixMonthly'] as List<dynamic>? ?? []).map((month) => SixMonths.fromJson(month)).toList(),
    );
  }
}
