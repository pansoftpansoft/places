import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/Widgets/bottom_navigation.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_screen.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/app_bar_sight_list_screen.dart';
import 'package:places/ui/screen/widgets/sight_card.dart';


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
  Widget build(final BuildContext context) => Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(170.0),
          child: AppBarSightListScreen(),
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

  ///
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
