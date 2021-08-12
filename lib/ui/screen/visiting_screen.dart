import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/font_collection.dart';
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
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_alt_outlined,
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.map_outlined,
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
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
