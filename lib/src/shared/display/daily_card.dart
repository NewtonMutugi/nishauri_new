import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nishauri/src/utils/constants.dart';

import '../../features/self_screening/blood_sugar/presentation/pages/BloodSugarScreen.dart';
import '../providers/selectedIndexProvider.dart';

class FilterCard extends HookConsumerWidget {
  final List<String>? columnTitles;
  final Function(int selectedIndex)? onPressed;

  const FilterCard({
    Key? key,
    this.columnTitles,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Card(
      color: Constants.bgColor,
      elevation: Constants.FOUR,
      child: Padding(
        padding: const EdgeInsets.all(Constants.SPACING),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _buildColumns(context, ref, selectedIndex),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildColumns(BuildContext context, WidgetRef ref, int selectedIndex) {
    if (columnTitles!.isEmpty) {
      return [];
    }

    List<Widget> columns = [];
    for (int i = 0; i < columnTitles!.length; i++) {
      String title = columnTitles![i];
      columns.add(
        Expanded(
          child: _buildColumn(title, i, context, ref, selectedIndex),
        ),
      );
      if (i < columnTitles!.length - 1) {
        columns.add(const VerticalDivider(thickness: 1, color: Colors.grey));
      }
    }
    return columns;
  }

  Widget _buildColumn(String title, int index, BuildContext context, WidgetRef ref, int selectedIndex) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Constants.SMALL_SPACING),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: Constants.SMALL_APP_BAR_HEIGHT,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: index == selectedIndex ? Constants.white : null,
                  ),
                  onPressed: () => onPressed!(index),
                  child: Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}