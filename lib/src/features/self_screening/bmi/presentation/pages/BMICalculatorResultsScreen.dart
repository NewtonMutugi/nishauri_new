import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/providers/bmi_log_provider.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/providers/bmi_status_nutrition_provider.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/shared/input/Button.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/helpers.dart';
import 'package:nishauri/src/utils/routes.dart';

class BMICalculatorResultsScreen extends HookConsumerWidget {
  final double? otherBMI;
  final bool? isForSelf;
  const BMICalculatorResultsScreen({super.key, this.otherBMI, this.isForSelf});

  // Function to determine BMI category
  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Malnutrition';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal';
    } else {
      return 'Obese';
    }
  }

  // Function to get color for the BMI segment
  Color getSliderColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue; // Malnutrition
    } else if (bmi < 24.9) {
      return Colors.green; // Normal
    } else {
      return Colors.red; // Obese
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final bmiStatusNutritionAsync = ref.watch(bmiNutritionProvider);
    final bmiListAsync = ref.watch(bmiListProvider);

    final currentBMIEntries = bmiListAsync.when(
      data: (data) {
        data.sort((a, b) => b.created_at.compareTo(a.created_at));
        return data.first;
      },
      error: (error, _) {
        return null;
      },
      loading: () {
        return null;
      },
    );

    final bmi = otherBMI != null ? otherBMI : currentBMIEntries?.results;
    final bmiCategory = getBMICategory(bmi!);
    final sliderColor = getSliderColor(bmi);

    print("this self : $isForSelf");

    return Scaffold(
      body: Column(children: [
        const CustomAppBar(
            title: "BMI Calculator ⚖️",
            color: Constants.selfScreeningBgColor,
          subTitle: "Empower Your Health Journey with BMI Insights",
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Constants.SPACING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Results ${isForSelf != true ? ' for others' : ''}",
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: Constants.selfScreeningBgColor,
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(Constants.SPACING),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Your BMI is", style: theme.textTheme.titleMedium),
                              Text(
                                bmiCategory,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: sliderColor
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(Constants.SPACING),
                            child: Text(
                              bmi.toStringAsFixed(1),
                              style: theme.textTheme.titleLarge
                                  ?.copyWith(color: sliderColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 20,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Colored track
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Colors.blue,
                                          Colors.green,
                                          Colors.red,
                                        ],
                                        stops: [0.0, 0.80, 1.0],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                // Slider
                                Slider(
                                  value: bmi,
                                  onChanged: (value) {},
                                  min: 0,
                                  max: 30,
                                  activeColor: Colors.transparent,
                                  inactiveColor: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: Constants.SPACING),
                  bmiStatusNutritionAsync.when(
                    data: (data) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bmiCategory,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: sliderColor, fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: Constants.SPACING),
                        Text(
                          "Diet & Nutrition",
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Constants.labResultsColor,
                          ),
                        ),
                        const SizedBox(height: Constants.SPACING),
                        Markdown(
                          data: data
                              .where((element) =>
                          element.status == bmiCategory)
                              .first
                              .description ??
                              "",
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                        const SizedBox(height: Constants.SPACING),
                        Button(
                          title: "Re-Calculate",
                          surfixIcon: SvgPicture.asset(
                            "assets/images/refresh-circle.svg",
                            semanticsLabel: "Doctors",
                            fit: BoxFit.contain,
                          ),
                          backgroundColor: Constants.selfScreeningBgColor,
                          textColor: Colors.white,
                          onPress: () {
                            context.goNamed(RouteNames.BMI_CALCULATOR);
                          },
                        ),
                      ],
                    ),
                    error: (e, stackTrace) => Align(
                        alignment: Alignment.center, child: Text(e.toString())),
                    loading: () => const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]
      ),
      // bottomNavigationBar: ,
    );
  }
}
