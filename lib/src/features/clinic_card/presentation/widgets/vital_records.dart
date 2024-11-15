import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nishauri/src/features/clinic_card/data/models/health_test.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/shared/helper/health_record_filter.dart';
import 'package:nishauri/src/utils/constants.dart';

import '../../../../shared/display/heath_filter_button.dart';

class VitalHealthRecord extends StatefulWidget {
  const VitalHealthRecord({Key? key}) : super(key: key);

  @override
  _VitalHealthRecord createState() => _VitalHealthRecord();
}

class _VitalHealthRecord extends State<VitalHealthRecord> {
  // Store the selected filter
  DateFilter? selectedFilter;
  DateTimeRange? selectedDateRange;

  Future<List<HealthRecordModel>> _loadHealthRecords() async {
    final responseString = await rootBundle.loadString('assets/data/visits.json');
    final List<dynamic> json = jsonDecode(responseString);
    return json.map((e) => HealthRecordModel.fromJson(e)).toList();
  }

  Future<List<HealthRecordModel>> _applyFilter(List<HealthRecordModel> records) async {
    List<HealthRecordModel> filteredRecords = applyFilter(
      records,
      selectedFilter ?? DateFilter.all,
      selectedDateRange?.start,
      selectedDateRange?.end,
    );

    return filteredRecords;
  }

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
            height: Constants.APP_BAR_HEIGHT,
            smallTitle: "Vitals",
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
        _buildVitalList(record.vitals, theme),
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

  Widget _buildVitalList(List<Vital> vitals, ThemeData theme) {
    if (vitals.isEmpty) {
      return const Center(
          child:Text('No Vitals recorded.')
      );
    }

    return Column(
      children: vitals.map((vital) => _buildVitalRow(vital, theme)).toList(),
    );
  }

  Widget _buildVitalRow(Vital vital, ThemeData theme) {
    return ListTile(
      title: ExpansionTile(
        title: Row(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVitalsRow(vital, theme),
              ],
            )),
          ],
        ),
        children: <Widget>[
          ListTile(
            title: Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Temperature", style: theme.textTheme.bodySmall),
                    Text(vital.temp, style: theme.textTheme.bodySmall),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Systolic  B.P", style: theme.textTheme.bodySmall),
                    Text(vital.systolic, style: theme.textTheme.bodySmall),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Diastolic  B.P", style: theme.textTheme.bodySmall),
                    Text(vital.diastolic, style: theme.textTheme.bodySmall),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Respiratory Rate", style: theme.textTheme.bodySmall),
                    Text(vital.respiratory, style: theme.textTheme.bodySmall),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Oxygen Saturation", style: theme.textTheme.bodySmall),
                    Text(vital.oxygenSaturation, style: theme.textTheme.bodySmall),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Weight", style: theme.textTheme.bodySmall),
                    Text(vital.weight, style: theme.textTheme.bodySmall),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Height", style: theme.textTheme.bodySmall),
                    Text(vital.height, style: theme.textTheme.bodySmall),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Presenting Complaints", style: theme.textTheme.bodySmall),
                    Text(vital.complain, style: theme.textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVitalsRow(Vital vital, ThemeData theme) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/images/boldDuotoneMedicineStethoscope.svg",
          width: Constants.TWENTY,
          height: Constants.TWENTY,
        ),
        const SizedBox(width: Constants.SPACING),
        Expanded(
          child:Text(vital.name,
            style: theme.textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,  // Truncate if too long
            maxLines: 1,
          ),
        ),
      ],
    );
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
      ],
    );
  }
}