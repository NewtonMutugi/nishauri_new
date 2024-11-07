class HealthRecordModel {
  final String uuid;
  final String visitDate;
  final String facility;
  final List<Condition> conditions;
  // final List<Medication> medications;
  // final List<Allergy> allergies;
  // final List<Vital> vitals;
  // final List<LabResult> labResults;
  // final List<Procedure> procedures;
  // final List<Immunization> immunizations;

  HealthRecordModel({
    required this.uuid,
    required this.visitDate,
    required this.facility,
    required this.conditions,
    // required this.medications,
    // required this.allergies,
    // required this.vitals,
    // required this.labResults,
    // required this.procedures,
    // required this.immunizations,
  });

  factory HealthRecordModel.fromJson(Map<String, dynamic> json) {
    return HealthRecordModel(
      uuid: json['uuid'],
      visitDate: json['visitDate'],
      facility: json['facility'],
      conditions: (json['conditions'] as List)
          .map((condition) => Condition.fromJson(condition))
          .toList(),
      // medications: (json['medications'] as List)
      //     .map((medication) => Medication.fromJson(medication))
      //     .toList(),
      // allergies: (json['allergies'] as List)
      //     .map((allergy) => Allergy.fromJson(allergy))
      //     .toList(),
      // vitals: (json['vitals'] as List)
      //     .map((vital) => Vital.fromJson(vital))
      //     .toList(),
      // labResults: (json['labResults'] as List)
      //     .map((labResult) => LabResult.fromJson(labResult))
      //     .toList(),
      // procedures: (json['procedures'] as List)
      //     .map((procedure) => Procedure.fromJson(procedure))
      //     .toList(),
      // immunizations: (json['immunization'] as List)
      //     .map((immunization) => Immunization.fromJson(immunization))
      //     .toList(),
    );
  }
}

class Condition {
  final String uuid;
  final String name;
  final String onsetDate;
  final String dateRecorded;
  final String status;
  final String value;

  Condition({
    required this.uuid,
    required this.name,
    required this.onsetDate,
    required this.dateRecorded,
    required this.status,
    required this.value,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      uuid: json['uuid'],
      name: json['name'],
      onsetDate: json['onsetDate'],
      dateRecorded: json['dateRecorded'],
      status: json['status'],
      value: json['value'],
    );
  }
}

// Define similar models for Medication, Allergy, Vital, LabResult, Procedure, and Immunization.
