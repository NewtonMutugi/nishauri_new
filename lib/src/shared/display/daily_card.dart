import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nishauri/src/shared/input/Button.dart';
import 'package:nishauri/src/utils/constants.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 1);
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
                children: _buildColumns(context, ref),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildColumns(BuildContext context, WidgetRef ref) {
    if (columnTitles!.isEmpty) {
      return [];
    }

    List<Widget> columns = [];
    for (int i = 0; i < columnTitles!.length; i++) {
      String title = columnTitles![i];
      columns.add(
        Expanded(
          child: _buildColumn(title, i, context, ref),
        ),
      );
      if (i < columnTitles!.length - 1) {
        columns.add(const VerticalDivider(thickness: 1, color: Colors.grey));
      }
    }
    return columns;
  }

  // Build a column and highlight the selected one
  Widget _buildColumn(String title, int index, BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // final bool isSelected = index == _selectedIndex;
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
                    backgroundColor: index == ref.watch(selectedIndexProvider) ? Constants.white : null,
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
