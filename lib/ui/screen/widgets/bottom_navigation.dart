import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/svg_icons.dart';

/// Нижнее главное меню
class BottomNavigation extends StatelessWidget {
  ///
  const BottomNavigation({final Key? key}) : super(key: key);
  @override
  Widget build(final BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        child: BottomNavigationBar(
          elevation: Theme.of(context).bottomNavigationBarTheme.elevation,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/SightListScreen');
                },
                child: SvgPicture.asset(
                  SvgIcons.list,
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
                  Navigator.pushReplacementNamed(context, '/MapScreen');
                },
                child: SvgPicture.asset(
                  SvgIcons.map,
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
                  Navigator.pushReplacementNamed(context, '/VisitingScreen');
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
                  Navigator.pushReplacementNamed(context, '/SettingsScreen');
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
