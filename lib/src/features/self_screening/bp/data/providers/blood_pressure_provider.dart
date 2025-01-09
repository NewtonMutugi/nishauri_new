import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nishauri/src/features/self_screening/bp/data/models/blood_pressure.dart';
import 'package:nishauri/src/features/self_screening/bp/data/models/bp_advice.dart';
import 'package:nishauri/src/features/self_screening/bp/data/models/filter_bp.dart';
import 'package:nishauri/src/features/self_screening/bp/data/repository/blood_pressure_repository.dart';
import 'package:nishauri/src/features/self_screening/bp/data/repository/bp_advice_repository.dart';
import 'package:nishauri/src/features/self_screening/bp/data/repository/bp_filter_repository.dart';
import 'package:nishauri/src/features/self_screening/bp/data/services/blood_pressure_service.dart';
import 'package:nishauri/src/features/self_screening/bp/data/services/bp_advice_service.dart';
import 'package:nishauri/src/features/self_screening/bp/data/services/bp_filter_service.dart';

final bloodPressureRepositoryProvider = Provider<BloodPressureRepository>((ref) {
  return BloodPressureRepository(BloodPressureService());
});

final bloodPressureListProvider = FutureProvider<List<BloodPressure>>((ref) async {
  final repository = ref.watch(bloodPressureRepositoryProvider);
  return await repository.getBloodPressures();
});

final bpAdviceRepositoryProvider = Provider<BpAdviceRepository>((ref) {
  return BpAdviceRepository(BpAdviceService());
});

final bloodPressureListAdviceProvider = FutureProvider<List<BpAdvice>>((ref) async {
  final repository = ref.watch(bpAdviceRepositoryProvider);
  return await repository.getBloodPressuresAdvice();
});

final bsFilterRepositoryProvider = Provider<BpFilterRepository>((ref) {
  return BpFilterRepository(BpFilterService());
});

final bpFilterProvider = FutureProvider<FilterBp>((ref) async {
  final repository = ref.watch(bsFilterRepositoryProvider);
  return await repository.fetchBloodPressureFilters();
});