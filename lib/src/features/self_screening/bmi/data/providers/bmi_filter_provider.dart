import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/model/filter_data.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/repositories/bmi_filter_repository.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/services/bmi_filter_service.dart';

final bmiFilterRepositoryProvider = Provider<BMIFilterRepository>((ref) {
  return BMIFilterRepository(BMIFilterService());
});

final bmiFilterProvider = FutureProvider<FilterData>((ref) async {
  final repository = ref.watch(bmiFilterRepositoryProvider);
  return await repository.fetchBMIFilter();
});