import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/blood_sugar.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/shared/display/background_image_widget.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/routes.dart';

class BloodSugarRecords extends StatelessWidget {
  final List<BloodSugar> data;

  const BloodSugarRecords({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (data.isEmpty)
    {
      BackgroundImageWidget(
        customAppBar: const CustomAppBar(
          color: Constants.selfScreeningBgColor,
          height: 120,
          smallTitle: "All Record Data",
          rightBtTitle: "",
        ), svgImage: 'assets/images/emptyself_screening.svg',
        notFoundText: 'No Data Recorded Yet',
      );
    }

    double _convertToMMOL(double level) {
      if (level > 30) {
        level = level / 18.0;
      }
      return double.parse(level.toStringAsFixed(1));
    }

    String _getBloodSugarStatus(double level, String condition) {
      // If the level is greater than 30, assume it's in mg/dL and convert to mmol/L
      if (level > 30) {
        level = level / 18.0;
      }

      if (condition == 'Fasting (before meals)') {
        if (level < 5.6) {
          return 'Normal';
        } else if (5.6 <= level && level < 7.0) {
          return 'Impaired Fasting';
        } else {
          return 'Diabetes';
        }
      } else if (condition == 'Postprandial (after meals)') {
        if (level < 7.8) {
          return 'Normal';
        } else if (7.8 <= level && level < 11.1) {
          return 'Impaired Glucose Tolerance';
        } else {
          return 'Diabetes';
        }
      } else {
        return 'Invalid condition';
      }
    }

    Color _getStatusColor(String status) {
      switch (status) {
        case 'Normal':
          return Colors.green;
        case 'Impaired fasting':
          return Colors.yellow;
        case 'Impaired Glucose Tolerance':
          return Colors.orange;
        case 'Diabetes':
          return Colors.red;
        default:
          return Colors.black;
      }
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            color: Constants.selfScreeningBgColor,
            height: 120,
            smallTitle: "All Record Data",
            rightBtTitle: "Add Data",
              path: RouteNames.BLOOD_SUGAR_INPUT
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Constants.SPACING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MMOL/L",
                    style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
                  ),
                  Expanded(
                    child: Container(
                      color: Constants.bgColor,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final bs = data[index];
                          final status = _getBloodSugarStatus(bs.level, bs.condition);
                          return Column(
                            children: [
                              ListTile(
                                leading: SvgPicture.asset(
                                  "assets/images/boldDuotoneMedicinePulse.svg",
                                  width: 20,
                                  height: 20,
                                ),
                                title: ExpansionTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '${_convertToMMOL(bs.level)}',
                                                style: theme.textTheme.titleMedium!.copyWith(color: _getStatusColor(status))
                                              ),

                                              TextSpan(
                                                text: ' mmol/L',
                                                style: theme.textTheme.titleSmall
                                              ),
                                            ]
                                          )
                                      ),
                                      // Text(
                                      //   "${bs.level}",
                                      //   style: theme.textTheme.titleMedium,
                                      // ),
                                      Text(
                                        DateFormat('dd MMM yy HH:mm').format(DateTime.parse(bs.created_at.toString()),), style: theme.textTheme.bodyMedium!.copyWith(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    ListTile(
                                      title: bs.condition != null && bs.condition!.isNotEmpty
                                          ? Text('Condition: ${bs.condition}')
                                          : null,
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Your blood sugar level is ${_getBloodSugarStatus(bs.level, bs.condition)}", style: theme.textTheme.bodyLarge!.copyWith(color: _getStatusColor(status)),),
                                          const SizedBox(height: 10,),
                                          Text('${bs.notes != null && bs.notes!.isNotEmpty ? 'Notes: ${bs.notes}': null}'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(), // Add the Divider here
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
