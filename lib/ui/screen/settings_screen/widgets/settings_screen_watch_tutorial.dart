import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/svg_icons.dart';

class SettingsScreenWatchTutorial extends StatelessWidget {
  const SettingsScreenWatchTutorial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          watchTutorial,
          style: Theme.of(context).textTheme.headline2,
        ),
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          icon: SvgPicture.asset(
            SvgIcons.info,
            height: 20,
            color: ColorPalette.greenColor,
          ),
          onPressed: () {
            debugPrint('Нажата кнопка "Смотреть туториал"');
            Navigator.pushNamed(
              context,
              RouteName.onboardingScreen,
            );
          },
        ),
      ],
    );
  }
}
