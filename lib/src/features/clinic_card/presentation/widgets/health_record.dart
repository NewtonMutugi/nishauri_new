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
                  _buildButtonRow(),
                  const SizedBox(height: Constants.SPACING),
                  _buildDateRow("16 October 2024", theme),
                  const SizedBox(height: Constants.SPACING),
                  _buildHospitalRow("KENYATTA NATIONAL HOSPITAL", theme),
                  const SizedBox(height: Constants.SPACING),
                  const Divider(),
                  const SizedBox(height: Constants.SPACING),
                  _buildListView(theme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Constants.bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HealthButton(title: "Last Update", color: Constants.bgColor),
          HealthButton(title: "A - Z", color: Constants.bgColor),
        ],
      ),
    );
  }

  Widget _buildDateRow(String date, ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(date, style: theme.textTheme.titleMedium),
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
      itemCount: 3, // Adjust item count based on your data
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Card(
            child: Padding(
              padding: const EdgeInsets.all(Constants.SPACING),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAllergyRow(theme),
                        _buildSeverityRow(theme),
                      ],
                    ),
                  ),
                ],
              ),
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
        TextButton(
          onPressed: () {},
          child: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget _buildSeverityRow(ThemeData theme) {
    return Row(
      children: [
        Text("Mild", style: theme.textTheme.bodyMedium),
      ],
    );
  }
}

class HealthButton extends StatelessWidget {
  final String title;
  final Color? color;

  const HealthButton({Key? key, required this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Button(
        title: title,
        backgroundColor: color,
        titleStyle: TextStyle(color: Colors.black54),
        onPress: () {},
      ),
    );
  }
}
