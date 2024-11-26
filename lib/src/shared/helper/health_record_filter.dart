
import 'package:flutter/material.dart';
import 'package:nishauri/src/features/clinic_card/data/models/health_test.dart';
import 'package:nishauri/src/shared/display/heath_filter_button.dart';

DateFilter? selectedFilter;

// Helper function for applying filters
List<HealthRecordModel> applyFilter(
    List<HealthRecordModel> records,
    DateFilter selectedFilter,
    DateTime? selectedDateRangeStart,
    DateTime? selectedDateRangeEnd) {

  DateTime now = DateTime.now();
  List<HealthRecordModel> filteredRecords = [];

  switch (selectedFilter) {
    case DateFilter.today:
      filteredRecords = records.where((record) {
        DateTime visitDate = DateTime.parse(record.visitDate);
        return visitDate.isAtSameMomentAs(now);
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
      if (selectedDateRangeStart != null && selectedDateRangeEnd != null) {
        filteredRecords = records.where((record) {
          DateTime visitDate = DateTime.parse(record.visitDate);
          return visitDate.isAfter(selectedDateRangeStart) &&
              visitDate.isBefore(selectedDateRangeEnd);
        }).toList();
      }
      break;
    case DateFilter.all:
    default:
      filteredRecords = records;
      break;
  }

  return filteredRecords;
}

Future<DateTimeRange?> selectDateRange({
  required BuildContext context,
  DateTimeRange? initialDateRange,
  DateTime? firstDate,
  String? saveText,
  Color? primaryColor,
  Color? barrierColor,
}) async {
  final DateTime now = DateTime.now();

  DateTime effectiveLastDate = now;

  DateTime effectiveFirstDate = firstDate ?? DateTime(now.year - 5); // Default to 5 years ago

  DateTimeRange? picked = await showDateRangePicker(
    context: context,
    firstDate: effectiveFirstDate, // Prevent selecting dates earlier than 5 years ago
    lastDate: effectiveLastDate,   // Prevent selecting dates in the future
    initialDateRange: initialDateRange,
    saveText: saveText ?? 'Done',  // Default save text 'Done'
    barrierColor: barrierColor ?? Colors.black45,  // Default barrier color
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: primaryColor ?? Colors.blue, // Default to blue if not provided
          colorScheme: ColorScheme.light(primary: primaryColor ?? Colors.blue),
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal),
        ),
        child: child!,
      );
    },
  );

  return picked;
}


