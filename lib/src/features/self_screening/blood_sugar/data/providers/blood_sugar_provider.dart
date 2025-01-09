import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/bs_advice.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/blood_sugar.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/filter_bs.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/repository/blood_sugar_repository.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/repository/bs_advice_repository.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/repository/bs_filter_repository.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/services/blood_sugar_service.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/services/bs_advice_service.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/services/bs_filter_service.dart';

final bloodSugarProvider = Provider<BloodSugarRepository>((ref) {
  return BloodSugarRepository(BloodSugarService());
});

final bloodSugarEntriesProvider = FutureProvider<List<BloodSugar>>((ref) async {
  final repository = ref.watch(bloodSugarProvider);
  return await repository.getBloodSugars();
});

final bsAdviceRepositoryProvider = Provider<BsAdviceRepository>((ref) {
  return BsAdviceRepository(BsAdviceService());
});

final bloodSugarListAdviceProvider = FutureProvider<List<BsAdvice>>((ref) async {
  final repository = ref.watch(bsAdviceRepositoryProvider);
  return await repository.getBloodPressuresAdvice();
});

final bsFilterRepositoryProvider = Provider<BsFilterRepository>((ref) {
  return BsFilterRepository(BsFilterService());
});

final bsFilterListProvider = FutureProvider<FilterBs>((ref) async {
  final repository = ref.watch(bsFilterRepositoryProvider);
  return await repository.fetchBloodSugarFilters();
});
