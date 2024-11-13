import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nishauri/src/features/clinic_card/data/models/health_test.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/shared/display/heath_filter_button.dart';
import 'package:nishauri/src/shared/extensions/extensions.dart';
import 'package:nishauri/src/shared/helper/health_record_filter.dart';
import 'package:nishauri/src/utils/constants.dart';

class ConditionHealthRecord extends StatefulWidget {
  const ConditionHealthRecord({Key? key}) : super(key: key);

  @override
  _ConditionHealthRecordState createState() => _ConditionHealthRecordState();
}

class _ConditionHealthRecordState extends State<ConditionHealthRecord> {
  // Store the selected filter
  DateFilter? selectedFilter;
  DateTimeRange? selectedDateRange;

  // Load health records from a JSON file
  Future<List<HealthRecordModel>> _loadHealthRecords() async {
    final responseString = await rootBundle.loadString('assets/data/visits.json');
    final List<dynamic> json = jsonDecode(responseString);
    return json.map((e) => HealthRecordModel.fromJson(e)).toList();
  }

  // Apply the selected filter to the health records
  Future<List<HealthRecordModel>> _applyFilter(List<HealthRecordModel> records) async {
    List<HealthRecordModel> filteredRecords = applyFilter(
      records,
      selectedFilter ?? DateFilter.all,
      selectedDateRange?.start,
      selectedDateRange?.end,
    );

    return filteredRecords;
  }

  // Function to handle date range selection
  Future<void> _selectDateRange(BuildContext context) async {
    DateTimeRange? pickedRange = await selectDateRange(
      context: context,
      initialDateRange: selectedDateRange,
      primaryColor: Constants.bmiCalculatorColor,
      barrierColor: Constants.bmiCalculatorColor,
    );

    if (pickedRange != null && pickedRange != selectedDateRange) {
      setState(() {
        selectedDateRange = pickedRange;
        selectedFilter = DateFilter.dateRange;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            color: Constants.clinicCardBgColor,
            height: 120,
            smallTitle: "Conditions",
            rightBtTitle: "",
          ),
          Expanded(
            child: FutureBuilder<List<HealthRecordModel>>(
              future: _loadHealthRecords(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final healthRecords = snapshot.data!;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(Constants.SPACING),
                    child: Column(
                      children: [
                        _buildFilterMenu(theme),
                        FutureBuilder<List<HealthRecordModel>>(
                          future: _applyFilter(healthRecords),
                          builder: (context, filteredSnapshot) {
                            if (filteredSnapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (filteredSnapshot.hasError) {
                              return Center(child: Text('Error: ${filteredSnapshot.error}'));
                            } else if (filteredSnapshot.hasData) {
                              final filteredRecords = filteredSnapshot.data!;

                              // Check if the filtered list is empty and show 'No Data' text
                              if (filteredRecords.isEmpty) {
                                return const Center(child: Text('No data available.'));
                              }

                              return Column(
                                children: filteredRecords
                                    .map((record) => _buildRecordView(record, theme))
                                    .toList(),
                              );
                            } else {
                              return const Center(child: Text('No data available.'));
                            }
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text('No data available.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // Record View Widgets and Helpers (No changes here, same as before)
  Widget _buildRecordView(HealthRecordModel record, ThemeData theme) {
    return Column(
      children: [
        _buildDateRow(record.visitDate, theme),
        const SizedBox(height: Constants.SPACING),
        _buildHospitalRow(record.facility, theme),
        const SizedBox(height: Constants.SPACING),
        const Divider(),
        _buildConditionList(record.conditions, theme),
        const SizedBox(height: Constants.SPACING),
        const Divider(),
      ],
    );
  }

  Widget _buildDateRow(String date, ThemeData theme) {
    return Row(
      children: [
      Expanded(
        child: Text(
        date,
        style: theme.textTheme.titleSmall),
      ),
      ],
    );
  }

  Widget _buildHospitalRow(String hospital, ThemeData theme) {
    return Row(
      children: [
        Expanded( // Wrap the Text widget in Expanded
          child: Text(
            hospital,
            style: theme.textTheme.titleMedium,
            overflow: TextOverflow.ellipsis, // Truncate if too long
          ),
        ),
      ],
    );
  }

  Widget _buildConditionList(List<Condition> conditions, ThemeData theme) {
    if (conditions.isEmpty) {
      return const Center(
          child:Text('No conditions recorded.')
      );
    }

    return Column(
      children: conditions.map((condition) => _buildConditionRow(condition, theme)).toList(),
    );
  }

  Widget _buildConditionRow(Condition condition, ThemeData theme) {
    return ListTile(
      title: ExpansionTile(
        title: Row(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildConditionsRow(condition, theme),
              ],
            )),
          ],
        ),
        children: <Widget>[
          ListTile(
            title: Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recorded", style: theme.textTheme.bodySmall),
                    Text(condition.dateRecorded, style: theme.textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildConditionsRow(Condition condition, ThemeData theme) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/images/boldDuotoneMedicineStethoscope.svg",
          width: 20,
          height: 20,
        ),
        const SizedBox(width: Constants.SPACING),
        Expanded(
        child:Text(condition.name,
           style: theme.textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,  // Truncate if too long
            maxLines: 1,
            ),),
        const Spacer(),
        Text(condition.status.titleCase, style: theme.textTheme.bodySmall?.copyWith(color: getStatusColor(condition.status))),
      ],
    );
  }

  Color getStatusColor(String status) {
    if (status == 'ACTIVE') {
      return Constants.programsColor;
    } else if (status == 'INACTIVE') {
      return Constants.facilityDirectoryColor;
    } else {
      return Constants.selfScreeningBgColor;
    }
  }

  // Build the filter menu with the date range option
  Widget _buildFilterMenu(ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        HealthButton(
          onFilterSelected: (filter) {
            setState(() {
              selectedFilter = filter;
              if (filter == DateFilter.dateRange) {
                // Trigger the date range picker when the date range filter is selected
                _selectDateRange(context);
              }
            });
          },
        ),
        // if (selectedDateRange != null)
          // Padding(
          //   padding: const EdgeInsets.only(left: Constants.SPACING),
          //   child: Text(
          //     'From ${selectedDateRange!.start.toLocal()} - ${selectedDateRange!.end.toLocal()}',
          //     style: theme.textTheme.bodyMedium,
          //   ),
          // ),
      ],
    );
  }
}
