import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/svg_icons.dart';

/// Нижнее главное меню
///
///
class BottomNavigationList extends StatefulWidget {

  int _selectedIndex;

  ///
  BottomNavigationList(this._selectedIndex, {final Key? key}) : super(key: key);

  @override
  State<BottomNavigationList> createState() => _BottomNavigationListState();
}

class _BottomNavigationListState extends State<BottomNavigationList> {
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
              icon: SvgPicture.asset(
                SvgIcons.heartTransparent,
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
                SvgIcons.settings,
                height: 30,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedIconTheme!
                    .color,
              ),
              label: '',
            ),
          ],
          currentIndex: widget._selectedIndex,
          onTap: _onItemTapped,
        ),
      );

  void _onItemTapped(final int index) {
    setState(() {
      widget._selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(
            context,
            RouteName.sightListScreen,
          );
          break;
        case 1:
          Navigator.pushReplacementNamed(
            context,
            RouteName.mapScreen,
          );
          break;
        case 2:
          Navigator.pushReplacementNamed(
            context,
            RouteName.visitingScreen,
          );
          break;
        case 3:
          Navigator.pushReplacementNamed(
            context,
            RouteName.settingsScreen,
          );
          break;
      }
    });
  }
}
