import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/providers/blood_sugar_provider.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/providers/bmi_log_provider.dart';
import 'package:nishauri/src/features/self_screening/bp/data/providers/blood_pressure_provider.dart';
import 'package:nishauri/src/features/self_screening/presentation/widgets/health_card.dart';
import 'package:nishauri/src/features/self_screening/presentation/widgets/health_list.dart';
import 'package:nishauri/src/features/self_screening/presentation/widgets/image_card.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/shared/display/custom_bottom_nav_bar.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/routes.dart';

class SelfScreening extends ConsumerStatefulWidget {
  const SelfScreening({Key? key}) : super(key: key);

  @override
  _SelfScreeningState createState() => _SelfScreeningState();
}

class _SelfScreeningState extends ConsumerState<SelfScreening> {
  int _currIndex = 0;
  int _messagesCount = 0;

  void _onTap(int index) {
    setState(() {
      _currIndex = index;
      _messagesCount = 0; // Reset messages count
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bpAsync = ref.watch(bloodPressureListProvider);
    final bmiListAsync = ref.watch(bmiListProvider);

    final currentBpEntries = bpAsync.when(
      data: (data) {
        data.sort((a, b) => b.created_at.compareTo(a.created_at));
        return data.isNotEmpty ? data.first : null;
      },
      error: (error, _) => null,
      loading: () => null,
    );

    final bsAsync = ref.watch(bloodSugarEntriesProvider);

    final currentBsEntries = bsAsync.when(
      data: (data) {
        data.sort((a, b) => b.created_at.compareTo(a.created_at));
        return data.isNotEmpty ? data.first : null;
      },
      error: (error, _) => null,
      loading: () => null,
    );

    final currentBMIEntries = bmiListAsync.when(
      data: (data) {
        data.sort((a, b) => b.created_at.compareTo(a.created_at));
        return data.isNotEmpty ? data.first : null;
      },
      error: (error, _) => null,
      loading: () => null,
    );

    // Create a list of items and remove entries based on available data
    final List<String> items = ["Blood Sugar", "Blood Pressure", "BMI", "Period Calendar"];
    final List<String> paths = [RouteNames.BLOOD_PRESSURE, RouteNames.BLOOD_SUGAR, RouteNames.BMI_CALCULATOR_RESULTS];

    if (currentBpEntries != null) {
      items.remove("Blood Pressure");
    }
    if (currentBsEntries != null) {
      items.remove("Blood Sugar");
    }
    if (currentBMIEntries != null) {
      items.remove("BMI");
    }

    double _convertToMMOL(double level) {
      if (level > 30) {
        level = level / 18.0;
      }
      return double.parse(level.toStringAsFixed(1));
    }

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: "Self Screening",
            subTitle: "Easily track your health. Stay informed \nand take control of well-being.",
            color: Constants.selfScreeningBgColor,
            svgPathGroup: "assets/images/group_clinic_card.svg",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cards showing health data
                    Wrap(
                      spacing: 5,
                      runSpacing: 16,
                      children: [
                        if (currentBpEntries != null) HealthCard(
                          svgAsset: "assets/images/boldDuotoneLikeHearts.svg",
                          title: "Blood Pressure",
                          value1: "${currentBpEntries.systolic}",
                          text1: "mmHG",
                          vName1: "Systolic",
                          value2: "${currentBpEntries.diastolic}",
                          text2: "mmHG",
                          vName2: "Diastolic",
                          value3: "${currentBpEntries.pulse_rate}",
                          text3: "Pulse/Min",
                          vName3: "Pulse Rate",
                          onPressed: () {
                            context.goNamed(RouteNames.BLOOD_PRESSURE);
                          },
                        ),
                        if (currentBsEntries != null) HealthCard(
                          svgAsset: "assets/images/boldDuotoneMedicinePulse.svg",
                          title: "Blood Sugar",
                          value1: "${_convertToMMOL(currentBsEntries.level)}",
                          text1: "mmol/L",
                          onPressed: () {
                            context.goNamed(RouteNames.BLOOD_SUGAR);
                          },
                        ),
                        if (currentBMIEntries != null) HealthCard(
                          svgAsset: "assets/images/bmi.svg",
                          title: "Body Measurements",
                          value1: "${currentBMIEntries.weight}",
                          text1: "KGS",
                          vName1: "Weight",
                          value2: "${currentBMIEntries.height}",
                          text2: "Centimetres",
                          vName2: "Height",
                          value3: "${currentBMIEntries.results}",
                          text3: "",
                          vName3: "BMI",
                          onPressed: () {
                            context.goNamed(RouteNames.BMI_CALCULATOR_RESULTS);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ItemList(items: items, path: paths),
                    const SizedBox(height: 20),
                    // Title for the next section
                    Text(
                      "About Self Screening",
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    const Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 1,
                      runSpacing: 16,
                      children: [
                        ImageCard(imagePath: 'assets/images/hospital_building.svg'),
                        ImageCard(imagePath: 'assets/images/hospital_building.svg'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Title for the understanding health section
                    Text(
                      "Understanding Your Health",
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Understanding your health metrics is crucial for maintaining a healthy lifestyle. "
                          "Stay informed about your numbers and consult your healthcare provider when needed.",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currIndex,
        onTap: _onTap,
        messagesCount: _messagesCount,
      ),
    );
  }
}
