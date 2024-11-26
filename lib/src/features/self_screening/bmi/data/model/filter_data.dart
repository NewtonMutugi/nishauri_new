import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/model/six_months.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/model/week.dart';

part 'filter_data.freezed.dart';
part 'filter_data.g.dart';

@Freezed()
class FilterData with _$FilterData {

  const factory FilterData({
    required List<Week> week,
    required List<SixMonths> sixMonths,
    String? user_id,
  }) = _FilterData;

  factory FilterData.fromJson(Map<String, Object?> json)
  => _$FilterDataFromJson(json);
}
