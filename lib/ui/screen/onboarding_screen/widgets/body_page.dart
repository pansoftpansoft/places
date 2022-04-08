import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';

///Тело шаблона страници Onboard
class BodyPage extends StatelessWidget {
  /// Заголовок
  final String header1;

  /// Коментарий
  final String header2;

  /// Иконка
  final String svgIcon;

  ///
  const BodyPage({
    required this.header1,
    required this.header2,
    required this.svgIcon,
    final Key? key,
  }) : super(key: key);


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
