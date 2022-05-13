import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/visiting_screen/widgets/app_bar_visiting.dart';
import 'package:places/ui/screen/visiting_screen/widgets/tab1_widget.dart';
import 'package:places/ui/screen/visiting_screen/widgets/tab2_widget.dart';
import 'package:places/ui/screen/widgets/bottom_navigation/bottom_navigation.dart';

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

    debugPrint('VisitingScreen mocks = ${mocks.length.toString()}');

    mocksWantVisit = mocks;
    debugPrint('VisitingScreen mocksWantVisit = ${mocksWantVisit.length.toString()}');
    //     .where(
    //       (final element) {
    //
    //     debugPrint(element.isFavorites.toString());
    //
    //     return (element.isFavorites??false) == true && element.visitedDate == null;
    //   },
    // )
    //     .toList();
  }

  @override
  Widget build(final BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: AppBarVisiting(),
          ),
          bottomNavigationBar: BottomNavigation(2),
          body: const Padding(
            padding: EdgeInsets.all(paddingPage),
            child: TabBarView(
              children: <Widget>[
                Tab1Widget(),
                Tab2Widget(),
              ],
            ),
          ),
        ),
      );
}
