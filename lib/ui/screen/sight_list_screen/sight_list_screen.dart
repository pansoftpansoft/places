import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/floating_button.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sight_list_screen_landscape.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sight_list_screen_portrait.dart';
import 'package:places/ui/screen/widgets/bottom_navigation/bottom_navigation.dart';

///Список достопримечательностей
class SightListScreen extends StatefulWidget {
  ///Конструктор
  const SightListScreen({final Key? key}) : super(key: key);

  @override
  SightListScreenState createState() => SightListScreenState();
}

///
class SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(final BuildContext context) => OrientationBuilder(
        builder: (
          context,
          orientation,
        ) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: orientation == Orientation.portrait
                ? const FloatingButton()
                : null,
            bottomNavigationBar: orientation == Orientation.portrait
                ? BottomNavigation(0)
                : null,
            body: orientation == Orientation.portrait
                ? const SightListScreenPortrait()
                : const SightListScreenLandscape(),
          );
        },
      );
}
