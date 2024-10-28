
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/providers/blood_sugar_provider.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/shared/display/custome_filter_chart.dart';
import 'package:nishauri/src/shared/display/daily_card.dart';
import 'package:nishauri/src/shared/input/Button.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/routes.dart';

class BloodSugarScreen extends ConsumerStatefulWidget {
  const BloodSugarScreen({super.key});

  @override
  _BloodSugarScreenState createState() => _BloodSugarScreenState();
}

class _BloodSugarScreenState extends ConsumerState<BloodSugarScreen> {
  Color buttonColor = Colors.blue;

  void _changeColor() {
    setState(() {
      buttonColor = buttonColor == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Normal':
        return Colors.green;
      case 'Impaired fasting':
        return Colors.yellow;
      case 'Impaired Glucose Tolerance':
        return Colors.orange;
      case 'Diabetes':
        return Colors.red;
      default:
        return Colors.white24;
    }
  }

  String _getBloodSugarStatus(double level, String condition) {
    if (condition == 'Fasting (before meals)'){
      if (level < 100) {
        return 'Normal';
      } else if (100 <= level && level < 126) {
        return 'Impaired Fasting';
      }
      else {
        return 'Diabetes';
      }
    }
    else if (condition == 'Postprandial (after meals)'){
      if (level < 140) {
        return 'Normal';
      } else if (140 <= level && level < 200) {
        return 'Impaired Glucose Tolerance';
      }
      else {
        return 'Diabetes';
      }
    } else {
      return 'Invalid condition';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloodSugarListProvider = ref.watch(bloodSugarEntriesProvider);
    final adviceAsync = ref.watch(bloodSugarListAdviceProvider);
    final theme = Theme.of(context);



    final data = bloodSugarListProvider.when(
      data: (data) {
        data.sort((a, b) => b.created_at.compareTo(a.created_at));
        return data ?? [];
      },
      error: (error, _) {
        return [];
      },
      loading: () {
        return [];
      },
    );

    final displayedData = data.isNotEmpty ? data.first : null;

    final status = _getBloodSugarStatus(displayedData.level, displayedData.condition);

    final advice = adviceAsync.when(
      data: (adviceData) => adviceData.firstWhere(
            (ad) => ad.label == status,
        // orElse: () => null,
      ).advice ?? 'No advice available',
      error: (error, _) => 'Error loading advice',
      loading: () => 'Loading advice...',
    );

    final dataPoints = data.asMap().entries.map((entry) {
      final index = entry.key.toDouble();
      final systolic = entry.value.level;
      return FlSpot(index, systolic);
    }).toList();

    final dateTimeList = data.asMap().entries.map((e) {
      return e.value.created_at.toString();
    }).toList();

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            smallTitle: "Blood Sugar",
            height: 120,
            color: Constants.selfScreeningBgColor,
            rightBtTitle: "Add Data",
            path: RouteNames.BLOOD_SUGAR_INPUT,
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
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            FilterCard(
                              onPressed: _changeColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: Constants.SPACING,),
                        Row(
                          children: [
                            Text("Last Record Date:", style: theme.textTheme.bodyLarge),
                            const SizedBox(width: 4),
                            Text(DateFormat('dd MMM yyyy').format(displayedData!.created_at), style: theme.textTheme.bodyLarge!.copyWith(color: Colors.grey, fontWeight: FontWeight.bold)),
                          ],
                        ),

                        const SizedBox(height: Constants.SPACING,),
                        Row(
                          children: [
                            Text("${displayedData.level}", style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 4),
                            Text("MM/GH", style: theme.textTheme.bodyMedium),
                            const SizedBox(width: 4,),
                            Text(status, style: theme.textTheme.bodyLarge!.copyWith(color: _getStatusColor(status,), ),)
                          ],
                        ),
                        const SizedBox(height: Constants.SPACING),
                        Text(displayedData.condition, style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.blueGrey),),
                        const SizedBox(height: Constants.SPACING,),
                        Wrap(
                          spacing: 1,
                          runSpacing: 16,
                          children: [
                            CustomFilterLineChart(
                              dataPoints: dataPoints,
                              dateTimes: dateTimeList,
                              gradientColors: [
                                Constants.bloodSugarColor,
                                Constants.bloodSugarColor.withOpacity(0.3),
                              ],
                              minX: 0,
                              maxX: data.length.toDouble() - 1,
                              minY: 40.0,
                              maxY: 400.0,
                              leftTile: false,
                              bottomTile: true,
                              interval: 80,
                              // dateFormat: "HH:mm-dd",
                              filter: "Daily",
                              barColor: Constants.barColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: Constants.SPACING,),
                        Card(
                          color: Constants.bgColor,
                          child: ListTile(
                            title: Text("Show All Data", style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),),
                            trailing: const Icon(Icons.arrow_forward_ios_outlined),
                            onTap: (){
                              context.goNamed(RouteNames.BLOOD_SUGAR_RECORDS, extra: data);
                            },
                          ),
                        ),
                        const SizedBox(height: Constants.SPACING,),
                        Container(
                          color: Constants.bgColor,
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
                                          'Your Blood Sugar Levels are ',
                                          style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(width: 4,),
                                        Text(status, style: theme.textTheme.bodyLarge!.copyWith(color: Colors.green),),
                                        const SizedBox(height: Constants.SPACING,),
                                      ],
                                    ),
                                    subtitle: Text(
                                      advice,
                                      style: theme.textTheme.bodyMedium,
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
                            context.goNamed(RouteNames.BLOOD_SUGAR_INSIGHT);
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
    );
  }
}
