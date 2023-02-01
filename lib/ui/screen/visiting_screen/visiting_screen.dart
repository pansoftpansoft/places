// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/visiting_screen/widgets/app_bar_visiting.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_visited.dart';
import 'package:places/ui/screen/visiting_screen/widgets/list_want_visit.dart';
import 'package:places/ui/screen/widgets/bottom_navigation/bottom_navigation.dart';

///Окно в котором можно выбрать
///места которые хочешь посетить и которые уже посетил
class VisitingScreen extends StatefulWidget {
  ///
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

///
class _VisitingScreenState extends State<VisitingScreen> {
  @override
  void initState() {
    super.initState();
    debugPrint('super.initState');
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: AppBarVisiting(),
          ),
          bottomNavigationBar: BottomNavigation(2),
          body: Padding(
            padding: const EdgeInsets.all(paddingPage),
            child: Column(
              children: const [
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      ListWantVisit(),
                      ListVisited(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
