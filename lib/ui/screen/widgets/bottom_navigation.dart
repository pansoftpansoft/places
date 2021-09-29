import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/settings_screen/settings_screen.dart';
import 'package:places/ui/screen/visiting_screen/visiting_screen.dart';

/*
Нижняя навигационная панель
используется на многих экранах
*/
class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      ),
      child: BottomNavigationBar(
        elevation: Theme.of(context).bottomNavigationBarTheme.elevation,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgIcons.list,
              height: 30,
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedIconTheme!
                  .color,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgIcons.map,
              height: 30,
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedIconTheme!
                  .color,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<Route>(
                        builder: (BuildContext context) =>
                            const VisitingScreen())); //.push(  MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              child: SvgPicture.asset(
                SvgIcons.heartTransparent,
                height: 30,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedIconTheme!
                    .color,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<Route>(
                        builder: (BuildContext context) =>
                            SettingsScreen())); //.push(  MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              child: SvgPicture.asset(
                SvgIcons.settings,
                height: 30,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedIconTheme!
                    .color,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
