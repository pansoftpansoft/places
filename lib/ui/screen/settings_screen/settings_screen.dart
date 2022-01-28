import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/settings_screen/widgets/settings_screen_theme_switch.dart';
import 'package:places/ui/screen/settings_screen/widgets/settings_screen_watch_tutorial.dart';
import 'package:places/ui/screen/widgets/bottom_navigation/bottom_navigation.dart';

///Экран настроек
class SettingsScreen extends StatelessWidget {
  ///Конструктор
  const SettingsScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            settings,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        bottomNavigationBar: BottomNavigation(3),
        body: Padding(
          padding: const EdgeInsets.all(paddingPage),
          child: Column(
            children: const <Widget>[
              SettingsScreenThemeSwitch(),
              Divider(
                thickness: 1,
                color: ColorPalette.lmTabBarBackground,
              ),
              SettingsScreenWatchTutorial(),
              Divider(
                thickness: 1,
                color: ColorPalette.lmTabBarBackground,
              ),
            ],
          ),
        ),
      );
}
