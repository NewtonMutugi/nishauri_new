import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/providers/bmi_filter_provider.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/providers/bmi_log_provider.dart';
import 'package:nishauri/src/features/self_screening/bmi/presentation/widgets/BMILineGraph.dart';
import 'package:nishauri/src/features/self_screening/bp/data/providers/blood_pressure_provider.dart';
import 'package:nishauri/src/features/self_screening/bp/presentation/pages/trend_chart_screen.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/providers/blood_sugar_provider.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/presentation/widgets/blood_suger_trend_chart.dart';

class GeneralDashboard extends ConsumerWidget {
  const GeneralDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bmiAsync = ref.watch(bmiFilterProvider);
    final bloodPressureAsync = ref.watch(bpFilterProvider);
    final bsFilterListAsync = ref.watch(bsFilterListProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: SizedBox(
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("BMI Trend", style: theme.textTheme.titleMedium),
                    Expanded(
                      child: bmiAsync.when(
                        data: (bmiData) {
                          return BMILineGraph(data: bmiData, filter: "Week",);
                        },

                        loading: () => Center(child: CircularProgressIndicator()),
                        error: (error, _) => Center(child: Text("No BMI Data")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: SizedBox(
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Blood Pressure Trend", style: theme.textTheme.titleMedium),
                    Expanded(
                      child: bloodPressureAsync.when(
                        data: (bpData) {

                          return TrendChartScreen(data: bpData, filter: 'Week',);
                        },
                        loading: () => Center(child: CircularProgressIndicator()),
                        error: (error, _) => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("No Blood Pressure Data"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: SizedBox(
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Blood Sugar Trend", style: theme.textTheme.titleMedium),
                    Expanded(
                      child: bsFilterListAsync.when(
                        data: (bSFilteredData) {
                          return BloodSugarTrendChart(data: bSFilteredData);
                        },

                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (error, _) => const Center(child: Text("No Blood Sugar Data")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.refresh(bmiListProvider);
          ref.refresh(bloodPressureListProvider);
          ref.refresh(bloodSugarEntriesProvider);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
