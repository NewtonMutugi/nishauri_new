import 'package:freezed_annotation/freezed_annotation.dart';

part 'bs_six_months.freezed.dart';
part 'bs_six_months.g.dart';

@Freezed()
class BsSixMonths with _$BsSixMonths {

  const factory BsSixMonths({
    String? month,
    double? avg_level
  }) = _BsSixMonths;

  factory BsSixMonths.fromJson(Map<String, Object?> json)
  => _$BsSixMonthsFromJson(json);
}
