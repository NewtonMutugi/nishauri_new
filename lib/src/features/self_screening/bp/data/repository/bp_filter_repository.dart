import 'package:nishauri/src/features/self_screening/bp/data/models/filter_bp.dart';
import 'package:nishauri/src/features/self_screening/bp/data/services/bp_filter_service.dart';

class BpFilterRepository {
  final BpFilterService _service;

  BpFilterRepository(this._service);

  Future<FilterBp> fetchBloodPressureFilters() async {
    return await _service.fetchBloodPressureFilters();
  }
}