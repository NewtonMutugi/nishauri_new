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
    final List<FilterData> fData = [];
    fData.add(data);
    print(" filter : $data");
    final List<Color> gradientColors = [
      Constants.bmiCalculatorColor.withOpacity(0.3),
      Constants.bmiCalculatorShortcutBgColor.withOpacity(0),
    ];

        final dataPoints = fData.asMap().entries.map((entry) {
          final index = entry.key.toDouble();
          final double bmiFilter ;
          if (filter == "6 Months") {
            bmiFilter = entry.value.sixMonths.first.avgResults;
          }
          else {
            bmiFilter = entry.value.week.first.results;
          }
          return FlSpot(index, bmiFilter);
        }).toList();

    final date = fData.asMap().entries.map((e) {
      final String dateFilter;
      if (filter == "6 Months") {
        dateFilter = e.value.sixMonths.first.month;
      }
      else {
        dateFilter = e.value.week.first.dayName;
      }
      return dateFilter;
    }).toList();

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomFilterLineChart(
              dataPoints: dataPoints,
              dateTimes: date,
              minX: 0,
              maxX: dataPoints.length - 1,
              minY: 5,
              leftTile: false,
              barColor: Constants.bmiCalculatorColor,
              gradientColors: gradientColors,
              bottomTile: true,
              // dateFormat: "dd/MM/yy",
              filter: "Daily",
            ),
          ),
        );
  }
}
