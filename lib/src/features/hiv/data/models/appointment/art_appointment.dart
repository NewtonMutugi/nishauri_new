import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'art_appointment.freezed.dart';
part 'art_appointment.g.dart';

@Freezed()
class ARTAppointment with _$ARTAppointment {
  const factory ARTAppointment({
    String? id,
    required String ccc_no,
    String? appointment_type,
    required String appointment_date,
    String? appointment,
    String? nextAppointmentDate,
  }) = _ARTAppointment;

  factory ARTAppointment.fromJson(Map<String, dynamic> json)=> _$ARTAppointmentFromJson(json);
}
