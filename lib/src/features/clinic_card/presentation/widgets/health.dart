import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nishauri/src/features/clinic_card/data/models/health_test.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/utils/constants.dart';

class HealthRecordTest extends StatefulWidget {
  const HealthRecordTest({Key? key}) : super(key: key);

  @override
  _HealthRecordTestState createState() => _HealthRecordTestState();
}

class _HealthRecordTestState extends State<HealthRecordTest> {
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
    if (selectedFilter == null || selectedFilter == DateFilter.all) {
      return records; // Return all records if no filter or 'All Data' is selected
    }

    DateTime now = DateTime.now();
    List<HealthRecordModel> filteredRecords = [];

    switch (selectedFilter) {
      case DateFilter.today:
        filteredRecords = records.where((record) {
          return DateTime.parse(record.visitDate).isAtSameMomentAs(now);
        }).toList();
        break;
      case DateFilter.currentWeek:
        filteredRecords = records.where((record) {
          DateTime visitDate = DateTime.parse(record.visitDate);
          return visitDate.isAfter(now.subtract(Duration(days: now.weekday - 1))) &&
              visitDate.isBefore(now.add(Duration(days: 7 - now.weekday)));
        }).toList();
        break;
      case DateFilter.currentMonth:
        filteredRecords = records.where((record) {
          DateTime visitDate = DateTime.parse(record.visitDate);
          return visitDate.month == now.month && visitDate.year == now.year;
        }).toList();
        break;
      case DateFilter.dateRange:
        if (selectedDateRange != null) {
          filteredRecords = records.where((record) {
            DateTime visitDate = DateTime.parse(record.visitDate);
            return visitDate.isAfter(selectedDateRange!.start) &&
                visitDate.isBefore(selectedDateRange!.end);
          }).toList();
        }
        break;
      default:
        filteredRecords = records;
        break;
    }

    return filteredRecords;
  }

  // Function to handle date range selection
  Future<void> _selectDateRange(BuildContext context) async {
    final DateTime now = DateTime.now();
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 1),
      initialDateRange: selectedDateRange,
      saveText: 'Done',
      barrierColor: Constants.bmiCalculatorColor,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Constants.bmiCalculatorColor,
            // accentColor: Constants.programsColor,
            colorScheme: ColorScheme.light(primary: Constants.bmiCalculatorColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
        selectedFilter = DateFilter.dateRange; // Automatically switch to 'dateRange' filter
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
        Text(date, style: theme.textTheme.titleMedium),
      ],
    );
  }

  Widget _buildHospitalRow(String hospital, ThemeData theme) {
    return Row(
      children: [
        Text(hospital, style: theme.textTheme.titleLarge),
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
        Text(condition.name, style: theme.textTheme.titleMedium),
        const Spacer(),
        Text(condition.status, style: theme.textTheme.bodyMedium?.copyWith(color: getStatusColor(condition.status))),
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

class HealthButton extends StatefulWidget {
  final Function(DateFilter) onFilterSelected;

  const HealthButton({Key? key, required this.onFilterSelected}) : super(key: key);

  @override
  _HealthButtonState createState() => _HealthButtonState();
}

class _HealthButtonState extends State<HealthButton> {
  DateFilter? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.1,
      child: MenuAnchor(
        builder: (BuildContext context, MenuController controller, Widget? child) {
          return IconButton(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            icon: SvgPicture.asset(
              "assets/images/clinic_menu.svg",
              semanticsLabel: "Doctors",
              fit: BoxFit.contain,
              height: 40,
              width: 40,
            ),
            tooltip: 'Show menu',
          );
        },
        menuChildren: List<MenuItemButton>.generate(
          DateFilter.values.length,
              (int index) => MenuItemButton(
            onPressed: () {
              widget.onFilterSelected(DateFilter.values[index]);
            },
            child: Text(DateFilter.values[index].toString().split('.').last),
          ),
        ),
      ),
    );
  }
}

enum DateFilter { all, today, currentWeek, currentMonth, dateRange }
