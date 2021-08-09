import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/theme/color_palette.dart';
import 'package:places/ui/theme/font_collection.dart';
import 'package:places/ui/theme/labels.dart';

import 'package:places/mocks.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key key}) : super(key: key);

  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  int mocksLength = 3;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            Labels.checkFavorites,
            textAlign: TextAlign.center,
            style: FontCollection.headerTabColor18h24w500,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Card(
              elevation: 0,
              color: ColorPalette.cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(117.0),
              ),
              child: TabBar(
                unselectedLabelColor: ColorPalette.fontBasicColorLightHard,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorPalette.fontBasicColor),
                tabs: [
                  Tab(
                    text: Labels.iWantToVisit,
                  ),
                  Tab(text: Labels.visited),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt_outlined,
                color: const Color(0xFF3B3E5B),
                size: 30,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.map_outlined,
                color: const Color(0xFF3B3E5B),
                size: 30,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: const Color(0xFF3B3E5B),
                size: 30,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: const Color(0xFF3B3E5B),
                size: 30,
              ),
              label: '',
            ),
          ],
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
                            color: ColorPalette.fontBasicColorLight,
                          ),
                          SizedBox(height: 32),
                          Text(
                            Labels.emptyList,
                            textAlign: TextAlign.center,
                            style: FontCollection.fontBasicColorLight18h24w500,
                          ),
                          SizedBox(height: 8),
                          Text(
                            Labels.checkPlace,
                            textAlign: TextAlign.center,
                            style: FontCollection.fontBasicColorLight14h18w400,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        SightCard(mocks[3],goNeed: 'Запланировано на 11 окт. 2021',),
                        SightCard(mocks[4],goNeed: 'Запланировано на 12 окт. 2021',),
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
                            color: ColorPalette.fontBasicColorLight,
                          ),
                          SizedBox(height: 32),
                          Text(
                            Labels.emptyList,
                            textAlign: TextAlign.center,
                            style: FontCollection.fontBasicColorLight18h24w500,
                          ),
                          SizedBox(height: 8),
                          Text(
                            Labels.completeRoute,
                            textAlign: TextAlign.center,
                            style: FontCollection.fontBasicColorLight14h18w400,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        SightCard(mocks[0], goal: 'Цель достигнута 11 окт. 2021',),
                        SightCard(mocks[1], goal: 'Цель достигнута 12 окт. 2021',),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
