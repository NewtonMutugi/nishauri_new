import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
