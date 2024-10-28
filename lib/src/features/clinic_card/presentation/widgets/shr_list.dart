import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nishauri/src/features/clinic_card/data/models/program.dart';
import 'package:nishauri/src/utils/constants.dart';

class HealthRecord extends StatelessWidget {
  // final Program program;
  // const HealthRecord({Key? key, required this.program}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        // ListTile(
        //   title: Text(program.name),
        //   // subtitle: Text('Facility Name: ${program.facility_name}'),
        // ),
        Expanded(
          child: ListView.builder(
            // itemCount: program.obs.length,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              // final observations = program.obs[index];
              return Column(
                children: [
                  const Divider(),
                  ListTile(
                    leading: SvgPicture.asset(
                      "assets/images/boldDuotoneFoldersFolderPathConnect.svg",
                      width: 20,
                      height: 20,
                    ),
                    title: Text("All Records", style: theme.textTheme.titleMedium,),
                    trailing: const Icon(Icons.chevron_right),
                    // title: Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(Constants.SPACING),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           observations.label,
                    //           style: theme.textTheme.headline6,
                    //           overflow: TextOverflow.ellipsis,
                    //           maxLines: 1,
                    //         ),
                    //         const SizedBox(height: Constants.SPACING),
                    //         Row(
                    //           children: [
                    //             Icon(
                    //               Icons.diamond_outlined,
                    //               color: theme.colorScheme.primary,
                    //             ),
                    //             const SizedBox(width: Constants.SPACING),
                    //             Text(observations.value?? "",),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
