import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';

///
class EmptyListTab2 extends StatelessWidget {
  ///
  const EmptyListTab2({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              SvgIcons.gogo,
              height: 48,
              width: 53,
              color: ColorPalette.textInTextField.withOpacity(opacityText),
            ),
            const SizedBox(height: 32),
            Text(
              emptyList,
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              completeRoute,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      );
}
