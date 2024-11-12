class HealthRecordModel {
  final String uuid;
  final String visitDate;
  final String facility;
  final List<Condition> conditions;
  // final List<Medication> medications;
  // final List<Allergy> allergies;
  final List<Vital> vitals;
  // final List<LabResult> labResults;
  // final List<Procedure> procedures;
   final List<Immunization> immunizations;

  HealthRecordModel({
    required this.uuid,
    required this.visitDate,
    required this.facility,
    required this.conditions,
    // required this.medications,
    // required this.allergies,
    required this.vitals,
    // required this.labResults,
    // required this.procedures,
     required this.immunizations,
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
      vitals: (json['vitals'] as List)
          .map((vital) => Vital.fromJson(vital))
          .toList(),
      // labResults: (json['labResults'] as List)
      //     .map((labResult) => LabResult.fromJson(labResult))
      //     .toList(),
      // procedures: (json['procedures'] as List)
      //     .map((procedure) => Procedure.fromJson(procedure))
      //     .toList(),
       immunizations: (json['immunization'] as List)
           .map((immunization) => Immunization.fromJson(immunization))
          .toList(),
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

class Vital {
  final String uuid;
  final String name;
  final String weight;
  final String temp;
  final String systolic;
  final String diastolic;
  final String respiratory;
  final String oxygenSaturation;
  final String height;
  final String complain;

  Vital({
    required this.uuid,
    required this.name,
    required this.weight,
    required this.temp,
    required this.systolic,
    required this.diastolic,
    required this.respiratory,
    required this.oxygenSaturation,
    required this.height,
    required this.complain,
  });

  factory Vital.fromJson(Map<String, dynamic> json) {
    return Vital(
      uuid: json['uuid'],
      name: json['name'],
      weight: json['weight'],
      temp: json['temp'],
      systolic: json['systolic'],
      diastolic: json['diastolic'],
      respiratory: json['respiratory'],
      oxygenSaturation: json['oxygenSaturation'],
      height: json['height'],
      complain: json['complain'],
    );
  }
}

// Define similar models for Medication, Allergy, Vital, LabResult, Procedure, and Immunization.
//Immunization
class Immunization{
 final String uuuid;
 final String name;
 final String immunizationDate;
 final String manufacturer;
 final String lot;


 Immunization({
   required this.uuuid,
   required this.name,
   required this.immunizationDate,
   required this.manufacturer,
   required this.lot,
});

 factory Immunization.fromJson(Map<String, dynamic> json){
   return Immunization(
     uuuid: json['uuid'],
     name: json['name'],
     immunizationDate: json['immunizationDate'],
     manufacturer: json['manufacturer'],
     lot:   json['lot']
   );
 }

}

