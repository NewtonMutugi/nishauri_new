import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nishauri/src/features/common/presentation/pages/chat_feeback_form.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/providers/blood_sugar_provider.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/providers/bmi_log_provider.dart';
import 'package:nishauri/src/features/self_screening/bp/data/providers/blood_pressure_provider.dart';
import 'package:nishauri/src/features/self_screening/presentation/widgets/health_card.dart';
import 'package:nishauri/src/features/self_screening/presentation/widgets/health_list.dart';
import 'package:nishauri/src/features/self_screening/presentation/widgets/image_card.dart';
import 'package:nishauri/src/shared/display/CustomAppBar.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/routes.dart';

class SelfScreening extends HookConsumerWidget {
  const SelfScreening({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    int _currIndex = 0;
    int _messagesCount = 0;

    final bpAsync = ref.watch(bloodPressureListProvider);
    final bmiListAsync = ref.watch(bmiListProvider);

    final currentBpEntries = bpAsync.when(
      data: (data) {
        // Sort the list by date in descending order
        data.sort((a, b) => b.created_at.compareTo(a.created_at));
        // Return the most current object
        return data.isNotEmpty ? data.first : null;
      },
      error: (error, _) {
        return null;
      },
      loading: () {
        return null;
      },
    );

    final bsAsync = ref.watch(bloodSugarEntriesProvider);

    final currentBsEntries = bsAsync.when(
      data: (data) {
        data.sort((a, b) => b.created_at.compareTo(a.created_at));
        return data.first;
      },
      error: (error, _) {
        return null;
      },
      loading: () {
        return null;
      },
    );

    final currentBMIEntries = bmiListAsync.when(
      data: (data) {
        data.sort((a, b) => b.created_at.compareTo(a.created_at));
        return data.first;
      },
      error: (error, _) {
        return null;
      },
      loading: () {
        return null;
      },
    );

    // Create a list of items and remove "Blood Pressure" if currentBpEntries is not null
    final List<String> items = ["Blood Sugar", "Blood Pressure", "BMI", "Period Calendar"];
    final List<String> paths = [RouteNames.BLOOD_PRESSURE, RouteNames.BLOOD_SUGAR, RouteNames.BMI_CALCULATOR_RESULTS,];
    // final List<String> extra = ['', '', '24'];
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

    print(currentBMIEntries);

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: "Self Screening",
            subTitle: "Easily track your health. Stay informed and take control of well-being.",
            color: Constants.selfScreeningBgColor,
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Cards showing health data
                          Wrap(
                            spacing: 5,
                            runSpacing: 16,
                            children: [
                              currentBpEntries != null ? HealthCard(
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
                              ) : const SizedBox(),
                              currentBsEntries != null ? HealthCard(
                                svgAsset: "assets/images/boldDuotoneMedicinePulse.svg",
                                title: "Blood Sugar",
                                value1: "${currentBsEntries != null ? _convertToMMOL(currentBsEntries.level) : 'N/A'}",
                                text1: "mmol/L",
                                onPressed: () {
                                  context.goNamed(RouteNames.BLOOD_SUGAR);
                                },
                              ) : const SizedBox(),
                              HealthCard(
                                svgAsset: "assets/images/boldDuotoneMedicinePulse.svg",
                                title: "Body Measurements",
                                value1: "${currentBMIEntries?.weight}",
                                text1: "KGS",
                                vName1: "Weight",
                                value2: "${currentBMIEntries?.height}",
                                text2: "Centimetres",
                                vName2: "Height",
                                value3: "${currentBMIEntries?.results}",
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
                  ],
                ),
              )
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.disabledColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Home.svg"),
            label: "Home",
            activeIcon: SvgPicture.asset("assets/images/Home-Active.svg"),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Modules.svg"),
            label: "Apps",
            activeIcon: SvgPicture.asset("assets/images/Modules-active.svg"),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Chatbot.svg"),
            label: "Ask Nuru",
            activeIcon: SvgPicture.asset("assets/images/Chatbot-Active.svg"),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Settings.svg"),
            label: "Settings",
            activeIcon: SvgPicture.asset("assets/images/Settings-Active.svg"),
          ),
        ],
        currentIndex: _currIndex,
        onTap: (index) async {
          if (_currIndex == 2 && index != 2 && _messagesCount > 2) {
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                content: Stack(
                  children: [
                    const ChatFeedbackForm(),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const FaIcon(FontAwesomeIcons.xmark),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          // Update current index and messages count
          _currIndex = index;
          _messagesCount = 0;
        },
      ),
    );
  }
}
