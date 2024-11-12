
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
