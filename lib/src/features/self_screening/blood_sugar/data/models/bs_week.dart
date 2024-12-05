import 'package:freezed_annotation/freezed_annotation.dart';

part 'bs_week.freezed.dart';
part 'bs_week.g.dart';

@Freezed()
class BsWeek with _$BsWeek {

  const factory BsWeek({
    required String dayName,
    String? date,
    double? level,
    String? condition,
  }) = _BsWeek;

  factory BsWeek.fromJson(Map<String, Object?> json)
  => _$BsWeekFromJson(json);
}
