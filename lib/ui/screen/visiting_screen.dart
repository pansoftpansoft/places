import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/mocks.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key key}) : super(key: key);

  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  int mocksLength = 2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Labels.checkFavorites,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TabBar(
                  tabs: [
                    const Tab(
                      text: Labels.iWantToVisit,
                    ),
                    const Tab(text: Labels.visited),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
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
                  color: Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme.color,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  SvgIcons.map,
                  height: 30,
                  color: Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme.color,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  SvgIcons.heartFull,
                  height: 30,
                  color: Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme.color,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  SvgIcons.settings,
                  height: 30,
                  color: Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme.color,
                ),
                label: '',
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              mocksLength == 0
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            size: 53,
                            color: Theme.of(context).textTheme.headline2.color,
                          ),
                          const SizedBox(height: 32),
                          Text(
                            Labels.emptyList,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            Labels.checkPlace,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        SightCard(
                          mocks[3],
                          goNeed: 'Запланировано на 11 окт. 2021',
                        ),
                        SightCard(
                          mocks[4],
                          goNeed: 'Запланировано на 12 окт. 2021 ',
                        ),
                      ],
                    ),
              mocksLength == 0
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            size: 53,
                            color: Theme.of(context).textTheme.headline2.color,
                          ),
                          const SizedBox(height: 32),
                          Text(
                            Labels.emptyList,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            Labels.completeRoute,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        SightCard(
                          mocks[0],
                          goal: 'Цель достигнута 11 окт. 2021',
                        ),
                        SightCard(
                          mocks[1],
                          goal: 'Цель достигнута 12 окт. 2021',
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
