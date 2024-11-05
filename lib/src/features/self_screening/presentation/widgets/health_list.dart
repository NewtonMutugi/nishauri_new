import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nishauri/src/utils/constants.dart';

class ItemList extends StatelessWidget {
  final List<String> items;
  final Color backgroundColor;
  final List<String> path;
  final List<String>? svgAsset;
  const ItemList({
    Key? key,
    required this.items,
    required this.path,
    this.svgAsset,
    this.backgroundColor = Constants.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = 100 + (items.length - 1) * 70 + 5;

    return Container(
      color: backgroundColor,
      child: SizedBox(
        height: height.toDouble(),
        child: ListView.separated(
          itemCount: items.length + 1,
          separatorBuilder: (context, index) {
            return const Divider(color: Colors.grey);
          },
          itemBuilder: (context, index) {
            if (index < items.length) {
              return ListTile(
                leading: svgAsset != null
                    ? SvgPicture.asset(
                  svgAsset![index],
                  width: 20,
                  height: 20,
                )
                    : null,
                title: Text(items[index]),
                onTap: () {
                  context.goNamed(path[index]);
                },
                trailing: const Icon(Icons.chevron_right),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
