import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nishauri/src/utils/constants.dart';

class ProfileAppBar extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final IconData? icon;
  final String? age;
  final String? address;
  final Color? color;
  final Widget? bottom;
  final double? height;
  final String? smallTitle;
  final String? rightBtTitle;
  final String? path;
  final String? svgPath;
  final String? svgPathGroup;

  const ProfileAppBar({
    super.key,
    this.title,
    this.subTitle,
    this.icon,
    this.bottom,
    this.color,
    this.height,
    this.smallTitle,
    this.rightBtTitle,
    this.path,
    this.age,
    this.address,
    this.svgPath,
    this.svgPathGroup,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height,
      width: double.infinity, // Use double.infinity for responsive width
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.SPACING,
        vertical: Constants.SPACING * 3,
      ),
      decoration: BoxDecoration(
        color: color ?? theme.colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(Constants.SPACING),
          bottomRight: Radius.circular(Constants.SPACING),
        ),
      ),
      child: Stack(
        children: [
          // SVG Image positioned at the top-right corner
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              svgPathGroup ?? '',
              semanticsLabel: "Background SVG",
              fit: BoxFit.contain,
              width: 180,
              height: 180,
            ),
          ),
          // Main content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Constants.SPACING),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      "assets/images/reply.svg",
                      semanticsLabel: "Back",
                      fit: BoxFit.contain,
                      width: 25,
                      height: 25,
                    ),
                    onTap: () => context.pop(),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: Constants.SPACING),
                  SvgPicture.asset(
                    svgPath ?? '',
                    semanticsLabel: "Profile",
                    fit: BoxFit.contain,
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    title ?? '',
                    style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: Constants.SPACING),
                  if (icon != null)
                    Icon(
                      icon,
                      color: theme.canvasColor,
                    ),
                ],
              ),
              const SizedBox(height: Constants.SPACING * 2),
              Text(
                subTitle!,
                style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: Constants.SPACING * 2),
              Text(
                age!,
                style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: Constants.SPACING * 2),
              Text(
                address!,
                style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
