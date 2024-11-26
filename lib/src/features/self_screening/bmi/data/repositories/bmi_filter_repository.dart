import 'package:nishauri/src/features/self_screening/bmi/data/model/bmi_log.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/model/filter_data.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/services/bmi_filter_service.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/services/bmi_log_service.dart';

class BMIFilterRepository {
  final BMIFilterService _service;

  BMIFilterRepository(this._service);

  Future<FilterData> fetchBMIFilter() async {
    return await _service.fetchBMIFilter();
  }
}
