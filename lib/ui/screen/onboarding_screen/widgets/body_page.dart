import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';

///Тело шаблона страници Onboard
class BodyPage extends StatelessWidget {
  ///
  const BodyPage({
    final Key? key,
    required this.header1,
    required this.header2,
    required this.svgIcon,
  }) : super(key: key);

  final String header1;
  final String header2;
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
            header1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 24,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            header2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      );
}
