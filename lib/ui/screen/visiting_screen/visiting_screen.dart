import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/Widgets/bottom_navigation.dart';
import 'package:places/ui/screen/visiting_screen/widgets/app_bar_visiting.dart';
import 'package:places/ui/screen/visiting_screen/widgets/tab1.dart';
import 'package:places/ui/screen/visiting_screen/widgets/tab2.dart';

/*
Окно в котором можно выбрать
места которые хочешь посетить и которые уже посетил
*/
class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBarVisiting(),
        ),
        bottomNavigationBar: BottomNavigation(),
        body: Padding(
          padding: const EdgeInsets.all(Sizes.paddingPage),
          child: TabBarView(
            children: [
              Tab1(context),
              Tab2(context),
            ],
          ),
        ),
      ),
    );
  }
}
