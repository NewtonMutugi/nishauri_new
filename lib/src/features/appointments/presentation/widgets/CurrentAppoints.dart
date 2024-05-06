import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nishauri/src/features/appointments/data/providers/appointment_provider.dart';
import 'package:nishauri/src/shared/display/CustomeAppBar.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/shared/display/background_image_widget.dart';

class CurrentAppointments extends HookConsumerWidget {
  const CurrentAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentAppointmentSync = ref.watch(appointmentProvider(false));
    return currentAppointmentSync.when(
      data: (data) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const Divider(),
                      ListTile(
                        title: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(Constants.SPACING),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].program_name ?? '',
                                  style: theme.textTheme.headline6,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: Constants.SPACING),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.app_registration_outlined,
                                      color: theme.colorScheme.primary,
                                    ),
                                    const SizedBox(width: Constants.SPACING),
                                    Text(data[index].appointment_type??''),
                                  ],
                                ),
                                const SizedBox(height: Constants.SPACING),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: theme.colorScheme.primary,
                                    ),
                                    const SizedBox(width: Constants.SPACING),
                                    Text(data[index].appointment_date),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
      error: (error, _) => BackgroundImageWidget(
        svgImage: 'assets/images/background.svg',
        notFoundText: error.toString(),
      ),
      loading: () => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Loading Current Appointments",
              style: theme.textTheme.headline6,
            ),
            const SizedBox(height: Constants.SPACING * 2),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
