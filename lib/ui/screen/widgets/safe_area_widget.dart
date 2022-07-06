import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';

class SafeAreaWidget extends StatelessWidget {
  const SafeAreaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Column(
    children: <Widget>[
      SvgPicture.asset(
        SvgIcons.errorIcon,
        color: ColorPalette.lmFontHeadline2.withOpacity(0.56),
      ),
      const SizedBox(height: 12),
      Text(
        errorText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2!.copyWith(
              fontSize: 18,
              color:
                  ColorPalette.lmFontHeadline2.withOpacity(0.56),
            ),
      ),
      const SizedBox(height: 8),
      Text(
        somethingWentWrong,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2!.copyWith(
              fontSize: 14,
              color:
                  ColorPalette.lmFontHeadline2.withOpacity(0.56),
            ),
      ),
    ],
  );
}
