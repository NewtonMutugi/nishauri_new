import 'package:nishauri/src/features/self_screening/bmi/data/model/bmi_nutrition_maping.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/services/bmi_calculator_service.dart';

class BMIStatusNutritionRepository {
  final BMICalculatorService _service;

  BMIStatusNutritionRepository(this._service);

  Future<List<BMIStatusNutrition>> getBMIStatusNutrition() async {
      final nutrition = await _service.getBMIStatusNutrition();
      return nutrition;
  }
}