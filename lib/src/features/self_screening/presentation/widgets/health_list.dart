import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nishauri/src/utils/constants.dart';

class ItemList extends StatelessWidget {
  final List<String> items;
  final Color backgroundColor;
  final Color? color;
  final List<String> path;
  final List<String>? svgAsset;
  final List<String>? relationship;
  const ItemList({
    Key? key,
    required this.items,
    required this.path,
    this.svgAsset,
    this.backgroundColor = Constants.bgColor,
    this.color,
    this.relationship
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
                  width: Constants.TWENTY,
                  height: Constants.TWENTY,
                  color: color,
                )
                    : null,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: Constants.SPACING),
                      child: Text(items[index]),
                    ),
                    if (relationship != null)
                      Padding(
                        padding: const EdgeInsets.only(left: Constants.SPACING),
                        child: Card(
                          color: Constants.clinicCardKinColor,
                          child: Padding(
                            padding: const EdgeInsets.all(Constants.SMALL_SPACING),
                            child: Text(
                              relationship![index],
                              style: const TextStyle(color: Constants.programsColor),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
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
