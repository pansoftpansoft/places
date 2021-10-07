import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/Widgets/bottom_navigation.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_screen.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';
import 'package:places/ui/screen/widgets/sight_card.dart';
import 'package:places/ui/screen/widgets/title_app.dart';

///Список достопримечательностей
class SightListScreen extends StatefulWidget {
  ///Конструктор
  const SightListScreen({final Key? key}) : super(key: key);

  @override
  sightListScreenState createState() => sightListScreenState();
}

class sightListScreenState extends State<SightListScreen> {
  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(170.0),
          child: AppBar(
            toolbarHeight: double.infinity,
            centerTitle: false,
            elevation: 0,
            title: const TitleApp(),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Sizes.paddingPage,
                  0,
                  Sizes.paddingPage,
                  Sizes.paddingPage,
                ),
                child: Stack(
                  children: <Widget>[
                    SearchBar(),
                    SizedBox(
                      height: Sizes.heightTextFieldSearch,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<Route>(
                              builder: (final BuildContext context) =>
                                  const SightSearchScreen(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: floatingActionButton(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.paddingPage,
            vertical: 0,
          ),
          child: ListView.builder(
            itemCount: mocksWantVisit.length,
            itemBuilder: (
              final BuildContext context,
              final int index,
            ) =>
                SightCard(mocks[index]),
          ),
        ),
      );

  DecoratedBox floatingActionButton(final BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              ColorPalette.greenColorLightGradient,
              ColorPalette.greenColorStrongGradient,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: FloatingActionButton.extended(
          elevation: 0,
          backgroundColor: Colors.transparent,
          icon: SvgPicture.asset(
            SvgIcons.plus,
          ),
          label: Text(Labels.newPlace.toUpperCase()),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (final BuildContext context) => const AddSightScreen(),
              ),
            );
          },
        ),
      );
}
