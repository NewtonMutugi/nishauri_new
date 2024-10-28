import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nishauri/src/features/clinic_card/data/providers/programProvider.dart';
import 'package:nishauri/src/features/self_screening/presentation/widgets/health_list.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/shared/display/background_image_widget.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/routes.dart';

import '../../../user_programs/data/providers/program_provider.dart';

class ClinicCardScreen extends HookConsumerWidget {
  const ClinicCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final programAsync = ref.watch(programProvider);
    final userPrograms = ref.watch(userProgramProvider);

    final List<String> items = [
      "All Records",
      "Allergies",
      "Conditions",
      "Immunizations",
      "Lab Results",
      "Medications",
      "Procedures",
      "Vitals"
    ];

    final List<String> icons = [
      "assets/images/boldDuotoneFoldersFolderPathConnect.svg",
      "assets/images/boldDuotoneMedicineVirus.svg",
      "assets/images/boldDuotoneMedicineStethoscope.svg",
      "assets/images/boldDuotoneMedicineSyringe.svg",
      "assets/images/boldDuotoneMedicineTestTube.svg",
      "assets/images/boldDuotoneMedicineJarOfPills2.svg",
      "assets/images/boldDuotoneMedicineBone.svg",
      "assets/images/boldDuotoneMedicineHeartPulse2.svg"
    ];

    final List<String> paths = [
      RouteNames.BLOOD_PRESSURE,
      RouteNames.BLOOD_SUGAR,
    ];

    void _reloadData() {
      ref.refresh(programProvider);
      ref.refresh(userProgramProvider);
    }

    return programAsync.when(
      data: (data) {
        final activePrograms = data.where((program) {
          return userPrograms.hasValue && userPrograms.value!.any(
                  (userProgram) => userProgram.program_name == program.name && userProgram.isActive
          );
        });

        if (activePrograms.isEmpty) {
          return _buildEmptyState(context, _reloadData);
        }

        return Scaffold(
          body: Column(
            children: [
              const CustomAppBar(
                title: "My Clinic Card 👨🏾‍💼",
                color: Constants.clinicCardBgColor,
                subTitle: "Access all your medical details",
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                  children: [Text("Health Records", style: theme.textTheme.titleMedium),
                                  ]
                              ),
                              const SizedBox(height: 10),
                              ItemList(items: items, path: paths, svgAsset: icons),
                              const SizedBox(height: 10),
                              Row(
                                  children: [Text("Programs", style: theme.textTheme.titleMedium),
                                  ]
                              ),
                              ItemList(items: items, path: paths),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _reloadData,
            child: const Icon(Icons.refresh),
            tooltip: 'Refresh Data',
          ),
        );
      },
      error: (error, _) => _buildErrorState(context, error.toString(), _reloadData),
      loading: () => _buildLoadingState(context, theme),
    );
  }

  Widget _buildEmptyState(BuildContext context, VoidCallback reload) {
    return BackgroundImageWidget(
      customAppBar: const CustomAppBar(
        title: "My Clinic Card 👨🏾‍💼",
        color: Constants.clinicCardBgColor,
        subTitle: "Access all your medical details",
      ),
      svgImage: 'assets/images/lab-empty-state.svg',
      notFoundText: "No programs available",
      floatingButtonIcon1: Icons.refresh,
      floatingButtonAction1: reload,
    );
  }

  Widget _buildErrorState(BuildContext context, String error, VoidCallback reload) {
    return BackgroundImageWidget(
      customAppBar: const CustomAppBar(
        title: "My Clinic Card 👨🏾‍💼",
        color: Constants.clinicCardBgColor,
        subTitle: "Access all your medical details",
      ),
      svgImage: 'assets/images/lab-empty-state.svg',
      notFoundText: error,
      floatingButtonIcon1: Icons.refresh,
      floatingButtonAction1: reload,
    );
  }

  Widget _buildLoadingState(BuildContext context, ThemeData theme) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomAppBar(
            title: "My Clinic Card 👨🏾‍💼",
            color: Constants.clinicCardBgColor,
            subTitle: "Access all your medical details",
          ),
          Text(
            "Loading Programs",
            style: theme.textTheme.headline6,
          ),
          const SizedBox(height: Constants.SPACING * 2),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
