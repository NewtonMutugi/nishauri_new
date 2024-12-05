import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/providers/bmi_filter_provider.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/providers/bmi_log_provider.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/providers/bmi_status_nutrition_provider.dart';
import 'package:nishauri/src/features/self_screening/bmi/presentation/widgets/BMILineGraph.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/shared/display/daily_card.dart';
import 'package:nishauri/src/shared/providers/selectedIndexProvider.dart';
import 'package:nishauri/src/utils/constants.dart';
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
      return Colors.blue;
    } else if (bmi < 24.9) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final bmiStatusNutritionAsync = ref.watch(bmiNutritionProvider);
    final bmiListAsync = ref.watch(bmiListProvider);
    final bmiFilter = ref.watch(bmiFilterProvider);
    final selectedIndex = ref.watch(selectedIndexProvider);

    final filter =  ["Week", "6 Months"];

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

    return Scaffold(
      body: Column(children: [
        const CustomAppBar(
          title: "BMI Calculator ⚖️",
          color: Constants.selfScreeningBgColor,
          subTitle: "Empower Your Health Journey with BMI Insights",
          svgPathGroup: "assets/images/group_clinic_card.svg",
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Constants.SPACING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: Constants.SIXTEEN,
                    runSpacing: Constants.SIXTEEN,
                    children: [
                      FilterCard(
                        columnTitles: filter,
                        onPressed: (index) {
                        ref.read(selectedIndexProvider.notifier).state = index;
                        }
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.SPACING,),
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
                            height: Constants.TWENTY,
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
                        const SizedBox(height: Constants.SPACING),
                        if (isForSelf == true)
                          SizedBox(
                            height: Constants.GRAPH_HEIGHT,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: bmiFilter.when(
                                      data: (bmiData) {
                                        return BMILineGraph(data: bmiData, filter: filter[selectedIndex],);
                                      },

                                      loading: () => Center(child: CircularProgressIndicator()),
                                      error: (error, _) => Center(child: Text("No BMI Data $error")),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(height: Constants.SPACING),
                        ExpansionTile(
                          collapsedBackgroundColor: Constants.bgColor,
                          backgroundColor: Constants.bgColor,
                          collapsedIconColor: sliderColor,
                          title: Text(
                            "Diet & Nutrition",
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: Constants.labResultsColor,
                            ),
                          ),
                          children: <Widget>[
                            const SizedBox(height: Constants.SPACING),
                            Text(
                              ' Your BMI is ($bmiCategory)',
                              style: theme.textTheme.titleLarge?.copyWith(
                                  color: sliderColor, fontWeight: FontWeight.bold
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
                          ],
                        ),
                        const SizedBox(height: Constants.SPACING),
                        Card(
                          color: Constants.bgColor,
                          child: ListTile(
                            title: Text("Show All Data", style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),),
                            trailing: const Icon(Icons.arrow_forward_ios_outlined),
                            onTap: (){
                              ref.refresh(bmiListProvider);
                              context.goNamed(RouteNames.BMI_HISTORY, extra: data);
                            },
                          ),
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
                  const SizedBox(height: Constants.SPACING),
                ],
              ),
            ),
          ),
        ),
      ]
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: Constants.TWO_HUNDRED,
            child: FloatingActionButton(
              backgroundColor: Constants.selfScreeningBgColor,
              onPressed: () {
                context.goNamed(RouteNames.BMI_CALCULATOR);
              },
              heroTag: null,
              elevation: Constants.SMALL_SPACING,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Constants.SMALL_SPACING),
                child: Text(
                    "Calculate BMI",
                    style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white)
                ),
              ),
            ),
          ),
        ],
      ),


      // bottomNavigationBar: ,
    );
  }
}
