import 'package:freezed_annotation/freezed_annotation.dart';

part 'bs_hours.freezed.dart';
part 'bs_hours.g.dart';

@Freezed()
class BsHours with _$BsHours {

  const factory BsHours({
    String? time,
    double? level,
    String? condition,
  }) = _BsHours;

  factory BsHours.fromJson(Map<String, Object?> json)
  => _$BsHoursFromJson(json);
}