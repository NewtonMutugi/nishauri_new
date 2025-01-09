import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nishauri/src/features/self_screening/bp/data/models/filter_bp.dart';
import 'package:nishauri/src/shared/charts/CustomeMultLineChart.dart';
import 'package:nishauri/src/utils/constants.dart';

class TrendChartScreen extends StatelessWidget {
  final FilterBp data;
  final String filter;
  const TrendChartScreen({
    required this.data, required this.filter,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<FlSpot> systolicSpots;

    if (filter == "Day") {
      systolicSpots = data.hourly
          ?.asMap()
          .entries
          .map((entry) => FlSpot(
        entry.key.toDouble(),entry.value.systolic ?? 0,
      ))
          .toList() ?? [];
    } else if (filter == "Week") {
      systolicSpots = data.weekly
          ?.asMap()
          .entries
          .map((entry) => FlSpot(
        entry.key.toDouble(),entry.value.systolic ?? 0,
      ))
          .toList() ?? [];
    } else if (filter == "6 Months") {
      systolicSpots = data.sixMonthly
          ?.asMap()
          .entries
          .map((entry) => FlSpot(
        entry.key.toDouble(),entry.value.avg_systolic ?? 0,
      ))
          .toList() ?? [];
    } else {
      systolicSpots = [];
    }

    final List<FlSpot> diastolicSpots;

    if (filter == "Day") {
      diastolicSpots = data.hourly
          ?.asMap()
          .entries
          .map((entry) => FlSpot(
        entry.key.toDouble(),entry.value.diastolic ?? 0,
      ))
          .toList() ?? [];
    } else if (filter == "Week") {
      diastolicSpots = data.weekly
          ?.asMap()
          .entries
          .map((entry) => FlSpot(
        entry.key.toDouble(),entry.value.diastolic ?? 0,
      ))
          .toList() ?? [];
    } else if (filter == "6 Months") {
      diastolicSpots = data.sixMonthly
          ?.asMap()
          .entries
          .map((entry) => FlSpot(
        entry.key.toDouble(),entry.value.avg_diastolic ?? 0,
      ))
          .toList() ?? [];
    } else {
      diastolicSpots = [];
    }


    final List<String> dateTimeList;
    if (filter == "Day") {
      dateTimeList = data.hourly
          ?.asMap()
          .entries
          .map((entry) {
        final timeString = entry.value.time;
        final dateTime = timeString != null ? DateTime.parse(timeString) : DateTime.now();
        return DateFormat('dd/MM').format(dateTime);
      })
          .whereType<String>()
          .toList() ?? [];
    } else if (filter == "Week") {
      dateTimeList = data.weekly
          ?.asMap()
          .entries
          .map((entry) => entry.value.dayName )
          .whereType<String>()
          .toList() ?? [];
    } else if (filter == "6 Months") {
      dateTimeList = data.sixMonthly
          ?.asMap()
          .entries
          .map((entry) => entry.value.month)
          .whereType<String>()
          .toList() ?? [];
    } else {
      dateTimeList = [];
    }

        return Container(
          height: 350,
          child:           Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomMultiLineChart(
                lineBarsData: [
                  LineChartBarData(
                    spots: systolicSpots,
                    isCurved: true,
                    color: Constants.barColor,
                    barWidth: 2,
                    belowBarData: BarAreaData(
                      show: false,
                      gradient: LinearGradient(
                        colors: [Colors.red.withOpacity(0.3), Colors.red.withOpacity(0)],
                      ),
                    ),
                    dotData: FlDotData(show: true),
                  ),
                  LineChartBarData(
                    spots: diastolicSpots,
                    isCurved: true,
                    color: Constants.facilityDirectoryColor,
                    barWidth: 2,
                    belowBarData: BarAreaData(
                      show: false,
                      gradient: LinearGradient(
                        colors: [Colors.orange.withOpacity(0.3), Colors.orange.withOpacity(0)],
                      ),
                    ),
                    dotData: FlDotData(show: true),
                  ),
                ],
                minX: 0,
                maxX: dateTimeList.length - 1,
                dateTimes: dateTimeList,
                showLeftTitles: false,
                filter: filter,
              ),
            ),
          ),
        );
  }
}
