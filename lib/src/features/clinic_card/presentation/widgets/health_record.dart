import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/shared/display/daily_card.dart';
import 'package:nishauri/src/shared/input/Button.dart';
import 'package:nishauri/src/utils/constants.dart';

class HealthRecord extends StatelessWidget {
  const HealthRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            color: Constants.clinicCardBgColor,
            height: 120,
            smallTitle: "Allergies",
            rightBtTitle: "",
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Constants.SPACING),
              child: Column(
                children: [
                  const SizedBox(height: Constants.SPACING),
                  _buildDateRow("16 October 2024", theme),
                  const SizedBox(height: Constants.SPACING),
                  _buildHospitalRow("KENYATTA NATIONAL HOSPITAL", theme),
                  const SizedBox(height: Constants.SPACING),
                  const Divider(),
                  _buildListView(theme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildButtonRow() {
  //   return Container(
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(12),
  //       color: Constants.bgColor,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.3),
  //           spreadRadius: 2,
  //           blurRadius: 5,
  //           offset: const Offset(0, 3),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         HealthButton(title: "Last Update", color: Constants.bgColor),
  //         HealthButton(title: "A - Z", color: Constants.bgColor),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildDateRow(String date, ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(date, style: theme.textTheme.titleMedium),
        HealthButton(),
      ],
    );
  }

  Widget _buildHospitalRow(String hospital, ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hospital, style: theme.textTheme.titleLarge),
      ],
    );
  }

  Widget _buildListView(ThemeData theme) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Card(
            child: Padding(
              padding: const EdgeInsets.all(Constants.SPACING),
              child: ExpansionTile(
                title:Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildAllergyRow(theme),
                          // _buildSeverityRow(theme),
                        ],
                      ),
                    ),
                  ],
                ),
                children: [
                  ListTile(
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Reactions", style: theme.textTheme.bodyMedium,),
                            Text("Headache, Arrythmia", style: theme.textTheme.bodySmall,)
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Onset Date", style: theme.textTheme.bodyMedium,),
                            Text("25 October, 2024", style: theme.textTheme.bodySmall,)
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ),
          ),
          
        );
      },
    );
  }

  Widget _buildAllergyRow(ThemeData theme) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/images/boldDuotoneFoldersFolderPathConnect.svg",
          width: 20,
          height: 20,
        ),
        const SizedBox(width: Constants.SPACING),
        Text("Allergies", style: theme.textTheme.titleMedium),
        Spacer(),
        Text("Mild", style: theme.textTheme.bodyMedium),
        // TextButton(
        //   onPressed: () {},
        //   child: const Icon(Icons.chevron_right),
        // ),
      ],
    );
  }

  // Widget _buildSeverityRow(ThemeData theme) {
  //   return Row(
  //     children: [
  //       Text("Mild", style: theme.textTheme.bodyMedium),
  //     ],
  //   );
  // }
}

class HealthButton extends StatefulWidget {
  const HealthButton({Key? key}) : super(key: key);

  @override
  _HealthButtonState createState() => _HealthButtonState();
}

class _HealthButtonState extends State<HealthButton> {
  // Define the selectedMenu variable
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: MenuAnchor(
        builder: (BuildContext context, MenuController controller, Widget? child) {
          return IconButton(
            onPressed: () {
              // Open or close the menu on button press
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
              height: 30,
              width: 30,
            ),
            // icon: const Icon(Icons.more_horiz),
            tooltip: 'Show menu',
          );
        },
        menuChildren: List<MenuItemButton>.generate(
          3,
              (int index) => MenuItemButton(
            onPressed: () {
              // Update the selectedMenu state when a menu item is pressed
              setState(() {
                selectedMenu = SampleItem.values[index];
              });
            },
            child: Text('Item ${index + 1}'),
          ),
        ),
      ),
    );
  }
}

// Enum to represent sample menu items
enum SampleItem {
  item1,
  item2,
  item3,
}
