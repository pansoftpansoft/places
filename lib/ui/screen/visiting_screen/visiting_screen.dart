import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/Widgets/bottom_navigation.dart';
import 'package:places/ui/screen/visiting_screen/widgets/app_bar_visiting.dart';
import 'package:places/ui/screen/visiting_screen/widgets/tab1.dart';
import 'package:places/ui/screen/visiting_screen/widgets/tab2.dart';

///Окно в котором можно выбрать
///места которые хочешь посетить и которые уже посетил
class VisitingScreen extends StatefulWidget {
  ///
  const VisitingScreen({final Key? key}) : super(key: key);

  @override
  VisitingScreenState createState() => VisitingScreenState();
}

///
class VisitingScreenState extends State<VisitingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: AppBarVisiting(),
          ),
          bottomNavigationBar: BottomNavigation(),
          body: Padding(
            padding: const EdgeInsets.all(Sizes.paddingPage),
            child: TabBarView(
              children: <Widget>[
                tab1(context),
                tab2(context),
              ],
            ),
          ),
        ),
      );
}
