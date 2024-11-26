import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nishauri/src/features/self_screening/bp/data/models/blood_pressure.dart';
import 'package:nishauri/src/features/self_screening/bp/data/providers/blood_pressure_provider.dart';
import 'package:nishauri/src/features/self_screening/bp/presentation/pages/BPLinelistScreen.dart';
import 'package:nishauri/src/features/self_screening/bp/presentation/pages/trend_chart_screen.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/shared/display/background_image_widget.dart';
import 'package:nishauri/src/shared/display/custome_filter_chart.dart';
import 'package:nishauri/src/shared/display/daily_card.dart';
import 'package:nishauri/src/shared/input/Button.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/routes.dart';

class BPMonitorScreen extends ConsumerStatefulWidget {
  @override
  _BPMonitorScreenState createState() => _BPMonitorScreenState();
}

class _BPMonitorScreenState extends ConsumerState<BPMonitorScreen> {

  String _getBloodPressureStatus(double systolic, double diastolic) {
    if (systolic < 120 && diastolic < 80) {
      return 'Optimal';
    } else if (systolic < 130 && diastolic < 80) {
      return 'Normal';
    } else if (systolic < 140 || diastolic < 90) {
      return 'Elevated';
    } else if (systolic < 160 || diastolic < 100) {
      return 'Hypertension Grade 1';
    } else if (systolic < 180 || diastolic < 110) {
      return 'Hypertension Grade 2';
    } else {
      return 'Hypertension Grade 3';
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Optimal':
        return Colors.green;
      case 'Normal':
        return Colors.blue;
      case 'Elevated':
        return Colors.orange;
      case 'Hypertension Grade 1':
        return Colors.yellow;
      case 'Hypertension Grade 2':
        return Colors.red;
      case 'Hypertension Grade 3':
        return Colors.redAccent;
      default:
        return Colors.black;
    }
  }


  void _reloadData() {
    ref.refresh(bloodPressureListProvider);
  }

  @override
  Widget build(BuildContext context) {
    final bloodPressureListAsync = ref.watch(bloodPressureListProvider);
    final theme = Theme.of(context);
    final adviceAsync = ref.watch(bloodPressureListAdviceProvider);
    return bloodPressureListAsync.when(
      data: (data) {
        data.sort((a, b) => b.created_at.compareTo(a.created_at));
        final displayedData = data.isNotEmpty ? data.first : null;
        data.sort((a, b) => a.created_at.compareTo(b.created_at));
        final chatData = data.length > 5 ? data.sublist(data.length - 5) : data;

        final status = _getBloodPressureStatus(displayedData!.systolic, displayedData.diastolic);

        final advice = adviceAsync.when(
          data: (adviceData) => adviceData.firstWhere(
                (ad) => ad.status == status,
            // orElse: () => null,
          )?.advice ?? 'No advice available',
          error: (error, _) => 'Error loading advice',
          loading: () => 'Loading advice...',
        );
        return Scaffold(
          body: Column(
            children: [
              const CustomAppBar(
                // title: "Blood Pressure",
                color: Constants.selfScreeningBgColor,
                height: Constants.SMALL_APP_BAR_HEIGHT,
                smallTitle: "Blood Pressure",
                rightBtTitle: "Add Data",
                path: RouteNames.BLOOD_PRESSURE_INPUT,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(Constants.SPACING),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: Constants.SIXTEEN,
                              runSpacing: Constants.SIXTEEN,
                              children: [
                                FilterCard(
                                    columnTitles: ["Day", "Week", "6 Months"]
                                ),
                              ],
                            ),
                            const SizedBox(height: Constants.SPACING,),
                            Row(
                              children: [
                                Text("Last Record Date:", style: theme.textTheme.bodyLarge),
                                const SizedBox(width: Constants.FOUR),
                                Text(DateFormat('dd MMM yyyy').format(displayedData!.created_at), style: theme.textTheme.bodyLarge!.copyWith(color: Colors.grey, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: Constants.SPACING,),
                            Row(
                              children: [
                                Text("${displayedData.systolic}/${displayedData.diastolic}", style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                                const SizedBox(width: Constants.FOUR),
                                Text("mmHG", style: theme.textTheme.bodyMedium),
                                const SizedBox(width: Constants.FOUR,),
                                Text(status, style: theme.textTheme.bodyLarge!.copyWith(color: _getStatusColor(status,), ),)
                              ],
                            ),
                            const SizedBox(height: Constants.SPACING,),
                            Wrap(
                              spacing: 1,
                              runSpacing: Constants.SIXTEEN,
                              children: [
                                TrendChartScreen(data: chatData,)
                              ],
                            ),
                            const SizedBox(height: Constants.SPACING,),
                            Card(
                              color: Constants.bgColor,
                              child: ListTile(
                                title: Text("Show All Data", style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),),
                                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                                onTap: (){
                                  context.goNamed(RouteNames.BLOOD_PRESSURE_RECORDS, extra: data);
                                },
                              ),
                            ),
                            const SizedBox(height: Constants.SPACING,),
                            Container(
                              decoration: BoxDecoration(
                                color: Constants.bgColor,
                                borderRadius: BorderRadius.circular(Constants.SPACING),
                                border: Border.all(color: Constants.bgColor),
                              ),
                              // color: Constants.bgColor,
                              // height: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(Constants.SPACING),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Text(
                                              'Your Blood Pressure is ',
                                              style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(width: Constants.FOUR,),
                                            Text("($status)", style: theme.textTheme.bodyLarge!.copyWith(color: _getStatusColor(status,), ),)
                                          ],
                                        ),
                                        subtitle: Text(
                                          advice,
                                          style: theme.textTheme.bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: Constants.SPACING),
                            Button(
                              title: "More Insight",
                              onPress: (){
                                context.goNamed(RouteNames.BLOOD_PRESSURE_INSIGHT);
                              },
                              textColor: Constants.selfScreeningBgColor,
                              // onPressed: () {
                              //   // implement on Pressed
                              // },
                              // child: Text('More Insight', style: theme.textTheme.bodyLarge!.copyWith(color: Constants.selfScreeningBgColor)),
                              // style: TextButton.styleFrom(
                              //   backgroundColor: Constants.bgColor,
                              //   padding: EdgeInsets.all(10),
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(8), // Rounded corners
                              //   ),
                              // ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: _reloadData,
                child: Icon(Icons.refresh),
                heroTag: null,
              ),
            ],
          ),
        );
      },
      error: (error, _) => BackgroundImageWidget(
        customAppBar: const CustomAppBar(
          title: "Blood Pressure Monitor 📈",
          color: Constants.bmiCalculatorColor,
        ),
        svgImage: 'assets/images/lab-empty-state.svg',
        notFoundText: "No BP Data Available to display",
        floatingButtonIcon1: Icons.refresh,
        floatingButtonAction1: () {
          _reloadData();
        },
      ),
      loading: () => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Loading Blood Pressure",
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: Constants.SPACING * 2),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
