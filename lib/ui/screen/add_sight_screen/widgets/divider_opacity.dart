import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/sizes.dart';

///
class DividerOpacity extends StatelessWidget {
  ///
  const DividerOpacity({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => const Opacity(
        opacity: Sizes.opacityText,
        child: Divider(
          color: ColorPalette.lmTabBarUnSelect,
          thickness: 0.8,
        ),
      );
}
