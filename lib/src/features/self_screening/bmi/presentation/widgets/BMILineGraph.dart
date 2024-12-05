import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/model/bmi_log.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/model/filter_data.dart';
import 'package:nishauri/src/shared/charts/CustomLineChart.dart';
import 'package:nishauri/src/shared/display/custome_filter_chart.dart';
import 'package:nishauri/src/utils/constants.dart';

class BMILineGraph extends StatelessWidget {
  final FilterData data;
  final String? filter;
const BMILineGraph({required this.data, this.filter, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = [
      Constants.bmiCalculatorColor.withOpacity(0.3),
      Constants.bmiCalculatorShortcutBgColor.withOpacity(0),
    ];

    final List<FlSpot> dataPoint;

      if (filter == "Week") {
      dataPoint = data.week
          !.asMap()
          .entries
          .map((entry) => FlSpot(
        entry.key.toDouble(), entry.value.results ?? 0,
      )).toList();
    } else if (filter == "6 Months") {
      dataPoint = data.sixMonths
          !.asMap()
          .entries
          .map((entry) => FlSpot(
        entry.key.toDouble(),entry.value.avgResults ?? 0,
      ))
          .toList();
    } else {
      dataPoint = [];
    }

    final List<String> dateTimeList;
    if (filter == "Week") {
      dateTimeList = data.week
          ?.asMap()
          .entries
          .map((entry) => entry.value.dayName )
          .whereType<String>()
          .toList() ?? [];
    } else if (filter == "6 Months") {
      dateTimeList = data.sixMonths
          ?.asMap()
          .entries
          .map((entry) => entry.value.month)
          .whereType<String>()
          .toList() ?? [];
    } else {
      dateTimeList = [];
    }

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomFilterLineChart(
              dataPoints: dataPoint,
              dateTimes: dateTimeList,
              minX: 0,
              maxY: 30.0,
              maxX: dateTimeList.length - 1,
              leftTile: true,
              minY: 0,
              barColor: Constants.bmiCalculatorColor,
              gradientColors: gradientColors,
              bottomTile: true,
              interval: 5,
              filter: filter,
            ),
          ),
        );
  }
}
