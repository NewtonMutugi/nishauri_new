import 'package:flutter/material.dart';

import '../../utils/constants.dart';

enum ButtonMode { outline, contained }

class Button extends StatelessWidget {
  final String title;
  final bool loading;
  final bool disabled;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? prefixIcon;
  final Widget? surfixIcon;
  final ButtonMode mode;
  final double spacing;
  final double borderRadius;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsetsGeometry? paddingGeometry;
  final TextStyle? titleStyle;

  final void Function()? onPress;

  const Button(
      {super.key,
      required this.title,
      this.backgroundColor,
      this.onPress,
      this.textColor,
      this.prefixIcon,
      this.surfixIcon,
      this.loading = false,
      this.spacing = Constants.SPACING,
      this.borderRadius = Constants.ROUNDNESS,
      this.mode = ButtonMode.contained,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.paddingGeometry,
      this.titleStyle,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final bgColor = disabled
        ? theme.disabledColor
        : onPress == null
            ? theme.disabledColor
            : backgroundColor;
    if (loading) {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
        ],
      );
    }

    return SizedBox(
      width: double.infinity,
      child: mode == ButtonMode.outline
          ? OutlinedButton(
              onPressed: disabled ? null : onPress,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color?>(bgColor),

                  foregroundColor: MaterialStatePropertyAll<Color?>(textColor)),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                spacing: spacing,
                children: [
                  if (prefixIcon != null) prefixIcon!,
                  Text(title, style: titleStyle),
                  if (surfixIcon != null) surfixIcon!
                ],
              ),
            )
          : ElevatedButton(
              onPressed: disabled ? null : onPress,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color?>(bgColor),
                  foregroundColor: MaterialStatePropertyAll<Color?>(textColor)),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                spacing: spacing,
                children: [
                  if (prefixIcon != null) prefixIcon!,
                  Text(title, style: titleStyle),
                  if (surfixIcon != null) surfixIcon!
                ],
              ),
            ),
    );
  }
}
