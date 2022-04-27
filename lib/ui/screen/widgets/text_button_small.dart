import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';

///Небольшая кнопка с кавадратными углами
class TextButtonSmall extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final IconData? iconNamePrefix;
  final IconData? iconNameSuffix;
  final String svgIconNamePrefix;
  final String svgIconNameSuffix;

  const TextButtonSmall({
    required this.title,
    this.onPressed,
    this.iconNamePrefix,
    this.iconNameSuffix,
    this.svgIconNamePrefix = '',
    this.svgIconNameSuffix = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    debugPrint('Это кнопка "$title"; Виджет $TextButtonSmall $VoidCallback');

    return TextButton(
      child: SizedBox(
        width: 164,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 9),
              child: svgIconNamePrefix.isEmpty
                  ? null
                  : SvgPicture.asset(
                      svgIconNamePrefix,
                      height: 30,
                      width: 30,
                      // ignore: unnecessary_null_comparison
                      color: Theme.of(context)
                          .textButtonTheme
                          .style
                          ?.foregroundColor!
                          .resolve({},),
                      // color: onPressed == null
                      //     ? ColorPalette.lmTextButtonTextDisable
                      //     : ColorPalette.lmTextButtonText,
                    ),
            ),
            Text(
              title,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: svgIconNameSuffix.isEmpty
                  ? null
                  : SvgPicture.asset(
                      svgIconNameSuffix,
                      height: 30,
                      width: 30,
                      // ignore: unnecessary_null_comparison
                      color: onPressed == null
                          ? ColorPalette.lmTextButtonTextDisable
                          : ColorPalette.lmTextButtonText,
                    ),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
