import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/floating_button.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sticky_header.dart';
import 'package:places/ui/screen/widgets/bottom_navigation.dart';
import 'package:places/ui/screen/widgets/sight_card/sight_card.dart';

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
  Widget build(final BuildContext context) =>
      Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const FloatingButton(),
        bottomNavigationBar: BottomNavigation(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.paddingPage,
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: StickyHeader(),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (final BuildContext context,
                      final int index,) =>
                      SightCard(mocks[index]),
                  childCount: mocks.length,
                ),
              ),
            ],
          ),
        ),
      );
}
