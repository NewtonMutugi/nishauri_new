
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nishauri/src/utils/constants.dart';

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
    final theme = Theme.of(context);
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
              (int index) {
            IconData iconData;
            String label;

            switch (DateFilter.values[index]) {
              case DateFilter.all:
                iconData = Icons.calendar_today;
                label = 'All';
                break;
              case DateFilter.today:
                iconData = Icons.today;
                label = 'Today';
                break;
              case DateFilter.currentWeek:
                iconData = Icons.calendar_view_week;
                label = 'This Week';
                break;
              case DateFilter.currentMonth:
                iconData = Icons.calendar_view_month;
                label = 'This Month';
                break;
              case DateFilter.dateRange:
                iconData = Icons.date_range;
                label = 'Date Range';
                break;
              default:
                iconData = Icons.help;
                label = 'Unknown';
            }

            return MenuItemButton(
              onPressed: () {
                widget.onFilterSelected(DateFilter.values[index]);
              },
              child: Row(
                children: [
                  Icon(iconData, size: Constants.BUTTON_FONT_SIZE, color: Constants.clinicCardBgColor),
                  SizedBox(width: Constants.SPACING),
                  Text(label, style: theme.textTheme.bodyMedium,),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

enum DateFilter { all, today, currentWeek, currentMonth, dateRange }

