import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';

class backgroundDismissible extends StatelessWidget {
  const backgroundDismissible({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorPalette.redColor,
      margin: const EdgeInsets.fromLTRB(
          0, 0, 0, Sizes.paddingPage),
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(Sizes.borderRadiusCard),
      ),
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  SvgIcons.bucket,
                  height: 26,
                  color: ColorPalette.whiteColor,
                ),
                Text(
                  'Удалить',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(
                      color: ColorPalette.whiteColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}