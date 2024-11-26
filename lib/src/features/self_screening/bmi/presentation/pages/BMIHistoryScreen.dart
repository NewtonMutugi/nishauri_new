import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/providers/bmi_log_provider.dart';
import 'package:nishauri/src/features/self_screening/bmi/presentation/widgets/BMILineGraph.dart';
import 'package:nishauri/src/features/self_screening/bmi/presentation/widgets/BMILineList.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/shared/display/background_image_widget.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/routes.dart';

class BMIHistoryScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final bmiListAsync = ref.watch(bmiListProvider);

          return bmiListAsync.when(
            data: (data) {
              final displayedData = data.length > 5 ? data.sublist(data.length - 5) : data;
              return Column(
                children: [
                  const CustomAppBar(
                    smallTitle: "All Record Data",
                    height: Constants.SMALL_APP_BAR_HEIGHT,
                    rightBtTitle: "Record BMI",
                    path: RouteNames.BMI_CALCULATOR,
                    color: Constants.selfScreeningBgColor,
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: BMILinelist(data: data),
                            ),
                            // Expanded(
                            //   flex: 1,
                            //   child: BMILineGraph(data: displayedData),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => BackgroundImageWidget(
              customAppBar: const CustomAppBar(
                smallTitle: "All Record Data",
                height: Constants.SMALL_APP_BAR_HEIGHT,
                rightBtTitle: "Record BMI",
                // icon: Icons.trending_up,
                color: Constants.selfScreeningBgColor,
              ),
              svgImage: 'assets/images/lab-eBLOOD_SUGAR_INPUTmpty-state.svg',
              notFoundText: "No BMI Data",
              floatingButtonIcon1: Icons.refresh,
              floatingButtonAction1: () {
                ref.refresh(bmiListProvider);
              },
            ),
          );
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () {
              ref.refresh(bmiListProvider);
            },
            backgroundColor: Constants.bmiCalculatorColor,
            child: const Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}
