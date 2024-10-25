import 'package:nishauri/src/features/self_screening/bp/data/models/blood_pressure.dart';
import 'package:nishauri/src/features/self_screening/bp/data/models/bp_advice.dart';
import 'package:nishauri/src/features/self_screening/bp/data/services/blood_pressure_service.dart';
import 'package:nishauri/src/features/self_screening/bp/data/services/bp_advice_service.dart';

class BpAdviceRepository {
  final BpAdviceService _service;

  BpAdviceRepository(this._service);

  Future<List<BpAdvice>> getBloodPressuresAdvice() async {
    return await _service.fetchBloodPressuresAdvice();
  }
}