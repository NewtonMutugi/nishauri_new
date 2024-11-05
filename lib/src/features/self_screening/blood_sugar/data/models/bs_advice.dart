import 'package:freezed_annotation/freezed_annotation.dart';

part 'bs_advice.freezed.dart';
part 'bs_advice.g.dart';

@Freezed()
class BsAdvice with _$BsAdvice {
  const factory BsAdvice({
    String? label,
    String? description,
    String? advice,

  }) = _BsAdvice;
  factory BsAdvice.fromJson(Map<String, dynamic> json)=> _$BsAdviceFromJson(json);
}