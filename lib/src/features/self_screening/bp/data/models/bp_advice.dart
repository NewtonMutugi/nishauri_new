import 'package:freezed_annotation/freezed_annotation.dart';

part 'bp_advice.freezed.dart';
part 'bp_advice.g.dart';

@Freezed()
class BpAdvice with _$BpAdvice {
  const factory BpAdvice({
    String? status,
    String? advice,

  }) = _BpAdvice;
  factory BpAdvice.fromJson(Map<String, dynamic> json)=> _$BpAdviceFromJson(json);
}