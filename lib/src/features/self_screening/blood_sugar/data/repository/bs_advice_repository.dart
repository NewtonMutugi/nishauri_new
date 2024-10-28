import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/bs_advice.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/services/bs_advice_service.dart';

class BsAdviceRepository {
  final BsAdviceService _service;

  BsAdviceRepository(this._service);

  Future<List<BsAdvice>> getBloodPressuresAdvice() async {
    return await _service.fetchBloodSugarAdvice();
  }
}