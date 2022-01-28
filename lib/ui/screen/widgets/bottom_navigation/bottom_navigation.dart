import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/svg_icons.dart';

/// Нижнее главное меню
class BottomNavigation extends StatefulWidget {
  int _selectedIndex;

  ///
  BottomNavigation(this._selectedIndex, {final Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
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
          items: listBottomNavigationBarItem(context),
          currentIndex: widget._selectedIndex,
          onTap: _onItemTapped,
        ),
      );

  List<BottomNavigationBarItem> listBottomNavigationBarItem(BuildContext context) {
    return <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgIcons.list,
              height: 30,
              color: _color(context),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgIcons.map,
              height: 30,
              color: _color(context),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgIcons.heartTransparent,
              height: 30,
              color: _color(context),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgIcons.settings,
              height: 30,
              color: _color(context),
            ),
            label: '',
          ),
        ];
  }

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

  Color? _color(BuildContext context) {
    return Theme.of(context)
        .bottomNavigationBarTheme
        .unselectedIconTheme!
        .color;
  }
}
