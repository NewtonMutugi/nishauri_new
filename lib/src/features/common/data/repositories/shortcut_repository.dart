import 'package:nishauri/src/utils/routes.dart';

class ShortcutRepository {
  Future<List<String>> getShortcuts()async{
    return [
      MenuItemNames.DASHBOARD,
      MenuItemNames.BMI_CALCULATOR,
      MenuItemNames.FACILITY_VISITS,
    ];
  }
}