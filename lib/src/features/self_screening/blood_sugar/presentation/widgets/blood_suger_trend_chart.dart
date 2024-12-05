import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/filter_bs.dart';
import 'package:nishauri/src/shared/display/custome_filter_chart.dart';
import 'package:nishauri/src/utils/constants.dart';

class BloodSugarTrendChart extends StatelessWidget {
  final FilterBs data;
  const BloodSugarTrendChart({
    required this.data,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    double _convertToMMOL(double level) {
      return level > 30 ? double.parse((level / 18.0).toStringAsFixed(1)) : level;
    }

    final List<FlSpot>? dataPoint = data.weekly
          ?.asMap()
          .entries
          .map((entry) => FlSpot(
        entry.key.toDouble(),
        _convertToMMOL(entry.value.level ?? 0),
      )).toList();
    final List<String> dateTimeList = data.weekly
          ?.asMap()
          .entries
          .map((entry) => entry.value.dayName )
          .whereType<String>()
          .toList() ?? [];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomFilterLineChart(
          dataPoints: dataPoint,
          dateTimes: dateTimeList,
          gradientColors: [
            Constants.bloodSugarColor,
            Constants.bloodSugarColor.withOpacity(0.3),
          ],
          minX: 0,
          maxX: dateTimeList.length.toDouble() - 1,
          minY: 0.0,
          maxY: 30.0,
          leftTile: true,
          bottomTile: true,
          interval: 5,
          barColor: Constants.barColor,
        ),
      ),
    );
  }
}
