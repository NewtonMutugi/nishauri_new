import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/filter_bs.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/services/bs_filter_service.dart';

class BsFilterRepository {
  final BsFilterService _service;

  BsFilterRepository(this._service);

  Future<FilterBs> fetchBloodSugarFilters() async {
    return await _service.fetchBloodSugarFilters();
  }
}