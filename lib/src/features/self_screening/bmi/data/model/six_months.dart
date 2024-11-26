import 'package:freezed_annotation/freezed_annotation.dart';

part 'six_months.freezed.dart';
part 'six_months.g.dart';

@Freezed()
class SixMonths with _$SixMonths {

  const factory SixMonths({
    required String month,
    double? avgWeight,
    double? avgHeight,
    required double avgResults,
  }) = _SixMonths;

  factory SixMonths.fromJson(Map<String, Object?> json)
  => _$SixMonthsFromJson(json);
}
