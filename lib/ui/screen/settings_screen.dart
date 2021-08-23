import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:provider/provider.dart';
import 'package:places/ui/screen/models/app_model.dart';
import 'package:places/ui/screen/Widgets/bottom_navigation.dart';

//Экран настроек
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitchedTheme = false;

  @override
  Widget build(BuildContext context) {
    isSwitchedTheme =
        context.select<AppModel, bool>((AppModel a) => a.isThemeColor);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Labels.settings),
      ),
      bottomNavigationBar: BottomNavigation(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Labels.dark_theme,
                  style: Theme.of(context).textTheme.headline2,
                ),
                CupertinoSwitch(
                  value: isSwitchedTheme,
                  onChanged: (value) {
                    isSwitchedTheme = !isSwitchedTheme;
                    var themeActual = context.read<AppModel>();
                    themeActual.changeTheme(isSwitchedTheme);
                    print(isSwitchedTheme);
                  },
                )
              ],
            ),
            const Divider(
              thickness: 1,
              color: ColorPalette.lmTabBarBackground,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Labels.watchTutorial,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      SvgIcons.info,
                      height: 20,
                      color: ColorPalette.greenColor,
                    ),
                    onPressed: () {
                      print('Нажата кнопка "Смотреть еуториал"');
                    },
                  ),
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
}
