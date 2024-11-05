import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    final bloodSugarListProvider = ref.watch(bloodSugarEntriesProvider);
    final adviceAsync = ref.watch(bloodSugarListAdviceProvider);
    final theme = Theme.of(context);

    final data = bloodSugarListProvider.when(
      data: (data) {
        data.sort((a, b) => b.created_at.compareTo(a.created_at));
        return data;
      },
      error: (_, __) => [],
      loading: () => [],
    );

    final displayedData = data.isNotEmpty ? data.first : null;
    if (displayedData == null) return Center(child: CircularProgressIndicator());

    final status = _getBloodSugarStatus(displayedData.level, displayedData.condition);
    final advice = adviceAsync.when(
      data: (adviceData) => adviceData.firstWhere((ad) => ad.label == status).advice ?? 'No advice available',
      error: (_, __) => 'Error loading advice',
      loading: () => 'Loading advice...',
    );

    final data2 = bloodSugarListProvider.when(
      data: (data) {
        // Sort the data by created_at date in ascending order
        data.sort((a, b) => a.created_at.compareTo(b.created_at));

        // Return the last five entries (or all if there are less than five)
        return data.length > 5 ? data.sublist(data.length - 5) : data;
      },
      error: (_, __) => [],
      loading: () => [],
    );



    final dataPoints = data2.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), _convertToMMOL(entry.value.level));
    }).toList();

    final dateTimeList = data2.map((e) => e.created_at.toString()).toList();

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
              child: Padding(
                padding: const EdgeInsets.all(Constants.SPACING),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [FilterCard(onPressed: _changeColor)],
                    ),
                    const SizedBox(height: Constants.SPACING),
                    _buildLastRecordRow(displayedData, theme),
                    const SizedBox(height: Constants.SPACING),
                    _buildBloodSugarLevelRow(displayedData, status, theme),
                    const SizedBox(height: Constants.SPACING),
                    Text(displayedData.condition, style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                    const SizedBox(height: Constants.SPACING),
                    CustomFilterLineChart(
                      dataPoints: dataPoints,
                      dateTimes: dateTimeList,
                      gradientColors: [
                        Constants.bloodSugarColor,
                        Constants.bloodSugarColor.withOpacity(0.3),
                      ],
                      minX: 0,
                      maxX: data2.length.toDouble() - 1,
                      minY: 0.0,
                      maxY: 30.0,
                      leftTile: true,
                      bottomTile: true,
                      interval: 5,
                      filter: "Daily",
                      barColor: Constants.barColor,
                    ),
                    const SizedBox(height: Constants.SPACING),
                    _buildShowAllDataCard(data, theme),
                    const SizedBox(height: Constants.SPACING),
                    _buildAdviceCard(advice, status, theme),
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

  Row _buildLastRecordRow(displayedData, ThemeData theme) {
    return Row(
      children: [
        Text("Last Record Date:", style: theme.textTheme.bodyLarge),
        const SizedBox(width: 4),
        Text(DateFormat('dd MMM yyyy').format(displayedData.created_at), style: theme.textTheme.bodyLarge!.copyWith(color: Colors.grey, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Row _buildBloodSugarLevelRow(displayedData, String status, ThemeData theme) {
    return Row(
      children: [
        Text("${_convertToMMOL(displayedData.level)}", style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(width: 4),
        Text("MMOL/L", style: theme.textTheme.bodyMedium),
        const SizedBox(width: 4),
        Text(status, style: theme.textTheme.bodyLarge!.copyWith(color: _getStatusColor(status))),
      ],
    );
  }

  Card _buildShowAllDataCard(List data, ThemeData theme) {
    return Card(
      color: Constants.bgColor,
      child: ListTile(
        title: Text("Show All Data", style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
        onTap: () => context.goNamed(RouteNames.BLOOD_SUGAR_RECORDS, extra: data),
      ),
    );
  }

  Container _buildAdviceCard(String advice, String status, ThemeData theme) {
    return Container(
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
    );
  }
}
