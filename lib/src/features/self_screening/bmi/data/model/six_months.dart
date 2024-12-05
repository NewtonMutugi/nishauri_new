import 'package:freezed_annotation/freezed_annotation.dart';

part 'six_months.freezed.dart';
part 'six_months.g.dart';

@Freezed()
class SixMonths with _$SixMonths {

  const factory SixMonths({
    String? month,
    double? avgWeight,
    double? avgHeight,
    double? avgResults,
  }) = _SixMonths;

  factory SixMonths.fromJson(Map<String, Object?> json)
  => _$SixMonthsFromJson(json);
}
