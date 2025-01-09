import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/filter_bs.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/providers/blood_sugar_provider.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/shared/display/custome_filter_chart.dart';
import 'package:nishauri/src/shared/display/daily_card.dart';
import 'package:nishauri/src/shared/input/Button.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/routes.dart';

import '../../../../../shared/providers/selectedIndexProvider.dart';

class BloodSugarScreen extends ConsumerWidget {
  const BloodSugarScreen({super.key});

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
        return Colors.grey;
    }
  }

  String _getBloodSugarStatus(double level, String condition) {
    if (level > 30) level /= 18.0;

    if (condition == 'Fasting (before meals)') {
      if (level < 5.6) return 'Normal';
      if (level < 7.0) return 'Impaired Fasting';
      return 'Diabetes';
    } else if (condition == 'Postprandial (after meals)') {
      if (level < 7.8) return 'Normal';
      if (level < 11.1) return 'Impaired Glucose Tolerance';
      return 'Diabetes';
    }
    return 'Invalid condition';
  }

  double _convertToMMOL(double level) {
    return level > 30 ? double.parse((level / 18.0).toStringAsFixed(1)) : level;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloodSugarListProvider = ref.watch(bloodSugarEntriesProvider);
    final adviceAsync = ref.watch(bloodSugarListAdviceProvider);
    final selectedIndex = ref.watch(selectedIndexProvider);
    final bsFilterListAsync = ref.watch(bsFilterListProvider);
    final theme = Theme.of(context);

    final filter =  ["Day", "Week", "6 Months"];

    final data = bloodSugarListProvider.when(
      data: (data) => data..sort((a, b) => b.created_at.compareTo(a.created_at)),
      error: (_, __) => [],
      loading: () => [Center(child: CircularProgressIndicator())],
    );

    if (data.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final displayedData = data.first;
    final status = _getBloodSugarStatus(displayedData.level, displayedData.condition);

    final advice = adviceAsync.when(
      data: (adviceData) => adviceData.firstWhere((ad) => ad.label == status).advice ?? 'No advice available',
      error: (_, __) => 'Error loading advice',
      loading: () => 'Loading advice...',
    );

    final FilterBs filteredData = bsFilterListAsync.when(
      data: (data) => data,
      error: (_, __) => FilterBs(
        hourly: [],
        weekly: [],
        sixMonthly: [],
      ),
      loading: () => FilterBs(
        hourly: [],
        weekly: [],
        sixMonthly: [],
      ),
    );

    final List<FlSpot>? dataPoint;
    if (filter[selectedIndex] == "Day") {
      dataPoint = filteredData.hourly
          ?.asMap()
          .entries
          .map((entry) => FlSpot(
        entry.key.toDouble(),
        _convertToMMOL(entry.value.level ?? 0),
      ))
          .toList();
    } else if (filter[selectedIndex] == "Week") {
      dataPoint = filteredData.weekly
          ?.asMap()
          .entries
          .map((entry) => FlSpot(
        entry.key.toDouble(),
        _convertToMMOL(entry.value.level ?? 0),
      ))
          .toList();
    } else if (filter[selectedIndex] == "6 Months") {
      dataPoint = filteredData.sixMonthly
          ?.asMap()
          .entries
          .map((entry) => FlSpot(
        entry.key.toDouble(),
        _convertToMMOL(entry.value.avg_level ?? 0),
      ))
          .toList();
    } else {
      dataPoint = [];
    }
    final List<String> dateTimeList;
    if (filter[selectedIndex] == "Day") {
      dateTimeList = filteredData.hourly
          ?.asMap()
          .entries
          .map((entry) {
        final timeString = entry.value.time;
        final dateTime = timeString != null ? DateTime.parse(timeString) : DateTime.now();
        return DateFormat('dd/MM').format(dateTime);
      })
          .whereType<String>()
          .toList() ?? [];
    } else if (filter[selectedIndex] == "Week") {
      dateTimeList = filteredData.weekly
          ?.asMap()
          .entries
          .map((entry) => entry.value.dayName )
          .whereType<String>()
          .toList() ?? [];
    } else if (filter[selectedIndex] == "6 Months") {
      dateTimeList = filteredData.sixMonthly
          ?.asMap()
          .entries
          .map((entry) => entry.value.month)
          .whereType<String>()
          .toList() ?? [];
    } else {
      dateTimeList = [];
    }

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            smallTitle: "Blood Sugar",
            height: Constants.SMALL_APP_BAR_HEIGHT,
            color: Constants.selfScreeningBgColor,
            rightBtTitle: "Add Data",
            path: RouteNames.BLOOD_SUGAR_INPUT,
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
                          columnTitles:filter,
                          onPressed: (index) {
                            ref.read(selectedIndexProvider.notifier).state = index;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: Constants.SPACING),
                    Row(
                      children: [
                        Text("Last Record Date: ", style: theme.textTheme.bodyLarge),
                        Text(
                          DateFormat('dd MMM yyyy').format(displayedData.created_at),
                          style: theme.textTheme.bodyLarge!.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: Constants.SPACING),
                    Row(
                      children: [
                        Text(
                          "${_convertToMMOL(displayedData.level)}",
                          style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        Text("MMOL/L", style: theme.textTheme.bodyMedium),
                        const SizedBox(width: 4),
                        Text(status, style: theme.textTheme.bodyLarge!.copyWith(color: _getStatusColor(status))),
                      ],
                    ),
                    const SizedBox(height: Constants.SPACING),
                    Text(
                      displayedData.condition,
                      style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.blueGrey),
                    ),
                    const SizedBox(height: Constants.SPACING),
                    CustomFilterLineChart(
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
                      filter: filter[selectedIndex],
                      barColor: Constants.barColor,
                    ),
                    const SizedBox(height: Constants.SPACING),
                    Card(
                      color: Constants.bgColor,
                      child: ListTile(
                        title: Text(
                          "Show All Data",
                          style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        onTap: () => context.goNamed(RouteNames.BLOOD_SUGAR_RECORDS, extra: data),
                      ),
                    ),
                    const SizedBox(height: Constants.SPACING),
                    Container(
                      color: Constants.bgColor,
                      child: Padding(
                        padding: const EdgeInsets.all(Constants.SPACING),
                        child: ListTile(
                          title: Row(
                            children: [
                              Text(
                                'Your Blood Sugar Levels are ',
                                style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 4),
                              Text(status, style: theme.textTheme.bodyLarge!.copyWith(color: Colors.green)),
                            ],
                          ),
                          subtitle: Text(advice, style: theme.textTheme.bodyMedium),
                        ),
                      ),
                    ),
                    const SizedBox(height: Constants.SPACING),
                    Button(
                      title: "More Insight",
                      onPress: () => context.goNamed(RouteNames.BLOOD_SUGAR_INSIGHT),
                      textColor: Constants.selfScreeningBgColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
