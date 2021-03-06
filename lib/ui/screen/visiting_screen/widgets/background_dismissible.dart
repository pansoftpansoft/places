import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';

/// Задний фон при перетаскивание карточек
class BackgroundDismissible extends StatelessWidget {
  ///
  const BackgroundDismissible({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 3 / 2,
        child: Container(
          padding: _buildEdgeInsets(),
          decoration: const BoxDecoration(
            color: ColorPalette.redColor,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadiusCard16),
            ),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  SvgIcons.bucket,
                  height: heightSizeBox26,
                  color: ColorPalette.whiteColor,
                ),
                Text(
                  delete,
                  style: textStyle(context),
                ),
              ],
            ),
          ),
        ),
      );

  TextStyle? textStyle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2?.copyWith(
          color: ColorPalette.whiteColor,
        );
  }

  EdgeInsets _buildEdgeInsets() {
    return const EdgeInsets.fromLTRB(
      0,
      0,
      paddingPage,
      0,
    );
  }
}
