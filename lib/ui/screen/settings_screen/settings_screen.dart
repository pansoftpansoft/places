import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/models/app_model.dart';
import 'package:places/ui/screen/widgets/bottom_navigation_list.dart';
import 'package:provider/provider.dart';

///Экран настроек
class SettingsScreen extends StatelessWidget {
  ///Конструктор
  const SettingsScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(settings),
        ),
        bottomNavigationBar: BottomNavigationList(3),
        body: Padding(
          padding: const EdgeInsets.all(paddingPage),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    darkTheme,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  CupertinoSwitch(
                    value: context.select<AppModel, bool>(
                      (final a) => a.isThemeColor,
                    ),
                    onChanged: (final value) {
                      context.read<AppModel>().changeTheme();
                    },
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: ColorPalette.lmTabBarBackground,
              ),
              Row(
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
                      if (kDebugMode) {
                        print('Нажата кнопка "Смотреть туториал"');
                      }
                      Navigator.pushNamed(
                        context,
                        RouteName.onboardingScreen,
                      );
                    },
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: ColorPalette.lmTabBarBackground,
              ),
            ],
          ),
        ),
      );
}
