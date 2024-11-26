import 'package:freezed_annotation/freezed_annotation.dart';

part 'week.freezed.dart';
part 'week.g.dart';

@Freezed()
class Week with _$Week {

  const factory Week({
    required String dayName,
    String? date,
    double? weight,
    double? height,
    required double results,
  }) = _Week;

  factory Week.fromJson(Map<String, Object?> json)
  => _$WeekFromJson(json);
}
