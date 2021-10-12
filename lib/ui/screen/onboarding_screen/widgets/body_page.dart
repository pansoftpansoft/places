import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';

///Тело шаблона страници Onboard
class BodyPage extends StatelessWidget {
  ///
  const BodyPage({
    final Key? key,
    required this.heder1,
    required this.heder2,
    required this.svgIcon,
  }) : super(key: key);

  final String heder1;
  final String heder2;
  final String svgIcon;

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          SvgPicture.asset(
            svgIcon,
            color: ColorPalette.whiteMain,
          ),
          //lmFontHeadline1
          const SizedBox(height: 42),
          Text(
            heder1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 24,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            heder2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      );
}
