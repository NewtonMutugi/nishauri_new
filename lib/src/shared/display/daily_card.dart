import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nishauri/src/utils/constants.dart';

class FilterCard extends StatelessWidget {
  final VoidCallback? onPressed;

  const FilterCard({
    Key? key,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
            children: [
              Expanded(child: _buildColumn("Day", context)),
              const VerticalDivider(thickness: 1, color: Colors.grey),
              Expanded(child: _buildColumn("Week", context)),
              const VerticalDivider(thickness: 1, color: Colors.grey),
              Expanded(child: _buildColumn("Month", context)),
              const VerticalDivider(thickness: 1, color: Colors.grey),
              Expanded(child: _buildColumn("6Months", context)),
            ],
          ),
           ),
          ],
        ),
      ),
    );
  }

  Widget _buildColumn(String day, BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Constants.SMALL_SPACING),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextButton(
                  onPressed: onPressed,
                  child:  Text(day, style: theme.textTheme.titleLarge),
              )

              // const SizedBox(width: 4),
              // Text("TUE", style: theme.textTheme.titleLarge),
            ],
          ),
        ],
      ),
    );
  }
}
